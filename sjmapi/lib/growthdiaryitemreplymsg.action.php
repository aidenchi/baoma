<?php
class growthdiaryitemreplymsg
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		
		$root = array();	
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		$root["login_user_id"] = intval($user_data['id']);
		$root["login_user_name"] = $user_data['user_name'];
		
		if($user_id == 0){			
			$root['user_login_status'] = 0;				
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			//查询出我的成长日记的ids
			$my_growth_diary_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."growth_diary where user_id = ".intval($user_data['id'])." order by create_time desc");
			$my_growth_diary_ids = '';
			foreach($my_growth_diary_list as $k0=>$v0){
				$my_growth_diary_ids = $my_growth_diary_ids.$v0['id'].',';
			}
			$my_growth_diary_ids = substr($my_growth_diary_ids,0,-1);
			$my_growth_diary_ids = '('.$my_growth_diary_ids.')';
			
			/*不要分页
			$page = intval($GLOBALS['request']['page']); //分页
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;
			$limit_sql=" limit ".$limit;
			*/
			
			$sql_count = "select count(*) from ".DB_PREFIX."growth_diary_reply where growth_diary_id in ".$my_growth_diary_ids." and is_read = 0";
			$total_noread_count = $GLOBALS['db']->getOne($sql_count);
			
			$sql = "select growth_diary_id,count(*) as num from ".DB_PREFIX."growth_diary_reply where growth_diary_id in ".$my_growth_diary_ids." and is_read = 0 group by growth_diary_id";
			$growth_diary_hasreply_noread_list = $GLOBALS['db']->getAll($sql);
			foreach($growth_diary_hasreply_noread_list as $k=>$v){
				$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary where id = ".$v['growth_diary_id']);
				if(msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_item['content']),0,40)!=preg_replace("/<[^>]+>/i","",$growth_diary_item['content'])){
					$growth_diary_item['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_item['content']),0,40);
				}else{
					$growth_diary_item['short_content'] = preg_replace("/<br[^>]+>/i","",$growth_diary_item['content']);
				}
				$growth_diary_hasreply_noread_list[$k]['item'] = $growth_diary_item;
			}
			$root['growth_diary_hasreply_noread_list']=$growth_diary_hasreply_noread_list;
			$root['total_noread_count']=intval($total_noread_count);
			$root['sql']=$sql;
		}
		
		$root['page_title'] = "贝欧-成长日记未读回复";
		$root['city_name']=$city_name;
		output($root);
	}
}
?>