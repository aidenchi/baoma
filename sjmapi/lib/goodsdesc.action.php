<?php
class goodsdesc{
	public function index(){
		require_once APP_ROOT_PATH.'app/Lib/deal.php';
		/**

		 * has_attr: 0:无属性; 1:有属性
		 * 有商品属性在要购买时，要选择属性后，才能购买
		 
		 * change_cart_request_server: 
		 * 编辑购买车商品时，需要提交到服务器端，让服务器端通过一些判断返回一些信息回来(如：满多少钱，可以免运费等一些提示)
		 * 0:提交，1:不提交；
		 
		 * image_attr_a_id_{$attr_a_id} 图片列表，可以根据属性ID值，来切换图片列表;默认为：0
		 * limit_num: 库存数量
		 
		 */
		$email = addslashes(trim($GLOBALS['request']['email']));//用户名或邮箱
		$pwd = trim($GLOBALS['request']['pwd']);//密码
		$id = intval($GLOBALS['request']['id']);//商品ID
		$city_id =strim($GLOBALS['request']['city_id']);//城市名称
		
		$user = user_check($email,$pwd,false);
		$user_id = intval($user['id']);
		$is_collect = 0;
		if ($user_id > 0){
			$sql2 = "select count(*) from ".DB_PREFIX."deal_collect where deal_id = ".$id." and user_id=".$user_id;
			if($GLOBALS['db']->getOne($sql2)>0){
				$is_collect = 1;
			}
		}		
		
		$ypoint =  $m_latitude = doubleval($GLOBALS['request']['m_latitude']);  //ypoint 
		$xpoint = $m_longitude = doubleval($GLOBALS['request']['m_longitude']);  //xpoint
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		//$item = get_deal($id);
		//$root = getGoodsArray($item);
		$item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal where id = ".intval($id)." and is_effect = 1 and is_delete = 0 ");
		$supplier_location_id =  $GLOBALS['db']->getOne("select id from ".DB_PREFIX."supplier_location where supplier_id = ".$item['supplier_id']);
		$item['supplier_location_id']  = $supplier_location_id;
		$item['icon']=str_replace("./public/","/public/",$item['icon']);//图片显示不出来，ymy添加了这一句 2014-12-10
		//格式化数据
		$item['begin_time_format'] = to_date($item['begin_time']);
		$item['end_time_format'] = to_date($item['end_time']);
		$item['origin_price_format'] = format_price($item['origin_price']);
		$item['current_price_format'] = format_price($item['current_price']);
		$item['success_time_format']  = to_date($item['success_time']);
		$item['description']=str_replace("./public/","/public/",$item['description']);//图片显示不出来，ymy添加了这一句 2014-12-10
		//检是否收藏该商品
		$collect_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_collect where user_id = ".intval($user['id'])." and deal_id = ".$id);
		if($collect_data){
			$item['is_collect'] = 1;//已收藏
		}else{
			$item['is_collect'] = 0;//未收藏
		}
		$root = $item;	
				
		$pi = 3.14159265;  //圆周率
		$r = 6378137;  //地球平均半径(米)
		$root['distance']=ACOS(SIN(($ypoint * $pi) / 180 ) *SIN(($item['supplier_address_info']['ypoint'] * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS(($item['supplier_address_info']['ypoint'] * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - ($item['supplier_address_info']['xpoint'] * $pi) / 180 ) ) * $r; 
		$root['return'] = 1;
		
		
		//图片列表
		$images = array();
		//image_attr_1_id_{$attr_1_id} 图片列表，可以根据属性ID值，来切换图片列表
		$sql = "select img from ".DB_PREFIX."deal_gallery where deal_id = ".intval($id)." order by sort asc";
		$list = $GLOBALS['db']->getAll($sql);	
		$gallery = array();
		$big_gallery = array();
		foreach($list as $k=>$image){
			$gallery[] = get_abs_img_root(get_spec_image($image['img'],320,320,0));
			$big_gallery[] = get_abs_img_root(get_spec_image($image['img'],0,0,0));	
		}
		$root['gallery'] = $gallery;
		$root['big_gallery'] = $big_gallery;			
		
		
		//支持的门店列表;
		$sql = "select id,name,address,tel,xpoint,ypoint,supplier_id from ".DB_PREFIX."supplier_location where id in (select location_id from ".DB_PREFIX."deal_location_link where deal_id = ".$id.")";	
		$supplier_location_list = $GLOBALS['db']->getAll($sql);						
		foreach($supplier_location_list as $k=>$sl){
			$supplier_location_list[$k]['distance']=ACOS(SIN(($ypoint * $pi) / 180 ) *SIN(($sl['ypoint'] * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS(($sl['ypoint'] * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - ($sl['xpoint'] * $pi) / 180 ) ) * $r;
		}		
		$root['supplier_location_list'] = $supplier_location_list;
		
		
		//其它团购
		//if($GLOBALS['request']['from']=="wap"){						
			$time = get_gmtime();
			$time_condition = '  and is_shop = 0 ';
			$time_condition.=' and ('.$time.'>=begin_time or begin_time = 0 ) and ('.$time.'< end_time or end_time = 0) and buy_type<>2 and is_recommend=1';
			$time_condition.=' and id<>'.$id;
			/*
			if($item['cate_id']>0)
			{
				$ids = load_auto_cache("deal_sub_parent_cate_ids",array("cate_id"=>$item['cate_id']));
				$time_condition .= " and cate_id in (".implode(",",$ids).")";
			
			}
			
			if($item['city_id']==0)
			{
				$city = get_current_deal_city();
				$city_id = $city['id'];
				$time_condition .= " and city_id in (".implode(",",$item['city_id']).")";
			}
			if($item['city_id']>0)
			{
				$ids = load_auto_cache("deal_city_belone_ids",array("city_id"=>$item['city_id']));
				if($ids)
				{
					$time_condition .= " and city_id in (".implode(",",$ids).")";
			
				}
			}
			*/
			$dealsql= "select * from ".DB_PREFIX."deal where is_effect = 1 and  is_delete = 0 ".$time_condition." order by sort desc,id desc limit 4";
			$deal_other = $GLOBALS['db']->getAll($dealsql);
			$root['deal_other']=$deal_other;			
			
			//商品评论
			//商品评论列表前3条
			$message_re=m_get_message_list(3," m.rel_table = 'deal' and m.rel_id=".$id." and m.is_buy = 1 and m.is_effect = 1",$city_id);
			foreach($message_re['list'] as $k=>$v){
				$message_re['list'][$k]['create_time_format']=getBeforeTimelag($v['create_time']);
				$message_re['list'][$k]['width'] = ($v['point'] / 5) * 100;
			}		
			$root['message_list']=$message_re['list']; 
			$root['message_count']=$message_re['count'];
			//每一项评分（5、4、3、2、1）多少条，占总数多少比例
			//星级点评数
			$root['star_1'] = 0;
			$root['star_2'] = 0;
			$root['star_3'] = 0;
			$root['star_4'] = 0;
			$root['star_5'] = 0;
			$root['star_dp_width_1'] = 0;
			$root['star_dp_width_2'] = 0;
			$root['star_dp_width_3'] = 0;
			$root['star_dp_width_4'] = 0;
			$root['star_dp_width_5'] = 0;
			$comment_count = $root['message_count'];// intval($GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."message where rel_id = ".$id." and rel_table = 'deal' and pid = 0 and is_buy = 1"));
			$buy_dp_sum = 0.0;
			$buy_dp_group = $GLOBALS['db']->getAll("select point,count(*) as num from ".DB_PREFIX."message where rel_id = ".$id." and rel_table = 'deal' and pid = 0 and is_buy = 1 and is_effect = 1 group by point");
			foreach($buy_dp_group as $dp_k=>$dp_v)
			{
				$star = intval($dp_v['point']);
				if ($star >= 1 && $star <= 5){		
					$root['star_'.$star] = $dp_v['num'];				
					$buy_dp_sum += $star * $dp_v['num'];
					$root['star_dp_width_'.$star] = (round($dp_v['num']/ $comment_count,1)) * 100;
				}
			}				
			//整体平均分
			$score = round($buy_dp_sum / $comment_count,1);
			$width = $score > 0 ? ($score / 5) * 100 : 0;			
			$root['point']=$score;
			$root['width']=$width;

			
			if($item['is_shop']==0){
				$root['page_title']="团购详情";
			}elseif($item['is_shop']==1){
				$root['page_title']="商品详情";
			}else{
				$root['page_title']="代金券详情";
			}						
		//}
		
		$root['page_title']=$root['name'];//商品名
		$root['is_collect']=$is_collect;
		$root['city_name']=$city_name;
		output($root);	
	}
}
?>