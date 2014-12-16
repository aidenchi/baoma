<?php
class topicwrite
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
			/*
			//表情
			$result = $GLOBALS['db']->getAll("select `type`,`title`,`emotion`,`filename` from ".DB_PREFIX."expression order by type");
			$expression = array();
			foreach($result as $k=>$v)
			{
				$v['filename'] = "./public/expression/".$v['type']."/".$v['filename'];
				$v['emotion'] = str_replace(array('[',']'),array('',''),$v['emotion']);
				$expression[$v['type']][] = $v;
			}			
			$root['expression'] = $expression;
			*/
			//论坛版块
			$cate_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_tag_cate where showin_web = 1 order by sort desc limit 5");
			$root['cate_list'] = $cate_list;
			
		}
		
		$root['page_title'] = "写帖";	
		$root['city_name']=$city_name;
		output($root);
	}
}
?>