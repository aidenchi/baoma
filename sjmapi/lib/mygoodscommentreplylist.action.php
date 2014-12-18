<?php
class mygoodscommentreplylist
{
	public function index()
	{	
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		$city_id =strim($GLOBALS['request']['city_id']);//城市名称
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
			$limit_sql=" limit ".$limit;
			$sql_count = "select count(*) from ".DB_PREFIX."message as m where m.rel_table = 'deal' and m.is_buy = 1 and m.pid = 0 and m.city_id =".$city_id." and m.user_id = ".intval($user_data['id']).
			" and m.admin_reply != '' and m.update_time != 0";
			$total = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($total/$page_size);
			
			$sql = "select m.id,m.rel_id,m.is_effect,m.content,m.create_time,m.point,m.admin_reply,m.update_time,u.user_name,m.user_id,m.title from ".DB_PREFIX.
			"message as m left join ".DB_PREFIX."user as u on u.id=m.user_id where m.rel_table = 'deal' and m.is_buy = 1 and m.pid = 0 and m.city_id =".
			$city_id." and m.user_id = ".intval($user_data['id'])." and m.admin_reply != '' and m.update_time != 0 order by m.create_time desc".$limit_sql;

			$list = $GLOBALS['db']->getAll($sql);
			foreach($list as $k=>$v){
				$list[$k]['goods_id']=$v['rel_id'];
				$list[$k]['goods_name'] = $GLOBALS['db']->getOne("select name from ".DB_PREFIX."deal where id = ".$list[$k]['goods_id']);
				$list[$k]['update_time_format']=getBeforeTimelag($v['update_time']);
				$list[$k]['create_time_format']=getBeforeTimelag($v['create_time']);
				$list[$k]['width']= ($v['point'] / 5) * 100;				
			}
			
			$root['my_goods_comment_count']=$total;
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['my_goods_comment_list']=$list;

		}
		
		$root['page_title']="我的评论回复";
		output($root);
	}
}
?>