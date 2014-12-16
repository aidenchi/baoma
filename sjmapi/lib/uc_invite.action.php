<?php
class uc_invite
{
	public function index()
	{
		
		$root = array();
		$root['return'] = 1;
		
		$page = intval($GLOBALS['request']['page']); //分页
		
		$page=$page==0?1:$page;
		
		$page_size = PAGE_SIZE;
		$limit = (($page-1)*$page_size).",".$page_size;
		
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		
		
		//检查用户,用户密码
		$user = user_check($email,$pwd);
		$user_id  = intval($user['id']);
			
		$url = get_domain().APP_ROOT;
		$share_url=str_replace("sjmapi", "wap", $url);
		if($user_id)
		$share_url .= "?r=".base64_encode(intval($user_id));
		$root['share_url']=$share_url;	
		$root['page_title']="邀请链接";//fwb 2014-08-27
		output($root);
	}
	
	
}
?>