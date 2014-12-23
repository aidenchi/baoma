<?php 


require './system/common.php';
require './app/Lib/YouhuiApp.class.php';

$_REQUEST['ctl']="index";
$_REQUEST['act']="daijin_index";

//实例化一个网站应用实例
$AppWeb = new YouhuiApp(); 

?>