<?php
class add_supplier_dp
{
	public function index()
	{
		
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		
		$content = strim($GLOBALS['request']['content']);//点评内容
		$point = intval($GLOBALS['request']['point']);//点评分数
		$merchant_id = intval($GLOBALS['request']['id']);//团购或商品id //只有购买后，才能点评
		
		//检查用户,用户密码
		$user = user_check($email,$pwd);
		$user_id  = intval($user['id']);		

		
		$root = array();
		if($user_id>0)
		{
			if ($content != null && $content != ""){
				//检查用户,用户密码
	
				if($merchant_id > 0){
					$supplier_location_id = $merchant_id;
					$merchant_youhui_comment = array(
								'user_id' => $user_id,
								'supplier_location_id' => $supplier_location_id,
								'title' => $content,
								'content' => $content,
								'point' => $point,
								'status' => 0,
								'create_time' => get_gmtime(),
					);
				$GLOBALS['db']->autoExecute(DB_PREFIX."supplier_location_dp", $merchant_youhui_comment, 'INSERT');
				$id = $GLOBALS['db']->insert_id();
				$root['id'] = $id;
				if($id > 0)	{
					$GLOBALS['db']->query("update ".DB_PREFIX."supplier_location set dp_count = dp_count + 1 where id = ".$id);
					$root['status'] = 1;
					$root['info'] = "提交成功，审核通过后可显示";
				}else{
					$root['status'] = 0;
					$root['info'] = "提交失败";
			}
				}
			}else{
				$root['info'] = $GLOBALS['lang']['MESSAGE_CONTENT_EMPTY'];
				$root['status'] =0;
			}
		}else{
			$root['user_login_status'] = 0;	
			$root['status'] =0;
			$root['info'] = '请先登录';
		}
		output($root);		
	}
}
?>