<?php
class growthdiarydatelist
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		
		$root = array();	
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;		
			
			$year = intval($GLOBALS['request']['year']);
			$month = intval($GLOBALS['request']['month']);
			$day = intval($GLOBALS['request']['day']);

			$condition = " where user_id = ".intval($user_data['id'])." and record_year = ".$year." and record_month = ".$month." and record_day = ".$day;
			$sql_count = "select count(*) from ".DB_PREFIX."growth_diary".$condition." order by record_date desc";
			$total = $GLOBALS['db']->getOne($sql_count);
			$sql= "select * from ".DB_PREFIX."growth_diary".$condition." order by create_time desc";
			$growth_diary_list = $GLOBALS['db']->getAll($sql);
			foreach($growth_diary_list as $k=>$v){
				if(msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content'])){
					$growth_diary_list[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content']),0,40);
				}else{
					$growth_diary_list[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$growth_diary_list[$k]['content']);
				}
			}
			$root['total'] = $total;
			$root['growth_diary_list'] = $growth_diary_list;
			$root['page_title'] = $year."年".$month."月".$day."日成长日记";
		}
		
		$root['city_name']=$city_name;
		output($root);
	}
}
?>