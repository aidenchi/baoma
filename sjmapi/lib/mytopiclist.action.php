<?php
class mytopiclist
{
	public function index()
	{	
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		$user_id = intval($user_data['id']);
		
		$root = array();
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$page = intval($GLOBALS['request']['page']); //分页
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;
			$limit_sql=" limit ".$limit;
			$sql_count = "select count(*) from ".DB_PREFIX."topic where user_id= ".intval($user_data['id'])." and is_effect = 1 and is_delete = 0  and fav_id = 0 ".
			"and relay_id = 0 and type='share' order by id desc";
			$total = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($total/$page_size);
			
			$sql = "select * from ".DB_PREFIX."topic where user_id = ".intval($user_data['id'])." and is_effect = 1 and is_delete = 0  and fav_id = 0 ".
			"and relay_id = 0 and type='share' order by id desc".$limit_sql;
			$my_topic_list = $GLOBALS['db']->getAll($sql);
			foreach($my_topic_list as $k=>$v){
				if(msubstr(preg_replace("/<[^>]+>/i","",$my_topic_list[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$my_topic_list[$k]['content'])){
					$my_topic_list[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$my_topic_list[$k]['content']),0,40);
				}else{
					$my_topic_list[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$my_topic_list[$k]['content']);
				}
			}
			$root['total']=$total;
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['my_topic_list']=$my_topic_list;
		}
		
		$root['page_title']="我的主贴";
		output($root);
	}
}
?>