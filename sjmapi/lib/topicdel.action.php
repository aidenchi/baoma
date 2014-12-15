<?php
class topicdel
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
			$root['status']=0;
			$root['info']='帖子删除失败';
			$topic_id = intval($GLOBALS['request']['topic_id']);
			//删除帖子
			$GLOBALS['db']->query("delete from ".DB_PREFIX."topic where id = ".$topic_id);
			//删除该帖子的回复
			$GLOBALS['db']->query("delete from ".DB_PREFIX."topic_reply where topic_id = ".$topic_id);			
			//删除帖子版块的关联表
			$GLOBALS['db']->query("delete from ".DB_PREFIX."topic_cate_link where topic_id = ".$topic_id);
			$root['status']=1;
			$root['info']='帖子删除成功';			
		}		
		
		$root['page_title']='帖子详情';
		$root['city_name']=$city_name;
		output($root);
	}
}

?>