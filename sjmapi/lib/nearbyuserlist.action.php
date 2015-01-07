<?php
class nearbyuserlist
{
	public function index()
	{	
		require_once APP_ROOT_PATH."system/libs/user.php";
		$root = array();
		$root['return'] = 1;
		$city_id = intval($GLOBALS['request']['city_id']);
		
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);		
		$result = do_login_user($email,$pwd);
		$GLOBALS['user_info'] = $user_data = es_session::get('user_info');
		$age_id = intval($GLOBALS['request']['age_id']);//年龄id
		$sex = intval($GLOBALS['request']['sex']);//性别
		
		$ypoint =  doubleval($GLOBALS['request']['ypoint']);  //ypoint 
		$xpoint = doubleval($GLOBALS['request']['xpoint']);  //xpoint
		$distance = strim($GLOBALS['request']['distance']); 		
		//$xpoint = doubleval(114.41776);
		//$ypoint = doubleval(30.483698);
		
		//输出区域
		$base_quan_list=$GLOBALS['db']->getAll("select * from ".DB_PREFIX."area where city_id=".intval($city_id)." and pid = 0 order by sort desc");
		$quan_list = array();
		$quan_list[0]['id'] = 1;
		$quan_list[0]['name'] = "全部";
		foreach($base_quan_list as $k=>$v){
			$quan_list[$k+1] = $base_quan_list[$k];
		}
		
		//查询条件
		$where = " is_effect = 1 and is_delete = 0 ";
		$field_append = " ";
		$orderby = " order by id desc ";
		
		//位置

		
		//年龄
		$now_date = date('Y-m-d');
		$now_time = strtotime($now_date);
		$sex_month_befor_time = strtotime("-6 month");		
		//$sex_month_befor_date = date('Y-m-d H:i:s', $sex_month_befor_time); 
		$one_year_befor_time = strtotime("-1 year");
		$two_year_befor_time = strtotime("-2 year");
		$three_year_befor_time = strtotime("-3 year");
		$four_year_befor_time = strtotime("-4 year");
		$five_year_befor_time = strtotime("-5 year");
		$six_year_befor_time = strtotime("-6 year");
		$seven_year_befor_time = strtotime("-7 year");
		$eight_year_befor_time = strtotime("-8 year");
		$nine_year_befor_time = strtotime("-9 year");
		if($age_id > 0){	
			$where = $where." and both_time != 0";
			if($age_id == 1){
				$where = $where." and both_time >= $sex_month_befor_time ";
			}
			if($age_id == 2){//7-12月
				$where = $where." and both_time >= $one_year_befor_time and both_time <= $sex_month_befor_time ";
			}
			if($age_id == 3){//1-2岁
				$where = $where." and both_time >= $three_year_befor_time and both_time <= $one_year_befor_time ";
			}			
			if($age_id == 4){//3-4岁
				$where = $where." and both_time >= $five_year_befor_time and both_time <= $three_year_befor_time ";
			}
			if($age_id == 5){//5-6岁
				$where = $where." and both_time >= $seven_year_befor_time and both_time <= $five_year_befor_time ";
			}
			if($age_id == 6){//7-8岁
				$where = $where." and both_time >= $nine_year_befor_time and both_time <= $seven_year_befor_time ";
			}
		}
		
		//距离
		if($xpoint>0 && $ypoint>0){//定位成功，得出距离
			$pi = 3.14159265;  //圆周率
			$r = 6370693;  //地球平均半径(米)
			//根据坐标点计算距离
			$field_append = ",(ACOS(SIN(($ypoint * $pi) / 180 ) *SIN((ypoint * $pi) / 180 ) +COS(($ypoint * $pi) / 180 ) * COS((ypoint * $pi) / 180 ) *COS(($xpoint * $pi) / 180 - (xpoint * $pi) / 180 ) ) * $r) as distance";
			//选择距离
			if($distance == 'all' || $distance == ''){
			}
			if($distance == 'gt10'){
				$squares = returnSquarePoint($xpoint, $ypoint, 10);
				$where .= " and ypoint<>0 and (ypoint<{$squares['right-bottom']['lat']} or ypoint>{$squares['left-top']['lat']}) and (xpoint<{$squares['left-top']['lng']} or xpoint>{$squares['right-bottom']['lng']}) ";
			}
			if($distance == '0.5'){
				$squares = returnSquarePoint($xpoint, $ypoint, 0.5);
				$where .= " and ypoint<>0 and ypoint>{$squares['right-bottom']['lat']} and ypoint<{$squares['left-top']['lat']} and xpoint>{$squares['left-top']['lng']} and xpoint<{$squares['right-bottom']['lng']} ";
			}
			if($distance == '1'){
				$squares = returnSquarePoint($xpoint, $ypoint, 1);
				$where .= " and ypoint<>0 and ypoint>{$squares['right-bottom']['lat']} and ypoint<{$squares['left-top']['lat']} and xpoint>{$squares['left-top']['lng']} and xpoint<{$squares['right-bottom']['lng']} ";
			}
			if($distance == '2'){
				$squares = returnSquarePoint($xpoint, $ypoint, 2);
				$where .= " and ypoint<>0 and ypoint>{$squares['right-bottom']['lat']} and ypoint<{$squares['left-top']['lat']} and xpoint>{$squares['left-top']['lng']} and xpoint<{$squares['right-bottom']['lng']} ";
			}			
			if($distance == '3'){
				$squares = returnSquarePoint($xpoint, $ypoint, 3);
				$where .= " and ypoint<>0 and ypoint>{$squares['right-bottom']['lat']} and ypoint<{$squares['left-top']['lat']} and xpoint>{$squares['left-top']['lng']} and xpoint<{$squares['right-bottom']['lng']} ";
			}	
			if($distance == '5'){
				$squares = returnSquarePoint($xpoint, $ypoint, 5);
				$where .= " and ypoint<>0 and ypoint>{$squares['right-bottom']['lat']} and ypoint<{$squares['left-top']['lat']} and xpoint>{$squares['left-top']['lng']} and xpoint<{$squares['right-bottom']['lng']} ";
			}	
			if($distance == '8'){
				$squares = returnSquarePoint($xpoint, $ypoint, 8);
				$where .= " and ypoint<>0 and ypoint>{$squares['right-bottom']['lat']} and ypoint<{$squares['left-top']['lat']} and xpoint>{$squares['left-top']['lng']} and xpoint<{$squares['right-bottom']['lng']} ";
			}	
			if($distance == '10'){
				$squares = returnSquarePoint($xpoint, $ypoint, 10);
				$where .= " and ypoint<>0 and ypoint>{$squares['right-bottom']['lat']} and ypoint<{$squares['left-top']['lat']} and xpoint>{$squares['left-top']['lng']} and xpoint<{$squares['right-bottom']['lng']} ";
			}
			//按距离排序
			$orderby = " order by distance asc ";
		}else{
			$field_append = " ";
			$orderby = " order by id desc ";
		}
		
		//性别
		if($sex >0){
			if($sex == 1){//男
				$where = $where." and sex = 1 ";
			}
			if($sex == 2){//女
				$where = $where." and sex = 0 ";
			}
		}


		$page = intval($GLOBALS['request']['page']); //分页		
		$page=$page==0?1:$page;		
		$page_size = PAGE_SIZE;
		$limit = (($page-1)*$page_size).",".$page_size;		
		$sql_count = "select count(*) from ".DB_PREFIX."user ";
		$sql = "select id,xpoint,ypoint,locate_time,user_name,sex ".$field_append." from ".DB_PREFIX."user ";
		$sql_count.=" where ".$where;		
		$sql.= " where ".$where;
		$sql.=$orderby;		
		$sql.=" limit ".$limit;
		
		$total = $GLOBALS['db']->getOne($sql_count);
		$page_total = ceil($total/$page_size);
		
		$root['sql'] = $sql;
		$user_list = $GLOBALS['db']->getAll($sql);
		foreach($user_list as $k => $item){		
			$item['uid'] = $item['id'];
			if($item['daren_title']!='')
			$item['user_name'] .= "[".$item['daren_title']."]";
			$item['fans'] = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user_focus where focused_user_id = ". $item['id']);
			$item['user_avatar'] = get_abs_img_root(get_muser_avatar($item['id'],"big"));
			if($item['id']==$user_data['id'])
			{
				$item['is_follow'] = -1;
			}
			else
			{
				$focus_uid = intval($item['id']);
				$focus_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_focus where focus_user_id = ".intval($user_data['id'])." and focused_user_id = ".intval($focus_uid));
				if($focus_data)
				$item['is_follow'] = 1;
				else
				$item['is_follow'] = 0;
			}
			
			$item['locate_time_format'] = pass_date($item['locate_time']);
			$item['distance'] = round($item['distance']);
			$user_list[$k] = $item;
		}
		$root['email']=$email;
		$root['quan_list'] = $quan_list;
		$root['age_id'] = $age_id;
		$root['xpoint']=$xpoint;
		$root['ypoint']=$ypoint;
		$root['distance'] = $distance;
		$root['sex'] = $sex;
		$root['user_list'] = $user_list;
		$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
		$root['page_title']='附近玩伴';		
		
		output($root);
	}	
}

function returnSquarePoint($lng, $lat,$distance){
 	$EARTH_RADIUS = 6370.693;
    $dlng =  2 * asin(sin($distance / (2 * $EARTH_RADIUS)) / cos(deg2rad($lat)));
    $dlng = rad2deg($dlng);
     
    $dlat = $distance/$EARTH_RADIUS;
    $dlat = rad2deg($dlat);
     
    return array(
                'left-top'=>array('lat'=>$lat + $dlat,'lng'=>$lng-$dlng),
                'right-top'=>array('lat'=>$lat + $dlat, 'lng'=>$lng + $dlng),
                'left-bottom'=>array('lat'=>$lat - $dlat, 'lng'=>$lng - $dlng),
                'right-bottom'=>array('lat'=>$lat - $dlat, 'lng'=>$lng + $dlng)
                );
}

?>