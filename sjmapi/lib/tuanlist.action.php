<?php
class tuanlist{
	public function index(){
		$root = array();
		$catalog_id = intval($GLOBALS['request']['catalog_id']);//商品分类ID
		$cata_type_id=intval($GLOBALS['request']['cata_type_id']);//商品二级分类
		$city_id = intval($GLOBALS['request']['city_id']);//城市分类ID			
		$page = intval($GLOBALS['request']['page']); //分页
		$keyword = strim($GLOBALS['request']['keyword']);
		$page=$page==0?1:$page;
		$quan_id = intval($GLOBALS['request']['quan_id']); //商圈id	
		$order_type=strim($GLOBALS['request']['order_type']);
		
		
		//if(!$city_id)
		//{
		//	$city = get_current_deal_city();
		//	$city_id = $city['id'];
		//}
		
		$ytop = $latitude_top = floatval($GLOBALS['request']['latitude_top']);//最上边纬线值 ypoint
		$ybottom = $latitude_bottom = floatval($GLOBALS['request']['latitude_bottom']);//最下边纬线值 ypoint
		$xleft = $longitude_left = floatval($GLOBALS['request']['longitude_left']);//最左边经度值  xpoint
		$xright = $longitude_right = floatval($GLOBALS['request']['longitude_right']);//最右边经度值 xpoint
		$ypoint =  $m_latitude = doubleval($GLOBALS['request']['m_latitude']);  //ypoint 
		$xpoint = $m_longitude = doubleval($GLOBALS['request']['m_longitude']);  //xpoint
		
		/*输出分类*/
		$bcate_list = getCateList();
		
		/*输出商圈*/
		$quan_list=getQuanList($city_id);
		
		$page_size = PAGE_SIZE;
		$limit = (($page-1)*$page_size).",".$page_size;
	
		if($keyword)
		{
			$kws_div = div_str($keyword);
			foreach($kws_div as $k=>$item)
			{
				$kws[$k] = str_to_unicode_string($item);
			}
			$ukeyword = implode(" ",$kws);
			$condition ="  (match(tag_match,name_match,locate_match,deal_cate_match) against('".$ukeyword."' IN BOOLEAN MODE) or name like '%".$keyword."%') and ";
		}
		//buy_type 0普通团购;2在线订购;3秒杀抢团
		//is_shop 0团购;1:商品;
		$condition.=" buy_type = 0 and is_shop = 0 and is_lottery = 0 ";
		
		if($xpoint>0)/* 排序（$order_type）  default 智能（默认），nearby  离我最近*/
		{		
			$pi = 3.14159265;  //圆周率
			$r = 6378137;  //地球平均半径(米)
			$field_append = ", (ACOS(SIN(($ypoint * $pi) / 180 ) *SIN((ypoint * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS((ypoint * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - (xpoint * $pi) / 180 ) ) * $r) as distance ";
			
			if($ybottom!=0&&$ytop!=0&&$xleft!=0&&$xright!=0)
			{
			if($condition!="")
			$condition.=" and ";
			$condition.= " ypoint > $ybottom and ypoint < $ytop and xpoint > $xleft and xpoint < $xright ";
			}
			$order = " distance asc,id desc ";
		}
		else
			$order = "sort desc,id desc ";

		/*排序  
		 智能排序和 离我最的 是一样的 都以距离来升序来排序，只有这两种情况有传经纬度过来，就没有把 这两种情况写在 下面的判断里，写在上面了。
		default 智能（默认），nearby  离我，avg_point 评价，newest 最新，buy_count 人气，price_asc 价低，price_desc 价高 */
		if($order_type=='avg_point')/*评价*/
			$order= " avg_point desc,id desc ";
		elseif($order_type=='newest')/*最新*/
			$order= " create_time desc,id desc ";
		elseif($order_type=='buy_count')/*销量*/
			$order= " buy_count desc,id desc ";
		elseif($order_type=='price_asc')/*价格升*/
			$order= " current_price asc,id desc ";
		elseif($order_type=='price_desc')/*价格降*/
			$order= " current_price desc,id desc ";
			
			

		//根据传入的商圈ID来搜索该商圈下的商品
		if ($quan_id > 0){
			$sql_q = "select name from ".DB_PREFIX."area where id = ".intval($quan_id);
			$q_name = $GLOBALS['db']->getOne($sql_q);
			$q_name_unicode = str_to_unicode_string($q_name);
			$condition .=" and (match(locate_match) against('".$q_name_unicode."' IN BOOLEAN MODE))";
		}	
		
		$deals = m_get_deal_list($limit,$catalog_id,$city_id,array(DEAL_ONLINE),$condition,$order,0,$field_append,$cata_type_id);
		$list = $deals['list'];
		$count= $deals['count'];
		
		$page_total = ceil($count/$page_size);
		
		$root = array();
		$root['return'] = 1;
		//$root['sql'] = $deals['sql'];
		
		$taday_begin=to_timespan(to_date(get_gmtime(),'Y-m-d'));
		$taday_end=$taday_begin*24*60*60;
		$goodses = array();
		foreach($list as $k=>$v)
		{
			$goodses[$k]['id']=$v['id'];
			$goodses[$k]['distance']=$v['distance'];
			$goodses[$k]['ypoint']=$v['ypoint'];
			$goodses[$k]['xpoint']=$v['xpoint'];
			$goodses[$k]['name']=$v['name'];
			$goodses[$k]['sub_name']=$v['sub_name'];
			$goodses[$k]['goods_brief']=$v['brief'];
			$goodses[$k]['buy_count']=$v['buy_count'];
			$goodses[$k]['auto_order']=$v['auto_order'];
			$goodses[$k]['current_price']=round($v['current_price'],2);
			$goodses[$k]['origin_price']=round($v['origin_price'],2);
			$goodses[$k]['icon']=get_abs_img_root(get_spec_image($v['icon'],360,288,0));
			if(($v['begin_time']>0) && ($taday_begin<$v['begin_time'] && $v['begin_time']<$taday_end))
			{
				$goodses[$k]['is_taday']=1;
			}
			else if(($v['begin_time']==0) && ($taday_begin<$v['create_time'] && $v['create_time']<$taday_end))
			{
				$goodses[$k]['is_taday']=1;
			}else
			{
				$goodses[$k]['is_taday']=0;
			}
		}
		
		$root['city_id']=$city_id;
		
		$root['page_title']="团购列表";	
		$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
		if ($goodses === false){
			$root['item'] = array();
		}else{
			$root['item'] = $goodses;
		}
		
		
		if ($bcate_list === false){
			$root['bcate_list'] = array();
		}else{
			$root['bcate_list'] = $bcate_list;
		}

		if ($quan_list === false){
			$root['quan_list'] = array();
		}else{
			$root['quan_list'] = $quan_list;
		}		
		
		output($root);
		
	}
}