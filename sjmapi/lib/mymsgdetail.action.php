<?php
class mymsgdetail
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
			$group_key = addslashes(trim($_REQUEST['id']));
			$row_sql = "select count(*) as count,max(system_msg_id) as system_msg_id,max(id) as id,max(is_notice) as is_notice from ".DB_PREFIX."msg_box  
				where is_delete = 0 and ((to_user_id = ".intval($user_data['id'])." and `type` = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1))  
				and group_key = '".$group_key."'";
			$row = $GLOBALS['db']->getRow($row_sql);
			if($row['count']==0){
				//没有消息对象， 直接创建消息	
				//查出fans列表			
				$page = intval($GLOBALS['request']['page']); //分页
				$page=$page==0?1:$page;
				$page_size = PAGE_SIZE;//10
				$limit = (($page-1)*$page_size).",".$page_size;				
				$fans_count = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."user_focus where focused_user_id = ".intval($user_data['id']));
				$page_total = ceil($fans_count/$page_size);			
				//输出粉丝
				$fans_list = $GLOBALS['db']->getAll("select focus_user_id as id,focus_user_name as user_name from ".DB_PREFIX."user_focus where focused_user_id = ".
				intval($user_data['id'])." order by id desc limit ".$limit);
				
				$root['fans_count']=intval($fans_count);
				$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
				$root['fans_list']=$fans_list;
				$root['page_flag']=0;
				$root['page_title']="写私信";
			}else if($row['system_msg_id']>0||$row['is_notice']==1){
				//系统消息，仅查看
				$sys_msg = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."msg_box where id = ".$row['id']." and is_delete = 0");
				$GLOBALS['db']->query("update ".DB_PREFIX."msg_box set is_read = 1 where id = ".$row['id']);
				$root['sys_msg']=$sys_msg;
				$root['page_flag']=1;
				$root['page_title']="系统消息";
			}else{
				//消息记录
				$page = intval($GLOBALS['request']['page']); //分页
				$page=$page==0?1:$page;
				$page_size = PAGE_SIZE;//10
				$limit = (($page-1)*$page_size).",".$page_size;
				$sql = "select * from ".DB_PREFIX."msg_box  
						where is_delete = 0 and ((to_user_id = ".intval($user_data['id'])." and `type` = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1))  
						and group_key = '".$group_key."' 
						order by create_time desc limit ".$limit;
				$sql_count = "select count(*) from ".DB_PREFIX."msg_box  
						where is_delete = 0 and ((to_user_id = ".intval($user_data['id'])." and `type` = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1)) and group_key = '".$group_key."'";
			
				$upd_sql = "update ".DB_PREFIX."msg_box set is_read = 1 
						where is_delete = 0 and ((to_user_id = ".intval($user_data['id'])." and `type` = 0) or (from_user_id = ".intval($user_data['id'])." and `type` = 1))  
						and group_key = '".$group_key."' ";
						
				$GLOBALS['db']->query($upd_sql);
				$one_to_one_msg_count = $GLOBALS['db']->getOne($sql_count);
				$one_to_one_msg_list = $GLOBALS['db']->getAll($sql);
				foreach($one_to_one_msg_list as $k=>$v)
				{
					if($v['to_user_id']!=intval($user_data['id']))
					{
						$dest_user_id = $v['to_user_id'];
						break;
					}
					if($v['from_user_id']!=intval($user_data['id']))
					{
						$dest_user_id = $v['from_user_id'];
						break;
					}
				}				
				$dest_user_name = $GLOBALS['db']->getOne("select user_name from ".DB_PREFIX."user where id = ".$dest_user_id);				
				
				$root['one_to_one_msg_count']=intval($one_to_one_msg_count);
				$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
				$root['one_to_one_msg_list']=$one_to_one_msg_list;
				$root['page_flag']=2;
				$root['page_title']="我与".$dest_user_name."的私信";
			}
		}	
		
		output($root);
	}
}
?>