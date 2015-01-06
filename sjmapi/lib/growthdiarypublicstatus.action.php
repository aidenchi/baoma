<?php
class growthdiarypublicstatus
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
			$root['page_title'] = "成长日日记";
			
			$growth_diary_id = intval($GLOBALS['request']['growth_diary_id']);	
			
			if($growth_diary_id != intval($user_data['id'])){
				$old_public_status = $GLOBALS['db']->getOne("select is_public from ".DB_PREFIX."growth_diary where id = ".$growth_diary_id);
				if($old_public_status == 0){
					$new_public_status = 1;
				}
				if($old_public_status == 1){
					$new_public_status = 0;
				}
				$u_sql = "update ".DB_PREFIX."growth_diary set is_public = ".$new_public_status." where id = ".$growth_diary_id;
				$GLOBALS['db']->query($u_sql);
				$root['status']=1;
				$root['public_status']=$new_public_status;
				$root['info']="权限修改成功";				
			}else{
				$root['status']=0;
				$root['info']="权限修改失败";
			}
					
		}

		output($root);
	}
}
?>