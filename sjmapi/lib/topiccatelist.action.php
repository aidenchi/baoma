<?php
class topiccatelist
{
	public function index()
	{
		$root = array();
		$cate_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_tag_cate where showin_web = 1 order by sort desc limit 5");
		foreach($cate_list as $k=>$v){
			$cate_name = $v['name'];
			$unicode_cate_name = str_to_unicode_string($cate_name);
			$sql = "select * from ".DB_PREFIX."topic where is_effect = 1 and is_delete = 0 and fav_id = 0 and relay_id = 0 and ".
			"type in ('share') and match(cate_match) against('".$unicode_cate_name."'  IN BOOLEAN MODE) order by id desc limit 3";
			//$cate_list[$k]['one_cate_topic_list'] = "test".$k.$sql;
			$cate_list[$k]['one_cate_topic_list'] = $GLOBALS['db']->getAll($sql);
			foreach($cate_list[$k]['one_cate_topic_list'] as $k1=>$v1){
				if(msubstr(preg_replace("/<[^>]+>/i","",$cate_list[$k]['one_cate_topic_list'][$k1]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$cate_list[$k]['one_cate_topic_list'][$k1]['content'])){
					$cate_list[$k]['one_cate_topic_list'][$k1]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$cate_list[$k]['one_cate_topic_list'][$k1]['content']),0,40);
				}else{
					$cate_list[$k]['one_cate_topic_list'][$k1]['short_content'] = preg_replace("/<br[^>]+>/i","",$cate_list[$k]['one_cate_topic_list'][$k1]['content']);
				}
			}
			
		}
		
		$root['cate_list'] = $cate_list;
		$root['page_title']='论坛';
		output($root);
	}
}
?>