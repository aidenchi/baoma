<?php
class growthdiaryreplydel
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
			$reply_id = intval($GLOBALS['request']['reply_id']);
			$GLOBALS['db']->query("delete from ".DB_PREFIX."growth_diary_reply where id = ".$reply_id);
			$root['status']=1;
			$root['info']='删除成功';			
		}		
		
		$root['page_title']='成长日记详情';
		$root['city_name']=$city_name;
		output($root);
	}
}

?>