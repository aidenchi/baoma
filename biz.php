<?php 

error_reporting(0);
if((trim($_REQUEST['m'])=='File'&&trim($_REQUEST['a'])=='do_upload_img')||(trim($_REQUEST['m'])=='File'&&trim($_REQUEST['a'])=='do_upload'))
{
	define("ADMIN_ROOT",1);
	require "admin.php";
}
else
{
	require './system/common.php';
	require './app/Lib/BizApp.class.php';
	
	//实例化一个网站应用实例
	$AppWeb = new BizApp(); 
}

?>