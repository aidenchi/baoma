<?php
class topiclist
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		
		$root = array();
		$root["login_user_id"] = intval($user_data['id']);
		
		$cid = intval($GLOBALS['request']['cid']);//版块
		$page = intval($GLOBALS['request']['page']); //分页
		
		$cate_name =  $GLOBALS['db']->getOne("select name from ".DB_PREFIX."topic_tag_cate where id = ".$cid);
		
		$topic_id_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_cate_link where cate_id = ".$cid);
		$topic_ids = '';
		foreach($topic_id_list as $k=>$v){
			$topic_ids = $topic_ids.$v['topic_id'].',';
		}
		$topic_ids = substr($topic_ids,0,-1);
		$topic_ids = '('.$topic_ids.')';
		$condition = " id in ".$topic_ids." and";
				
		$page=$page==0?1:$page;
		$page_size = PAGE_SIZE;//10
		$limit = (($page-1)*$page_size).",".$page_size;
		$limit_sql=" limit ".$limit;
		$sql_count = "select count(*) from ".DB_PREFIX."topic where ".$condition." is_effect = 1 and is_delete = 0  and fav_id = 0 ".
		"and relay_id = 0 and type='share' order by create_time desc";
		$total = $GLOBALS['db']->getOne($sql_count);
		$page_total = ceil($total/$page_size);
		
		$sql = "select * from ".DB_PREFIX."topic where ".$condition." is_effect = 1 and is_delete = 0  and fav_id = 0 and relay_id = 0 ".
		"and type='share' order by create_time desc".$limit_sql;	
		$one_cate_topic_list = $GLOBALS['db']->getAll($sql);
		foreach($one_cate_topic_list as $k=>$v){
			if(msubstr(preg_replace("/<[^>]+>/i","",$one_cate_topic_list[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$one_cate_topic_list[$k]['content'])){
				$one_cate_topic_list[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$one_cate_topic_list[$k]['content']),0,40);
			}else{
				$one_cate_topic_list[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$one_cate_topic_list[$k]['content']);
			}
		}
		
		$root['total'] = $total;
		$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
		$root['one_cate_topic_list']=$one_cate_topic_list;
		$root['cate_name']=$cate_name;		
		$root['page_title']='帖子列表';
		output($root);
	}
}
?>