<?php
if(!defined('ROOT_PATH'))
define('ROOT_PATH', str_replace('upop_response.php', '', str_replace('\\', '/', __FILE__)));

global $pay_req;
$pay_req['ctl'] = "payment";
$pay_req['act'] = "response";
$pay_req['class_name'] = "Upop";
include ROOT_PATH."shop.php";
?>