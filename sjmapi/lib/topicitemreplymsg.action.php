<?php
class topicitemreplymsg
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		
		$root = array();	
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		$root["login_user_id"] = intval($user_data['id']);
		$root["login_user_name"] = $user_data['user_name'];
		
		if($user_id == 0){			
			$root['user_login_status'] = 0;				
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			/******************************************别人对我帖子的回复******************************************/
			//查询出我的帖子的ids
			$my_topic_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic where user_id = ".intval($user_data['id'])." and is_effect = 1 and is_delete = 0  and fav_id = 0 ".
			"and relay_id = 0 and type='share' and id = origin_id order by create_time desc");
			$my_topic_ids = '';
			foreach($my_topic_list as $k0=>$v0){
				$my_topic_ids = $my_topic_ids.$v0['id'].',';
			}
			$my_topic_ids = substr($my_topic_ids,0,-1);
			$my_topic_ids = '('.$my_topic_ids.')';
			//别人对我的帖子的回复  未读的数量
			$topic_replynoread_sql_count = "select count(*) from ".DB_PREFIX."topic_reply where topic_id in ".$my_topic_ids." and is_read = 0";
			$topic_replynoread_count = $GLOBALS['db']->getOne($topic_replynoread_sql_count);
			//别人对我的帖子的回复  未读
			$topic_replynoread_sql = "select topic_id,count(*) as num from ".DB_PREFIX."topic_reply where topic_id in ".$my_topic_ids." and is_read = 0 group by topic_id";
			$topic_replynoread_list = $GLOBALS['db']->getAll($topic_replynoread_sql);
			foreach($topic_replynoread_list as $k=>$v){
				$topic_item = $GLOBALS['db']->getRow("select id,forum_title from ".DB_PREFIX."topic where id = ".$v['topic_id']);
				$topic_replynoread_list[$k]['item'] = $topic_item;
			}
			$root['topic_replynoread_list']=$topic_replynoread_list;
			$root['topic_replynoread_count']=intval($topic_replynoread_count);
			$root['topic_replynoread_sql'] = $topic_replynoread_sql;
			
			/******************************************别人对我回复的回复******************************************/
			//别人对我回复的回复  未读的数量
			$topic_reply_replynoread_sql_count = "select count(*) from ".DB_PREFIX."topic_reply where topic_id not in ".$my_topic_ids.
				" and reply_user_id = ".intval($user_data['id'])." and reply_is_read = 0";
			$topic_reply_replynoread_count = $GLOBALS['db']->getOne($topic_reply_replynoread_sql_count);
			//别人对我回复的回复  未读
			$topic_reply_replynoread_sql = "select topic_id,count(*) as num from ".DB_PREFIX."topic_reply where topic_id not in ".$my_topic_ids.
			" and reply_user_id = ".intval($user_data['id'])." and reply_is_read = 0 group by topic_id";
			$topic_reply_replynoread_list = $GLOBALS['db']->getAll($topic_reply_replynoread_sql);
			foreach($topic_reply_replynoread_list as $k1=>$v1){
				$topic_item1 = $GLOBALS['db']->getRow("select id,forum_title from ".DB_PREFIX."topic where id = ".$v1['topic_id']);
				$topic_reply_replynoread_list[$k1]['item'] = $topic_item1;
			}
			$root['topic_reply_replynoread_list']=$topic_reply_replynoread_list;
			$root['topic_reply_replynoread_count']=intval($topic_reply_replynoread_count);
			$root['topic_reply_replynoread_sql'] = $topic_reply_replynoread_sql;
			
			
			//总的回复数量
			$topic_replynoread_count_total = intval($topic_replynoread_count) + intval($topic_reply_replynoread_count);
			$root['topic_replynoread_count_total'] = $topic_replynoread_count_total;
		}
		
		$root['page_title'] = "贝欧-论坛帖子未读回复";
		$root['city_name']=$city_name;
		output($root);
	}
}
?>