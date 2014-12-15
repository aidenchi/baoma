<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(88522820@qq.com)
// +----------------------------------------------------------------------


class verifyModule extends BizBaseModule
{
	public function __construct()
	{
		parent::__construct();
		$this->check_auth();
	}
	public function index()
	{				
		$s_account_info = es_session::get("account_info");
		$account_id = intval($s_account_info['id']);
		$GLOBALS['tmpl']->assign("page_title",$GLOBALS['lang']['VERIFY_COUPON']);
		$GLOBALS['tmpl']->display("biz/biz_verify.html");
	}
	
	
	
	public function check_coupon()
	{
		require_once  APP_ROOT_PATH."system/libs/biz_verify.php";
		$s_account_info = es_session::get("account_info");
		$sn = htmlspecialchars(addslashes(trim($_REQUEST['coupon_sn'])));
		$pwd = htmlspecialchars(addslashes(trim($_REQUEST['coupon_pwd'])));
		ajax_return(biz_check_coupon($s_account_info,$sn,$pwd));
	}
	
	
	public function use_coupon()
	{
		require_once  APP_ROOT_PATH."system/libs/biz_verify.php";
		$s_account_info = es_session::get("account_info");
		$sn = htmlspecialchars(addslashes(trim($_REQUEST['coupon_sn'])));
		$pwd = htmlspecialchars(addslashes(trim($_REQUEST['coupon_pwd'])));
		ajax_return(biz_use_coupon($s_account_info,$sn,$pwd));
	}
	
	
	public function youhui()
	{
		$s_account_info = es_session::get("account_info");
		$account_id = intval($s_account_info['id']);
		$GLOBALS['tmpl']->assign("page_title",$GLOBALS['lang']['YOUHUI_VERIFY']);
		$GLOBALS['tmpl']->display("biz/biz_verify_youhui.html");		
	}
	
	
	
	public function check_youhui()
	{
		
		require_once  APP_ROOT_PATH."system/libs/biz_verify.php";
		$s_account_info = es_session::get("account_info");
		$sn = htmlspecialchars(addslashes(trim($_REQUEST['youhui_sn'])));
		ajax_return(biz_check_youhui($s_account_info,$sn));			
	}
	
	public function use_youhui()
	{
		require_once  APP_ROOT_PATH."system/libs/biz_verify.php";
		$s_account_info = es_session::get("account_info");
		$sn = htmlspecialchars(addslashes(trim($_REQUEST['youhui_sn'])));
		$total_fee = intval(htmlspecialchars(addslashes(trim($_REQUEST['total_fee']))));
		ajax_return(biz_use_youhui($s_account_info,$sn,$total_fee));
						
	}
	
	//批量验证消费劵
	public function batch(){
		$s_account_info = es_session::get("account_info");
		$sql="select DISTINCT(dc.deal_id),d.sub_name from ".DB_PREFIX."deal_coupon as dc left join ".DB_PREFIX."deal as d on dc.deal_id=d.id where dc.supplier_id=".$s_account_info['supplier_id'];
		$coupon_list=$GLOBALS['db']->getAll($sql);
		$sql="select id,name from ".DB_PREFIX."supplier_location where supplier_id=".$s_account_info['supplier_id'];
		$supplier_location_list=$GLOBALS['db']->getAll($sql);
		$GLOBALS['tmpl']->assign('coupon_list',$coupon_list);
		$GLOBALS['tmpl']->assign('supplier_location_list',$supplier_location_list);
		$GLOBALS['tmpl']->assign("page_title",$GLOBALS['lang']['YOUHUI_VERIFY']);
		$GLOBALS['tmpl']->display("biz/biz_verify_batch.html");
	}
	public function add_coupon(){
		$s_account_info = es_session::get("account_info");
		$supplier_id = $s_account_info['supplier_id'];
		$coupon_pw=trim($_REQUEST['coupon_pw']);
		$sql="select * from ".DB_PREFIX."deal_coupon where password="."'$coupon_pw' and supplier_id = ".$supplier_id;	
		$deal_coupon=$GLOBALS['db']->getRow($sql);
		if($deal_coupon)
		{
			$order_item = $GLOBALS['db']->getRow("select name,sub_name from ".DB_PREFIX."deal_order_item where id = ".$deal_coupon['order_deal_id']);
			$deal_coupon['sub_name'] = $order_item['sub_name'];
			$deal_coupon['name'] = $order_item['name'];
			$GLOBALS['tmpl']->assign('deal_coupon',$deal_coupon);
			$html = $GLOBALS['tmpl']->fetch("biz/add_coupon.html");
			//echo $html;
			//exit;
			$resutl = array();
			$resutl['html'] = $html;
			$resutl['status'] = 1;
			ajax_return($resutl);
		}else{
			$resutl = array();
			$resutl['show_info'] = '无效的验证码,请重新输入';
			$resutl['status'] = 0;
			ajax_return($resutl);
		}		
	}
	
	public function check_coupon_batch()
	{
				
		$s_account_info = es_session::get("account_info");
		if(intval($s_account_info['id'])==0)
		{
			$res['status'] = 0;
			ajax_return($res);
		}
		else
		{
			$now = get_gmtime();
			$supplier_id = intval($s_account_info['supplier_id']);
			$temp=explode(",",$_REQUEST['code']);
			
			$k=0;
			foreach($temp as $v){
				$coupon=explode('-',$v);
				$deal_id=$coupon['0'];
				$sn=$coupon['1'];
				$pwd=$coupon['2'];
				$coupon_data = $GLOBALS['db']->getRow("select c.refund_status,c.begin_time,c.end_time, c.id as id,c.is_valid,c.deal_id,doi.name as name,doi.sub_name as sub_name,c.password as password,doi.number as number,c.sn as sn,c.supplier_id as supplier_id,c.confirm_time as confirm_time from ".DB_PREFIX."deal_coupon as c left join ".DB_PREFIX."deal_order_item as doi on c.order_deal_id = doi.id where c.sn = '".$sn."' and c.password = '".$pwd."' and c.is_valid in(1,2) and c.is_delete = 0 "); 
				if($coupon_data)
				{
					if($coupon_data['is_valid'] == 2){//改团购劵因为退款被锁定
						$result[$k]['msg'] = $GLOBALS['lang']['COUPON_IS_VALID_2'];
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=0;
						$k++;
						continue;
					}
					
					if($coupon_data['refund_status'] > 0){
						$result[$k]['msg'] = "团购券提交了退款申请，无法验证";
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=0;
						$k++;
						continue;
					}
					
				if($coupon_data['begin_time']>0&&$coupon_data['begin_time']>get_gmtime()){//未启用
						$result[$k]['msg'] = "团购券未生效";
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=0;
						$k++;
						continue;
					}
					if($coupon_data['end_time']>0&&$coupon_data['end_time']<get_gmtime()){//过期
						$result[$k]['msg'] = "团购券已过期";
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=0;
						$k++;
						continue;
					}
					
					$sql = "select d.* from ".DB_PREFIX."deal as d left join ".DB_PREFIX."deal_location_link as l on l.deal_id = d.id where l.deal_id = ".$coupon_data['deal_id']." and l.location_id in (".implode(",",$s_account_info['location_ids']).")";
					$deal_info = $GLOBALS['db']->getRow($sql);
					if(!$deal_info)
					{
						$result[$k]['msg'] = $GLOBALS['lang']['NO_AUTH'];
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=0;
						$k++;
						continue;
					}
					
					if($coupon_data['supplier_id']!=$supplier_id)
					{
						$result[$k]['msg'] = $GLOBALS['lang']['COUPON_INVALID_SUPPLIER'];
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=0;
						$k++;
						continue;
					}
					elseif($coupon_data['confirm_time'] > 0)
					{
						$result[$k]['msg'] = sprintf($GLOBALS['lang']['COUPON_INVALID_USED'],to_date($coupon_data['confirm_time']));
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=0;
						$k++;
						continue;
					}
					else
					{
						//开始确认
						$GLOBALS['db']->query("update ".DB_PREFIX."deal_coupon set confirm_account = ".intval($s_account_info['id']).",confirm_time=".$now." where id = ".intval($coupon_data['id']));
						$result[$k]['msg']= '验证成功';
						$result[$k]['deal_id']=$deal_id;
						$result[$k]['id'] = $coupon_data['id'];
						$result[$k]['name'] = $coupon_data['name'];
						$result[$k]['sub_name'] = $coupon_data['sub_name'];
						$result[$k]['password'] = $coupon_data['password'];
						$result[$k]['sn']=$sn;
						$result[$k]['status']=1;
						$k++;
//						$deal_type = intval($GLOBALS['db']->getOne("select deal_type from ".DB_PREFIX."deal where id = ".intval($coupon_data['deal_id'])));			
//						if($deal_type == 1)
//						{
//							$result['msg'] = $coupon_data['name']."(购买数量：".$coupon_data['number'].")".sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));;
//						}
//						else
//						{
//							$result['msg'] = $coupon_data['name'].sprintf($GLOBALS['lang']['COUPON_USED_OK'],to_date($now));;
//						}
						
						send_use_coupon_sms(intval($coupon_data['id'])); //发送团购券确认消息
						//send_use_coupon_mail(intval($coupon_data['id'])); //发送团购券确认消息
						
						update_balance($coupon_data['id'],$coupon_data['deal_id']);					
						continue;
					}
				}
				else
				{				
					$result[$k]['msg'] = '验证失败';//$GLOBALS['lang']['COUPON_INVALID'];
					$result[$k]['deal_id']=$deal_id;
					$result[$k]['sn']=$sn;
					$result[$k]['id'] =0;
					$result[$k]['name'] = '-';
					$result[$k]['sub_name'] = '-';
					$result[$k]['password'] = '';
					$result[$k]['status']=0;
					$k++;
					continue;
				}
				
			}
			$GLOBALS['tmpl']->assign('result',$result);
			$html = $GLOBALS['tmpl']->fetch("biz/user_coupon_batch_reult.html");
			$res['status']=1;
			$res['html']=$html;
			header("Content-Type:text/html; charset=utf-8");
			ajax_return($res);
		}
	}
}
?>