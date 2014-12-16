<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(88522820@qq.com)
// +----------------------------------------------------------------------


class ajaxModule extends TuanBaseModule
{
	public function get_supplier_location()
	{		
		$id = intval($_REQUEST['id']);
		$supplier_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."supplier_location where id = ".$id);
		$GLOBALS['tmpl']->assign("supplier_address_info",$supplier_info);
		$html = $GLOBALS['tmpl']->fetch("inc/sp_location.html");
		header("Content-Type:text/html; charset=utf-8");
		echo $html;
	}
	
	public function switch_style()
	{
		$type = trim(addslashes($_REQUEST['type']));
		if($type=='grid')
		{
			es_cookie::set("list_type",1); 
		}
		else
		{
			es_cookie::set("list_type",0); 
		}
	}
	
	public function check_buy()
	{
		$id = intval($_REQUEST['id']);
		header("Content-Type:text/html; charset=utf-8");
		$rs = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."deal_order_item as doi left join ".DB_PREFIX."deal_order as do on doi.order_id = do.id where doi.sup_id = ".$id." and do.user_id = ".intval($GLOBALS['user_info']['id'])." and do.pay_status = 2");
		echo $rs;
	}
	
	public function set_sort()
	{
		$type = trim(addslashes($_REQUEST['type']));
		es_cookie::set("sort_field",$type); 
		if($type!='sort')
		{
			$sort_type = trim(es_cookie::get("sort_type")); 
			if($sort_type&&$sort_type=='desc')
			{
				es_cookie::set("sort_type",'asc'); 
			}
			else
			{
				es_cookie::set("sort_type",'desc'); 
			}		
		}
		else
		{
			es_cookie::set("sort_type",'desc'); 
		}
	}
	
	public function set_sort_idx()
	{
		$type = trim(addslashes($_REQUEST['type']));
		es_cookie::set("sort_field_idx",$type); 
		if($type!='sort')
		{
			$sort_type = trim(es_cookie::get("sort_type_idx")); 
			if($sort_type&&$sort_type=='desc')
			{
				es_cookie::set("sort_type_idx",'asc'); 
			}
			else
			{
				es_cookie::set("sort_type_idx",'desc'); 
			}		
		}
		else
		{
			es_cookie::set("sort_type_idx",'desc'); 
		}
	}
	
	
	
	public function collect()
	{
		if(!$GLOBALS['user_info'])
		{
			$GLOBALS['tmpl']->assign("ajax",1);
			$html = $GLOBALS['tmpl']->fetch("inc/login_form.html");
			//弹出窗口处理
			$res['open_win'] = 1;
			$res['html'] = $html;
			ajax_return($res);
		}
		else
		{
			$sup_id = intval($_REQUEST['id']);
			//var_dump($sup_id);die;
			$sup_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal where id = ".$sup_id." and is_effect = 1");
		
			//var_dump($sup_info);die;
			if($sup_info)
			{
				$sql = "INSERT INTO `".DB_PREFIX."tuan_collect` (`id`,`sup_id`, `user_id`, `create_time`) select '0','".$sup_info['id']."','".intval($GLOBALS['user_info']['id'])."','".get_gmtime()."' from dual where not exists (select * from `".DB_PREFIX."tuan_collect` where `sup_id`= '".$sup_info['id']."' and `user_id` = ".intval($GLOBALS['user_info']['id']).")";
				$GLOBALS['db']->query($sql);
				if($GLOBALS['db']->affected_rows()>0)
				{
					$res['info'] = $GLOBALS['lang']['COLLECT_SUCCESS'];
				}
				else
				{
					$res['info'] = $GLOBALS['lang']['GOODS_COLLECT_EXIST'];
				}
				$res['open_win'] = 0;
				ajax_return($res);
			}
			else
			
			{
				$res['open_win'] = 0;
				$res['info'] = $GLOBALS['lang']['INVALID_GOODS'];
				ajax_return($res);
			}
		}
	}
	
	
	
	
	public function reopen()
	{
		$user_id = intval($GLOBALS['user_info']['id']);
		if($user_id == 0)
		{
			$GLOBALS['tmpl']->assign("ajax",1);
			$data['open_win'] = 1;
			$data['html'] = $GLOBALS['tmpl']->fetch("inc/login_form.html");
			ajax_return($data);
		}
		else
		{
			$sup_id = intval($_REQUEST['id']);		
			if(!check_ipop_limit(get_client_ip(),"reopen",3600,$sup_id))
			{
				$data['open_win'] = 0;
				$data['info'] = $GLOBALS['lang']['REOPEN_SUBMIT_FAST'];
				$data['status'] = 0;
				ajax_return($data);
			}
			else
			{
				$GLOBALS['db']->query("update ".DB_PREFIX."deal set reopen = reopen + 1 where id = ".$sup_id." and time_status = 2");
				$rs = $GLOBALS['db']->affected_rows();
				if($rs == 0)
				{
					$data['open_win'] = 0;
					$data['info'] = $GLOBALS['lang']['REOPEN_SUBMIT_FAILED'];
					$data['status'] = 0;
					ajax_return($data);
				}
				else
				{
					$data['open_win'] = 0;
					$data['status'] = 1;
					$data['info'] = $GLOBALS['lang']['REOPEN_SUBMIT_OK'];
					ajax_return($data);
				}
			}
		}
	}
}
?>