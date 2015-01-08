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
		
		//点击量加1
		$u_sql = "update ".DB_PREFIX."topic set hit_count = hit_count + 1 where id = ".$topic_id." and is_effect= 1 ".
		"and is_delete=0 and relay_id = 0 and origin_id=".$topic_id;
		$GLOBALS['db']->query($u_sql);
		
		if($topic_item){
			$root['exit']=1;
			//判断当前登录者是否是这篇帖子的主人，是的话则把这篇帖子的未读回复置为已读is_read 置为1
			if($topic_item['user_id'] == intval($user['id'])){
				$noreadreply_sql = "select id from ".DB_PREFIX."topic_reply where topic_id = ".$topic_id." and is_read = 0 ";
				$topic_noreadreply_list = $GLOBALS['db']->getAll($noreadreply_sql);
				foreach($topic_noreadreply_list as $k0=>$v0){
					$GLOBALS['db']->query("update ".DB_PREFIX."topic_reply set is_read = 1 where id = ".$v0['id']);
				}
			}else{//不是的话则把这篇帖子的别人对当前登录者的回复置为已读reply_is_read 置为1
				$reply_noreadreply_sql = "select id from ".DB_PREFIX."topic_reply where topic_id = ".$topic_id.
				" and reply_user_id = ".intval($user['id'])." and reply_is_read = 0 ";
				$topic_reply_noreadreply_list = $GLOBALS['db']->getAll($reply_noreadreply_sql);
				foreach($topic_reply_noreadreply_list as $k1=>$v1){
					$GLOBALS['db']->query("update ".DB_PREFIX."topic_reply set reply_is_read = 1 where id = ".$v1['id']);
				}
			}
			
			//读取回复
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;
			$limit_sql=" limit ".$limit;
			$sql_count = "select count(*) from ".DB_PREFIX."topic_reply where topic_id = ".$topic_id." and ".
			"is_effect = 1 and is_delete = 0 order by create_time asc ";
			$total = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($total/$page_size);
			
			//回复列表
			$topic_reply_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_reply where topic_id = ".$topic_id." and ".
			"is_effect = 1 and is_delete = 0 order by create_time desc ".$limit_sql);	
			//点赞数量
			$fav_sql_count = "select count(*) from ".DB_PREFIX."topic_favorite where topic_id = ".$topic_id;
			$fav_total = $GLOBALS['db']->getOne($fav_sql_count);
			$topic_item['fav_count'] = intval($fav_total);
			//当前登录者是否点赞过这篇日记
			$topic_item['is_fav'] = 0;
			if(intval($user['id']) > 0){
				$fav_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."topic_favorite where topic_id = ".$topic_id.
				" and author_user_id != 0 and fav_user_id = ".intval($user['id']));
				if($fav_data){
					$topic_item['is_fav'] = 1;
				}
			}
			
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