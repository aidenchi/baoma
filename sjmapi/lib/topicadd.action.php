<?php
class topicadd
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
			$forum_title = $GLOBALS['request']['forum_title'];
			$content = $GLOBALS['request']['content'];	
			$type =strim($GLOBALS['request']['type']);
			$cate_id = intval($GLOBALS['request']['cate_id']);
			$cate_name =  $GLOBALS['db']->getOne("select name from ".DB_PREFIX."topic_tag_cate where id = ".$cate_id);
			
			$topic = array();			
			$topic['forum_title'] = $forum_title;
			$topic['content'] = $content;
			$topic['create_time'] = get_gmtime();
			$topic['type'] = $type;
			$topic['user_id'] = $user_data['id'];
			$topic['user_name'] = $user_data['user_name'];
			$topic['is_effect']  = 1;
			$topic['is_delete'] = 0;
			$topic['source_name'] = 'wap';
			$topic['cate_match_row'] = $cate_name;
			$topic['is_cached'] = 1;
			$topic['image_list'] = 'a:0:{}';
			$topic['topic_group_data'] = 'b:0;';
			
			$GLOBALS['db']->autoExecute(DB_PREFIX."topic",$topic,"INSERT","");
			$topic_id = intval($GLOBALS['db']->insert_id());
			if($topic_id>0){
				$GLOBALS['db']->query("update ".DB_PREFIX."topic set origin_id = ".$topic_id." where id = ".$topic_id);				
				$link_data = array();
				$link_data['topic_id'] = $topic_id;
				$link_data['cate_id'] = $cate_id;
				$GLOBALS['db']->autoExecute(DB_PREFIX."topic_cate_link",$link_data,"INSERT","","SILENT");
				syn_topic_match($topic_id);	
				//user表里topic量加1
				$GLOBALS['db']->query("update ".DB_PREFIX."user set topic_count = topic_count + 1 where id = ".intval($user_data['id']));
				increase_user_active(intval($user_data['id']),"发表了一篇帖子");
				$root['status']=1;
				$root['info']='发帖成功';
			}else{
				$root['status']=0;
				$root['info']='发帖失败';
			}
			
		}
		
		
		$root['city_name']=$city_name;
		output($root);
	}
}

?>