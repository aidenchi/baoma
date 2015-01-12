<?php 

require './system/common.php';
require './app/Lib/ShopApp.class.php';

//实例化一个网站应用实例
$AppWeb = new ShopApp(); 
app_redirect(APP_ROOT."/wap/index.php");

?>