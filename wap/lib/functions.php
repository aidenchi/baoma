<?php
/***************************ymy add 2014-12-12***********************************/
//帖子回复计算几楼
function floor_num($k,$base_size){
	return intval(intval($k) + 1 + intval($base_size));
}

//显示头像
function show_avatar($u_id,$type="middle")
{
	$key = md5("AVATAR_".$u_id.$type);
	if(isset($GLOBALS[$key]))
	{
		return $GLOBALS[$key];
	}
	else
	{
		$avatar_key = md5("USER_AVATAR_".$u_id); 
		$avatar_data = $GLOBALS['dynamic_avatar_cache'][$avatar_key];// 当前用户所有头像的动态缓存			
		if(!isset($avatar_data)||!isset($avatar_data[$key]))
		{
			$avatar_file = get_user_avatar($u_id,$type);	
			$avatar_str = "<a href='".url("shop","space",array("id"=>$u_id))."' style='text-align:center; display:inline-block;'  onmouseover='userCard.load(this,".$u_id.");'>".
				   "<img src='".$avatar_file."'  />".
				   "</a>"; 			
			$avatar_data[$key] = $avatar_str;
			if(count($GLOBALS['dynamic_avatar_cache'])<500) //保存500个用户头像缓存
			{
				$GLOBALS['dynamic_avatar_cache'][$avatar_key] = $avatar_data;
			}			
		}
		else
		{
			$avatar_str = $avatar_data[$key];
		}
		$GLOBALS[$key]= $avatar_str;
		return $GLOBALS[$key];
	}
}

function update_avatar($u_id)
{
	$avatar_key = md5("USER_AVATAR_".$u_id); 
	unset($GLOBALS['dynamic_avatar_cache'][$avatar_key]);
	$GLOBALS['fcache']->set_dir(APP_ROOT_PATH."public/runtime/data/avatar_cache/");
	$GLOBALS['fcache']->set("AVATAR_DYNAMIC_CACHE",$GLOBALS['dynamic_avatar_cache']); //头像的动态缓存
}

//获取用户头像的文件名
function get_user_avatar($id,$type)
{
	$uid = sprintf("%09d", $id);//9位数
	$dir1 = substr($uid, 0, 3);
	$dir2 = substr($uid, 3, 2);
	$dir3 = substr($uid, 5, 2);
	$path = $dir1.'/'.$dir2.'/'.$dir3;
				
	$id = str_pad($id, 2, "0", STR_PAD_LEFT); 
	$id = substr($id,-2);
	$avatar_file = "/public/avatar/".$path."/".$id."virtual_avatar_".$type.".jpg";
	$avatar_check_file = APP_ROOT_PATH."public/avatar/".$path."/".$id."virtual_avatar_".$type.".jpg";
	if(file_exists($avatar_check_file))	
	return $avatar_file;
	else
	return "/public/avatar/noavatar_".$type.".gif";

	//@file_put_contents($avatar_check_file,@file_get_contents(APP_ROOT_PATH."public/avatar/noavatar_".$type.".gif"));
}

//论坛帖子获取已过时间
function pass_date($time)
{
		$time_span = get_gmtime() - $time;
		if($time_span>3600*24*365)
		{
			//一年以前
//			$time_span_lang = round($time_span/(3600*24*365)).$GLOBALS['lang']['SUPPLIER_YEAR'];
			//$time_span_lang = to_date($time,"Y".$GLOBALS['lang']['SUPPLIER_YEAR']."m".$GLOBALS['lang']['SUPPLIER_MON']."d".$GLOBALS['lang']['SUPPLIER_DAY']);
			$time_span_lang = to_date($time,"Y-m-d");
		}
		elseif($time_span>3600*24*30)
		{
			//一月
//			$time_span_lang = round($time_span/(3600*24*30)).$GLOBALS['lang']['SUPPLIER_MON'];
			//$time_span_lang = to_date($time,"Y".$GLOBALS['lang']['SUPPLIER_YEAR']."m".$GLOBALS['lang']['SUPPLIER_MON']."d".$GLOBALS['lang']['SUPPLIER_DAY']);
			$time_span_lang = to_date($time,"Y-m-d");
		}
		elseif($time_span>3600*24)
		{
			//一天
			//$time_span_lang = round($time_span/(3600*24)).$GLOBALS['lang']['SUPPLIER_DAY'];
			$time_span_lang = to_date($time,"Y-m-d");
		}
		elseif($time_span>3600)
		{
			//一小时
			$time_span_lang = round($time_span/(3600)).$GLOBALS['lang']['SUPPLIER_HOUR'];
		}
	    elseif($time_span>60)
		{
			//一分
			$time_span_lang = round($time_span/(60)).$GLOBALS['lang']['SUPPLIER_MIN'];
		}
		else
		{
			//一秒
			$time_span_lang = $time_span.$GLOBALS['lang']['SUPPLIER_SEC'];
		}
		return $time_span_lang;
}

//通过user_id获取user_name
function get_user_name_by_user_id($id)
{
	$key = md5("USER_NAME_LINK_".$id);
	if(isset($GLOBALS[$key]))
	{
		return $GLOBALS[$key];
	}
	else
	{
		$uname = load_dynamic_cache($key);
		if($uname===false)
		{
			$u = $GLOBALS['db']->getRow("select id,user_name,is_merchant,is_daren from ".DB_PREFIX."user where id = ".intval($id));
			$uname = "<a href='".wap_url("index","userinfo",array("user_id"=>$id))."' >".$u['user_name']."</a>";
			set_dynamic_cache($key,$uname);
		}
		$GLOBALS[$key] = $uname; 
		return $GLOBALS[$key];
	}
}

/***************************ymy add 2014-12-12*end**********************************/



//过滤SQL注入
function strim($string)
{
	return trim(addslashes($string));
}

//解析URL标签
// $str = u:shop|acate#index|id=10&name=abc
function parse_url_tag($str)
{
	$key = md5("URL_TAG_".$str);
	if(isset($GLOBALS[$key]))
	{
		return $GLOBALS[$key];
	}

	$url = load_dynamic_cache($key);
	$url=false;
	if($url!==false)
	{
		$GLOBALS[$key] = $url;
		return $url;
	}
	$str = substr($str,2);
	$str_array = explode("|",$str);
	$app_index = $str_array[0];
	$route = $str_array[1];
	$param_tmp = explode("&",$str_array[2]);
	$param = array();

	foreach($param_tmp as $item)
	{
		if($item!='')
			$item_arr = explode("=",$item);
		if($item_arr[0]&&$item_arr[1])
			$param[$item_arr[0]] = $item_arr[1];
	}
	$GLOBALS[$key]= url($app_index,$route,$param);
	set_dynamic_cache($key,$GLOBALS[$key]);
		
	return $GLOBALS[$key];
}


//显示错误
function showErr($msg,$ajax=0,$jump='',$stay=0)
{
	
	echo "<script>alert('".$msg."');location.href='".$jump."';</script>";exit;
	/*
	if($ajax==1)
	{
		$result['status'] = 0;
		$result['info'] = $msg;
		$result['jump'] = $jump;
		header("Content-Type:text/html; charset=utf-8");
		echo(json_encode($result));exit;
	}
	else
	{

		$GLOBALS['tmpl']->assign('page_title',$GLOBALS['lang']['ERROR_TITLE']." - ".$msg);
		$GLOBALS['tmpl']->assign('msg',$msg);
		if($jump=='')
		{
			$jump = $_SERVER['HTTP_REFERER'];
		}
		if(!$jump&&$jump=='')
			$jump = APP_ROOT."/";
		$GLOBALS['tmpl']->assign('jump',$jump);
		$GLOBALS['tmpl']->assign("stay",$stay);
		$GLOBALS['tmpl']->display("error.html");
		exit;
	}
	*/
}

//显示成功
function showSuccess($msg,$ajax=0,$jump='',$stay=0)
{
	echo "<script>alert('".$msg."');location.href='".$jump."';</script>";exit;
	/*
	if($ajax==1)
	{
		$result['status'] = 1;
		$result['info'] = $msg;
		$result['jump'] = $jump;
		header("Content-Type:text/html; charset=utf-8");
		echo(json_encode($result));exit;
	}
	else
	{
		$GLOBALS['tmpl']->assign('page_title',$GLOBALS['lang']['SUCCESS_TITLE']." - ".$msg);
		$GLOBALS['tmpl']->assign('msg',$msg);
		if($jump=='')
		{
			$jump = $_SERVER['HTTP_REFERER'];
		}
		if(!$jump&&$jump=='')
			$jump = APP_ROOT."/";
		$GLOBALS['tmpl']->assign('jump',$jump);
		$GLOBALS['tmpl']->assign("stay",$stay);
		$GLOBALS['tmpl']->display("success.html");
		exit;
	}
	*/
}

function do_postcart($request_param){
	
	if ($request_param['post_type'] ==''){
		//print_r($request_param);
		//exit;
		if($request_param['id']){
			/*
			 $cart['goods_id'] = 57;
			$cart['num'] = 1;
			$cart['attr_value_a'] = '白色';
			$cart['attr_value_b'] = '170';
			$cart['attr_id_a'] = 257;
			$cart['attr_id_b'] = 259;
			 
			*/
			$attr=array();
			$attr=$request_param['attr'];
			$attr_value=array();
			$attr_value=$request_param['attr_value'];
			$goods_id = $request_param['id'];
			$attr_id_a = $attr[0];
			$attr_value_a = trim($attr_value[0]);
			$attr_id_b = $attr[1];
			$attr_value_b = trim($attr_value[1]);
			$id = md5($goods_id."_".$attr_id_a."_".$attr_value_a."_".$attr_id_b."_".$attr_value_b);
			//$id = $goods_id;
			//echo $id;
			$session_cart_data=es_session::get("cart_data");
			if (empty($session_cart_data)){
				$session_cart_data = array();
			}
			if (isset($session_cart_data[$id])){
				$session_cart_data[$id]['num'] ++;
			}else{
				$tmp = array();
				$tmp["id"]  = $id;
				$tmp["goods_id"]  = $goods_id;
				$tmp["attr_id_a"] = $attr_id_a;
				$tmp['attr_id_b'] = $attr_id_b;
				$tmp["attr_value_a"] = $attr_value_a;
				$tmp['attr_value_b'] = $attr_value_b;
				$tmp['num'] = 1;
				$session_cart_data[$id] = $tmp;
			}
			es_session::set("cart_data",$session_cart_data);
		}
		//es_session::set("first_calc",1);
		
		$session_cart_data=es_session::get("cart_data");
		//print_r($session_cart_data);exit;
		
		if (count($session_cart_data) == 0){
			//购物车中,没有商品了，跳转到首页
			//app_redirect(url("index"));
			showErr('购物车未有商品',0,url("index"));
		}else{
			$request_param['cartdata']= str_replace("+","%2B",base64_encode(serialize(es_session::get("cart_data"))));
			return $request_param;
		}		
	}else if ($request_param['post_type'] =='del'){
		if($request_param['id']){
			$id=$request_param['id'];
			if(es_session::get("cart_data")){
				$session_cart_data=es_session::get("cart_data");
				unset($session_cart_data[$id]);
				es_session::set("cart_data",$session_cart_data);
				
				if (count($session_cart_data) == 0){
					//购物车中,没有商品了，跳转到首页
					app_redirect(url("index"));
				}else{
					//购物车中还有商品，刷新购物车界面
					app_redirect(url("index","postcart"));
				}				
				
				//echo "<script>alert('删除成功!');location.href='".$_SERVER["HTTP_REFERER"]."';</script>";
			}
		}
	}
}

/**
 * 定位城市
 * @param int $deal_city_id 城市id
 * @return unknown
 */
function get_cur_deal_city($deal_city_id = 0)
{
	if($deal_city_id > 0)
	{		
		$deal_city = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_city where is_effect = 1 and is_delete = 0 and id = ".intval($deal_city_id));
	}

	if(!$deal_city)
	{
		//设置如存在的IP订位
		if(file_exists(APP_ROOT_PATH."system/extend/ip.php"))
		{
			require_once APP_ROOT_PATH."system/extend/ip.php";
			$ip =  get_client_ip();
			$iplocation = new iplocate();
			$address=$iplocation->getaddress($ip);
				
			$sql = "select * from ".DB_PREFIX."deal_city where is_delete = 0 and is_effect = 1 ";
			$city_list = $GLOBALS['db']->getAll($sql);//不知谁把$city_list 查询去掉了; 去掉后就不能通过ip定位了; chenfq 现在又添加上去了 2014-09-18
				
			foreach ($city_list as $city)
			{
				if(strpos($address['area1'],$city['name']))
				{
					$deal_city = $city;
					break;
				}
			}
		}
		if(!$deal_city)
			$deal_city = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."deal_city where is_default = 1 and is_effect = 1 and is_delete = 0");
	}
	return $deal_city;
}

//编译生成css文件
function parse_css($urls)
{
	static $color_cfg;
	if(empty($color_cfg))
		$color_cfg = require_once APP_ROOT_PATH."wap/tpl/".TMPL_NAME."/color_cfg.php";
		
	$url = md5(implode(',',$urls));
	$css_url = 'public/runtime/wap/statics/'.$url.'.css';
	$url_path = APP_ROOT_PATH.$css_url;
	if(!file_exists($url_path)||IS_DEBUG||true)
	{
		$tmpl_path = $GLOBALS['tmpl']->_var['TMPL'];

		$css_content = '';
		foreach($urls as $url)
		{
			$css_content .= @file_get_contents($url);
		}
		$css_content = preg_replace("/[\r\n]/",'',$css_content);
		$css_content = str_replace("../images/",$tmpl_path."/images/",$css_content);
		if (is_array($color_cfg)){
			foreach($color_cfg as $k=>$v)
			{
				$css_content = str_replace($k,$v,$css_content);
			}
		}
		//		@file_put_contents($url_path, unicode_encode($css_content));
		@file_put_contents($url_path, $css_content);
	}
	return get_domain()."/".APP_ROOT.'/../'.$css_url;
}

function user_login(){
	//会员自动登录及输出
	$cookie_uname = es_cookie::get("user_name")?es_cookie::get("user_name"):'';
	$cookie_upwd = es_cookie::get("user_pwd")?es_cookie::get("user_pwd"):'';
	
	//logUtils::log_str($cookie_uname);
	//logUtils::log_str($cookie_upwd);
	
	if($cookie_uname!=''&&$cookie_upwd!=''&&!es_session::get("user_info"))
	{
		//logUtils::log_str("=======1=======");
		$cookie_uname = addslashes(trim(htmlspecialchars($cookie_uname)));
		$cookie_upwd = addslashes(trim(htmlspecialchars($cookie_upwd)));
		require_once APP_ROOT_PATH."system/libs/user.php";
		//require_once APP_ROOT_PATH."app/Lib/common.php";
		auto_do_login_user($cookie_uname,$cookie_upwd);
	
		//logUtils::log_str("========2=========");
	}
}



//解析URL标签
// $str = u:shop|acate#index|id=10&name=abc
function parse_wap_url_tag($str)
{
	$key = md5("WAP_URL_TAG_".$str);
	if(isset($GLOBALS[$key]))
	{
		return $GLOBALS[$key];
	}

	$url = load_dynamic_cache($key);
	$url=false;
	if($url!==false)
	{
		$GLOBALS[$key] = $url;
		return $url;
	}
	$str = substr($str,2);
	$str_array = explode("|",$str);
	$app_index = $str_array[0];
	$route = $str_array[1];
	$param_tmp = explode("&",$str_array[2]);
	$param = array();

	foreach($param_tmp as $item)
	{
		if($item!='')
			$item_arr = explode("=",$item);
		if($item_arr[0]&&$item_arr[1])
			$param[$item_arr[0]] = $item_arr[1];
	}
	$GLOBALS[$key]= wap_url($app_index,$route,$param);
	set_dynamic_cache($key,$GLOBALS[$key]);
	return $GLOBALS[$key];
}

//wap重写下使用原始链接
function wap_url($app_index,$route="index",$param=array())
{
	$GLOBALS['request']['from']="wap";
	return url($app_index,$route,$param);
}
?>