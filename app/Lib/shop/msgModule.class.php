<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(88522820@qq.com)
// +----------------------------------------------------------------------

require APP_ROOT_PATH.'app/Lib/page.php';
require APP_ROOT_PATH.'app/Lib/message.php';

class msgModule extends ShopBaseModule
{
	public function index()
	{
		$GLOBALS['tmpl']->caching = true;
		$cache_id  = md5(MODULE_NAME.trim($_REQUEST['act']).$GLOBALS['deal_city']['id']);	
		if($GLOBALS['tmpl']->is_cached("msg_index.html",$cache_id))
		{
			
		}	
		$GLOBALS['tmpl']->display("msg_index.html",$cache_id);
	}
	
	//不可接收购买评论
	public function add()
	{				
		$user_info = $GLOBALS['user_info'];
		$ajax = intval($_REQUEST['ajax']);
		if(!$user_info)
		{
			showErr($GLOBALS['lang']['PLEASE_LOGIN_FIRST'],$ajax);
		}
		if($_REQUEST['content']=='')
		{
			showErr($GLOBALS['lang']['MESSAGE_CONTENT_EMPTY'],$ajax);
		}
		
		//验证码
		if(app_conf("VERIFY_IMAGE")==1)
		{
			$verify = md5(trim($_REQUEST['verify']));
			$session_verify = es_session::get('verify');
			if($verify!=$session_verify)
			{				
				showErr($GLOBALS['lang']['VERIFY_CODE_ERROR'],$ajax);
			}
		}
		
		if(!check_ipop_limit(get_client_ip(),"message",intval(app_conf("SUBMIT_DELAY")),0))
		{
			showErr($GLOBALS['lang']['MESSAGE_SUBMIT_FAST'],$ajax);
		}
		
		$rel_table = addslashes(trim($_REQUEST['rel_table']));
		$message_type = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."message_type where type_name='".$rel_table."' and type_name <> 'supplier'");
		if(!$message_type)
		{
			showErr($GLOBALS['lang']['INVALID_MESSAGE_TYPE'],$ajax);
		}		
		$message_group = addslashes(trim($_REQUEST['message_group']));
		//查询退款状态
		if($message_group == "退款")
		{
			$my_order_id = addslashes(trim($_REQUEST['rel_id']));
			$order_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_order where id=".$my_order_id);
			
			if(intval($order_info['refund_status']) == 2)
			{
				showErr("已退款的商品不能继续申请退款!",$ajax);
			}
			if(intval($order_info['pay_status']) == 0)
			{
				showErr("请先进行支付再申请退款!",$ajax);
			}
			if(intval($order_info['refund_status']) == 1)
			{
				showErr("请勿多次申请退款!",$ajax);
			}
		}
		
		//添加留言
		$message['title'] = $_REQUEST['title']?htmlspecialchars(addslashes($_REQUEST['title'])):htmlspecialchars(addslashes($_REQUEST['content']));
		$message['content'] = htmlspecialchars(addslashes(valid_str($_REQUEST['content'])));
		$message['title'] = valid_str($message['title']);
		if($message_group)
		{
			$message['title']="[".$message_group."]:".$message['title'];
			$message['content']="[".$message_group."]:".$message['content'];
		}		
		$message['create_time'] = get_gmtime();
		$message['rel_table'] = $rel_table;
		$message['rel_id'] = addslashes(trim($_REQUEST['rel_id']));
		$message['user_id'] = intval($GLOBALS['user_info']['id']);
		if(intval($_REQUEST['city_id'])==0)
		$message['city_id'] = $deal_city['id'];
		else
		$message['city_id'] = intval($_REQUEST['city_id']);
		if(app_conf("USER_MESSAGE_AUTO_EFFECT")==0)
		{
			$message_effect = 0;
		}
		else
		{
			$message_effect = $message_type['is_effect'];
		}
		$message['is_effect'] = $message_effect;		
		$message['is_buy'] = 0;
		$message['contact'] = $_REQUEST['contact']?htmlspecialchars(addslashes($_REQUEST['contact'])):'';
		$message['contact_name'] = $_REQUEST['contact_name']?htmlspecialchars(addslashes($_REQUEST['contact_name'])):'';
		$GLOBALS['db']->autoExecute(DB_PREFIX."message",$message);
		if($message_group=='退款'&&$rel_table=='deal_order')
		{
			$GLOBALS['db']->query("update ".DB_PREFIX."deal_order set refund_status = 1 where id = ".intval($message['rel_id']));
			$GLOBALS['db']->query("update ".DB_PREFIX."deal_coupon set refund_status = 1 where order_id = ".intval($message['rel_id'])." and confirm_time = 0 and is_valid = 1 and balance_time = 0 and (any_refund = 1 or (expire_refund = 1 and end_time > 0 and end_time < ".get_gmtime()."))");
		}
		if($message_group=='退货'&&$rel_table=='deal_order')
		{
			$GLOBALS['db']->query("update ".DB_PREFIX."deal_order set retake_status = 1 where id = ".intval($message['rel_id']));
		}
		showSuccess($GLOBALS['lang']['MESSAGE_POST_SUCCESS'],$ajax);
	}
	public function cancel_refund(){
		$id = intval($_REQUEST['id']);
		$GLOBALS['db']->query("update ".DB_PREFIX."deal_order set refund_status = 0 where refund_status = 1 and id = ".$id);
		$GLOBALS['db']->query("update ".DB_PREFIX."deal_coupon set refund_status = 0 where refund_status = 1 and order_id = ".$id." and confirm_time = 0 and is_valid = 1 and balance_time = 0 and (any_refund = 1 or (expire_refund = 1 and end_time > 0 and end_time < ".get_gmtime()."))");
		//更新退款留言
		$GLOBALS['db']->query("update ".DB_PREFIX."message set content=concat('[已撤销]',content) where content like '%退款%' and content not like '%已撤销%' and rel_id=".$id);
		$json['status'] = 1;
		$json['info'] = "取消成功";
		echo json_encode($json);
		exit;
	}
}
?>