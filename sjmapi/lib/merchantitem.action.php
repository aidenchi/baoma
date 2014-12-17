<?php
class merchantitem
{
	public function index()
	{
		//print_r($GLOBALS['request']);
		$email = addslashes($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = addslashes($GLOBALS['request']['pwd']);//密码
		
		//检查用户,用户密码
		$user = user_check($email,$pwd);
		$user_id  = intval($user['id']);

		$id = intval($GLOBALS['request']['id']);
		$city_id = intval($GLOBALS['request']['city_id']);
		
		$act_2 = $GLOBALS['request']['act_2'];//子操作 空:没子操作; dz:设置打折提醒
		if ($act_2 != '' && $user_id == 0){
			$root['act_2'] = $act_2;
			$root['user_login_status'] = 0;//用户登陆状态：1:成功登陆;0：未成功登陆
			output($root);
		}
		
		$ypoint =  $m_latitude = doubleval($GLOBALS['request']['m_latitude']);  //ypoint 
		$xpoint = $m_longitude = doubleval($GLOBALS['request']['m_longitude']);  //xpoint
		$pi = 3.14159265;  //圆周率
		$r = 6378137;  //地球平均半径(米)		
		
		
		$sql = "select a.id,a.name,a.avg_point,a.address,a.api_address,a.supplier_id,a.tel,a.dp_count,a.avg_point,a.open_time,a.xpoint,a.ypoint,a.supplier_id as brand_id,a.brief,a.preview as logo,a.xpoint,a.ypoint,a.route,a.youhui_count,a.event_count,(select count(*) from ".DB_PREFIX."supplier_location_dp as dp where dp.supplier_location_id = a.id and dp.status = 1) as comment_count, c.name as city_name, 
		(ACOS(SIN(($ypoint * $pi) / 180 ) *SIN((a.ypoint * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS((a.ypoint * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - (a.xpoint * $pi) / 180 ) ) * $r) as distance 
		  from ".DB_PREFIX."supplier_location as a ".			 			   
					   " left outer join ".DB_PREFIX."deal_city as c on c.id = a.city_id ".
						"where a.id = $id ";	

		//file_put_contents(APP_ROOT_PATH. "sjmapi/log/sql_".strftime("%Y%m%d%H%M%S",time()).".txt",$sql);
		$list = $GLOBALS['db']->getRow($sql);
		$list['logo']=str_replace("./public/","/public/",$list['logo']);//图片显示不出来，ymy添加了这一句 2014-12-10
		$root = m_merchantItem($list);
		$root['open_time'] = $list['open_time'];
		$list['brief']=str_replace("./public/","/public/",$list['brief']);//图片显示不出来，ymy添加了这一句 2014-12-10
		$root['brief'] = $list['brief'];
		
		//is_auto_order 1:手机自主下单;消费者(在手机端上)可以直接给该门店支付金额
		//$sql = "select is_auto_order from  ".DB_PREFIX."supplier_location where id = ".$id;
		//$is_auto_order = $GLOBALS['db']->getOne($sql);
		//$root['is_auto_order'] = intval($is_auto_order); 
		$root['is_auto_order'] = 0;
		
		//其它门店
		$sql = "select a.id,a.name,a.avg_point,a.address,a.api_address,a.supplier_id,a.tel,a.dp_count,a.avg_point,a.supplier_id as brand_id,a.brief,a.preview as logo,a.xpoint,a.ypoint,a.route,a.youhui_count,a.event_count,(select count(*) from ".DB_PREFIX."supplier_location_dp as dp where dp.supplier_location_id = a.id and dp.status = 1) as comment_count, c.name as city_name,
		(ACOS(SIN(($ypoint * $pi) / 180 ) *SIN((a.ypoint * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS((a.ypoint * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - (a.xpoint * $pi) / 180 ) ) * $r) as distance
		from ".DB_PREFIX."supplier_location as a ".
				" left outer join ".DB_PREFIX."deal_city as c on c.id = a.city_id ".
						"where a.id != $id and a.supplier_id =".intval($root['supplier_id']);		
		//$root['ss'] = $sql;
		$other_supplier_location = $GLOBALS['db']->getAll($sql);
		if ($other_supplier_location === false){
			$root['other_supplier_location'] = array();
		}else{
			foreach($other_supplier_location as $k=>$v)
			{
				$other_supplier_location[$k]['logo'] = get_abs_img_root($v['logo']);
			}
			$root['other_supplier_location'] = $other_supplier_location;
		}
		
		
		/******************************************************门店商品***************************************************/		
		$time=get_gmtime();
		$t_where="where b.location_id=".$list['id']." and a.is_shop=0 and a.is_effect=1 and a.is_delete=0  and ((".$time.">= a.begin_time or a.begin_time = 0) and (".$time."< a.end_time or a.end_time = 0)) and a.buy_status <> 2";
		$g_where="where b.location_id=".$list['id']." and a.is_shop=1 and a.is_effect=1 and a.is_delete=0  and ((".$time.">= a.begin_time or a.begin_time = 0) and (".$time."< a.end_time or a.end_time = 0)) and a.buy_status <> 2";
		$y_where ="where a.is_effect = 1 and b.location_id=".$list['id']." and ((".$time.">= a.begin_time or a.begin_time = 0) and (".$time."< a.end_time or a.end_time = 0))";
		
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
				$t_where .= " and a.city_id in (".implode(",",$ids).")";
				$g_where .= " and a.city_id in (".implode(",",$ids).")";
				$y_where .= " and a.city_id in (".implode(",",$ids).")";
			}
		}	
		
		$goods_list=$GLOBALS['db']->getAll("select a.brief,a.id,a.is_hot,a.name,a.sub_name,a.origin_price,a.current_price,a.img,a.buy_count,a.discount from ".DB_PREFIX."deal as a left join ".DB_PREFIX."deal_location_link as b on b.deal_id=a.id ".$g_where." order by a.sort desc,a.id desc limit 3");

		foreach($goods_list as $k=>$v)
		{
			$v['img']=str_replace("./public/","/public/",$v['img']);//图片显示不出来，ymy添加了这一句 2014-12-10
			$goods_list[$k]['origin_price']=round($v['origin_price'],2);
			$goods_list[$k]['current_price']=round($v['current_price'],2);
			
			if($v['origin_price']>0&&floatval($v['discount'])==0) //手动折扣
			$goods_list[$k]['save_price'] =round($v['origin_price'] - $v['current_price'],2);			
			else
			$goods_list[$k]['save_price'] = round($v['origin_price']*((10-$v['discount'])/10),2);
			
			if($v['origin_price']>0&&floatval($v['discount'])==0)
			{
				$goods_list[$k]['discount'] = round(($v['current_price']/$v['origin_price'])*10,2);					
			}
			$goods_list[$k]['discount'] = round($goods_list[$k]['discount'],2);
			$goods_list[$k]['img'] = get_abs_img_root($v['img']);
			
			if (empty($v['brief'])){
				$goods_list[$k]['brief'] = $v['name'];
				$goods_list[$k]['name'] = $v['sub_name'];
			}
		}
		
		
		if ($goods_list === false){
			$root['goods_list']= array();
		}else{
			$root['goods_list']=$goods_list;
		}
		
		/**************************************************门店评论****************************************/
		//获取已经审核的评论列表（前3条）
		$comment_list=$GLOBALS['db']->getAll("select a.id,a.content,a.point,a.avg_price,a.create_time,b.id as user_id,b.user_name from ".DB_PREFIX."supplier_location_dp as a left join ".DB_PREFIX."user as b on b.id=a.user_id where a.supplier_location_id = ".$list['id']." and a.status = 1 order by a.is_top desc, a.create_time desc limit 3");
		$total=$GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_location_dp as a left join ".DB_PREFIX."user as b on b.id=a.user_id where a.supplier_location_id = ".$list['id']." and a.status = 1");
		foreach($comment_list as $k=>$v){
			$comment_list[$k]['avg_price']=round($v['avg_price'],1);
			$comment_list[$k]['time']=pass_date($v['create_time']);
			$comment_list[$k]['create_time_format']=getBeforeTimelag($v['create_time']);
			$comment_list[$k]['width']=$v['point'] > 0 ? ($v['point'] / 5) * 100 : 0;
		}		
		if ($comment_list === false){
			$root['comment_list']= array();
		}else{
			$root['comment_list']=$comment_list;
		}		
		$root['comment_count']=$total;
		//获取总体评分 start
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
		$buy_dp_sum = 0.0;	
		//每一项评分（5、4、3、2、1）多少条，占总数多少比例
		$buy_dp_group = $GLOBALS['db']->getAll("select point,count(*) as num from ".DB_PREFIX."supplier_location_dp where supplier_location_id = ".$list['id']." and status = 1 group by point");
		foreach($buy_dp_group as $dp_k=>$dp_v)
		{
			$star = intval($dp_v['point']);
			if ($star >= 1 && $star <= 5){
				$root['star_'.$star] = $dp_v['num'];				
				$buy_dp_sum += $star * $dp_v['num'];
				$root['star_dp_width_'.$star] = (round($dp_v['num']/ $total,1)) * 100;
			}
		}
		//整体平均分
		$root['buy_dp_sum']=$buy_dp_sum;
		$root['buy_dp_avg'] = round($buy_dp_sum / $total,1);
		$root['buy_dp_width'] = (round($buy_dp_sum / $total,1) / 5) * 100;		
		//获取总体评分 end
		
		if ($act_2 == "dz"){			
				$sql = "select uid from  ".DB_PREFIX."supplier_dy where uid = $user_id and supplier_id = ".$list['brand_id'];
				if (intval($GLOBALS['db']->getOne($sql) > 0)) {
					//已经设置打折提醒，则取消
					$sql = "delete from ".DB_PREFIX."supplier_dy where uid = $user_id and supplier_id = ".$list['brand_id'];
					$GLOBALS['db']->query($sql);
				}else{
					//没设置，则设置
					$merchant_dy = array(
						 'uid' => $user_id,
						 'supplier_id' => $list['brand_id']
					);
					$GLOBALS['db']->autoExecute(DB_PREFIX."supplier_dy", $merchant_dy, 'INSERT');
				}
		}
		
		$root['is_dy']= $GLOBALS['db']->getOne("select uid from ".DB_PREFIX."supplier_dy where uid = $user_id and supplier_id = ".$list['brand_id']." ");
		
		$root['return'] = 1;
		$root['user_login_status'] = 1;
		$root['page_title'] =$root['name'];//店铺名
		output($root);
	}
}
?>