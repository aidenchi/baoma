<?php
/*
	自定义函数库
 */
 //获取订单支付方式
 	function get_pay_way_d($payment_id)
	{
		$pay_way = M("Payment")->where("id=".$payment_id)->getField("name");
		return $pay_way;
	}
 //获取商品的结算价
	function get_balance_price_d($order_id,$deal_ids)
    {
		$sum_price = 0;
		$str = trim($deal_ids);
		if(!stripos($str,","))
    	{
			$number = M("DealOrderItem")->where("order_id = ".$order_id." and deal_id = ".$str)->getField("number");
    		$balance_price = M("Deal")->where("id=".$str)->getField("balance_price");
			$sum_price = $balance_price * $number;
    	}
		else
		{
			$deal_id = explode(',',$str);
			foreach($deal_id as $id)
			{
				$number = M("DealOrderItem")->where("order_id = ".$order_id." and deal_id = ".$id)->getField("number");
				$balance_price = M("Deal")->where("id=".$id)->getField("balance_price");
				$balance_price *= $number;
				$sum_price += $balance_price;
			}
		}
		return format_price($sum_price);
    }
    //计算利润
    function get_profit_d($order_id,$deal_ids)
    {
		$balance_price = get_balance_price_d($order_id,$deal_ids);
		$total_price = M("DealOrder")->where("id = ".$order_id)->getField('total_price');
		$profit = $total_price - ltrim($balance_price,"￥");
        return format_price($profit);
    }
    //获取负责商品的业务员
    function get_salesman_d($deal_ids)
    {
    	$id = trim($deal_ids);
        if(!stripos($id,","))
        {
        	return M("Deal")->where("id=".intval($id))->getField("salesman");
        }
        else
        {
            $deal_id = explode(',',$id);
            $sales = "";
            foreach($deal_id as $v)
            {
            	$sale = M("Deal")->where("id=".intval($v))->getField("salesman");
                if($sale=="")
                {
                	$sales .= "无,";
                }
                else
                {
            		$sales .= "$sale,";
                }
            }
            return rtrim($sales,',');
        }
    }
	

/******************************************团购券列表函数************************************************************/
	//后台公共函数库
	//获取商品短名
	function getGoodsName_d($deal_id)
    {
    	return M("Deal")->where("id=".$deal_id)->getField("sub_name");
    }
	//获取商品数量
	function get_coupon_number_d($deal_id,$order_id)
    {
    	$deal_type=M("Deal")->where("id=".deal_id)->getField("$order_id");
        $deal_order_item=M("DealOrderItem")->where("deal_id=".$deal_id)->FindAll();
        if(intval(deal_type)==1)
        {
        	foreach($deal_order_item as $v)
            {
            	$str=$v['number'];
            }
        }
        else
        {
        	$str=1;
        }
        return $str;
    }
	//获取所属会员
	function getCouponUserName($user_id)
	{
		$user_info = M("User")->getById($user_id);
		if($user_info)
		return $user_info['user_name'];
		else
		return L("NOT_USER_COUPON");
	}
	//获取发券序列号
	function getCouponOrderSn($order_id)
	{
		$order_info = M("DealOrder")->getById($order_id);
		if($order_info)
		return $order_info['order_sn'];
		else
		return L("NOT_ORDER_COUPON");
	}
	//确认商户账号
	function getCouponConfirmAccount($supplier_id)
	{
		return M("SupplierAccount")->where("supplier_id=".$supplier_id)->getField("account_name");
	}
	//是否发放
	function getCouponIsValid($is_valid)
	{
		if($is_valid == 2)
        {
			return "<span style='color:red;'>".l("COUPON_IS_VALID_".$is_valid)."</span>";
		}
        else
        {
			return l("COUPON_IS_VALID_".$is_valid);
		}
	}
	//是否退款
	function getRefundStatus($status,$id)
	{
		if($status==0)return "无";
		if($status==1)return "<span style='color:red; '>申请退款<br /> <a href='".u("DealCoupon/refund",array("id"=>$id))."'>确认退款</a></span>";
		if($status==2)return "已退款";
	}
	/*************************将过期团购券列表********************************/
	//团购券销售数量
	function get_coupon_sale_number_d($deal_id)
	{
		//获取商品类型deal_type
		$deal_type=M("Deal")->where("id = ".intval($deal_id))->getField('deal_type');
		if($deal_type == 0)
		{
			$sql = "select count(*) from ".DB_PREFIX."deal_coupon where deal_id = ".intval($deal_id);
			$number = $GLOBALS['db']->getOne($sql);
		}
		else
		{
			$coupon = M("DealCoupon")->where("deal_id = ".intval($deal_id))->findAll();
			$number=0;
			foreach($coupon as $v)
			{
				$sql = "select number from ".DB_PREFIX."deal_order_item where deal_id = ".intval($v['deal_id'])." and id = ".intval($v['order_deal_id'])." and order_id = ".intval($v['order_id']);
				$number = $GLOBALS['db']->getOne($sql);
			}
		}
		return intval($number);
	}
	//获取团购券已验证的数量
	function get_validate_sum_d($deal_id)
	{
		//print_d($deal_id);
		//return intval($deal_id);
		$deal_type = M("Deal")->where("id = ".intval($deal_id))->getField('deal_type');	//获取商品类型deal_type
		$ext_condition = " and confirm_time > 0 and refund_status < 2";	//扩展条件
		if($deal_type == 0)
		{
			$sql = "select count(*) from ".DB_PREFIX."deal_coupon where deal_id = ".intval($deal_id).$ext_condition;
			$number = $GLOBALS['db']->getOne($sql);
		}
		else
		{
			$coupon = M("DealCoupon")->where("deal_id = ".intval($deal_id).$ext_condition)->findAll();
			$number=0;
			foreach($coupon as $v)
			{
				$sql = "select number from ".DB_PREFIX."deal_order_item where deal_id = ".intval($v['deal_id'])." and id = ".intval($v['order_deal_id'])." and order_id = ".intval($v['order_id']);
				$number = $GLOBALS['db']->getOne($sql);
			}
		}
		return intval($number);
	}
	//获取团购券未验证的数量
	function get_not_validate_sum_d($deal_id)
	{
		$deal_type=M("Deal")->where("id = ".intval($deal_id))->getField('deal_type');	//获取商品类型deal_type
		$ext_condition = " and confirm_time = 0 and refund_status < 2";	//扩展条件
		if($deal_type == 0)
		{
			$sql = "select count(*) from ".DB_PREFIX."deal_coupon where deal_id = ".intval($deal_id).$ext_condition;
			$number = $GLOBALS['db']->getOne($sql);
		}
		else
		{
			$coupon = M("DealCoupon")->where("deal_id = ".intval($deal_id).$ext_condition)->findAll();
			$number=0;
			foreach($coupon as $v)
			{
				$sql = "select number from ".DB_PREFIX."deal_order_item where deal_id = ".intval($v['deal_id'])." and id = ".intval($v['order_deal_id'])." and order_id = ".intval($v['order_id']);
				$number = $GLOBALS['db']->getOne($sql);
			}
		}
		return intval($number);
	}
	//已退款数量
	function get_refund_sum_d()
	{
		$deal_type=M("Deal")->where("id = ".intval($deal_id))->getField('deal_type');	//获取商品类型deal_type
		$ext_condition = " and confirm_time = 0 and refund_status = 2";	//扩展条件
		if($deal_type == 0)
		{
			$sql = "select count(*) from ".DB_PREFIX."deal_coupon where deal_id = ".intval($deal_id).$ext_condition;
			$number = $GLOBALS['db']->getOne($sql);
		}
		else
		{
			$coupon = M("DealCoupon")->where("deal_id = ".intval($deal_id).$ext_condition)->findAll();
			$number=0;
			foreach($coupon as $v)
			{
				$sql = "select number from ".DB_PREFIX."deal_order_item where deal_id = ".intval($v['deal_id'])." and id = ".intval($v['order_deal_id'])." and order_id = ".intval($v['order_id']);
				$number = $GLOBALS['db']->getOne($sql);
			}
		}
		return intval($number);
	}
	//发券类型
	function get_deal_type_d($type,$id)
	{
		$deal = M("Deal")->getById($id);
		if($deal['is_coupon'])
		{
			return l("COUNT_TYPE_".$deal['deal_type']);
		}
		else
		{
			return l("NO_DEAL_COUPON_GEN");
		}
	}
	//时间状态
	function get_time_status_d($time_status,$deal_id)
	{
		$str = l("TIME_STATUS_".$time_status);
		if($time_status == 2)
		{
			$str .= "<br />&nbsp;".M("Deal")->where("id=".$deal_id)->getField("reopen").l("REOPEN_SUBMIT");
		}
		return $str;
	}
	//购买类型
	function get_buy_type_title_d($buy_type)
	{
		return l("DEAL_BUY_TYPE_".$buy_type);
	}
	//其中3天内要下线的商品结束时间显示红色，已下线三天内的商品显示蓝色
	function get_end_time_d($end_time)
	{
		$now=get_gmtime();   //获取当前服务器时间
		$three_days_after = $now + 3600 * 24 * 3;
		$seven_days_before = $now - 3600 * 24 * 3;
		$res = "";
		if($end_time <= $three_days_after && $end_time >= $now)
		{
			$res = '<label style="color:red;">'.to_date($end_time)."</label>";
		}
		elseif($end_time >= $three_days_after && $end_time <= $now)
		{
			$res = '<label style="color:blue;">'.to_date($end_time)."</label>"	;
		}
		else
		{
			$res = to_date($end_time);
		}
		return $res;
	}
	
/******************************************模板调用部分************************************************************/
///获取header类的分类
   function get_cate($cate_id=10,$sort="sort desc",$limit=0)
   {
			$scate_listt =$GLOBALS['db']->getAll("select * from ".DB_PREFIX."deal_cate_type as t left join ".DB_PREFIX."deal_cate_type_link as l on l.deal_cate_type_id = t.id where l.cate_id = ".$cate_id." order by ".$sort." limit ".$limit."");
                   foreach($scate_listt as $key=>$value)
                   {
                   	$durl = url("tuan","index",array("id"=>$cate_id,"tid"=>$value['id']));
                   	$scate_listt[$key]['url']=$durl;
                   }
                    if($scate_listt)
                    {
                    	$bcate['scates']=$scate_listt;
                    }
      return $scate_listt;
   }
 //获取商圈
   function get_quan($pid=0,$sort="sort desc",$limit=0)
   {
   	        $deal_city_id=get_current_deal_city();
            $area_list_result = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."area where city_id = ".$deal_city_id['id']." and pid = 0 order by ".$sort." limit ".$limit."");
            foreach($area_list_result as $k=>$v)
            {
          	   $area_list_result[$k]['url'] = url("youhui","store",array("aid"=>$v['id']));
               $quan_list_result = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."area where city_id = ".$deal_city_id['id']." and pid = ".$v['id']." order by sort desc");
          	   foreach($quan_list_result as $key=>$value)
          	   {
          	   $quan_list_result[$key]['url'] = url("youhui","store",array("aid"=>$v['id'],"qid"=>$value['id']));
          	   }
          	   if($quan_list_result)
          	   {
          	   	$area_list_result[$k]['quans']=$quan_list_result;
          	   }
            }
         return $area_list_result;
   }
 /*获取页面公告
 * ******   cate_id表示article_cate表下的id            ********
 * *****    limit:取值条数                                    *******/
    function get_notice_list($limit=0,$cate_id=10,$sort="sort",$notice_page=array(0))
    {
	if($limit == 0)
	$limit = app_conf("INDEX_NOTICE_COUNT");
	if($limit>0)
	{
		$limit_str = "limit ".$limit;
	}
	else
	{
		$limit_str = "";
	}
	$list = $GLOBALS['db']->getAll("select a.*,ac.type_id from ".DB_PREFIX."article as a left join ".DB_PREFIX."article_cate as ac on a.cate_id = ac.id where a.notice_page in (".implode(",",$notice_page).") and  ac.id=".$cate_id." and ac.is_effect = 1 and ac.is_delete = 0 and a.is_effect = 1 and a.is_delete = 0 order by a.".$sort." desc limit ".$limit."");
	foreach($list as $k=>$v)
	{
			if($v['type_id']==1)
			{
				$module = "help";
			}
			elseif($v['type_id']==2)
			{
				$module = "notice";
			}
			elseif($v['type_id']==3)
			{
				$module = "sys";
			}
			else
			{
				$module = 'article';
			}
			if($v['uname']!='')
			$aurl = url("shop",$module,array("id"=>$v['uname']));
			else
			$aurl = url("shop",$module,array("id"=>$v['id']));
			$list[$k]['url'] = $aurl;
	}
	return $list;
    }
/*获取父分类的商家 author:陈明胜
  * ******  deal_cate_id:对应deal_cate表的id,表示分类信息,若取0，则表示所有父类别的商家       ********
  * ******  sort:对应supplier_location下子分类排序                     ********
  * ******  limit:要获取的条数                                  *******/
     function get_store($deal_cate_id,$sort,$limit)
     {
     	$city_id=get_current_deal_city();
     	if($deal_cate_id==0)
     	{
     		$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location WHERE city_id=".$city_id['id']." and is_effect = 1 order by ".$sort." limit ".$limit."");
     	}
     	else
     	$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location WHERE city_id=".$city_id['id']." and deal_cate_id=".$deal_cate_id." and is_effect = 1 order by ".$sort." limit ".$limit."");
      	//$store_list=$GLOBALS['db']->getAll($sql);
      	foreach($store_list as $k=>$v)
      	{
      		$url=parse_url_tag("u:youhui|store#view|id=".$v['id']."");
      		$store_list[$k]['url']=$url;
      	}
      	return $store_list;
     }
 /*获取子分类的商家 author:陈明胜
  * ******  deal_cate_type_id:对应deal_cate_type表的id,表示子分类信息       ********
  * ******  sort:对应supplier_location下子分类排序                     ********
  * ******  limit:要获取的条数                                  *******/
     function get_type_store($deal_cate_type_id,$sort,$limit)
     {
     	$query = "SELECT a.*, b.* FROM ".DB_PREFIX."supplier_location AS a , ".DB_PREFIX."deal_cate_type_location_link AS b WHERE a.id = b.location_id AND a.is_recommend = 1 AND b.deal_cate_type_id = ".$deal_cate_type_id." ORDER BY ".$sort." LIMIT ".$limit."";
        if (!$result = mysql_query($query)){
		print "Query Error: ".mysql_error();
		exit;
		}
		$k=0;
		while($qch = mysql_fetch_array($result))
		{
			$url=parse_url_tag("u:youhui|store#view|id=".$qch['id']."");
			$list[$k]=$qch;
			$list[$k]['url']=$url;
			$k+=1;
		}
	    return $list;
     }
		 
		 

/**************************2014新版模板调用函数***********************************************/
//调用团购列表
// get_tuan(27,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"cate_id in(8) and is_recommend = 1","sort desc")

function get_tuan($limit,$cate_id=0,$city_id=0, $type=array(DEAL_ONLINE,DEAL_HISTORY,DEAL_NOTICE,DEAL_ALL), $where='',$orderby = '')
{
		$time = get_gmtime();
		$time_condition = '  and is_shop = 0 and ( 1<>1 ';
		if(in_array(DEAL_ONLINE,$type))
		{
			//进行中的团购
			$time_condition .= " or ((".$time.">= begin_time or begin_time = 0) and (".$time."<end_time or end_time = 0) and buy_status <> 2) ";
		}
		if(in_array(DEAL_HISTORY,$type))
		{
			//往期团购
			$time_condition .= " or ((".$time.">=end_time and end_time <> 0) or buy_status = 2) ";
		}
		if(in_array(DEAL_NOTICE,$type))
		{
			//预告
			$time_condition .= " or ((".$time." < begin_time and begin_time <> 0 and notice = 1)) ";
		}
		if(in_array(DEAL_ALL,$type))
		{
			//显示全部
			$time_condition .= " or ((".$time.">= begin_time or ".$time."<= begin_time or begin_time = 0))";
		}
		$time_condition .= ')';
			$count_sql = "select count(*) from ".DB_PREFIX."deal where is_effect = 1 and is_delete = 0 ".$time_condition;
			$sql = "select * from ".DB_PREFIX."deal where is_effect = 1 and is_delete = 0 ".$time_condition;
			if($cate_id>0)
			{
				$ids = load_auto_cache("deal_sub_parent_cate_ids",array("cate_id"=>$cate_id));
				$sql .= " and cate_id in (".implode(",",$ids).")";
				$count_sql .= " and cate_id in (".implode(",",$ids).")";
			}
			if($city_id==0)
			{
				$city = get_current_deal_city();
				$city_id = $city['id'];
			}
			if($city_id>0)
			{
				$ids = load_auto_cache("deal_city_belone_ids",array("city_id"=>$city_id));
				if($ids)
				{
				$sql .= " and city_id in (".implode(",",$ids).")";
				$count_sql .= " and city_id in (".implode(",",$ids).")";
				}
			}
		if($where != '')
		{
			$sql.=" and ".$where;
			$count_sql.=" and ".$where;
		}
		if($orderby=='')
		$sql.=" order by sort desc ";
		else
		$sql.=" order by ".$orderby;
		if($limit>0)
		{
			$sql.=" limit ".$limit." ";
		}
		else
		{
			if(count(explode(",",$limit))>1)
			{
				$sql.=" limit ".$limit." ";
			}
		}
		$deals = $GLOBALS['db']->getAll($sql);
		$deals_count = $GLOBALS['db']->getOne($count_sql);
 		if($deals)
		{
			foreach($deals as $k=>$deal)
			{
				//统计出价人数
				$bid = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."compete_record where deal_id = ".$deal['id']." order by id desc");
				$deal['bid_count'] = count($bid);
				//格式化数据
			$deal['begin_time_format'] = to_date($deal['begin_time']);
			$deal['end_time_format'] = to_date($deal['end_time']);
			$deal['origin_price_format'] = format_price($deal['origin_price']);
			$deal['current_price_format'] = format_price($deal['current_price']);
			$deal['extent_price_format'] = format_price($deal['extent_price']);
			$deal['start_price_format'] = format_price($deal['start_price']);
			$deal['vip_price_format'] = format_price($deal['vip_price']);
			$deal['success_time_format']  = to_date($deal['success_time']);
			$deal['success_time_format']  = to_date($deal['success_time']);
				if($deal['origin_price']>0&&floatval($deal['discount'])==0) //手动折扣
				$deal['save_price'] = $deal['origin_price'] - $deal['current_price'];
				else
				$deal['save_price'] = $deal['origin_price']*((10-$deal['discount'])/10);
				if($deal['origin_price']>0&&floatval($deal['discount'])==0)
				{
					$deal['discount'] = round(($deal['current_price']/$deal['origin_price'])*10,2);
				}
				$deal['discount'] = round($deal['discount'],2);
				$deal['save_price_format'] = format_price($deal['save_price']);
				//获取商家信息
				$mc_db = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."supplier_location where supplier_id = ".intval($deal['supplier_id'])." ");
				$deal['mc_add'] = $mc_db['address'];
				$deal['mc_tel'] = $mc_db['tel'];
				if($deal['uname']!='')
				$durl = url("tuan","deal",array("id"=>$deal['uname']));
				else
				$durl = url("tuan","deal",array("id"=>$deal['id']));
				$deal['url'] = $durl;
				$deal['deal_success_num'] = sprintf($GLOBALS['lang']['SUCCESS_BUY_COUNT'],$deal['buy_count']);
				$deal['current_bought'] = $deal['buy_count'];
				if($deal['buy_status']==0) //未成功
				{
					$deal['success_less'] = sprintf($GLOBALS['lang']['SUCCESS_LESS_BUY_COUNT'],$deal['min_bought'] - $deal['buy_count']);
				}
				$deals[$k] = $deal;
			}
		}
		return array('list'=>$deals,'count'=>$deals_count);
}


/**
 * 获取商城列表
 */

function search_goods_list_d($limit, $cate_id=0, $where='',$orderby = '',$cached = true, $join_str = '')
{		
		$key = md5($limit.$cate_id.$where.$orderby.$join_str);	
		if($cached)
		{				
			$res = $GLOBALS['cache']->get($key);
		}
		else
		{
			$res = false;
		}
		if($res===false)
		{
			
			$count_sql = "select count(*) from ".DB_PREFIX."deal as d" ;
			$sql = "select d.* from ".DB_PREFIX."deal as d ";
			
			if($join_str!='')
			{
				$count_sql.=$join_str;
				$sql.=$join_str;
			}
			
			$time = get_gmtime();
			$time_condition = '  and (d.is_shop=1  or d.shop_cate_id <> 0 ) ';
	
			$count_sql .= " where d.is_effect = 1 and d.is_delete = 0 ".$time_condition;
			$sql .= " where d.is_effect = 1 and d.is_delete = 0 ".$time_condition;
			
			if($cate_id>0)
			{
				$ids = load_auto_cache("shop_sub_cate_ids",array("cate_id"=>$cate_id));
				$sql .= " and d.shop_cate_id in (".implode(",",$ids).")";
				$count_sql .= " and d.shop_cate_id in (".implode(",",$ids).")";
			}
				
			$city = get_current_deal_city();
			$city_id = $city['id'];

			if($city_id>0)
			{			
				$ids =  load_auto_cache("deal_city_belone_ids",array("city_id"=>$city_id));
				if($ids)
				{
				$sql .= " and city_id in (".implode(",",$ids).")";
				$count_sql .= " and city_id in (".implode(",",$ids).")";
				}
			}
			
			if($where != '')
			{
				$sql.=" and ".$where;
				$count_sql.=" and ".$where;
			}
			
			if($orderby=='')
			$sql.=" order by d.sort desc limit ".$limit;
			else
			$sql.=" order by ".$orderby." limit ".$limit;
	
			
			$deals = $GLOBALS['db']->getAll($sql);				
			$deals_count = $GLOBALS['db']->getOne($count_sql);
			
	 		if($deals)
			{
				foreach($deals as $k=>$deal)
				{
				
					//格式化数据
					$deal['origin_price_format'] = format_price($deal['origin_price']);
					$deal['current_price_format'] = format_price($deal['current_price']);
	
					
					if($deal['origin_price']>0&&floatval($deal['discount'])==0) //手动折扣
					$deal['save_price'] = $deal['origin_price'] - $deal['current_price'];			
					else
					$deal['save_price'] = $deal['origin_price']*((10-$deal['discount'])/10);
					if($deal['origin_price']>0&&floatval($deal['discount'])==0)
					{
						$deal['discount'] = round(($deal['current_price']/$deal['origin_price'])*10,2);					
					}
					
					$deal['discount'] = round($deal['discount'],2);
	
	
	
					$deal['save_price_format'] = format_price($deal['save_price']);
					if($deal['uname']!='')
					$durl = url("shop","goods",array("id"=>$deal['uname']));
					else
					$durl = url("shop","goods",array("id"=>$deal['id']));
					$deal['url'] = $durl;
					
					$deals[$k] = $deal;
				}
			}	
			$res = array('list'=>$deals,'count'=>$deals_count);	
			$GLOBALS['cache']->set($key,$res);
		}			
		return $res;
}
?>