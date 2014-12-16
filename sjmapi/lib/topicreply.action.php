<?php
class topicreply
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
			$content = $GLOBALS['request']['content'];
			$topic_id = intval($GLOBALS['request']['topic_id']);
			$reply_user_id = intval($GLOBALS['request']['reply_user_id']);
			$reply_user_name = $GLOBALS['request']['reply_user_name'];
			$content = $GLOBALS['request']['content'];
			$topic_reply = array();	
			$topic_reply['topic_id'] = $topic_id;
			$topic_reply['content'] = $content;
			$topic_reply['user_name'] = $user_data['user_name'];
			$topic_reply['user_id'] = intval($user_data['id']);
			$topic_reply['reply_id'] = $reply_id;
			$topic_reply['reply_user_id'] = $reply_user_id;
			$topic_reply['reply_user_name'] = $reply_user_name;
			$topic_reply['create_time'] = get_gmtime();
			$topic_reply['is_effect']  = 1;
			$topic_reply['is_delete'] = 0;			
			
			$GLOBALS['db']->autoExecute(DB_PREFIX."topic_reply",$topic_reply,"INSERT","");
			$reply_id = intval($GLOBALS['db']->insert_id());
			if($reply_id>0){
				$GLOBALS['db']->query("update ".DB_PREFIX."topic set reply_count = reply_count + 1 where id = ".$topic_id);//该帖子的回复数量加1
				$root['status']=1;
				$root['info']='回复成功';
			}else{
				$root['status']=0;
				$root['info']='回复失败';
			}
			$root['page_title']='帖子详情';
		}		
		
		$root['city_name']=$city_name;
		output($root);
	}
}

?>