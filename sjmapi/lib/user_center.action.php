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
			
			/****第一栏**头像*昵称*等级*分数*****/
			$root['uid'] = $user_data['id'];
			$root['user_name'] = $user_data['user_name'];
			$root['user_email'] = $user_data['email'];			
			$point_level = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_level where id = ".intval($user_data['level_id']));//用户等级名称
			$root['user_point_level'] = $point_level['name'];
			$root['user_point'] =$user_data['point'];
			
			/****第二栏**评论回复*论坛回复*私信*****/
			
			
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
			
		}
		$root['city_name']=$city_name;
		output($root);
	}
}
?>