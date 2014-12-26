<?php
class aatest
{
	public function index()
	{
		//print_r($GLOBALS['request']);
		$root = array();
		$root['return'] = 1;
		
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称	
		$city_id = intval($GLOBALS['request']['city_id']);//城市id
		$cate_id = intval($GLOBALS['request']['cate_id']);//类别id
		$quan_id = intval($GLOBALS['request']['quan_id']);//区域id
		$age_id = intval($GLOBALS['request']['age_id']);//年龄id		
		$order_type=strim($GLOBALS['request']['order_type']);//排序方式		
		$keyword = strim($GLOBALS['request']['keyword']);//关键字搜索
		$page = intval($GLOBALS['request']['page']); //分页	

		$ypoint =  doubleval($GLOBALS['request']['ypoint']);  //ypoint 
		$xpoint = doubleval($GLOBALS['request']['xpoint']);  //xpoint
		//$xpoint = doubleval(114.41776);
		//$ypoint = doubleval(30.483698);
		$root['xypoint'] = $xpoint.','.$ypoint;

		
		//输出分类
		$base_cate_list=$GLOBALS['db']->getAll("select id,name,icon_img from ".DB_PREFIX."deal_cate where is_delete=0 and is_effect=1 and pid=0 order by sort desc,id desc");	
		$bcate_list = array();
		$bcate_list[0]['id'] = 0;
		$bcate_list[0]['name'] = "全部";
		foreach($base_cate_list as $k=>$v){
			$bcate_list[$k+1] = $base_cate_list[$k];
		}
		//输出区域
		$base_quan_list=$GLOBALS['db']->getAll("select * from ".DB_PREFIX."area where city_id=".intval($city_id)." and pid = 0 order by sort desc");
		$quan_list = array();
		$quan_list[0]['id'] = 1;
		$quan_list[0]['name'] = "全部";
		foreach($base_quan_list as $k=>$v){
			$quan_list[$k+1] = $base_quan_list[$k];
		}
		//输出年龄
		$base_age_list=$GLOBALS['db']->getAll("select * from ".DB_PREFIX."supplier_location_age order by sort desc");
		$age_list = array();
		$age_list[0]['id'] = 0;
		$age_list[0]['name'] = "全部";
		foreach($base_age_list as $k=>$v){
			$age_list[$k+1] = $base_age_list[$k];
		}
		
		$page=$page==0?1:$page;
		$page_size = PAGE_SIZE;
		$limit = (($page-1)*$page_size).",".$page_size;	
		
		$where = "1 = 1";

		if($city_id>0){			
			$ids = load_auto_cache("deal_city_belone_ids",array("city_id"=>$city_id));
			if($ids){
				$where .= " and a.city_id in (".implode(",",$ids).")";
			}
		}	
		
		//筛选一  分类		
		if($cate_id>0){//如果选择了分类			
			$deal_cate_name = $GLOBALS['db']->getOne("select name from ".DB_PREFIX."deal_cate where id = ".$cate_id);			
			$deal_cate_name_unicode = str_to_unicode_string($deal_cate_name);
			$where .= " and (match(a.deal_cate_match) against('".$deal_cate_name_unicode."' IN BOOLEAN MODE)) ";		
		}		
		
		//筛选二  区域
		if ($quan_id > 0){//如果选择了区域	
			if ($quan_id != 1){//不为全部
				$q_name = $GLOBALS['db']->getOne("select name from ".DB_PREFIX."area where id = ".intval($quan_id));
				$q_name_unicode = str_to_unicode_string($q_name);
				$where .=" and (match(a.locate_match) against('".$q_name_unicode."' IN BOOLEAN MODE))";
				$xpoint = 0;
				$ypoint = 0;
			}
		}
		
		if($xpoint>0 && $ypoint>0){//定位成功，按离我的位置由近到远排序	
			$pi = 3.14159265;  //圆周率
			$r = 6378137;  //地球平均半径(米)
			$field_append = ", (ACOS(SIN(($ypoint * $pi) / 180 ) *SIN((a.ypoint * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS((a.ypoint * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - (a.xpoint * $pi) / 180 ) ) * $r) as distance ";
			//0.5km范围内
			$squares = returnSquarePoint($xpoint, $ypoint, 2);
			$where .= "and a.ypoint<>0 and a.ypoint>{$squares['right-bottom']['lat']} and a.ypoint<{$squares['left-top']['lat']} and a.xpoint>{$squares['left-top']['lng']} and a.xpoint<{$squares['right-bottom']['lng']} ";

			$orderby = " order by distance asc ";
		}else{//定位失败，按人气排序	
			$orderby = " order by a.dp_count desc ";
		}	
		
		//筛选三（排序） 人气、评价、最新	
		//如果选中了位置即quan_id大于0，并且排序选中的是离我最近，即order_type等于0，则将order_type置为1；		
		//如果未选中位置，位置为全部即quan_id等于0，order_type为本来的选中值
		if($order_type=='dp_count'){//人气（点评数量倒序）	
			$orderby = " order by a.dp_count desc ";	
		}
		if($order_type=='avg_point'){//评价（平均评分倒序）
			$orderby = " order by a.avg_point desc ";
		}
		if($order_type=='id'){//最新（id倒序）
			$orderby = " order by a.id desc ";
		}
			
		//筛选四  年龄
		if ($age_id > 0){//如果选择了年龄
			$supplier_locations = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."supplier_location_age_link where age_id = ".$age_id);
			$location_ids = '';
			foreach($supplier_locations as $k=>$v){
				$location_ids = $location_ids.$v['location_id'].',';
			}
			$location_ids = substr($location_ids,0,-1);
			$location_ids = '('.$location_ids.')';
			$where .=" and a.id in ".$location_ids;
			//$root['location_ids'] = $location_ids;
		}		
		
		//关键字搜索
		if($keyword){
	   		$GLOBALS['tmpl']->assign("keyword",$keyword);
	   		$kws_div = div_str($keyword);
			foreach($kws_div as $k=>$item)	{
				$kw[$k] = str_to_unicode_string($item);
			}
			$kw_unicode = implode(" ",$kw);
			//有筛选
			$where .=" and (match(a.name_match,a.locate_match,a.deal_cate_match,a.tags_match) against('".$kw_unicode."' IN BOOLEAN MODE) or name like '%".$keyword."%')";	  	
	   }
		
		$sql_count = "select count(*) from ".DB_PREFIX."supplier_location". " as a";
		$sql = "select a.id,a.deal_cate_id,a.name,a.avg_point,a.city_id, a.mobile_brief,a.mobile_brief as brief,a.tel,".
		"a.preview as logo,a.dp_count as comment_count,a.xpoint,a.ypoint,a.address as api_address $field_append from ".DB_PREFIX."supplier_location as a ";
	   
		$sql_count.=" where ".$where;
		$sql.=" where ".$where;
		$sql.=$orderby;
		$sql.=" limit ".$limit;		
		$root['sql'] = $sql;
		
		$total = $GLOBALS['db']->getOne($sql_count);
		$page_total = ceil($total/$page_size);
		$list = $GLOBALS['db']->getAll($sql);
	
		$merchant_list = array();
		$l_ids=array();
		foreach($list as $item){
			$item['logo']=str_replace("./public/","/public/",$item['logo']);//图片显示不出来，ymy添加了这一句 2014-12-10
			$item = m_merchantItem($item);			
			$merchant_list[] = $item;
		}
		foreach($merchant_list as $k=>$v){		
			$merchant_list[$k]['cate_name']=$GLOBALS['db']->getOne("select name from ".DB_PREFIX."deal_cate where id=".$v['deal_cate_id']);
			//$merchant_list[$k]['width'] = $v['avg_point'] > 0 ? ($v['avg_point'] / 5) * 100 : 0;
			//$merchant_list[$k]['avg_point']=round($v['avg_point'],1);		
			if (empty($merchant_list[$k]['mobile_brief'])){
				$merchant_list[$k]['mobile_brief'] = $merchant_list[$k]['l_cate_type'].' '.$merchant_list[$k]['l_area'];
			}
			//从店铺点评表里读取点评情况
			$this_store_comment_count=$GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_location_dp as a left join ".
			DB_PREFIX."user as b on b.id=a.user_id where a.supplier_location_id = ".$v['id']." and a.status = 1");
			$buy_dp_sum = 0.0;
			$buy_dp_group = $GLOBALS['db']->getAll("select point,count(*) as num from ".DB_PREFIX."supplier_location_dp where supplier_location_id = ".$v['id']." and status = 1 group by point");
			foreach($buy_dp_group as $dp_k=>$dp_v){
				$star = intval($dp_v['point']);
				if ($star >= 1 && $star <= 5){			
					$buy_dp_sum += $star * $dp_v['num'];
				}
			}			
			//整体平均分
			$merchant_list[$k]['dp_avg_point'] = round($buy_dp_sum / $this_store_comment_count,1);
			$merchant_list[$k]['dp_width'] = (round($buy_dp_sum / $this_store_comment_count,1) / 5) * 100;	
			$u_sql = "update ".DB_PREFIX."supplier_location set avg_point = ".$merchant_list[$k]['dp_avg_point']." where id = ".$v['id'];
			$GLOBALS['db']->query($u_sql);
		}
		
		$root['total'] = intval($total);
		$root['item'] = $merchant_list;
		$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
		$root['bcate_list'] = $bcate_list;
		$root['quan_list'] = $quan_list;
		$root['age_list'] = $age_list;
		//$root['age_id'] = $age_id;
		$root['city_id']=$city_id;
		$root['cate_id']=$cate_id;
		$root['quan_id']=$quan_id;
		$root['xpoint']=$xpoint;
		$root['ypoint']=$ypoint;
		$root['order_type'] = $order_type;
		$root['city_name']=$city_name;
		
		$root['page_title']='店铺列表';
		output($root);
	}
}
?>