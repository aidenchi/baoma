<?php
class growthdiaryreply
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
			$growth_diary_id = intval($GLOBALS['request']['growth_diary_id']);
			$growth_diary_reply = array();	
			$growth_diary_reply['growth_diary_id'] = $growth_diary_id;
			$growth_diary_reply['content'] = $content;
			$growth_diary_reply['user_name'] = $user_data['user_name'];
			$growth_diary_reply['user_id'] = intval($user_data['id']);
			$growth_diary_reply['create_time'] = get_gmtime();
			$growth_diary_reply['is_read'] = 0;
			
			$growth_diary_author_user_id = $GLOBALS['db']->getOne("select user_id from ".DB_PREFIX."growth_diary where id = ".$growth_diary_id);
			if($growth_diary_author_user_id == intval($user_data['id'])){//如果是自己回复自己的成长日记，is_read为1
				$growth_diary_reply['is_read'] = 1;
			}
			
			$GLOBALS['db']->autoExecute(DB_PREFIX."growth_diary_reply",$growth_diary_reply,"INSERT","");
			$reply_id = intval($GLOBALS['db']->insert_id());
			if($reply_id>0){
				$root['status']=1;
				$root['info']='回复成功';
			}else{
				$root['status']=0;
				$root['info']='回复失败';
			}
			$root['page_title']='成长日记详情';
		}		
		
		$root['city_name']=$city_name;
		output($root);
	}
}

?>