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
		$sql = "select id,title,brief,create_time,click_count from ".DB_PREFIX."article where is_effect = 1 order by sort desc";
		$sql.=" limit ".$limit;		
		$sql_count = "select count(*) from ".DB_PREFIX."article where is_effect = 1 ";
		$count = $GLOBALS['db']->getOne($sql_count);
		$article_list = $GLOBALS['db']->getAll($sql);
	
		$root['page'] = array("page"=>$page,"page_total"=>ceil($count/$page_size),"page_size"=>$page_size);		
		$root['return'] = 1;
		$root['count'] = intval($count);
		$root['article_list'] = $article_list;
		
		$root['page_title']='文章列表';
		
		output($root);		
	}
}
?>
