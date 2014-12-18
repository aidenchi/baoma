<?php
class myinfo
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
			$root['uid'] = $user_data['id'];
			$root['user_name'] = $user_data['user_name'];
			$root['email'] = $user_data['email'];
			$root['sex'] = $user_data['sex'];
			$root['byear'] = $user_data['byear'];
			$root['bmonth'] = $user_data['bmonth'];
			$root['bday'] = $user_data['bday'];
			$root['my_intro'] = $user_data['my_intro'];
		}
		
		$root['page_title']="我的资料";
		output($root);
	}
}
?>