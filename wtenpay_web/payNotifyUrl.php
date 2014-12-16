<?php

//---------------------------------------------------------
//财付通即时到帐支付后台回调示例，商户按照此文档进行开发即可
//---------------------------------------------------------
require_once("tenpay.conifg.php");
require ("classes/ResponseHandler.class.php");
require ("classes/WapNotifyResponseHandler.class.php");

/* 商户号 */
$partner = $tenpay_config['partner']; //"1900000109";

/* 密钥 */
$key = $tenpay_config['tenpay_key']; //"8934e7d15453e97507ef794cf7b0519d";


/* 创建支付应答对象 */
$resHandler = new WapNotifyResponseHandler();
$resHandler->setKey($key);

//判断签名
if($resHandler->isTenpaySign()) {
	
	//商户订单号
	$bargainor_id = $resHandler->getParameter("bargainor_id");
	
	//商户订单号
	$payment_notice_sn = $resHandler->getParameter("sp_billno");
	
	//财付通交易单号
	$transaction_id = $resHandler->getParameter("transaction_id");
	//金额,以分为单位
	$total_fee = $resHandler->getParameter("total_fee");
	
	//支付结果
	$pay_result = $resHandler->getParameter("pay_result");

	if( "0" == $pay_result  ) {
		$payment_notice = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."payment_notice where notice_sn = '".$payment_notice_sn."'");
	    $order_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_order where id = ".$payment_notice['order_id']);
	    require_once APP_ROOT_PATH."system/libs/cart.php";
	    $rs = payment_paid($payment_notice['id']);	
	    if($rs){
	    	$GLOBALS['db']->query("update ".DB_PREFIX."payment_notice set outer_notice_sn = '".$transaction_id."' where id = ".$payment_notice['id']);				
			order_paid($payment_notice['order_id']);
			echo 'success';
	    }else
			echo 'fail';
	}
	else
	{
		echo 'fail';
	} 
	
} else {
	//回调签名错误
	echo "fail";
}


?>
