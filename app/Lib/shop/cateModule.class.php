<?php


require APP_ROOT_PATH.'app/Lib/page.php';

class cateModule extends ShopBaseModule
{
	public function index()
	{
		$GLOBALS['tmpl']->caching = true;
		$cache_id  = md5(MODULE_NAME.ACTION_NAME.trim($_REQUEST['id']).$GLOBALS['deal_city']['id']);		
		if (!$GLOBALS['tmpl']->is_cached('goods_list.html', $cache_id))		
		{
			
					
			
			$id = intval($_REQUEST['id']);
			if($id==0)
			$uname = addslashes(trim($_REQUEST['id']));
			$cate_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."shop_cate where id = ".$id." or (uname = '".$uname."' and uname <> '')");
			$GLOBALS['tmpl']->assign("cate_id",$cate_item['id']);					
			
			//输出商城分类
			$cate_tree = get_cate_tree($cate_item['id']);
			$t_cate_tree = array();
			if($cate_item['pid']){
				$t_cate_tree = get_cate_tree($cate_item['pid']);
			}
			
			$t_cate_tree = array_merge($t_cate_tree,$cate_tree);
			
			$cate_tree=array();
			foreach($t_cate_tree as $k=>$v){
				$cate_tree[$v['id']] = $v;
			}
			foreach($cate_tree as $ck=>$cv){
				if($cv['id'] != $cate_item['id'] && $cv['pid'] != $cate_item['id']){
					$new_cate_tree[$cv['id']] = $cv;
				}else{
					if($cv['pid'] != $cate_item['id']){
						$new_cate_tree[$cv['id']] = $cv;
						foreach($cate_tree as $cck=>$ccv){
							if($ccv['pid'] == $cate_item['id']){
								$new_cate_tree[$ccv['id']] = $ccv;
								$new_cate_tree[$ccv['id']]['level'] = 2;
							}
						}
					}
				}

			}
			$GLOBALS['tmpl']->assign("cate_tree",$new_cate_tree);
			//开始输出当前的site_nav
			$cates = array();
			$cate = $cate_item;
			do
			{
				$cates[] = $cate;
				$pid = intval($cate['pid']);
				$cate = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."shop_cate where is_effect =1 and is_delete =0 and id = ".$pid);			
				
			}while($pid!=0);
			
			foreach($cates as $cate_row)
			{
				$page_title .= $cate_row['name']." - "; 
				$page_kd .= $cate_row['name'].",";
			}
			$page_title = substr($page_title,0,-3);
			krsort($cates);
			
			$site_nav[] = array('name'=>$GLOBALS['lang']['HOME_PAGE'],'url'=>APP_ROOT."/");
			if($cate_item)
			{
				foreach($cates as $cate_row)
				{
					if($cate_row['uname']!="")
					$curl = url("shop","cate#index",array("id"=>$cate_row['uname']));
					else
					$curl = url("shop","cate#index",array("id"=>$cate_row['id']));
					$site_nav[] = array('name'=>$cate_row['name'],'url'=>$curl);
				}
			}		
			else
			{
				$site_nav[] = array('name'=>$GLOBALS['lang']['GOODS_CATE'],'url'=>url("shop","cate#index"));
			}
			$GLOBALS['tmpl']->assign("site_nav",$site_nav);
			//输出当前的site_nav
			
			$GLOBALS['tmpl']->assign("page_title",$page_title);
			$GLOBALS['tmpl']->assign("page_keyword",$page_kd);
			$GLOBALS['tmpl']->assign("page_description",$page_kd);					
		}
		$GLOBALS['tmpl']->display("goods_list.html",$cache_id);
	}
}
?>