<?php
class growthdiaryitem
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
				
		$id = intval($GLOBALS['request']['id']);
		$condition = " where id = ".$id;
		$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary".$condition);
		$root['growth_diary_item']=$growth_diary_item;
		$root['page_title'] = "成长日记详情";			
		
		/*
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$root['page_title'] = "成长日记详情";
			
			$id = intval($GLOBALS['request']['id']);
			$condition = " where user_id = ".intval($user_data['id'])." and id = ".$id;
			$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary".$condition);
			$root['growth_diary_item']=$growth_diary_item;
		}
		*/
		$root['city_name']=$city_name;
		output($root);
	}
}
?>