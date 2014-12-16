<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title>财付通手机网页支付</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
*{
	margin:0;
	padding:0;
}
</style>
</head>
<body text=#000000 bgColor=#ffffff leftMargin=0 topMargin=4>
<?php
//error_reporting(0);
//---------------------------------------------------------
//财付通即时到帐支付页面回调示例，商户按照此文档进行开发即可
//---------------------------------------------------------

require_once("tenpay.conifg.php");
require_once ("./classes/ResponseHandler.class.php");
require_once ("./classes/WapResponseHandler.class.php");

/* 商户号 */
$partner = $tenpay_config['partner']; //"1900000109";

/* 密钥 */
$key = $tenpay_config['tenpay_key']; //"8934e7d15453e97507ef794cf7b0519d";


/* 创建支付应答对象 */
$resHandler = new WapResponseHandler();
$resHandler->setKey($key);

//判断签名
if($resHandler->isTenpaySign()) {

	//商户号
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
	   
	    if($payment_notice['is_paid']==1){
	    	echo "支付成功<br />请点左上角<b>返回</b>按钮";
	    	die();
	    }
	    $order_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_order where id = ".$payment_notice['order_id']);
	    require_once APP_ROOT_PATH."system/libs/cart.php";
	    $rs = payment_paid($payment_notice['id']);
	    if($rs){
	    	$GLOBALS['db']->query("update ".DB_PREFIX."payment_notice set outer_notice_sn = '".$transaction_id."' where id = ".$payment_notice['id']);				
			order_paid($payment_notice['order_id']);
			echo "支付成功<br />请点左上角<b>返回</b>按钮";
	    }else
			echo "支付失败<br />请点左上角<b>返回</b>按钮";
	
	} else {
		//当做不成功处理
		echo "支付失败<br />请点左上角<b>返回</b>按钮";
	}
	
} else {
	echo "认证签名失败<br />请点左上角<b>返回</b>按钮";
}

?>
</body>
</html>