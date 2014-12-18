<?php
class goodscommentdel
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
			$root['status']=0;
			$root['info']='商品点评删除失败';
			$goods_comment_id = intval($GLOBALS['request']['goods_comment_id']);
			//删除商品点评
			$GLOBALS['db']->query("delete from ".DB_PREFIX."message where id = ".$goods_comment_id);
			$root['status']=1;
			$root['info']='商品点评删除成功';			
		}		
		
		$root['page_title']='我的点评';
		$root['city_name']=$city_name;
		output($root);
	}
}

?>