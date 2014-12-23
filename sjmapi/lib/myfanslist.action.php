<?php
class myfanslist
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
			
			$total = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user_focus where focused_user_id = ".intval($user_data['id']));
			$page_total = ceil($total/$page_size);
			
			//粉丝列表
			$fans_list = $GLOBALS['db']->getAll("select focus_user_id as id,focus_user_name as user_name from ".DB_PREFIX."user_focus where focused_user_id = ".
			intval($user_data['id'])." order by id desc limit ".$limit);
			
			//循环我的粉丝，检查我是否也关注了TA
			foreach($fans_list as $k=>$v){
				//$v['id'] ==> 粉丝的id
				//intval($user_data['id']) ==>  我的id
				$focus_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_focus where focus_user_id = ".intval($user_data['id'])." and focused_user_id = ".$v['id']);
				if($focus_data){
					$fans_list[$k]['focused'] = 1;//已关注
				}else{
					$fans_list[$k]['focused'] = 0;//未关注
				}
			}
		
			$root['total']=$total;
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['fans_list']=$fans_list;
		}
		
		$root['page_title']="我的粉丝";
		output($root);
	}
}
?>