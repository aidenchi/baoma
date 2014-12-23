<?php
class userinfo
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
			
			//获取该用户的基本信息
			$user_info = $GLOBALS['db']->getRow("select user_name,sex,my_intro,topic_count,level_id,point from ".DB_PREFIX."user where id = ".$user_id);
			if($user_info){
				$user_info['user_id'] = $user_id;			
				$user_level_info = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_level where id = ".$user_info['level_id']);//等级名称
				$user_info['user_point_level'] = $user_level_info['name'];			
				//判断当前用户是否已经关注过该用户
				$focused = 0;//未关注
				$focus_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."user_focus where focus_user_id = ".$current_user_id." and focused_user_id = ".$user_id);
				if($focus_data){
					$focused = 1;//已关注
				}
				$user_info['focused']=$focused;				
				$root['user_info'] = $user_info;
				
				//获取该用户的最新的5篇帖子
				$sql = "select * from ".DB_PREFIX."topic where user_id = ".$user_id." and is_effect = 1 and is_delete = 0  and fav_id = 0 ".
				"and relay_id = 0 and type='share' order by create_time desc limit 5";
				$user_topic = $GLOBALS['db']->getAll($sql);
				foreach($user_topic as $k=>$v){
					if(msubstr(preg_replace("/<[^>]+>/i","",$user_topic[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$user_topic[$k]['content'])){
						$user_topic[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$user_topic[$k]['content']),0,40);
					}else{
						$user_topic[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$user_topic[$k]['content']);
					}
				}
				$root['user_topic']=$user_topic;			
				
				$root['page_title']=$user_info['user_name']."的资料";
			}else{
				$root['user_info'] = $user_info;
				$root['page_title']="无此人";
			}
		
		
		output($root);
	}
}
?>