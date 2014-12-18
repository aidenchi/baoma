<?php
class myinfosave
{
	public function index()
	{	
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		$user_id = intval($user_data['id']);
		
		$root = array();
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$root['status']=0;
			$root['info']='修改失败';
			$uid = intval($user_data['id']);
			$user_email = $GLOBALS['request']['user_email'];		
			$user_name = $GLOBALS['request']['user_name'];		
			$sex = intval($GLOBALS['request']['sex']);
			$birth = $GLOBALS['request']['birth'];			
			$birth_arr = explode('-',$birth); 
			$byear = intval($birth_arr[0]);
			$bmonth = intval($birth_arr[1]);
			$bday = intval($birth_arr[2]);
			$my_intro = $GLOBALS['request']['my_intro'];
			
			$result = check_email_and_username($uid,$user_email,$user_name);
			if($result['flag']){
				$sql = "update ".DB_PREFIX."user set email = '".$user_email."', user_name = '".$user_name."', sex = '".$sex."', byear = '".$byear."', bmonth = '".$bmonth."', bday = '".$bday."', my_intro = '".$my_intro."' where id = ".$uid;
				$GLOBALS['db']->query($sql);
				$root['status']=1;
				$root['info']='修改成功';
			}else{
				$root['status']=0;
				$root['info']=$result['msg'];
			}				
		}
		
		$root['page_title']="我的资料";
		output($root);
	}
}

function check_email_and_username($uid,$email,$user_name){
	$result = array();
	$result['flag'] = true;
	$result['msg'] = "";	
	//检测email是否除了自己之外还存在
	if($GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user where email = '".$email."' and id <> ".$uid)>0){
		$result['flag'] = false;
		$result['msg'] = "该email已经被使用，请换一个";
	}
	//检测昵称是否除了自己之外还存在
	if($GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user where user_name = '".$user_name."' and id <> ".$uid)>0){
		$result['flag'] = false;
		$result['msg'] = "该昵称已经被使用，请换一个";
	}
	return $result;
}	

?>