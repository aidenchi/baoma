<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(88522820@qq.com)
// +----------------------------------------------------------------------

require APP_ROOT_PATH.'app/Lib/deal.php';
require APP_ROOT_PATH.'app/Lib/youhui_lib.php';
class indexModule extends ShopBaseModule
{
	public function index()
	{		
		$GLOBALS['tmpl']->caching = true;
		$GLOBALS['tmpl']->cache_lifetime = 600;  //首页缓存10分钟
		$cache_id  = md5(MODULE_NAME.ACTION_NAME.$GLOBALS['deal_city']['id']);		
		if (!$GLOBALS['tmpl']->is_cached('index.html', $cache_id))
		{		
			make_deal_cate_js();
			make_deal_region_js();	
			
			//print_d($GLOBALS); 
				
			$result = load_auto_cache("store_filter_nav_cache",array('city_id'=>$GLOBALS['deal_city']['id']));
			
			$GLOBALS['tmpl']->assign("cate_list",$result['cate_list']);
			$GLOBALS['tmpl']->assign("area_list",$result['area_list']);
			
			//输出公告
			$notice_list = get_notice(0,array(0,1));
			$GLOBALS['tmpl']->assign("notice_list",$notice_list);			

			//获取推荐的大分类
			$bcate_list = load_dynamic_cache("INDEX_RECOMMEND_BCATE");
			if($bcate_list===false)
			{
				$bcate_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."deal_cate where is_effect = 1 and is_delete = 0 and recommend = 1 order by sort desc");
				set_dynamic_cache("INDEX_RECOMMEND_BCATE",$bcate_list);
			}
			
				
			
			/***********2013-10-21@佰通网络科技添加代码****************/
			
			//@佰通网络科技2013-07-25日添加输出推荐团购
			$index_rec_tuan=call_user_method("index_rec_tuan",$this);
			$GLOBALS['tmpl']->assign("index_rec_tuan",$index_rec_tuan);
			//@佰通网络科技2013-07-25日添加输出最新团购
			$index_new_tuan=call_user_method("index_new_tuan",$this);
			$GLOBALS['tmpl']->assign("index_new_tuan",$index_new_tuan);
			//@佰通网络科技2013-07-25日添加输出团购
			$index_list_tuan=call_user_method("index_list_tuan",$this);
			$GLOBALS['tmpl']->assign("index_list_tuan",$index_list_tuan);
			//@佰通网络科技2013-07-25日添加优惠券
			$index_list_youhui=call_user_method("index_list_youhui",$this);
			$GLOBALS['tmpl']->assign("index_list_youhui",$index_list_youhui);
			
			$th_rec_tuan = get_deal_list_show(3,0,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE)," is_recommend = 1"," sort desc");
			$th_rec_tuan =$th_rec_tuan['list'];
			$GLOBALS['tmpl']->assign("th_rec_tuan",$th_rec_tuan);
			
			//最新商家列表
			$new_store = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location WHERE city_id=".$GLOBALS['deal_city']['id']." and is_effect = 1 order by id desc limit 10 ");
			$GLOBALS['tmpl']->assign("new_store",$new_store);
			
			//热卖排行
			$hot_tuan = get_deal_list_show(6,0,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE),""," buy_count desc");
			$hot_tuan =$hot_tuan['list'];
			$GLOBALS['tmpl']->assign("hot_tuan",$hot_tuan);
			
			//print_d($hot_tuan);
			
			//热门商圈获取
	     	$alist=$result['area_list'];
			$city_id=$GLOBALS['deal_city']['id'];
			foreach($alist as $i=>$arealist){
					
				$area_id=(int)$arealist[id];
				if($area_id>0)
				{			
					$quan_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."area where city_id = ".$city_id." and pid = ".$area_id." order by sort desc");
					
					$quan_list[]	=	array("name"=>$GLOBALS['lang']['ALL'],"id"=>0);
					
					foreach($quan_list as $k=>$v)
						{
							if($quan_id==$v['id'])
							{
								$quan_list[$k]['act'] = 1;
							}
							$tmp_url_param = $url_param;
							$tmp_url_param['aid'] = $area_id;
							$tmp_url_param['qid'] = $v['id'];
							$quan_list[$k]['url'] = url("youhui","store",$tmp_url_param);	
							$condition = build_deal_filter_condition($tmp_url_param);						
							$quan_list[$k]['count'] = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_location where is_effect=1 $condition ");
					}			
				}
				//
				$alist[$i]["quan_list"]=$quan_list;
		    }
			
			$GLOBALS['tmpl']->assign("area_result",$alist);
			
			
			//获取推荐的大分类
			$bbcate_list = load_dynamic_cache("INDEX_RECOMMEND_BASECATE");
			if ($bbcate_list === false) {
				$bbcate_list = $GLOBALS['db']->getAll("select * from " . DB_PREFIX . "deal_cate where is_effect = 1 and is_delete = 0 and recommend = 1 order by sort desc limit 0,7");
			}
			
	    	foreach ($bbcate_list as $i=>$value) {
			
				//小类		
				$deal_cate_id = $value['id'];
				if($deal_cate_id>0)
				{			
					$scate_list =$GLOBALS['db']->getAll("select t.id,t.name from ".DB_PREFIX."deal_cate_type as t left join ".DB_PREFIX."deal_cate_type_link as l on l.deal_cate_type_id = t.id where l.cate_id = ".$deal_cate_id." order by t.sort desc");
					
								
					foreach($scate_list as $k=>$v)
					{									
								if($deal_type_id==$v['id'])
								$scate_list[$k]['act'] = 1;
			
								$tmp_url_param = $url_param;
								$tmp_url_param['id']=$deal_cate_id;
								$tmp_url_param['tid'] = $v['id'];
								$durl = url("tuan","",$tmp_url_param);						
								$scate_list[$k]['url'] = $durl;
								$condition = build_deal_filter_condition($tmp_url_param);
								$scate_list[$k]['count'] = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_location where is_effect=1 $condition ");
					
					}	
					$value['clist'] = $scate_list;		
				}
				//var_dump($scate_list);die();
				//获取相关产品
				$where = " is_recommend = 1";
				$sort_field = "sort";
				$sort_type = "desc";
				$result = get_deal_list(6, $deal_cate_id, 0, $type = array(DEAL_ONLINE), $where, $sort_field . " " . $sort_type);
				
				$result_2 = get_deal_list(0, $deal_cate_id, 0, $type = array(DEAL_ONLINE), "", $sort_field . " " . $sort_type);
				
				$prolist = $result['list'];
				$count = $result_2['count'];
				
				$value['plist'] = $prolist;
				$value['count']=$count ;
				
				$datalist[] = $value;
				
			}
			
			$GLOBALS['tmpl']->assign("cat_list", $datalist);
			

			
			
		  /***********2013-10-21@佰通网络科技添加代码结束****************/
			
			
			
			$conf_left = $GLOBALS['db']->getAll("select name from ".DB_PREFIX."conf where name in ('INDEX_LEFT_STORE','INDEX_LEFT_TUAN','INDEX_LEFT_YOUHUI','INDEX_LEFT_DAIJIN','INDEX_LEFT_EVENT') and `value`>0 order by -`value` asc");


			$left_html = "";
			foreach($conf_left as $row)
			{
				$func_name = strtolower($row['name']);
				$left_html.= call_user_method($func_name,$this);
			}
			$GLOBALS['tmpl']->assign("left_html",$left_html);
			
			//关于活跃小组
			$hot_group = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_group where is_effect = 1 order by topic_count desc,user_count desc limit 2");
			$GLOBALS['tmpl']->assign("hot_group",$hot_group);	
			
			$hot_group_count=count($hot_group);
			$GLOBALS['tmpl']->assign("hot_group_count",$hot_group_count);
			
			$conf_right = $GLOBALS['db']->getAll("select name from ".DB_PREFIX."conf where name in ('INDEX_RIGHT_STORE','INDEX_RIGHT_TUAN','INDEX_RIGHT_YOUHUI','INDEX_RIGHT_DAIJIN','INDEX_RIGHT_EVENT') and `value`>0 order by -`value` asc");
			$right_html = "";
			foreach($conf_right as $row)
			{
				$func_name = strtolower($row['name']);
				$right_html.= call_user_method($func_name,$this);
			}
			$GLOBALS['tmpl']->assign("right_html",$right_html);
			
			
			//输出最新的点评
			$dp_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."supplier_location_dp where status = 1 order by create_time desc limit 50");
			foreach($dp_list as $k=>$v)
			{
				$dp_list[$k]['sp_name'] = $GLOBALS['db']->getOne("select name from ".DB_PREFIX."supplier_location where id = ".$v['supplier_location_id']);
			}
			$GLOBALS['tmpl']->assign("dp_list",$dp_list);
			$right_dp_html = decode_topic_without_img($GLOBALS['tmpl']->fetch("inc/index_dp_list.html"));
			$GLOBALS['tmpl']->assign("right_dp_html",$right_dp_html);
			
			//开始输出友情链接
			$f_link_group = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."link_group where is_effect = 1 order by sort desc");
			foreach($f_link_group as $k=>$v)
			{
				$g_links = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."link where is_effect = 1 and show_index = 1 and group_id = ".$v['id']." order by sort desc");
				if($g_links)
				{
					foreach($g_links as $kk=>$vv)
					{
						if(substr($vv['url'],0,7)=='http://')
						{
							$g_links[$kk]['url'] = str_replace("http://","",$vv['url']);
						}
					}
					$f_link_group[$k]['links'] = $g_links;
				}
				else
				unset($f_link_group[$k]);
			}
			
			$now = get_gmtime();
			$vote = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."vote where is_effect = 1 and begin_time < ".$now." and (end_time = 0 or end_time > ".$now.") order by sort desc limit 1");
			$GLOBALS['tmpl']->assign("vote",$vote);
			$GLOBALS['tmpl']->assign("f_link_data",$f_link_group);
		}
		$GLOBALS['tmpl']->display("index.html",$cache_id);
	}
	
	
	//左侧模块
	public function index_left_store()
	{
		$city_ids = load_auto_cache("deal_city_belone_ids",array("city_id"=>intval($GLOBALS['deal_city']['id'])));
		
		if($city_ids)
		$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location  use index (search_idx1, is_verify) WHERE is_recommend=1 AND city_id in(".implode(",",$city_ids).") and is_effect = 1 order by is_verify desc,sort desc limit 0,".app_conf("INDEX_SUPPLIER_COUNT"));
		else
		$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location  use index (search_idx1, is_verify) WHERE is_recommend=1 AND is_effect = 1 order by is_verify desc,sort desc limit 0,".app_conf("INDEX_SUPPLIER_COUNT"));
		
		$bcate_list = load_dynamic_cache("INDEX_RECOMMEND_BCATE");
		$GLOBALS['tmpl']->assign("bcate_list",$bcate_list);
		$GLOBALS['tmpl']->assign("store_list",$store_list);
		return $GLOBALS['tmpl']->fetch("index/index_left_store.html");
	}
	public function index_left_tuan()
	{
		$tuan_list = get_deal_list_show(0,0,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE)," is_recommend = 1 ");
		$tuan_list =$tuan_list['list'];
		$GLOBALS['tmpl']->assign("tuan_list",$tuan_list);
		$bcate_list = load_dynamic_cache("INDEX_RECOMMEND_BCATE");
		$GLOBALS['tmpl']->assign("bcate_list",$bcate_list);
		return $GLOBALS['tmpl']->fetch("index/index_left_tuan.html");
	}
	public function index_left_youhui()
	{
		$youhui_list = get_free_youhui_list(0,0," is_recommend = 1 ","");
		$youhui_list = $youhui_list['list'];
		$GLOBALS['tmpl']->assign("youhui_list",$youhui_list);		
		$bcate_list = load_dynamic_cache("INDEX_RECOMMEND_BCATE");
		$GLOBALS['tmpl']->assign("bcate_list",$bcate_list);
		return $GLOBALS['tmpl']->fetch("index/index_left_youhui.html");
	}
	public function index_list_youhui()
	{
		$youhui_list = get_free_youhui_list(8,0," is_recommend = 1 ","");
		$youhui_list = $youhui_list['list'];
		$GLOBALS['tmpl']->assign("youhui_list",$youhui_list);		
		
		return $GLOBALS['tmpl']->fetch("index/index_list_youhui.html");
	}
	public function index_left_daijin()
	{
		$result = search_youhui_list(0,0," d.is_recommend = 1 ","",false,"",$GLOBALS['deal_city']['id']);
		$daijin_list = $result['list'];
		$GLOBALS['tmpl']->assign("daijin_list",$daijin_list);
		$bcate_list = load_dynamic_cache("INDEX_RECOMMEND_BCATE");
		$GLOBALS['tmpl']->assign("bcate_list",$bcate_list);
		return $GLOBALS['tmpl']->fetch("index/index_left_daijin.html");
	}
	public function index_left_event()
	{
		$bcate_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."event_cate where is_effect = 1 order by sort desc limit 4");
		$GLOBALS['tmpl']->assign("bcate_list",$bcate_list);		
		$event_list  = search_event_list(0,0,$GLOBALS['deal_city']['id'],"is_recommend = 1 ");
		$event_list = $event_list['list'];
		
		$GLOBALS['tmpl']->assign("event_list",$event_list);
		return $GLOBALS['tmpl']->fetch("index/index_left_event.html");
	}
	
	
	//右侧模块
	public function index_right_store()
	{
		$city_ids = load_auto_cache("deal_city_belone_ids",array("city_id"=>intval($GLOBALS['deal_city']['id'])));		
		if($city_ids)
		$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location  use index(avg_point) WHERE  city_id in(".implode(",",$city_ids).") and is_effect = 1 order by dp_count desc,avg_point desc limit 5");
		else
		$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location  use index(avg_point) WHERE  is_effect = 1 order by dp_count desc,avg_point desc limit 5");
		
		$GLOBALS['tmpl']->assign("store_list",$store_list);
		return $GLOBALS['tmpl']->fetch("index/index_right_store.html");
	}
	public function index_right_tuan()
	{
		$tuan_list = get_deal_list_show(3,0,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE),"");
		$tuan_list =$tuan_list['list'];
		$GLOBALS['tmpl']->assign("tuan_list",$tuan_list);
		return $GLOBALS['tmpl']->fetch("index/index_right_tuan.html");
	}
	public function index_right_youhui()
	{
		$youhui_list = get_free_youhui_list(5,0,""," view_count desc ");
		$youhui_list = $youhui_list['list'];
		$GLOBALS['tmpl']->assign("youhui_list",$youhui_list);		
		return $GLOBALS['tmpl']->fetch("index/index_right_youhui.html");
	}
	public function index_right_daijin()
	{
		$result = search_youhui_list(5,0,"","",false,"",$GLOBALS['deal_city']['id']);
		$daijin_list = $result['list'];
		$GLOBALS['tmpl']->assign("daijin_list",$daijin_list);
		return $GLOBALS['tmpl']->fetch("index/index_right_daijin.html");
	}
	public function index_right_event()
	{
		$event_list  = search_event_list(5,0,$GLOBALS['deal_city']['id'],""," submit_count desc ");
		$event_list = $event_list['list'];
		$GLOBALS['tmpl']->assign("event_list",$event_list);
		return $GLOBALS['tmpl']->fetch("index/index_right_event.html");
	}


	/***
	**2013-07-25添加首页团购
	**@@@@佰通网络科技添加修改
	***/
	public function index_rec_tuan()
	{
		$tuan_list = get_deal_list_show(6,0,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE)," is_recommend = 1 ");
		$tuan_list =$tuan_list['list'];
		$GLOBALS['tmpl']->assign("tuan_list",$tuan_list);
		$bcate_list = load_dynamic_cache("INDEX_RECOMMEND_BCATE");
		$GLOBALS['tmpl']->assign("bcate_list",$bcate_list);
		
		$dq_time = get_gmtime();
		$GLOBALS['tmpl']->assign("dq_time",$dq_time);
		
		//今日推荐
		$index_tuan_list=get_deal_list_show(4,0,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE,DEAL_HISTORY,DEAL_NOTICE)," is_recommend = 1 ");
		$GLOBALS['tmpl']->assign("index_tuan_list",$index_tuan_list['list']);
		
		//精彩预告
		$index_tuan_yg=get_deal_list_show(10,0,$GLOBALS['deal_city']['id'],array(DEAL_NOTICE)," is_recommend = 1 ");
		$GLOBALS['tmpl']->assign("index_tuan_yg",$index_tuan_yg['list']);
		
		//美食天天品
		$index_tuan_ms=get_deal_list_show(10,8,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE)," is_recommend = 1 ");
		$GLOBALS['tmpl']->assign("index_tuan_ms",$index_tuan_ms['list']);
		
		
		//今晚好去处
		$index_tuan_ktv=get_deal_list_show(10,10,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE)," is_recommend = 1 ");
		$GLOBALS['tmpl']->assign("index_tuan_ktv",$index_tuan_ktv['list']);
		
		
		//精彩回顾
		$index_tuan_history=get_deal_list_show(10,0,$GLOBALS['deal_city']['id'],array(DEAL_HISTORY)," is_recommend = 1 ");
		$GLOBALS['tmpl']->assign("index_tuan_history",$index_tuan_history['list']);
		
		
		return $GLOBALS['tmpl']->fetch("index/index_rec_tuan.html");
	}
	public function index_new_tuan()
	{
		$tuan_list = get_deal_list_show(6,0,$GLOBALS['deal_city']['id'],array(DEAL_ONLINE),"");
		$tuan_list =$tuan_list['list'];
		$GLOBALS['tmpl']->assign("tuan_list",$tuan_list);
		return $GLOBALS['tmpl']->fetch("index/index_new_tuan.html");
	}
	
	public function index_list_tuan()
	{
		//获取推荐的大分类
			$bcate_list_tuan = load_dynamic_cache("INDEX_RECOMMEND_BASECATE");
			if ($bcate_list_tuan === false) {
				$bcate_list_tuan = $GLOBALS['db']->getAll("select * from " . DB_PREFIX . "deal_cate where is_effect = 1 and is_delete = 0 and recommend = 1 order by sort desc ");
				
			}
			
			if ($bcate_list_tuan) {
				$datalist_tuan = load_dynamic_cache("INDEX_RECOMMEND_CATLIST");
				$idx=0;
				$limit=4;
				$slimit=4;
				if ($datalist_tuan === false) {
					foreach ($bcate_list_tuan as $value) {
						if($idx>0){
						//首页显示商品数
						$limit=6;
						//商家分类数
						$slimit=4;
						}
						$idx++;
						
						$iCatId = $value['id'];
						//获取下集分类
						$catlist = $GLOBALS['db']->getAll("select t.* from " . DB_PREFIX . "deal_cate_type as t left join " . DB_PREFIX . "deal_cate_type_link as l on l.deal_cate_type_id = t.id where t.is_recommend = 1 and l.cate_id = $iCatId order by sort desc limit 0,5");
						$value['smalllist'] = $catlist;
						//获取推荐产品
						$where = " is_recommend = 1";
						$sort_field = "sort";
						$sort_type = "desc";
						$result = get_deal_list($limit, $iCatId, 0, $type = array(DEAL_ONLINE), $where, $sort_field . " " . $sort_type);
						$prolist = $result['list'];
						
						foreach($prolist as $k=>$v)
						{
						
							//获取商家地址和电话信息
							$mc_db = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."supplier_location where supplier_id = ".intval($v['supplier_id'])." ");
							$prolist[$k]['mc_add'] = $mc_db['address'];
							$prolist[$k]['mc_tel'] = $mc_db['tel'];
								
						}
						
						$value['plist'] = $prolist;
						
						
						//获取推荐商家
						
						foreach ($catlist as $key=>$catelist) {
						$deal_cate_id=$catelist[id];
						
						$city_ids = load_auto_cache("deal_city_belone_ids",array("city_id"=>intval($GLOBALS['deal_city']['id'])));		
						if($city_ids){
						$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location as sl left join " . DB_PREFIX . "deal_cate_type_location_link as dc on dc.location_id=sl.id  WHERE  city_id in(".implode(",",$city_ids).") and is_effect = 1 and is_recommend = 1 and dc.deal_cate_type_id='$deal_cate_id' order by dp_count desc,avg_point desc limit $slimit");}else{
						$store_list = $GLOBALS['db']->getAll("SELECT * FROM ".DB_PREFIX."supplier_location as sl left join " . DB_PREFIX . "deal_cate_type_location_link as dc on dc.location_id=sl.id WHERE  is_effect = 1 and is_recommend = 1 and dc.deal_cate_type_id='$deal_cate_id' order by dp_count desc,avg_point desc limit $slimit");
						}
						
						  $scate_num=0;
						  if($store_list){	
							$value[scate][$key][name]=$catelist[name];
							$value[scate][$key]['store_list'] =$store_list ;
							$scate_num++;
							if($scate_num>1){var_dump($scate_num);break;}
						  }
						
						}
						$datalist_tuan[] = $value;
						
					}
				
					set_dynamic_cache("INDEX_RECOMMEND_CATLIST", $datalist_tuan);
					
				}
				//var_dump($datalist_tuan[0]);die();
				
				//获取数据总数
				$datalist_tuan_count = count($datalist_tuan);
				$GLOBALS['tmpl']->assign("datalist_tuan_count", $datalist_tuan_count );
				$GLOBALS['tmpl']->assign("cat_list_tuan", $datalist_tuan);
				
			}
		}
		
    /***
	**2013-07-25添加首页团购方法结束
	**@@@@佰通网络科技添加修改
	***/
	
	/**
	 * 输出推荐达人
	 */
	function load_index_daren_list(){
		$rnd_daren_list = get_rand_user(9,1);			
		$GLOBALS['tmpl']->assign("rnd_daren_list",$rnd_daren_list);
		return $GLOBALS['tmpl']->fetch("index/index_daren_list.html");	
	}
}
?>