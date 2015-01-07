<?php
class userxypoint
{
	public function index()
	{

		$root = array();
		$root['return'] = 0;

		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		$user_id = intval($user_data['id']);

		$latitude = floatval($GLOBALS['request']['latitude']);//ypoint
		$longitude = floatval($GLOBALS['request']['longitude']);//xpoint
		$location = strim($GLOBALS['request']['location']);//位置


		$root['m_latitude'] = $latitude;
		$root['m_longitude'] = $longitude;
		$root['status'] = 1;
		
		if ($user_id > 0 && $latitude > 0 && $longitude > 0){
			$user_x_y_point = array(
								'uid' => $user_id,
								'xpoint' => $longitude,
								'ypoint' => $latitude,
								'location' => $location,
								'locate_time' => get_gmtime(),
			);
			$user_xypoint_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_x_y_point where uid = ".$user_id);
			if($user_xypoint_data){
				$sql0 = "update ".DB_PREFIX."user_x_y_point set xpoint = $longitude, ypoint = $latitude, locate_time = ".get_gmtime()." where uid = $user_id";
				$GLOBALS['db']->query($sql0);
			}else{
				$GLOBALS['db']->autoExecute(DB_PREFIX."user_x_y_point", $user_x_y_point, 'INSERT');
			}			
			$sql = "update ".DB_PREFIX."user set xpoint = $longitude, ypoint = $latitude, location = $location ,  locate_time = ".get_gmtime()." where id = $user_id";
			$GLOBALS['db']->query($sql);

			$root['return'] = 1;
		}

		output($root);
	}
}
?>