<?php


class PaymentNoticeAction extends CommonAction{
	public function index()
	{
		if(trim($_REQUEST['order_sn'])!='')
		{
			$condition['order_id'] = M("DealOrder")->where("order_sn='".trim($_REQUEST['order_sn'])."'")->getField("id");
		}
		if(trim($_REQUEST['notice_sn'])!='')
		{
			$condition['notice_sn'] = $_REQUEST['notice_sn'];
		}	
	   if(trim($_REQUEST['user_name'])!='')
		{
			$condition['user_id'] = M("User")->where("user_name='".trim($_REQUEST['user_name'])."'")->getField("id");
		}	
		
		if(intval($_REQUEST['payment_id'])==0)unset($_REQUEST['payment_id']);
		$this->assign("default_map",$condition);
		$this->assign("payment_list",M("Payment")->findAll());
		parent::index();
	}
}
?>