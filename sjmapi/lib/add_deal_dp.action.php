<?php
class add_deal_dp
{
	public function index()
	{
		
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		
		$content = strim($GLOBALS['request']['content']);//点评内容
		$point = intval($GLOBALS['request']['point']);//点评分数
		$deal_id = intval($GLOBALS['request']['id']);//团购或商品id //只有购买后，才能点评
		
		//检查用户,用户密码
		$user = user_check($email,$pwd);
		$user_id  = intval($user['id']);		
		$money = floatval($user['money']);
			
		$root = array();
		$root['return'] = 1;
		if($user_id>0)
		{
			$root['user_login_status']	=	1;
			
			$result = add_deal_dp($user_id, $content, $point, $deal_id);
			$root['status'] = $result['status'];
			$root['info'] = $result['msg'];
		}else
		{
			$root['user_login_status'] = 0;	
			$root['status'] =0;
			$root['info'] = '请先登录';
		}
		output($root);		
	}
}
?>