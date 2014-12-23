<?php



class indexModule extends BizBaseModule
{
	public function __construct()
	{
		parent::__construct();
		$this->check_auth();
	}
	public function index()
	{				
		$GLOBALS['tmpl']->display("biz/biz_index.html");
	}
}
?>