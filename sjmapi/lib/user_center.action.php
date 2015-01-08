<?php
class user_center
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		$city_id =strim($GLOBALS['request']['city_id']);//城市名称
		//$result = do_login_user($email,$pwd);
		//$user_data = es_session::get('user_info');
		
		//logUtils::log_obj($GLOBALS['request']);
		
		$root = array();	
		$user_data = user_check($email,$pwd);

		//logUtils::log_obj($user_data);
		
		$user_id = intval($user_data['id']);

		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$root['info'] = "用户中心";
			$root['page_title'] = "用户中心";			
			
			/****第一栏**头像*昵称*性别*等级*积分*经验****/
			$root['uid'] = $user_data['id'];
			$root['user_name'] = $user_data['user_name'];
			$root['sex'] = $user_data['sex'];
			$root['user_email'] = $user_data['email'];			
			$point_level = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_level where id = ".intval($user_data['level_id']));//用户等级名称
			$root['user_point_level'] = $point_level['name'];
			$root['user_point'] =$user_data['point'];
			$root['score'] =$user_data['score'];
			
			
			/****第三栏**我的点评*我的主贴*我的收藏*****/
			$my_supplier_comment_count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_location_dp where user_id = ".intval($user_data['id']));//我的店铺点评
			$my_goods_comment_count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."message where pid = 0 and city_id =".$city_id." and user_id = ".intval($user_data['id']));//我的商品点评
			$my_supplier_and_goods_comment_count = intval($my_supplier_comment_count) + intval($my_goods_comment_count);//我的点评
			$my_topic_count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."topic where user_id= ".intval($user_data['id'])." and is_effect = 1 and is_delete = 0  and fav_id = 0 ".
			"and relay_id = 0 and type='share' ");//我的主贴
			$my_goods_collect_count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."deal_collect where user_id = ".intval($user_data['id']));//我的收藏
			$root['my_supplier_and_goods_comment_count'] =$my_supplier_and_goods_comment_count;
			$root['my_topic_count'] =$my_topic_count;
			$root['my_goods_collect_count'] =$my_goods_collect_count;
			
			/****第四栏**我的关注*我的粉丝*****/
			$my_focus_count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user_focus where focus_user_id = ".intval($user_data['id']));//我的关注
			$my_fans_count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user_focus where focused_user_id = ".intval($user_data['id']));//我的粉丝
			$root['my_focus_count'] =$my_focus_count;
			$root['my_fans_count'] =$my_fans_count;	
			
			
			/***********************************************商品评论 未读回复数量*****************************************/
			$goods_dp_reply_noread_count_sql = "select count(*) from ".DB_PREFIX."message as m where m.rel_table = 'deal' and m.is_buy = 1 and m.pid = 0 and m.user_id = ".intval($user_data['id']).
			" and m.admin_reply != '' and m.update_time != 0 and is_read = 0";
			$goods_dp_reply_noread_count = $GLOBALS['db']->getOne($goods_dp_reply_noread_count_sql);
			$root['goods_dp_reply_noread_count'] =$goods_dp_reply_noread_count;
			
			/***********************************************论坛回复 未读回复数量*****************************************/
			//查询出我的帖子的ids
			$my_topic_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic where user_id = ".intval($user_data['id'])." and is_effect = 1 and is_delete = 0  and fav_id = 0 ".
			"and relay_id = 0 and type='share' and id = origin_id order by create_time desc");
			$my_topic_ids = '';
			foreach($my_topic_list as $k0=>$v0){
				$my_topic_ids = $my_topic_ids.$v0['id'].',';
			}
			$my_topic_ids = substr($my_topic_ids,0,-1);
			$my_topic_ids = '('.$my_topic_ids.')';
			//别人对我的帖子的回复  未读的数量
			$topic_replynoread_sql_count = "select count(*) from ".DB_PREFIX."topic_reply where topic_id in ".$my_topic_ids." and is_read = 0";
			$topic_replynoread_count = $GLOBALS['db']->getOne($topic_replynoread_sql_count);
			//别人对我回复的回复  未读的数量
			$topic_reply_replynoread_sql_count = "select count(*) from ".DB_PREFIX."topic_reply where topic_id not in ".$my_topic_ids.
				" and reply_user_id = ".intval($user_data['id'])." and reply_is_read = 0";
			$topic_reply_replynoread_count = $GLOBALS['db']->getOne($topic_reply_replynoread_sql_count);
			//总的回复数量
			$topic_replynoread_count_total = intval($topic_replynoread_count) + intval($topic_reply_replynoread_count);
			$root['topic_replynoread_count_total'] = $topic_replynoread_count_total;
			
			/***********************************************私信 未读数量*****************************************/
			$msg_noread_count_sql = "select count(distinct(group_key)) from ".DB_PREFIX."msg_box
			where is_delete = 0 and ((to_user_id = ".intval($user_data['id'])." and `type` = 0 and is_read = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1 and is_read = 0))";
			$msg_noread_count = $GLOBALS['db']->getOne($msg_noread_count_sql);
			$root['msg_noread_count'] =$msg_noread_count;
			
			/***********************************************成长日记 未读回复数量*****************************************/
			$my_growth_diary_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."growth_diary where user_id = ".intval($user_data['id'])." order by create_time desc");
			$my_growth_diary_ids = '';
			foreach($my_growth_diary_list as $k0=>$v0){
				$my_growth_diary_ids = $my_growth_diary_ids.$v0['id'].',';
			}
			$my_growth_diary_ids = substr($my_growth_diary_ids,0,-1);
			$my_growth_diary_ids = '('.$my_growth_diary_ids.')';
			$growth_diary_total_noread_count_sql = "select count(*) from ".DB_PREFIX."growth_diary_reply where growth_diary_id in ".$my_growth_diary_ids." and is_read = 0";
			$growth_diary_total_noread_count = $GLOBALS['db']->getOne($growth_diary_total_noread_count_sql);
			$root['growth_diary_total_noread_count'] =$growth_diary_total_noread_count;
			
		}
		$root['city_name']=$city_name;
		output($root);
	}
}
?>