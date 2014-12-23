<?php


require APP_ROOT_PATH.'app/Lib/uc.php';

class uc_collectModule extends ShopBaseModule
{
	public function index()
	{
		
		$page = intval($_REQUEST['p']);
		if($page==0)
		$page = 1;
		$limit = (($page-1)*app_conf("PAGE_SIZE")).",".app_conf("PAGE_SIZE");
		$result = get_collect_list($limit,$GLOBALS['user_info']['id']);
		//var_dump($result);die;
		$GLOBALS['tmpl']->assign("list",$result['list']);
		$page = new Page($result['count'],app_conf("PAGE_SIZE"));   //初始化分页对象 		
		$p  =  $page->show();
		$GLOBALS['tmpl']->assign('pages',$p);
		
		$GLOBALS['tmpl']->assign("page_title",$GLOBALS['lang']['UC_COLLECT']);
		$GLOBALS['tmpl']->assign("inc_file","inc/uc/uc_collect_index.html");
		
		if($page==0)
		$page = 1;
		$limit = (($page-1)*app_conf("PAGE_SIZE")).",".app_conf("PAGE_SIZE");
		$tuan_result = get_tuan_collect_list($limit,$GLOBALS['user_info']['id']);
			//var_dump($tuan_result);die;
		
		$GLOBALS['tmpl']->assign("tuan_list",$tuan_result['list']);
		$page = new Page($tuan_result['count'],app_conf("PAGE_SIZE"));   //初始化分页对象 
				//var_dump($tuan_result['count']);die;
		$pp  =  $page->show();
		$GLOBALS['tmpl']->assign('pagess',$pp);
		
		$GLOBALS['tmpl']->assign("page_title",$GLOBALS['lang']['UC_COLLECT']);
		$GLOBALS['tmpl']->assign("inc_file","inc/uc/uc_collect_index.html");
	
				
		$GLOBALS['tmpl']->display("uc.html");
	}
	
	public function del()
	{
		$id = intval($_REQUEST['id']);
		$GLOBALS['db']->query("delete from ".DB_PREFIX."deal_collect where id = ".$id." and user_id = ".intval($GLOBALS['user_info']['id']));
		if($GLOBALS['db']->affected_rows())
		{
			showSuccess($GLOBALS['lang']['DELETE_SUCCESS']);
		}
		else
		{
			showErr($GLOBALS['lang']['INVALID_COLLECT']);
		}
	}
	
	
}
?>