<?php
class topiclist
{
	public function index()
	{
		$root = array();
		$cid = intval($GLOBALS['request']['cid']);//版块
		$page = intval($GLOBALS['request']['page']); //分页
		
		$cate_name =  $GLOBALS['db']->getOne("select name from ".DB_PREFIX."topic_tag_cate where id = ".$cid);
		$unicode_cate_name = str_to_unicode_string($cate_name);
		$condition.=" and match(cate_match) against('".$unicode_cate_name."'  IN BOOLEAN MODE) ";		
				
		$page=$page==0?1:$page;
		$page_size = PAGE_SIZE;//10
		$limit = (($page-1)*$page_size).",".$page_size;
		$limit_sql=" limit ".$limit;
		$sql_count = "select count(*) from ".DB_PREFIX."topic where is_effect = 1 and is_delete = 0  and fav_id = 0 ".
		"and relay_id = 0 and type='share' and cate_match_row != '' ".$condition." order by id desc";
		$total = $GLOBALS['db']->getOne($sql_count);
		$page_total = ceil($total/$page_size);
		
		$sql = "select * from ".DB_PREFIX."topic where is_effect = 1 and is_delete = 0  and fav_id = 0 and relay_id = 0 ".
		"and type='share' and cate_match_row != '' ".$condition." order by id desc".$limit_sql;	
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