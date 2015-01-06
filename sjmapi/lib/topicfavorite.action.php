<?php
class topicfavorite
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		
		$root = array();	
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['login_info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$root['page_title'] = "成长日历";
			
			$topic_id = intval($GLOBALS['request']['topic_id']);	
			$author_user_id = intval($GLOBALS['request']['author_user_id']);
			
			if($author_user_id == intval($user_data['id'])){
				$root['fav_status']=4;//自己不能喜欢自己
			}else{
				$fav_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."topic_favorite where topic_id = ".$topic_id." and author_user_id = ".
				$author_user_id." and fav_user_id = ".intval($user_data['id']));
				if($fav_data){//已经喜欢过，再点一下就是取消喜欢				
					$GLOBALS['db']->query("delete from ".DB_PREFIX."topic_favorite where id = ".$fav_data['id']);
					$root['fav_status']=1;//状态变为未喜欢
				}else{
					$topic_fav = array();
					$topic_fav['topic_id'] = $topic_id;
					$topic_fav['author_user_id'] = $author_user_id;
					$topic_fav['fav_user_id'] = intval($user_data['id']);
					$topic_fav['create_time'] = get_gmtime();	
					$GLOBALS['db']->autoExecute(DB_PREFIX."topic_favorite",$topic_fav,"INSERT","");
					$id = intval($GLOBALS['db']->insert_id());
					if($id>0){
						$root['fav_status']=2;//操作成功，状态变为已喜欢
					}else{
						$root['fav_status']=3;//操作失败，状态变为未喜欢
					}
				}	
			}
					
		}

		output($root);
	}
}
?>