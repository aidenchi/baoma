<?php
require '../system/common.php';
$payment = $payment = $GLOBALS['db']->getRow("select id,config from ".DB_PREFIX."payment where class_name='Wtenpay'");  
$payment['config'] = unserialize($payment['config']);

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
$tenpay_config['partner']		= $payment['config']['tenpay_partner'];

//合作者支付宝帐号
$tenpay_config['tenpay_key']		= $payment['config']['tenpay_key'];
