<?php
class growthdiarywrite
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
			$root['page_title'] = "成长日记";			
			$id = intval($GLOBALS['request']['id']);
			//输出表情数据html
			$qq_expression = $GLOBALS['db']->getAll("select `type`,`title`,`emotion`,`filename` from ".DB_PREFIX."expression where type='qq' order by id asc");
			foreach($qq_expression as $k=>$v){
				$qq_expression[$k]['filename'] = "/public/expression/".$v['type']."/".$v['filename'];
			}
			$root['qq_expression']=$qq_expression;
		
			if($id > 0){
				$condition = " where user_id = ".intval($user_data['id'])." and id = ".$id;
				$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary".$condition);				
			}
			$root['growth_diary_item']=$growth_diary_item;
			$root['id'] = $id;
		}
		
			
		$root['city_name']=$city_name;
		output($root);
	}
}
?>