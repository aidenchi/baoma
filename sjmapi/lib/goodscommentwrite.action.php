<?php
class goodscommentwrite
{
	public function index()
	{
		$root = array();
		$root['return'] = 1;

		$merchant_id = intval($GLOBALS['request']['merchant_id']);
		$email = addslashes($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = addslashes($GLOBALS['request']['pwd']);//密码

		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
		}
	
		$root['page_title']="我要评论";
		output($root);
	}
}
?>