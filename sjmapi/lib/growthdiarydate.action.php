<?php
class growthdiarydate
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
			
			$root["login_user_id"] = intval($user_data['id']);
			$root["login_user_name"] = $user_data['user_name'];
			
			$current_year =intval($GLOBALS['request']['current_year']);//页面上当前日历界面年份
			$current_month =intval($GLOBALS['request']['current_month']);//页面上当前日历界面月份
			
			$condition = " where user_id = ".intval($user_data['id'])." and record_year = ".$current_year." and record_month = ".$current_month;
			$growth_diary_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."growth_diary".$condition." order by record_date desc");
			$root['growth_diary_list']=$growth_diary_list;
		}
		
		$root['city_name']=$city_name;
		output($root);
	}
}
?>