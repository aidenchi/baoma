<?php
class topiccatelist
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
		
		$cate_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_tag_cate where showin_web = 1 order by sort desc");
		foreach($cate_list as $k=>$v){
			$topic_id_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_cate_link where cate_id = ".$v['id']);
			$topic_ids = '';
			foreach($topic_id_list as $k0=>$v0){
				$topic_ids = $topic_ids.$v0['topic_id'].',';
			}
			$topic_ids = substr($topic_ids,0,-1);
			$topic_ids = '('.$topic_ids.')';
			//$cate_list[$k]['topic_ids'] = $topic_ids;
			
			$sql = "select * from ".DB_PREFIX."topic where id in ".$topic_ids." and is_effect = 1 and is_delete = 0 and fav_id = 0 and relay_id = 0 and ".
			"type in ('share') order by create_time desc limit 3";
			//$cate_list[$k]['sql'] = $sql;
	
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