<?php
class topicitem
{
	public function index()	{
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		
		//检查用户,用户密码
		$user = user_check($email,$pwd);
		$user_id  = intval($user['id']);			
		$root = array();
		
		$topic_id = intval($GLOBALS['request']['id']);//帖子id
		$page = intval($GLOBALS['request']['page']); //分页
		
		//读取主帖子
		$topic_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."topic where id = ".$topic_id." and is_effect= 1 ".
		"and is_delete=0 and relay_id = 0 and origin_id=".$topic_id);
		
		if($topic_item){
			$root['exit']=1;
			//读取回复
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;
			$limit_sql=" limit ".$limit;
			$sql_count = "select count(*) from ".DB_PREFIX."topic_reply where topic_id = ".$topic_id." and ".
			"is_effect = 1 and is_delete = 0 order by create_time asc ";
			$total = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($total/$page_size);
			
			$topic_reply_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_reply where topic_id = ".$topic_id." and ".
			"is_effect = 1 and is_delete = 0 order by create_time asc ".$limit_sql);	
			
			$base_size = ($page-1)*$page_size;
			$root['base_size'] = $base_size;
			$root['user_id'] = $user_id;
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);			
			$root['topic_reply_list']=$topic_reply_list;
		}else{
			$root['exit']=0;
			$root['msg']='抱歉，该帖子不存在！';
		}
		
		$root['topic_item']=$topic_item;
		$root['page_title']='帖子详情';
		output($root);
	}
}
?>