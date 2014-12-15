<?php
class growthdiarylist
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		
		$root = array();	
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$root['page_title'] = "成长日历";
			
			$condition = " where user_id = ".intval($user_data['id']);
			$page = intval($GLOBALS['request']['page']); //分页
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;
			$limit_sql=" limit ".$limit;
			
			$sql_count = "select count(*) from ".DB_PREFIX."growth_diary".$condition." order by record_date desc";
			$total = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($total/$page_size);
			
			$growth_diary_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."growth_diary".$condition." order by record_date desc".$limit_sql);
			foreach($growth_diary_list as $k=>$v){
				if(msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content'])){
					$growth_diary_list[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content']),0,40);
				}else{
					$growth_diary_list[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$growth_diary_list[$k]['content']);
				}
			}
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['growth_diary_list'] = $growth_diary_list;
		}
		
		$root['city_name']=$city_name;
		output($root);
	}
}
?>