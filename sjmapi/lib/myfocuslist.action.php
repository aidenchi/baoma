<?php
class myfocuslist
{
	public function index()
	{	
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		$user_id = intval($user_data['id']);
		
		$root = array();
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$page = intval($GLOBALS['request']['page']); //分页
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;		
			
			$total = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user_focus where focus_user_id = ".intval($user_data['id']));
			$page_total = ceil($total/$page_size);
			
			//粉丝列表
			$focus_list = $GLOBALS['db']->getAll("select focused_user_id as id,focused_user_name as user_name from ".DB_PREFIX."user_focus where focus_user_id = ".
			intval($user_data['id'])." order by id desc limit ".$limit);
			
			
			
			$root['total']=$total;
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['focus_list']=$focus_list;
		}
		
		$root['page_title']="我的关注";
		output($root);
	}
}
?>