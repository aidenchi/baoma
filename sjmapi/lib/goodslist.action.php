<?php
class goodslist{
	public function index(){
		require_once APP_ROOT_PATH.'app/Lib/shop_lib.php'; 
		
		$catalog_id = intval($GLOBALS['request']['catalog_id']);//商品分类ID
		$cata_type_id=intval($GLOBALS['request']['cata_type_id']);//商品二级分类
		$city_id = intval($GLOBALS['request']['city_id']);//城市分类ID	
		$page = intval($GLOBALS['request']['page']); //分页
		$keyword = strim($GLOBALS['request']['keyword']);
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		//print_r($GLOBALS['request']);
		$order_type=strim($GLOBALS['request']['order_type']);
	
		/*输出分类*/
		$allcate_list=$GLOBALS['db']->getAll("select id,name,pid from ".DB_PREFIX."shop_cate where is_delete=0 and is_effect=1 order by pid asc,sort desc");
		$cate_list=array();
		$bcate_list=array();
		foreach($allcate_list as $k=>$v)
		{
			if($v['pid']==0)
				$cate_list[$v['id']]=$v;
			else
				$cate_list[$v['pid']]['bcate_type'][]=$v;
				
		}
		
		$bcate_list[0]['id']=0;
		$bcate_list[0]['name']='全部分类';
		$bcate_list[0]['bcate_type'][0]['id']=0;
		$bcate_list[0]['bcate_type'][0]['qid']=0;
		$bcate_list[0]['bcate_type'][0]['name']='全部分类';
		foreach($cate_list as $k=>$v)
		{
			$bcate_type_array['0']['id']=$v['id'];
			$bcate_type_array['0']['qid']=0;
			$bcate_type_array['0']['name']="全部";
			if($cate_list[$v['id']]['bcate_type']==null || $cate_list[$v['id']]['bcate_type']=='')
				$cate_list[$v['id']]['bcate_type']=$bcate_type_array;
			else
				$cate_list[$v['id']]['bcate_type']=array_merge($bcate_type_array,$cate_list[$v['id']]['bcate_type']);
				
			$bcate_list[]=$cate_list[$k];
			
				
		}
		$root['bcate_list'] = $bcate_list;
		
		

		
		/*排序*/
		if($order_type=='avg_point')
			$order= " avg_point desc,id desc ";
		elseif($order_type=='newest')
			$order= " create_time desc,id desc ";
		elseif($order_type=='buy_count')
			$order= " buy_count desc,id desc ";
		elseif($order_type=='price_asc')
			$order= " current_price asc,id desc ";
		elseif($order_type=='price_desc')
			$order= " current_price desc,id desc ";
		else
			$order = "sort desc,id desc ";
		
		$page=$page==0?1:$page;
		
		$page_size = PAGE_SIZE;
		$limit = (($page-1)*$page_size).",".$page_size;
		//buy_type = 0 普通商品;1积分商品
		$condition = " buy_type = 0 and deal_type = 0 and is_shop=1";
		if($keyword)
		{
			$kws_div = div_str($keyword);
			foreach($kws_div as $k=>$item)
			{
				$kws[$k] = str_to_unicode_string($item);
			}
			$ukeyword = implode(" ",$kws);
			$condition .=" and  (match(tag_match,name_match,locate_match,shop_cate_match) against('".$ukeyword."' IN BOOLEAN MODE) or name like '%".$keyword."%')";
		}
		
		$merchant_id = intval($GLOBALS['request']['merchant_id']);
		if($merchant_id>0)
		{
			$deal_ids = $GLOBALS['db']->getOne("select group_concat(deal_id) from ".DB_PREFIX."deal_location_link where location_id = ".$merchant_id);
			if($deal_ids)
			{

				$condition .= " and id in (".$deal_ids.") ";
			}
			else
			{
				$condition .=" and id ='' ";
			}
		}

		if($cata_type_id > 0)
			$catalog_id=$cata_type_id;
		$deals = get_goods_list($limit,$catalog_id,$condition,$order,false,$city_id);
		
		$list = $deals['list'];
		$count= $deals['count'];
		
		$page_total = ceil($count/$page_size);
		
		$root = array();
		$root['return'] = 1;

		
		$goodses = array();
		foreach($list as $item){
			//$goods = array();
			$goods = getGoodsArray($item);
			$goodses[] = $goods;			
		}
		$root['item'] = $goodses;
		$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
		

		$root['quan_list'] = getCityList();
		/*
		//输出城市
		$root['city_list']=getCityList();
		//输出商圈
		$quan_list=getQuanList($city_id);
		$root['quan_list2'] = $quan_list;
		*/
		
		$root['bcate_list'] = $bcate_list;
		//$root['quan_list'] = $quan_list;
		$root['page_title'] = "商品列表";
		$root['city_name']=$city_name;
		output($root);
		
	}
}