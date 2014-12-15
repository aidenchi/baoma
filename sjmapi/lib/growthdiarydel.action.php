<?php
class growthdiarydel
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
			$root['page_title']='成长日历';
			$root['status']=0;
			$root['info']='删除失败';
			$id = intval($GLOBALS['request']['id']);
			$GLOBALS['db']->query("delete from ".DB_PREFIX."growth_diary where id = ".$id);
			$root['status']=1;
			$root['info']='删除成功';			
		}				
		
		$root['city_name']=$city_name;
		output($root);
	}
}
?>