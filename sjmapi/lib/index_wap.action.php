<?php
class index_wap
{
	public function index()
	{		
		$root = array();
		$root['return'] = 1;
		
		$city_id =intval($GLOBALS['request']['city_id']);
		$city_name =strim($GLOBALS['request']['city_name']);	
		
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		$root["login_user_id"] = intval($user_data['id']);

		$root['city_id']=$city_id;
		$root['city_name']=$city_name;
		
		//广告列表
		$adv_list = $GLOBALS['db']->getAll(" select * from ".DB_PREFIX."m_adv where page = 'wap' and city_id in (0,1,".intval($city_id).") and status = 1 order by sort desc ");		
		foreach($adv_list as $k=>$v){
			$adv_list[$k]['img']=str_replace("./public/","/public/",$adv_list[$k]['img']);
			//$adv_list[$k]['img'] = get_abs_img_root($v['img']);//get_abs_img_root(get_spec_image($v['img'],640,100,0));
			//$adv_list[$k]['img2'] = get_spec_image($v['img'],640,100,1);
		}
		$root['adv_list'] = $adv_list;
				
		//推荐活动
		$article_list = $GLOBALS['db']->getAll(" select * from ".DB_PREFIX."event where is_effect = 1 and is_recommend = 1 order by sort desc limit 4");
		foreach($article_list as $k1=>$v1){
			$article_list[$k1]['icon']=str_replace("./public/","/public/",$article_list[$k1]['icon']);
		}
		$root['article_list'] = $article_list;

		//精选商铺
		$supplier_location_sql = "select a.id,a.deal_cate_id,a.name,a.avg_point,a.city_id, a.mobile_brief,a.mobile_brief as brief,a.tel,".
		"a.preview as logo,a.dp_count as comment_count,a.xpoint,a.ypoint,a.address as api_address from ".DB_PREFIX."supplier_location as a 
		where a.is_effect = 1 and a.is_recommend = 1 order by id desc limit 4";
		$recommend_supplier_location_list = $GLOBALS['db']->getAll($supplier_location_sql);
		foreach($recommend_supplier_location_list as $k2=>$v2){
			$recommend_supplier_location_list[$k2]['logo']=str_replace("./public/","/public/",$recommend_supplier_location_list[$k2]['logo']);
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
			$recommend_supplier_location_list[$k2]['dp_avg_point'] = round($buy_dp_sum / $this_store_comment_count,1);
			$recommend_supplier_location_list[$k2]['dp_width'] = (round($buy_dp_sum / $this_store_comment_count,1) / 5) * 100;	
		}
		$root['recommend_supplier_location_list'] = $recommend_supplier_location_list;
		
		$root['page_title'] = $GLOBALS['m_config']['program_title'];
		output($root);
	}
}

?>