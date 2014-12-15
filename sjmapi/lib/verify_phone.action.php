<?php
class verify_phone{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		$mobile_phone=trim($GLOBALS['request']['mobile']);
		//print_r($GLOBALS['request']);
		$root = array();
		$root['return'] = 1;
		$isMobile = preg_match("/^(13\d{9}|14\d{9}|18\d{9}|15\d{9})|(0\d{9}|9\d{8})$/",$mobile_phone);
		if(!$isMobile)
		{
			$root['info']="请输入正确的手机号码";
			output($root);
		}	
		
		//检查用户,用户密码
		$user = user_check($email,$pwd);
		$user_id  = intval($user['id']);			
		if($user_id>0)
		{
			$root['user_login_status'] = 1;		
			$smsSubscribe = $GLOBALS['db']->getRow("select `id`,`mobile_phone`,`code`,`status`,`send_count`,`add_time` from ".DB_PREFIX."sms_mobile_verify where mobile_phone = '$mobile_phone' and type=0");
			
			if($smsSubscribe && intval($smsSubscribe['send_count']) <= 3 && intval($smsSubscribe['status'])== 0)
			{
				$new_time=get_gmtime();
				if($new_time-$smsSubscribe['add_time']<61)
				{
					$root['info']="验证码已发出,请注意查收";
					output($root);
				}
				else
				{
					$code = $smsSubscribe['code'];
				}
				
			}
			elseif($smsSubscribe && intval($smsSubscribe['status']) == 1){
				//已经验证的
				$root['info'] = '该手机号码已经注册过!';
				output($root);
			}
			else
			{
				$tempcode = unpack('H4',str_shuffle(md5(uniqid())));
				$code = $tempcode[1];
			}
			
			$message=$code."（".app_conf("SHOP_TITLE")."手机绑定验证码,请完成验证）,如非本人操作,请勿略本短信";
			
			require_once APP_ROOT_PATH."system/utils/es_sms.php";
			$sms = new sms_sender();
			$send=$sms->sendSms($mobile_phone,$message);
			//$send['status']=1;
			if($send['status'])
			{		
				$add_time = get_gmtime();
				if($smsSubscribe && intval($smsSubscribe['send_count']) <= 3 && intval($smsSubscribe['status'])== 0)
				{
					$sql = "update ".DB_PREFIX."sms_mobile_verify set send_count = send_count + 1 where id=".$smsSubscribe['id']."";
					$GLOBALS['db']->query($sql);
				}
				else
				{
					$re=$GLOBALS['db']->query("insert into ".DB_PREFIX."sms_mobile_verify(mobile_phone,code,status,add_time,send_count,type) values('$mobile_phone','$code',0,'$add_time',1,0)");
				}
				
				/*插入一条发送成功记录到队列表中*/
				$msg_data['dest'] = $mobile_phone;
				$msg_data['send_type'] = 0;
				$msg_data['content'] = addslashes($message);;
				$msg_data['send_time'] = $add_time;
				$msg_data['is_send'] = 1;
				$msg_data['is_success'] = 1;
				$msg_data['create_time'] = $add_time;
				$msg_data['user_id'] = intval($user_id);
				$msg_data['title'] = "手机号绑定验证";
				$GLOBALS['db']->autoExecute(DB_PREFIX."deal_msg_list",$msg_data); 

				$root['info']="验证码已发出,请注意查收";
			}
			else
			{				
				$root['info']="发送失败";
			}
			
		}
		else
		{
			$root['user_login_status'] = 0;		
		}		
		output($root);
	}
}
?>