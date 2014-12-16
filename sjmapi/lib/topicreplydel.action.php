<?php
class topicreplydel
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		
		$root = array();	
		$root['status']=0;
		$root['info']='删除失败';
		
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$topic_reply_id = intval($GLOBALS['request']['topic_reply_id']);
			$topic_id =  $GLOBALS['db']->getOne("select topic_id from ".DB_PREFIX."topic_reply where id = ".$topic_reply_id);
			$GLOBALS['db']->query("delete from ".DB_PREFIX."topic_reply where id = ".$topic_reply_id);
			$GLOBALS['db']->query("update ".DB_PREFIX."topic set reply_count = reply_count - 1 where id = ".$topic_id);//该帖子的回复数量减1
			$root['status']=1;
			$root['info']='删除成功';			
		}		
		
		$root['page_title']='帖子详情';
		$root['city_name']=$city_name;
		output($root);
	}
}

?>