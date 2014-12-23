<?php



class balanceModule extends BizBaseModule
{
	public function __construct()
	{
		parent::__construct();
		$this->check_auth();
	}
	public function index()
	{		
		require_once APP_ROOT_PATH."app/Lib/page.php";		
		$s_account_info = es_session::get("account_info");
		$account_id = intval($s_account_info['id']);		
		$GLOBALS['tmpl']->assign("page_title","结算报表");
		
		$deal_id = intval($_REQUEST['deal_id']);		
		$is_balance = intval($_REQUEST['is_balance']);
		
		if($_REQUEST['is_redirect']==1)
		{
			$url_param=array("deal_id"=>$deal_id,"is_balance"=>$is_balance);
			app_redirect(url("biz","balance",$url_param));
		}

		$sql = "select d.* from ".DB_PREFIX."deal as d left join ".DB_PREFIX."deal_location_link as l on l.deal_id = d.id where d.id = ".$deal_id." and l.location_id in (".implode(",",$s_account_info['location_ids']).")";
		$deal_info = $GLOBALS['db']->getRow($sql);
		//==========
		
		$GLOBALS['tmpl']->assign("is_balance",$is_balance);
		
		if($deal_info)
		{			
			$page = intval($_REQUEST['p']);
			if($page==0)
			$page = 1;
			$limit = (($page-1)*app_conf("PAGE_SIZE")).",".app_conf("PAGE_SIZE");

			$GLOBALS['tmpl']->assign("deal_info",$deal_info);
			if($deal_info['is_coupon']==1)
			{		
				if($is_balance==2)
				{
					$sort = " order by balance_time desc ";
				}	
				else
				{
					$sort = " order by id desc ";
				}	
				$condition = " deal_id = ".$deal_info['id']." and is_delete = 0 and user_id > 0 and is_valid = 1 ";
				$dataList = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = ".$is_balance.$sort." limit ".$limit);
				$dataTotal = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = ".$is_balance);
			
				foreach($dataList as $k=>$v)
				{
					$dataList[$k]['name'] = $GLOBALS['db']->getOne("select name from ".DB_PREFIX."deal_order_item where id = ".$v['order_deal_id']);
					if(!$dataList[$k]['name'])
					$dataList[$k]['name'] = $deal_info['name'];
				}				
				
				$totalBalance0 = $GLOBALS['db']->getOne("select sum(balance_price) from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = 0");
				$totalBalance00 =$GLOBALS['db']->getOne("select sum(add_balance_price) from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = 0");
				$totalBalance1 = $GLOBALS['db']->getOne("select sum(balance_price) from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = 1");
				$totalBalance11 =$GLOBALS['db']->getOne("select sum(add_balance_price) from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = 1");
				$totalBalance2 = $GLOBALS['db']->getOne("select sum(balance_price) from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = 2");
				$totalBalance22 =$GLOBALS['db']->getOne("select sum(add_balance_price) from ".DB_PREFIX."deal_coupon where ".$condition." and is_balance = 2");
				
				
				$GLOBALS['tmpl']->assign("totalBalance0",$totalBalance0+$totalBalance00+$totalBalance1+$totalBalance11);
				$GLOBALS['tmpl']->assign("totalBalance1",$totalBalance1+$totalBalance11);
				$GLOBALS['tmpl']->assign("totalBalance2",$totalBalance2+$totalBalance22);
				
				$GLOBALS['tmpl']->assign ( 'dataList', $dataList );
				$page = new Page($dataTotal,app_conf("PAGE_SIZE"));   //初始化分页对象 		
				$p  =  $page->show();
				$GLOBALS['tmpl']->assign('pages',$p);
				//团购券结算
				
				$html = $GLOBALS['tmpl']->fetch("biz/biz_balance_coupon.html");
				$GLOBALS['tmpl']->assign("html",$html);
				
			}
			else
			{
				if($is_balance==2)
				{
					$sort = " order by balance_time desc ";
				}	
				else
				{
					$sort = " order by id desc ";
				}	
				$condition = " deal_id = ".$deal_info['id']." ";
				$dataList = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = ".$is_balance.$sort."  limit ".$limit);
				$dataTotal = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = ".$is_balance);
					
				
				$totalBalance0 = $GLOBALS['db']->getOne("select sum(balance_total_price) from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = 0");
				$totalBalance00 = $GLOBALS['db']->getOne("select sum(add_balance_price_total) from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = 0");
				$totalBalance1 = $GLOBALS['db']->getOne("select sum(balance_total_price) from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = 1");
				$totalBalance11 = $GLOBALS['db']->getOne("select sum(add_balance_price_total) from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = 1");
				$totalBalance2 = $GLOBALS['db']->getOne("select sum(balance_total_price) from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = 2");
				$totalBalance22 = $GLOBALS['db']->getOne("select sum(add_balance_price_total) from ".DB_PREFIX."deal_order_item where ".$condition." and is_balance = 2");
				$GLOBALS['tmpl']->assign("totalBalance0",$totalBalance0+$totalBalance00+$totalBalance1+$totalBalance11);
				$GLOBALS['tmpl']->assign("totalBalance1",$totalBalance1+$totalBalance11);
				$GLOBALS['tmpl']->assign("totalBalance2",$totalBalance2+$totalBalance22);
				
				$GLOBALS['tmpl']->assign ( 'dataList', $dataList );
				$page = new Page($dataTotal,app_conf("PAGE_SIZE"));   //初始化分页对象 		
				$p  =  $page->show();
				$GLOBALS['tmpl']->assign('pages',$p);

				
				$html = $GLOBALS['tmpl']->fetch("biz/biz_balance_order.html");
				$GLOBALS['tmpl']->assign("html",$html);
				
				
			}
		}
		
		//=============
		
		$GLOBALS['tmpl']->display("biz/biz_balance.html");
	}
	
	public function log()
	{
		require_once APP_ROOT_PATH."app/Lib/page.php";
		$s_account_info = es_session::get("account_info");
		
		$account_data = $GLOBALS['db']->getRow("select s.money,s.name as name,a.allow_charge as allow_charge, a.account_name as account_name,a.login_ip as login_ip ,a.login_time as login_time ,a.update_time as create_time, a.supplier_id as supplier_id from ".DB_PREFIX."supplier_account as a left join ".DB_PREFIX."supplier as s on a.supplier_id = s.id where a.id = ".intval($s_account_info['id']));
		if(!$account_data)
		{
			app_redirect(url("biz","login"));
		}
		
		$GLOBALS['tmpl']->assign("page_title","财务明细");
		$GLOBALS['tmpl']->assign("account_data",$account_data);
		
		
		//输出列表
		$page = intval($_REQUEST['p']);
		if($page==0)
			$page = 1;
		$limit = (($page-1)*app_conf("PAGE_SIZE")).",".app_conf("PAGE_SIZE");
		
		$condition = " supplier_id = ".$account_data['supplier_id']." ";
		$dataList = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."supplier_money_log where ".$condition." order by create_time desc limit ".$limit);
		$dataTotal = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_money_log where ".$condition);

		$GLOBALS['tmpl']->assign ( 'dataList', $dataList );
		$page = new Page($dataTotal,app_conf("PAGE_SIZE"));   //初始化分页对象
		$p  =  $page->show();
		$GLOBALS['tmpl']->assign('pages',$p);
		
		$GLOBALS['tmpl']->display("biz/biz_balance_log.html");
		
	}
	
	public function charge()
	{
		require_once APP_ROOT_PATH."app/Lib/page.php";
		$s_account_info = es_session::get("account_info");
		
		$account_data = $GLOBALS['db']->getRow("select s.bank_info,s.bank_user,s.bank_name,s.money,s.name as name,a.allow_charge as allow_charge, a.account_name as account_name,a.login_ip as login_ip ,a.login_time as login_time ,a.update_time as create_time, a.supplier_id as supplier_id from ".DB_PREFIX."supplier_account as a left join ".DB_PREFIX."supplier as s on a.supplier_id = s.id where a.id = ".intval($s_account_info['id']));
		if(!$account_data)
		{
			app_redirect(url("biz","login"));
		}
		if($account_data['allow_charge']==0)
		{
			showErr("没有权限进行提现操作");
		}
		
		$GLOBALS['tmpl']->assign("page_title","商家提现");
		$GLOBALS['tmpl']->assign("account_data",$account_data);
		
		
		//输出列表
		$page = intval($_REQUEST['p']);
		if($page==0)
			$page = 1;
		$limit = (($page-1)*app_conf("PAGE_SIZE")).",".app_conf("PAGE_SIZE");
		
		$condition = " supplier_id = ".$account_data['supplier_id']." ";
		$dataList = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."supplier_money_submit where ".$condition." order by create_time desc  limit ".$limit);
		$dataTotal = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_money_submit where ".$condition);
		
		$wait_money = $GLOBALS['db']->getOne("select sum(money) from ".DB_PREFIX."supplier_money_submit where ".$condition." and status = 0");
		$max_money = $account_data['money'] - $wait_money;
		
		$GLOBALS['tmpl']->assign ( 'max_money', $max_money );
		$GLOBALS['tmpl']->assign ( 'dataList', $dataList );
		$page = new Page($dataTotal,app_conf("PAGE_SIZE"));   //初始化分页对象
		$p  =  $page->show();
		$GLOBALS['tmpl']->assign('pages',$p);
		
		$GLOBALS['tmpl']->display("biz/biz_balance_charge.html");
	}
	
	
	public function docharge()
	{
		require_once APP_ROOT_PATH."app/Lib/page.php";
		$s_account_info = es_session::get("account_info");
		
		$account_data = $GLOBALS['db']->getRow("select s.money,s.name as name,a.allow_charge as allow_charge, a.account_name as account_name,a.login_ip as login_ip ,a.login_time as login_time ,a.update_time as create_time, a.supplier_id as supplier_id from ".DB_PREFIX."supplier_account as a left join ".DB_PREFIX."supplier as s on a.supplier_id = s.id where a.id = ".intval($s_account_info['id']));
		if(!$account_data)
		{
			app_redirect(url("biz","login"));
		}
		if($account_data['allow_charge']==0)
		{
			showErr("没有权限进行提现操作");
		}
		
		$money = floatval($_REQUEST['money']);
		

		$condition = " supplier_id = ".$account_data['supplier_id']." ";
		$wait_money = $GLOBALS['db']->getOne("select sum(money) from ".DB_PREFIX."supplier_money_submit where ".$condition." and status = 0");
		$max_money = $account_data['money'] - $wait_money;
		
		if($money>0)
		{
			if($money>$max_money)$money = $max_money;
			$data = array();
			$data['money'] = $money;
			$data['supplier_id'] = $account_data['supplier_id'];
			$data['create_time'] = get_gmtime();
			$data['status'] = 0;
			
			$GLOBALS['db']->autoExecute(DB_PREFIX."supplier_money_submit",$data);
		}
		app_redirect(url("biz","balance#charge"));
	}
}
?>