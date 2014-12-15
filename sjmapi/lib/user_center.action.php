<?php
class user_center
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
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
			$root['uid'] = $user_data['id'];
			$root['user_name'] = $user_data['user_name'];
			$root['user_email'] = $user_data['email'];
			$root['user_money'] = $user_data['money'];
			$root['user_money_format'] = format_price($user_data['money']);//用户金额
			//ymy 2014-12-10 add
			$point_level = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_level where id = ".intval($user_data['level_id']));
			$root['user_point_level'] = $point_level['name'];
			$root['user_point'] =$user_data['point'];
			$headImg = get_muser_avatar($user_data['id'],"big");
			$headImg=str_replace("./public/","/public/",$headImg);//图片显示不出来，ymy添加了这一句 2014-12-10
			$root['user_avatar'] = get_abs_img_root($headImg);
			//$root['user_avatar'] = get_abs_img_root(get_muser_avatar($user_data['id'],"big"));
		}
		$root['city_name']=$city_name;
		output($root);
	}
}
?>