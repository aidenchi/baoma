<?php
class mymsgsend
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
			
			$to_user_name = addslashes(trim($GLOBALS['request']['to_user_name']));
			$content = htmlspecialchars(addslashes(trim($GLOBALS['request']['content'])));
			$to_user_id = $GLOBALS['db']->getOne("select id from ".DB_PREFIX."user where user_name = '".$to_user_name."'");
			if(intval($to_user_id)==0){
				$root['status'] = 0;
				$root['info'] = "收件人不存在";
			}else{
				//function send_user_msg($title,$content,$from_user_id,$to_user_id,$create_time,$sys_msg_id=0,$only_send=false,$is_notice = false)
				send_user_msg("",$content,intval($user_data['id']),$to_user_id,get_gmtime());
				$root['status'] = 1;
				$key = array($to_user_id,intval($user_data['id']));
				sort($key);
				$group_key = implode("_",$key);
				$root['href'] = "index.php?ctl=mymsgdetail&id=".$group_key;
				$root['info'] = "已发送";
			}
		}	
		
		output($root);
	}
}
?>