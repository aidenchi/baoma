<?php
class register_verify_code{
	public function index()
	{
		$mobile=trim($GLOBALS['request']['mobile']);
		$code = strim($GLOBALS['request']['code']);/*验证码*/
		$ref_uid=intval($GLOBALS['request']['ref_uid']);/*邀请id*/
		$is_register = strim($GLOBALS['request']['is_register']);//0:仅验证;1:除验证外,如果用户不存在,则直接创建一个新用户,客户端自动登陆;
		
		if($mobile == '')
		{
			$root['status'] = 0;
			$root['info'] = '手机号码不能为空';
			output($root);
		}
		
		if(!check_mobile($mobile))
		{
			$root['status'] = 0;
			$root['info'] = "请输入正确的手机号码";
			output($root);
		}
				
		//print_r($GLOBALS['request']);
		if($code=='')
		{
			$root['info']="请输入验证码!";
			$root['status'] = 0;
			output($root);
		}
		$db_code = $GLOBALS['db']->getRow("select id,code,add_time from ".DB_PREFIX."sms_mobile_verify where status=0 and mobile_phone = '$mobile' and type=0 order by id desc");
		//print_r($db_code['code']);
		if($db_code['code'] != $code)
		{
			$root['info']="请输入正确的验证码!";
			$root['status'] = 0;
			output($root);
		}
		$new_time=get_gmtime();
		if(($new_time-$db_code['add_time']) > 60*30)/*30分钟失效*/
		{
			$root['info']="验证码已失效,请重新获取!";
			$root['status'] = 0;
			$GLOBALS['db']->query("delete from ".DB_PREFIX."sms_mobile_verify  where mobile_phone = ".$mobile."");
			output($root);
		}
		
		//$GLOBALS['db']->query("update ".DB_PREFIX."sms_mobile_verify set status = 1 where id=".$db_code['id']."");
		
		$GLOBALS['db']->query("delete from ".DB_PREFIX."sms_mobile_verify where id=".$db_code['id']."");
				
		//is_register 0:仅验证;1:除验证外,如果用户不存在,则直接创建一个新用户,客户端自动登陆;
		if($is_register == 1){
			$user_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user where mobile = '$mobile'");
			require_once(APP_ROOT_PATH."/system/libs/user.php");
			if (!$user_data){
				//自动注册一个用户;
				$pwd = rand(1111,9999);
				$root = mobile_reg($mobile,$pwd,$ref_uid);
				auto_do_login_user($root['mobile'],md5($pwd),false);
			}else{
				$root['return'] = 1;
				$root['user_login_status'] = 1;//用户登陆状态：1:成功登陆;0：未成功登陆
				$root['info'] = "用户登陆成功";
				$root['uid'] = $user_data['id'];
				$root['user_name'] = $user_data['user_name'];
				$root['user_email'] = $user_data['email'];
				$root['user_money'] = $user_data['money'];
				$root['mobile'] = $user_data['mobile'];
				$root['user_pwd'] = $user_data['user_pwd'];
				$root['user_money_format'] = format_price($user_data['money']);//用户金额
				$root['home_user']['fans'] = $user_data['focused_count'];
				$root['home_user']['photos'] = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."topic_image where user_id = ".$user_data['id']);
				$root['home_user']['goods'] = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."topic where user_id = ".$user_data['id']." and topic_group = 'Fanwe' and is_delete = 0 and is_effect = 1");
				$root['home_user']['follows'] = $user_data['focus_count'];
				$root['home_user']['favs'] = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."topic where user_id = ".$user_data['id']." and fav_id <> 0");
					
				$root['home_user']['user_avatar'] = get_abs_img_root(get_muser_avatar($user_data['id'],"big"));
				$root['user_avatar'] = get_abs_img_root(get_muser_avatar($user_data['id'],"big"));	
				auto_do_login_user($root['mobile'],$root['user_pwd'],false);
			}			
			
			//删除注册电话号码验证吗
			//$GLOBALS['db']->query("delete from ".DB_PREFIX."sms_mobile_verify where mobile_phone = ".$mobile."");
			
			
			
		}else{
			$root['info']="验证成功";
		}
		
		$root['status'] = 1;
		output($root);
	}
}
?>