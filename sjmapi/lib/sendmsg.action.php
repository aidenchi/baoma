<?php
class sendmsg
{
	public function index()
	{
		$root = array();
		require_once APP_ROOT_PATH."system/libs/user.php";
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);
		$username = strim($GLOBALS['request']['user_name']);		
		//$result = do_login_user($email,$pwd);
		//$GLOBALS['user_info'] = $user_data = es_session::get('user_info');
		if(strim($GLOBALS['request']['from']=='wap')){
			$user_data = user_check($email,$pwd);
			$root['email']=$email;
			$root['pwd']=$pwd;
			$root['message']=htmlspecialchars(addslashes(trim($GLOBALS['request']['message'])));
			$root['name']=$GLOBALS['request']['user_name'];
			$root['da']=$GLOBALS['user_info']=user_check($email,$pwd);
		}else{
			$result = do_login_user($email,$pwd);
			$GLOBALS['user_info'] = $user_data = es_session::get('user_info');
		}// fwb add 2014-08-27
		
		if($GLOBALS['user_info'])
		{
			$user_id = $GLOBALS['db']->getOne("select id from ".DB_PREFIX."user where user_name = '".$username."'");
			$content = htmlspecialchars(addslashes(trim($GLOBALS['request']['message'])));
			send_user_msg("",$content,intval($GLOBALS['user_info']['id']),$user_id,get_gmtime());
			$root['return'] = 1;
			$root['info']="发送成功";
		}
		else
		{
			$root['return'] = 0;
			$root['info'] = "请先登录";
		}		
		output($root);
		
	}
}
?>