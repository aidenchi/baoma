<?php
class mymsgdel
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
			$msg_ids_val = trim($GLOBALS['request']['msg_ids_val']);
			$msg_ids_val = substr($msg_ids_val,1);
			$root['msg_ids_val'] = $msg_ids_val;
			$msg_ids_arr = explode(',',$msg_ids_val); 
			foreach($msg_ids_arr as $v){
				 $GLOBALS['db']->query("update ".DB_PREFIX."msg_box set is_delete = 1 where id = ".$v);			 
			}
			$root['status']=1;
			$root['info']='删除成功';			
		}		
		
		$root['page_title']='成长日记详情';
		$root['city_name']=$city_name;
		output($root);
	}
}

?>