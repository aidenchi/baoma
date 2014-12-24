<?php
class index_wap
{
	public function index()
	{		
		$root = array();
		$root['return'] = 1;
		
		$city_id =intval($GLOBALS['request']['city_id']);
		$city_name =strim($GLOBALS['request']['city_name']);	
		
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		//检查用户,用户密码
		$user_data = user_check($email,$pwd);
		$root["login_user_id"] = intval($user_data['id']);

		$root['city_id']=$city_id;
		$root['city_name']=$city_name;
		
		//广告列表
		$adv_list = $GLOBALS['db']->getAll(" select * from ".DB_PREFIX."m_adv where page = 'wap' and city_id in (0,1,".intval($city_id).") and status = 1 order by sort desc ");		
		foreach($adv_list as $k=>$v){
			$adv_list[$k]['img']=str_replace("./public/","/public/",$adv_list[$k]['img']);
			//$adv_list[$k]['img'] = get_abs_img_root($v['img']);//get_abs_img_root(get_spec_image($v['img'],640,100,0));
			//$adv_list[$k]['img2'] = get_spec_image($v['img'],640,100,1);
		}
		$root['adv_list'] = $adv_list;
				
		//文章列表（活动信息）
		$article_list = $GLOBALS['db']->getAll(" select * from ".DB_PREFIX."article where is_effect = 1 order by sort desc limit 5");
		$root['article_list'] = $article_list;
		
		//论坛精选（二手交易）
		$esjy_topic_ids = get_topicId_by_cateId(4);
		$esjy_sql = "select * from ".DB_PREFIX."topic where id in ".$esjy_topic_ids." and is_effect = 1 and is_delete = 0  and fav_id = 0 and relay_id = 0 ".
		"and type='share' order by create_time desc limit 20";
		$esjy_topic_list = $GLOBALS['db']->getAll($esjy_sql);
		foreach($esjy_topic_list as $k=>$v){
			if(msubstr(preg_replace("/<[^>]+>/i","",$esjy_topic_list[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$esjy_topic_list[$k]['content'])){
				$esjy_topic_list[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$esjy_topic_list[$k]['content']),0,40);
			}else{
				$esjy_topic_list[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$esjy_topic_list[$k]['content']);
			}
		}
		$root['esjy_topic_list'] = $esjy_topic_list;
		
		//优惠活动
		$yhhd_topic_ids = get_topicId_by_cateId(3);
		$yhhd_sql = "select * from ".DB_PREFIX."topic where id in ".$yhhd_topic_ids." and is_effect = 1 and is_delete = 0  and fav_id = 0 and relay_id = 0 ".
		"and type='share' order by create_time desc limit 5";
		$yhhd_topic_list = $GLOBALS['db']->getAll($yhhd_sql);
		foreach($yhhd_topic_list as $k=>$v){
			if(msubstr(preg_replace("/<[^>]+>/i","",$yhhd_topic_list[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$yhhd_topic_list[$k]['content'])){
				$yhhd_topic_list[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$yhhd_topic_list[$k]['content']),0,40);
			}else{
				$yhhd_topic_list[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$yhhd_topic_list[$k]['content']);
			}
		}
		$root['yhhd_topic_list'] = $yhhd_topic_list;
		
		
		$root['page_title'] = $GLOBALS['m_config']['program_title'];
		output($root);
	}
}

function get_topicId_by_cateId($cate_id){
		$topic_id_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."topic_cate_link where cate_id = ".intval($cate_id));
		$topic_ids = '';
		foreach($topic_id_list as $k=>$v){
			$topic_ids = $topic_ids.$v['topic_id'].',';
		}
		$topic_ids = substr($topic_ids,0,-1);
		$topic_ids = '('.$topic_ids.')';
		return $topic_ids;
}
?>