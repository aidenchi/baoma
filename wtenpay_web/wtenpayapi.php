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
//---------------------------------------------------------
//财付通即时到帐支付请求示例，商户按照此文档进行开发即可
//---------------------------------------------------------
require_once("tenpay.conifg.php");
require_once ("classes/RequestHandler.class.php");
require ("classes/client/ClientResponseHandler.class.php");
require ("classes/client/TenpayHttpClient.class.php");

/* 商户号 */
$partner = $tenpay_config['partner']; //"1900000109";

/* 密钥 */
$key = $tenpay_config['tenpay_key']; //"8934e7d15453e97507ef794cf7b0519d";


$order_id = intval($_REQUEST['order_id']);
$payment_notice_sn = trim($_REQUEST['out_trade_no']);
if ($order_id == 0){
	$payment_notice_sn = $GLOBALS['request']['out_trade_no'];			
	$payment_notice = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."payment_notice where notice_sn = '".$payment_notice_sn."'");				
	$order_id = intval($payment_notice['order_id']);
}

$order = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_order where id = ".$order_id);
if (empty($order)){
	echo "订单不存在";
	exit();
}

if ($order['pay_status'] == 2){
	echo "订单已经收款";
	exit();
}

$payment_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."payment where id=".intval($order['payment_id']));
$pay_code = strtolower($payment_info['class_name']);

if($pay_code !="wtenpay"){
	echo "不支持的支付方式";
	exit();
}



//订单号，此处用时间加随机数生成，商户根据自己情况调整，只要保持全局唯一就行
$out_trade_no = $payment_notice_sn;

//服务器异步通知页面路径
$notify_url = get_domain().APP_ROOT."/payNotifyUrl.php";

//页面跳转同步通知页面路径
$call_back_url = get_domain().APP_ROOT."/payReturnUrl.php";

//付款金额
$pay_price = $order['total_price'] - $order['pay_amount'];
if($payment_info&&$pay_price>0)
{
	require_once APP_ROOT_PATH."system/libs/cart.php";
	$payment_notice_id = make_payment_notice($pay_price,$order_id,$payment_info['id']);
	//创建支付接口的付款单
}

//创建了支付单号，通过支付接口创建支付数据
require_once APP_ROOT_PATH."system/payment/".$payment_info['class_name']."_payment.php";
$payment_class = $payment_info['class_name']."_payment";
$payment_object = new $payment_class();
$pay = $payment_object->get_payment_code($payment_notice_id);

/* 创建支付请求对象 */
$reqHandler = new RequestHandler();
$reqHandler->init();
$reqHandler->setKey($key);
//$reqHandler->setGateUrl("https://gw.tenpay.com/gateway/pay.htm");
//设置初始化请求接口，以获得token_id
$reqHandler->setGateUrl("http://wap.tenpay.com/cgi-bin/wappayv2.0/wappay_init.cgi");


$httpClient = new TenpayHttpClient();
//应答对象
$resHandler = new ClientResponseHandler();
//----------------------------------------
//设置支付参数 
//----------------------------------------
$reqHandler->setParameter("total_fee", $pay['total_fee']*100);  //总金额
//用户ip
$reqHandler->setParameter("spbill_create_ip", $_SERVER['REMOTE_ADDR']);//客户端IP
$reqHandler->setParameter("ver", "2.0");//版本类型
$reqHandler->setParameter("bank_type", "0"); //银行类型，财付通填写0
$reqHandler->setParameter("callback_url", $call_back_url);//交易完成后跳转的URL
$reqHandler->setParameter("bargainor_id", $partner); //商户号
$reqHandler->setParameter("sp_billno", $out_trade_no); //商户订单号
$reqHandler->setParameter("notify_url", $notify_url);//接收财付通通知的URL，需绝对路径
$reqHandler->setParameter("desc", $pay['subject']);
$reqHandler->setParameter("attach", "");


$httpClient->setReqContent($reqHandler->getRequestURL());

//后台调用
if($httpClient->call()) {

	$resHandler->setContent($httpClient->getResContent());
	//获得的token_id，用于支付请求
	$token_id = $resHandler->getParameter('token_id');
	$reqHandler->setParameter("token_id", $token_id);
	
	//请求的URL
	//$reqHandler->setGateUrl("https://wap.tenpay.com/cgi-bin/wappayv2.0/wappay_gate.cgi");
	//此次请求只需带上参数token_id就可以了，$reqUrl和$reqUrl2效果是一样的
	//$reqUrl = $reqHandler->getRequestURL(); 
	$reqUrl = "http://wap.tenpay.com/cgi-bin/wappayv2.0/wappay_gate.cgi?token_id=".$token_id;
	app_redirect($reqUrl);
	
}
else{
	echo "支付发生错误";
	exit();
}

?>
</body>
</html>