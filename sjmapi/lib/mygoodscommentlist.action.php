<?php
class mygoodscommentlist
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
			$sql_count = "select count(*) from ".DB_PREFIX."message as m where m.pid = 0 and m.city_id =".$city_id." and m.user_id = ".intval($user_data['id']);
			$total = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($total/$page_size);
			
			$sql = "select m.id,m.rel_id,m.content,m.create_time,m.point,u.user_name,m.user_id,m.title from ".DB_PREFIX.
			"message as m left join ".DB_PREFIX."user as u on u.id=m.user_id where m.pid = 0 and m.city_id =".
			$city_id." and m.user_id = ".intval($user_data['id'])." and m.rel_table = 'deal' and m.is_buy = 1 order by m.create_time desc".$limit_sql;

			$list = $GLOBALS['db']->getAll($sql);
			foreach($list as $k=>$v){
				$list[$k]['goods_id']=$v['rel_id'];
				$list[$k]['goods_name'] = $GLOBALS['db']->getOne("select name from ".DB_PREFIX."deal where id = ".$list[$k]['goods_id']);
				$list[$k]['create_time_format']=getBeforeTimelag($v['create_time']);
				$list[$k]['width']= ($v['point'] / 5) * 100;				
			}
			
			$root['my_goods_comment_count']=$total;
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['my_goods_comment_list']=$list;
			
			//我的店铺点评总数
			$sql_count1 = "select count(*) from ".DB_PREFIX."supplier_location_dp where user_id= ".intval($user_data['id'])." and status = 1 order by create_time desc";
			$total1 = $GLOBALS['db']->getOne($sql_count1);
			$root['my_supplier_comment_count']=$total1;
		}
		
		$root['page_title']="我的点评";
		output($root);
	}
}
?>