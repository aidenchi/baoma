<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(88522820@qq.com)
// +----------------------------------------------------------------------



//$sn = htmlspecialchars(addslashes(trim($_REQUEST['coupon_sn'])));
//$pwd = htmlspecialchars(addslashes(trim($_REQUEST['coupon_pwd'])));
function biz_check_coupon($s_account_info,$sn,$pwd)
{

	if(intval($s_account_info['id'])==0)
	{
		$result['status'] = 2;
		$result['msg'] = "请先登录";
		return $result;
	}
	else
	{
		$now = get_gmtime();

		$supplier_id = intval($s_account_info['supplier_id']);
		
		if (empty($sn)){
			$sql = "select c.refund_status, c.id as id,c.deal_id, c.order_id, c.is_valid,doi.sub_name, doi.name as name,doi.number as number, c.sn as sn,c.supplier_id as supplier_id,c.confirm_time as confirm_time from ".DB_PREFIX."deal_coupon as c left join ".DB_PREFIX."deal_order_item as doi on c.order_deal_id = doi.id where c.password = '".$pwd."' and c.is_valid in(1,2) and c.is_delete = 0  and c.begin_time <".$now." and (c.end_time = 0 or c.end_time>".$now.")";			
		}else{		
			$sql = "select c.refund_status, c.id as id,c.deal_id, c.order_id, c.is_valid,doi.sub_name, doi.name as name,doi.number as number, c.sn as sn,c.supplier_id as supplier_id,c.confirm_time as confirm_time from ".DB_PREFIX."deal_coupon as c left join ".DB_PREFIX."deal_order_item as doi on c.order_deal_id = doi.id where c.sn = '".$sn."' and c.password = '".$pwd."' and c.is_valid in(1,2) and c.is_delete = 0  and c.begin_time <".$now." and (c.end_time = 0 or c.end_time>".$now.")";
		}
		$coupon_data = $GLOBALS['db']->getRow($sql);
		if($coupon_data)
		{
			if($coupon_data['is_valid'] == 2){
				$result['status'] = 0;
				$result['msg'] = $GLOBALS['lang']['COUPON_IS_VALID_2'];
				//ajax_return($result);
					
				return $result;
			}

			if($coupon_data['refund_status'] > 0){
				$result['status'] = 0;
				$result['msg'] = "团购券提交了退款申请，无法验证";
				//ajax_return($result);

				return $result;
			}

			$sql = "select d.* from ".DB_PREFIX."deal as d left join ".DB_PREFIX."deal_location_link as l on l.deal_id = d.id where l.deal_id = ".$coupon_data['deal_id']." and l.location_id in (".implode(",",$s_account_info['location_ids']).")";
			$deal_info = $GLOBALS['db']->getRow($sql);
			if(!$deal_info)
			{
				$result['status'] = 0;
				$result['msg'] = $GLOBALS['lang']['NO_AUTH'];
				//ajax_return($result);
					
				return $result;
			}
			if(!$coupon_data['name'])$coupon_data['name'] = $deal_info['name'];

			if($coupon_data['supplier_id']!=$supplier_id)
			{
				$result['status'] = 0;
				$result['msg'] = $GLOBALS['lang']['COUPON_INVALID_SUPPLIER'];
				//ajax_return($result);
				return $result;
			}
			elseif($coupon_data['confirm_time'] > 0)
			{
				$result['status'] = 0;
				$result['msg'] = sprintf($GLOBALS['lang']['COUPON_INVALID_USED'],to_date($coupon_data['confirm_time']));
				//ajax_return($result);
				return $result;
			}
			else
			{
				$deal_type = intval($GLOBALS['db']->getOne("select deal_type from ".DB_PREFIX."deal where id = ".intval($coupon_data['deal_id'])));
				$result['status'] = 1;
				$result['coupon_data'] = $coupon_data;
				
				$sql = "select total_price from ".DB_PREFIX."deal_order where id = ".intval($coupon_data['order_id']);
				$total_price_format = format_price(floatval($GLOBALS['db']->getOne($sql)));				
				if($deal_type == 1)
				{
					$result['msg'] = $coupon_data['name']."(购买数量：".$coupon_data['number'].");订单金额:".$total_price_format;
					$result['sub_msg'] = $coupon_data['sub_name']."(购买数量：".$coupon_data['number'].");订单金额:".$total_price_format;
					$result['number'] = $coupon_data['number'];
				}
				else
				{
					$result['msg'] = $coupon_data['name'].";订单金额:".$total_price_format;
					$result['sub_msg'] = $coupon_data['sub_name'].";订单金额:".$total_price_format;
					$result['number'] = 1;
				}
				
				
				//ajax_return($result);
				return $result;
			}
		}
		else
		{
			$result['status'] = 0;
			$result['msg'] = '此密码错误,不能接待。请与消费者确认提供的密码是否正确';//$GLOBALS['lang']['COUPON_INVALID'];
			//ajax_return($result);
			return $result;
		}
	}
}	
	
	
	
function biz_use_coupon($s_account_info,$sn,$pwd,$use_num = 1)
{	
	$result = biz_check_coupon($s_account_info,$sn,$pwd);

	if ($result['status'] == 1){
		
		if ($use_num <= $result['number']){
			$coupon_data = $result['coupon_data'];
			$now = get_gmtime();
			$supplier_id = intval($s_account_info['supplier_id']);
			
			//开始确认
			$GLOBALS['db']->query("update ".DB_PREFIX."deal_coupon set is_balance = 1 , confirm_account = ".intval($s_account_info['id']).",confirm_time=".$now." where id = ".intval($coupon_data['id']));
			$result['status'] = 1;
				
			$deal_type = intval($GLOBALS['db']->getOne("select deal_type from ".DB_PREFIX."deal where id = ".intval($coupon_data['deal_id'])));
			if($deal_type == 1)
			{
				$result['msg'] = $coupon_data['name']."(购买数量：".$coupon_data['number'].")".sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));
				$result['sub_msg'] = $coupon_data['sub_name']."(购买数量：".$coupon_data['number'].")".sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));
			}
			else
			{
				$result['msg'] = $coupon_data['name'].sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));;
				$result['sub_msg'] = $coupon_data['sub_name'].sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));
			}
			//操作积分相关
			$t_begin_time = to_timespan(to_date(get_gmtime(),"Y-m-d"));  //今天开始
			$t_end_time = to_timespan(to_date(get_gmtime(),"Y-m-d"))+ (24*3600 - 1);  //今天结束
			$y_begin_time = $t_begin_time - (24*3600); //昨天开始
			$y_end_time = $t_end_time - (24*3600);  //昨天结束
				
			$point = intval(app_conf("USER_YOUHUI_DOWN_POINT"));
			$score = intval(app_conf("USER_YOUHUI_DOWN_SCORE"));
			$money = doubleval(app_conf("USER_YOUHUI_DOWN_MONEY"));
			$point_max = intval(app_conf("USER_ACTIVE_POINT_MAX"));
			$score_max = intval(app_conf("USER_ACTIVE_SCORE_MAX"));
			$money_max = doubleval(app_conf("USER_ACTIVE_MONEY_MAX"));
				
			$sum_money = doubleval($GLOBALS['db']->getOne("select sum(money) from ".DB_PREFIX."user_active_log where user_id = ".$coupon_data['user_id']." and create_time between ".$t_begin_time." and ".$t_end_time));
			$sum_score = intval($GLOBALS['db']->getOne("select sum(score) from ".DB_PREFIX."user_active_log where user_id = ".$coupon_data['user_id']." and create_time between ".$t_begin_time." and ".$t_end_time));
			$sum_point = intval($GLOBALS['db']->getOne("select sum(point) from ".DB_PREFIX."user_active_log where user_id = ".$coupon_data['user_id']." and create_time between ".$t_begin_time." and ".$t_end_time));
				
			if($sum_money>=$money_max)$money = 0;
			if($sum_score>=$score_max)$score = 0;
			if($sum_point>=$point_max)$point = 0;
				
			if($money>0||$score>0||$point>0)
			{
				require_once  APP_ROOT_PATH."system/libs/user.php";
				$log = "验证消费券";
				modify_account(array("money"=>$money,"score"=>$score,"point"=>$point),$coupon_data['user_id'],$log);
				$data['user_id'] = $coupon_data['user_id'];
				$data['create_time'] = get_gmtime();
				$data['money'] = $money;
				$data['score'] = $score;
				$data['point'] = $point;
				$GLOBALS['db']->autoExecute(DB_PREFIX."user_active_log",$data);
			}
			send_use_coupon_sms(intval($coupon_data['id'])); //发送团购券确认消息
			send_use_coupon_mail(intval($coupon_data['id'])); //发送团购券确认消息
				
			update_balance($coupon_data['id'],$coupon_data['deal_id']);
			//ajax_return($result);			
		}else{
			$result['status'] = 0;
			$result['msg'] = "超出使用数量";
		}
				
		return $result;		
	}else{
		return $result;
	}
	
/*	
	//$s_account_info = es_session::get("account_info");
	if(intval($s_account_info['id'])==0)
	{
		$result['status'] = 0;
		$result['msg'] = "请先登录";
		//ajax_return($result);
		return $result;
	}
	else
	{
		$now = get_gmtime();
		//$sn = htmlspecialchars(addslashes(trim($_REQUEST['coupon_sn'])));
		//$pwd = htmlspecialchars(addslashes(trim($_REQUEST['coupon_pwd'])));
		$supplier_id = intval($s_account_info['supplier_id']);
	
		if (empty($sn)){
			$sql = "select c.refund_status,c.is_valid,c.id as id,c.user_id as user_id,c.deal_id,doi.name as name,doi.number as number,c.sn as sn,c.supplier_id as supplier_id,c.confirm_time as confirm_time from ".DB_PREFIX."deal_coupon as c left join ".DB_PREFIX."deal_order_item as doi on c.order_deal_id = doi.id where c.password = '".$pwd."' and c.is_valid = 1 and c.is_delete = 0  and c.begin_time <".$now." and (c.end_time = 0 or c.end_time>".$now.")";
		}else{
			$sql = "select c.refund_status,c.is_valid,c.id as id,c.user_id as user_id,c.deal_id,doi.name as name,doi.number as number,c.sn as sn,c.supplier_id as supplier_id,c.confirm_time as confirm_time from ".DB_PREFIX."deal_coupon as c left join ".DB_PREFIX."deal_order_item as doi on c.order_deal_id = doi.id where c.sn = '".$sn."' and c.password = '".$pwd."' and c.is_valid = 1 and c.is_delete = 0  and c.begin_time <".$now." and (c.end_time = 0 or c.end_time>".$now.")";
		}
		$coupon_data = $GLOBALS['db']->getRow($sql);		
		if($coupon_data)
		{
			$sql = "select d.* from ".DB_PREFIX."deal as d left join ".DB_PREFIX."deal_location_link as l on l.deal_id = d.id where l.deal_id = ".$coupon_data['deal_id']." and l.location_id in (".implode(",",$s_account_info['location_ids']).")";
			$deal_info = $GLOBALS['db']->getRow($sql);
			if(!$deal_info)
			{
				$result['status'] = 0;
				$result['msg'] = $GLOBALS['lang']['NO_AUTH'];
				//ajax_return($result);
				return $result;
			}

			if($coupon_data['supplier_id']!=$supplier_id)
			{
				$result['status'] = 0;
				$result['msg'] = $GLOBALS['lang']['COUPON_INVALID_SUPPLIER'];
				//ajax_return($result);
				return $result;
			}
			elseif($coupon_data['confirm_time'] > 0)
			{
				$result['status'] = 0;
				$result['msg'] = sprintf($GLOBALS['lang']['COUPON_INVALID_USED'],to_date($coupon_data['confirm_time']));
				//ajax_return($result);
				return $result;
			}
			elseif($coupon_data['refund_status'] > 0)
			{
				$result['status'] = 0;
				$result['msg'] = "团购券提交了退款申请，无法验证";
				//ajax_return($result);
				return $result;
			}
			else
			{
				//开始确认
				$GLOBALS['db']->query("update ".DB_PREFIX."deal_coupon set is_balance = 1 , confirm_account = ".intval($s_account_info['id']).",confirm_time=".$now." where id = ".intval($coupon_data['id']));
				$result['status'] = 1;
					
				$deal_type = intval($GLOBALS['db']->getOne("select deal_type from ".DB_PREFIX."deal where id = ".intval($coupon_data['deal_id'])));
				if($deal_type == 1)
				{
					$result['msg'] = $coupon_data['name']."(购买数量：".$coupon_data['number'].")".sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));;
				}
				else
				{
					$result['msg'] = $coupon_data['name'].sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));;
				}
				//操作积分相关
				$t_begin_time = to_timespan(to_date(get_gmtime(),"Y-m-d"));  //今天开始
				$t_end_time = to_timespan(to_date(get_gmtime(),"Y-m-d"))+ (24*3600 - 1);  //今天结束
				$y_begin_time = $t_begin_time - (24*3600); //昨天开始
				$y_end_time = $t_end_time - (24*3600);  //昨天结束
					
				$point = intval(app_conf("USER_YOUHUI_DOWN_POINT"));
				$score = intval(app_conf("USER_YOUHUI_DOWN_SCORE"));
				$money = doubleval(app_conf("USER_YOUHUI_DOWN_MONEY"));
				$point_max = intval(app_conf("USER_ACTIVE_POINT_MAX"));
				$score_max = intval(app_conf("USER_ACTIVE_SCORE_MAX"));
				$money_max = doubleval(app_conf("USER_ACTIVE_MONEY_MAX"));
					
				$sum_money = doubleval($GLOBALS['db']->getOne("select sum(money) from ".DB_PREFIX."user_active_log where user_id = ".$coupon_data['user_id']." and create_time between ".$t_begin_time." and ".$t_end_time));
				$sum_score = intval($GLOBALS['db']->getOne("select sum(score) from ".DB_PREFIX."user_active_log where user_id = ".$coupon_data['user_id']." and create_time between ".$t_begin_time." and ".$t_end_time));
				$sum_point = intval($GLOBALS['db']->getOne("select sum(point) from ".DB_PREFIX."user_active_log where user_id = ".$coupon_data['user_id']." and create_time between ".$t_begin_time." and ".$t_end_time));
					
				if($sum_money>=$money_max)$money = 0;
				if($sum_score>=$score_max)$score = 0;
				if($sum_point>=$point_max)$point = 0;
					
				if($money>0||$score>0||$point>0)
				{
					require_once  APP_ROOT_PATH."system/libs/user.php";
					$log = "验证消费券";
					modify_account(array("money"=>$money,"score"=>$score,"point"=>$point),$coupon_data['user_id'],$log);
					$data['user_id'] = $coupon_data['user_id'];
					$data['create_time'] = get_gmtime();
					$data['money'] = $money;
					$data['score'] = $score;
					$data['point'] = $point;
					$GLOBALS['db']->autoExecute(DB_PREFIX."user_active_log",$data);
				}
				send_use_coupon_sms(intval($coupon_data['id'])); //发送团购券确认消息
				send_use_coupon_mail(intval($coupon_data['id'])); //发送团购券确认消息
					
				update_balance($coupon_data['id'],$coupon_data['deal_id']);
				//ajax_return($result);
				return $result;
			}
		}
		else
		{
			$result['status'] = 0;
			$result['msg'] = '此密码错误,不能接待。请与消费者确认提供的密码是否正确';//$GLOBALS['lang']['COUPON_INVALID'];
			//ajax_return($result);
			return $result;
		}
	}
	*/
}
	
	
	
	
	
function biz_check_youhui($s_account_info,$sn)
{

	//$s_account_info = es_session::get("account_info");
	if(intval($s_account_info['id'])==0)
	{
		$result['status'] = 0;
		$result['info'] = $GLOBALS['lang']['SUPPLIER_NOT_LOGIN'];
		//ajax_return($result);
		return $result;
	}

	$now = get_gmtime();
	//$sn = htmlspecialchars(addslashes(trim($_REQUEST['youhui_sn'])));
	$youhui_log = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."youhui_log where youhui_sn = '".$sn."'");

	if($youhui_log)
	{
		$sql = "select y.* from ".DB_PREFIX."youhui as y left join ".DB_PREFIX."youhui_location_link as l on l.youhui_id = y.id where l.youhui_id = ".$youhui_log['youhui_id']." and l.location_id in (".implode(",",$s_account_info['location_ids']).")";
		$youhui_info = $GLOBALS['db']->getRow($sql);
		if(!$youhui_info)
		{
			$result['status'] = 0;
			$result['info'] = $GLOBALS['lang']['NO_AUTH'];
			//ajax_return($result);
			return $result;
		}
		if($youhui_log['confirm_id']>0&&$youhui_log['confirm_time']>0)
		{
			$result['status'] = 0;
			$result['info'] = sprintf($GLOBALS['lang']['YOUHUI_HAS_USED'],to_date($youhui_log['confirm_time']));
		}
		else
		{
			$youhui_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."youhui where id = ".$youhui_log['youhui_id']);
			if($youhui_data)
			{
				if($youhui_data['begin_time']>0&&$youhui_data['begin_time']>$now)
				{
					$result['status'] = 0;
					$result['info'] = sprintf($GLOBALS['lang']['YOUHUI_NOT_BEGIN'],to_date($youhui_data['begin_time']));
				}
				elseif($youhui_data['end_time']>0&&$youhui_data['end_time']<$now)
				{
					$result['status'] = 0;
					$result['info'] = sprintf($GLOBALS['lang']['YOUHUI_HAS_END'],to_date($youhui_data['end_time']));
				}
				else
				{
					$result['status'] = 1;
					$youhui_log['youhui_data'] = $youhui_data;
					$result['data'] = $youhui_log;
					$result['info'] = $youhui_data['name']."[".$GLOBALS['lang']['YOUHUI_SN'].":".$youhui_log['youhui_sn']."]".$GLOBALS['lang']['IS_VALID_YOUHUI'];
					if($youhui_log['order_count']>0)
						$result['info'].="\n".$GLOBALS['lang']['YOUHUI_ORDER_COUNT'].":".$youhui_log['order_count'].$GLOBALS['lang']['ORDER_COUNT_PERSON'];
					if($youhui_log['is_private_room'])
						$result['info'].="(".$GLOBALS['lang']['IS_PRIVATE_ROOM'].")";
					if($youhui_log['date_time']>0)
						$result['info'].="\n".$GLOBALS['lang']['ORDER_DATE_TIME'].":".to_date($youhui_log['date_time'],"Y-m-d H:i");
					$result['info'].="\n".$GLOBALS['lang']['CONFIRM_USE_YOUHUI'];
				}
			}
			else
			{
				$result['status'] = 0;
				$result['info'] = $GLOBALS['lang']['YOUHUI_INVALID'];
			}
		}
	}
	else
	{
		$result['status'] = 0;
		$result['info'] = $GLOBALS['lang']['YOUHUI_SN_INVALID'];
	}
	//ajax_return($result);
	return $result;
}

function biz_use_youhui($s_account_info,$sn,$total_fee)
{
	//$s_account_info = es_session::get("account_info");
	if(intval($s_account_info['id'])==0)
	{
		$result['status'] = 0;
		$result['info'] = $GLOBALS['lang']['SUPPLIER_LOGIN_FIRST'];
	}
	else
	{
		$now = get_gmtime();
		//$sn = htmlspecialchars(addslashes(trim($_REQUEST['youhui_sn'])));
		//$total_fee = intval(htmlspecialchars(addslashes(trim($_REQUEST['total_fee']))));
			
		$youhui_log = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."youhui_log where youhui_sn = '".$sn."'");
		if($youhui_log)
		{
			$sql = "select y.* from ".DB_PREFIX."youhui as y left join ".DB_PREFIX."youhui_location_link as l on l.youhui_id = y.id where l.youhui_id = ".$youhui_log['youhui_id']." and l.location_id in (".implode(",",$s_account_info['location_ids']).")";
			$youhui_info = $GLOBALS['db']->getRow($sql);
			if(!$youhui_info)
			{
				$result['status'] = 0;
				$result['info'] = $GLOBALS['lang']['NO_AUTH'];
				//ajax_return($result);
				return $result;
			}
			if($youhui_log['confirm_id']>0&&$youhui_log['confirm_time']>0)
			{
				$result['status'] = 0;
				$result['info'] = sprintf($GLOBALS['lang']['YOUHUI_HAS_USED'],to_date($youhui_log['confirm_time']));
			}
			else
			{
				$youhui_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."youhui where id = ".$youhui_log['youhui_id']);
				if($youhui_data)
				{
					if($youhui_data['begin_time']>0&&$youhui_data['begin_time']>$now)
					{
						$result['status'] = 0;
						$result['info'] = sprintf($GLOBALS['lang']['YOUHUI_NOT_BEGIN'],to_date($youhui_data['begin_time']));
					}
					elseif($youhui_data['end_time']>0&&$youhui_data['end_time']<$now)
					{
						$result['status'] = 0;
						$result['info'] = sprintf($GLOBALS['lang']['YOUHUI_HAS_END'],to_date($youhui_data['end_time']));
					}
					else
					{
						$youhui_log['confirm_id'] = $s_account_info['id'];
						$youhui_log['confirm_time'] = $now;
						$youhui_log['total_fee'] = $total_fee;
						$GLOBALS['db']->autoExecute(DB_PREFIX."youhui_log", $youhui_log, $mode = 'UPDATE', $where = 'id='.$youhui_log['id'], $querymode = 'SILENT');
						//更新优惠总金额
						$youhui_content['total_fee']=$youhui_data['total_fee']+$total_fee;
						$GLOBALS['db']->autoExecute(DB_PREFIX."youhui", $youhui_content, $mode = 'UPDATE', $where = 'id='.$youhui_data['id'], $querymode = 'SILENT');
							
						require_once APP_ROOT_PATH."system/libs/user.php";
						$data = array(
								"money" => $youhui_data['return_money'],
								"score" => $youhui_data['return_score'],
								"point" => $youhui_data['return_point']
						);
						modify_account($data,$youhui_log['user_id'],$youhui_data['name']."已验证消费");
							
						$result['status'] = 1;
						$youhui_log['youhui_data'] = $youhui_data;
						$result['data'] = $youhui_log;
					}
				}
				else
				{
					$result['status'] = 0;
					$result['info'] = $GLOBALS['lang']['YOUHUI_INVALID'];
				}
			}
		}
		else
		{
			$result['status'] = 0;
			$result['info'] = $GLOBALS['lang']['YOUHUI_SN_INVALID'];
		}
		//ajax_return($result);
		return $result;
	}
}
	

?>