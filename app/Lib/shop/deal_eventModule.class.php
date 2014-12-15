<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(88522820@qq.com)
// +----------------------------------------------------------------------

require APP_ROOT_PATH.'app/Lib/page.php';
class deal_eventModule extends ShopBaseModule
{
	public function index()
	{			
			
					$page_size = 20;
					$page = intval($_REQUEST['p']);
					if($page==0)
					$page = 1;
					$limit = (($page-1)*$page_size).",".$page_size;	
		
				
				$event_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."deal_event order by sort desc limit ".$limit);
				$count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."deal_event");
				foreach($event_list as $k=>$v)
				{
					$event_list[$k]['url'] = url("shop","deal_event#show",array("id"=>$v['id']));
				}
				
					
					$page = new Page($count,$page_size);   //初始化分页对象 		
					$p  =  $page->show();
					$GLOBALS['tmpl']->assign('pages',$p);
					
				//开始输出当前的site_nav			
				$site_nav[] = array('name'=>$GLOBALS['lang']['HOME_PAGE'],'url'=>APP_ROOT."/");
				$site_nav[] = array('name'=>$GLOBALS['lang']['DEAL_EVENT'],'url'=>url("shop","deal_event#index"));
				$GLOBALS['tmpl']->assign("site_nav",$site_nav);	
					//输出商城分类
					$cate_tree = get_cate_tree();
					//var_dump($site_nav);die;	
				$GLOBALS['tmpl']->assign("cate_tree",$cate_tree);		
				$GLOBALS['tmpl']->assign("event_list",$event_list);
				$GLOBALS['tmpl']->assign("page_title",$GLOBALS['lang']['DEAL_EVENT']);
				$GLOBALS['tmpl']->assign("page_keyword",$GLOBALS['lang']['DEAL_EVENT']);
				$GLOBALS['tmpl']->assign("page_description",$GLOBALS['lang']['DEAL_EVENT']);
		
			$GLOBALS['tmpl']->display("deal_event_index.html");
		
		
	}
	//加载品牌商品列表
	function show()
	{
		$id = intval($_REQUEST['id']);
		
		//分页
				$page_size = 20;
				$page = intval($_REQUEST['p']);
				if($page==0)
				$page = 1;
				$limit = (($page-1)*$page_size).",".$page_size;	
		
				
				$deal_info = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."deal where deal_event_id = ".$id." order by sort desc limit ".$limit);
				$count= $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."deal where deal_event_id = ".$id);
				foreach($deal_info  as $k=>$v)
				{
				$deal_info[$k]['url'] = url("shop","goods",array("id"=>$v['id']));
				$deal_info[$k]['origin_price'] =  intval($deal_info[$k]['origin_price']);
				$deal_info[$k]['current_price'] = intval($deal_info[$k]['current_price']);
				$deal_info[$k]['daze']= number_format($deal_info[$k]['current_price']/$deal_info[$k]['origin_price']*10,2);
				}
				
				$page = new Page($count,$page_size);   //初始化分页对象 		
				$p  =  $page->show();
				$GLOBALS['tmpl']->assign('pages',$p);
		
								
				$GLOBALS['tmpl']->assign("deal_info",$deal_info);
				$info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_event where id = ".$id);
				
				if($info)
				{
									
					//开始输出当前的site_nav			
				
					$site_nav[] = array('name'=>$GLOBALS['lang']['HOME_PAGE'],'url'=>APP_ROOT."/");
					$site_nav[] = array('name'=>$GLOBALS['lang']['DEAL_EVENT'],'url'=>url("shop","deal_event#index"));
					$site_nav[] = array('name'=>$info['name'],'url'=>url("shop","deal_event#index",array("id"=>$info['id'])));
					
					$GLOBALS['tmpl']->assign("site_nav",$site_nav);
					//输出当前的site_nav
					
					$GLOBALS['tmpl']->assign("page_title",$info['name']);
					$GLOBALS['tmpl']->assign("page_keyword",$info['name']);
					$GLOBALS['tmpl']->assign("page_description",$info['name']);
					
				}else
				{
					app_redirect(APP_ROOT."/");
				}
				
				
			$GLOBALS['tmpl']->display("deal_event_show.html");

}

}
?>