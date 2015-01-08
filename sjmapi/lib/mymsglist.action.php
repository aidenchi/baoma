<?php
class mymsglist
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
			$root['login_user_id'] = intval($user_data['id']);
			
			$page = intval($GLOBALS['request']['page']); //分页
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;			
			
			$sql_count = "select count(distinct(group_key)) from ".DB_PREFIX."msg_box
			where is_delete = 0 and ((to_user_id = ".intval($user_data['id'])." and `type` = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1))";
			$msg_count = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($msg_count/$page_size);
			
			//消息列表(type为0:别人发给我的；type为1:我发给别人的)
			$sql = "select group_key,count(group_key) as total from ".DB_PREFIX."msg_box  
				where is_delete = 0 and ((to_user_id = ".intval($user_data['id'])." and `type` = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1))  
				group by group_key 
				order by max(create_time) desc limit ".$limit;
			$msg_list = $GLOBALS['db']->getAll($sql);
			foreach($msg_list as $k=>$v){
				$msg_list[$k] = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."msg_box where group_key = '".$v['group_key']."' and ((to_user_id = ".intval($user_data['id'])." and `type` = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1))  order by create_time desc limit 1");
				$msg_list[$k]['total'] = $v['total'];
				
			}
			
			$root['msg_count']=intval($msg_count);
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['msg_list']=$msg_list;
		}
		
		$root['page_title']="我的私信";
		output($root);
	}
}
?>