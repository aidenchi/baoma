<?php
class growthdiarywrite
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
			$root['page_title'] = "成长日记";
			$root['today'] = date('Y-m-d');
			$id = intval($GLOBALS['request']['id']);
			if($id > 0){
				$condition = " where user_id = ".intval($user_data['id'])." and id = ".$id;
				$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary".$condition);				
			}
			$root['growth_diary_item']=$growth_diary_item;
			$root['id'] = $id;
		}
		
			
		$root['city_name']=$city_name;
		output($root);
	}
}
?>