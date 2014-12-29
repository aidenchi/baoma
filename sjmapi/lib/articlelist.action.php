<?php

class articlelist
{
	public function index(){
		
		//分页
		$page = intval($GLOBALS['request']['page']);
		if($page==0)
			$page = 1;
		
		$root = array();
		
		/*
		$cate_id = intval($GLOBALS['request']['cate_id']);
		if ($cate_id == 0)		
			$cate_id =intval($GLOBALS['m_config']['article_cate_id']);
		*/
		$page_size = PAGE_SIZE;
		//分页
		$limit = (($page-1)*$page_size).",".$page_size;		
		$sql = "select * from ".DB_PREFIX."event where is_effect = 1 order by sort,id desc";
		$sql.=" limit ".$limit;		
		$sql_count = "select count(*) from ".DB_PREFIX."event where is_effect = 1 ";
		$count = $GLOBALS['db']->getOne($sql_count);
		$article_list = $GLOBALS['db']->getAll($sql);
		foreach($article_list as $k1=>$v1){
			$article_list[$k1]['icon']=str_replace("./public/","/public/",$article_list[$k1]['icon']);
		}
		
		$root['page'] = array("page"=>$page,"page_total"=>ceil($count/$page_size),"page_size"=>$page_size);		
		$root['return'] = 1;
		$root['count'] = intval($count);
		$root['article_list'] = $article_list;
		
		$root['page_title']='活动列表';
		
		output($root);		
	}
}
?>
