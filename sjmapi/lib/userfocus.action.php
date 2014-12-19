<?php
class userfocus
{
	public function index()
	{	
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		
		$root = array();
		
			$user_id =intval($GLOBALS['request']['user_id']);//该用户（被访问的用户）
			$current_user_id = intval($user_data['id']);//当前用户（登录状态中的用户）
			$root['current_user_id'] = $current_user_id;
			
			if($current_user_id == 0){//未登录
				$root['tag'] = 4;
				$root['html'] = "请先登录";
				output($root);
			}
			
			if($current_user_id == $user_id){//访问自己信息页
				$root['tag'] = 3;
				$root['html'] = "不能关注自己";
				output($root);
			}
			
			$focus_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_focus where focus_user_id = ".$current_user_id." and focused_user_id = ".$user_id);
			if(!$focus_data&&$current_user_id>0&&$user_id>0){//未关注，执行关注操作
				$focused_user_name = $GLOBALS['db']->getOne("select user_name from ".DB_PREFIX."user where id = ".$user_id);
				$focus_data = array();
				$focus_data['focus_user_id'] = $current_user_id;
				$focus_data['focused_user_id'] = $user_id;
				$focus_data['focus_user_name'] =$user_data['user_name'];
				$focus_data['focused_user_name'] = $focused_user_name;
				$GLOBALS['db']->autoExecute(DB_PREFIX."user_focus",$focus_data,"INSERT");
				$GLOBALS['db']->query("update ".DB_PREFIX."user set focus_count = focus_count + 1 where id = ".$current_user_id);
				$GLOBALS['db']->query("update ".DB_PREFIX."user set focused_count = focused_count + 1 where id = ".$user_id);
				$root['tag'] = 1;
				$root['html'] = "取消关注";
				output($root);
			}elseif($focus_data&&$current_user_id>0&&$user_id>0){//已关注，执行取消关注
				$GLOBALS['db']->query("delete from ".DB_PREFIX."user_focus where focus_user_id = ".$current_user_id." and focused_user_id = ".$user_id);
				$GLOBALS['db']->query("update ".DB_PREFIX."user set focus_count = focus_count - 1 where id = ".$current_user_id);
				$GLOBALS['db']->query("update ".DB_PREFIX."user set focused_count = focused_count - 1 where id = ".$user_id);		
				$root['tag'] =2;
				$root['html'] = "关注TA";
				output($root);
			}		
		
	}
}
?>