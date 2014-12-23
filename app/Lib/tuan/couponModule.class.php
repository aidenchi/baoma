<?php



require APP_ROOT_PATH.'app/Lib/page.php';
class couponModule extends TuanBaseModule
{	
	public function supplier_login()
	{
		app_redirect(url("biz","index"));
	}
}

?>