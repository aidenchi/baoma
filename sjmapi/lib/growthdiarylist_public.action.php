<?php
class growthdiarylist_public
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		
		$root = array();	
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		
		$root["login_user_id"] = intval($user_data['id']);
		$root["login_user_name"] = $user_data['user_name'];
		
			//公开成长日记			
			$condition = " where user_id = ".intval($user_data['id']);
			$page = intval($GLOBALS['request']['page']); //分页
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;
			$limit_sql=" limit ".$limit;
			
			$sql_count = "select count(*) from ".DB_PREFIX."growth_diary where is_public = 1";
			$total = $GLOBALS['db']->getOne($sql_count);
			$page_total = ceil($total/$page_size);
			
			$growth_diary_list = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."growth_diary where is_public = 1 order by create_time desc".$limit_sql);
			foreach($growth_diary_list as $k=>$v){
				if(msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content']),0,40)!=preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content'])){
					$growth_diary_list[$k]['short_content'] = msubstr(preg_replace("/<[^>]+>/i","",$growth_diary_list[$k]['content']),0,40);
				}else{
					$growth_diary_list[$k]['short_content'] = preg_replace("/<br[^>]+>/i","",$growth_diary_list[$k]['content']);
				}
				//图片内容
				if($v['has_pic'] == 1){
					$growth_diary_list[$k]['pic_list'] = array();
					$pic_ids_arr = explode(',',$v['pic_ids']);
					for($index=0;$index<count($pic_ids_arr);$index++){ 
						$img_id = $pic_ids_arr[$index];
						$img_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary_upload where id = ".$img_id);
						$img_item['small_preview_path']=str_replace("./public/","/public/",$img_item['small_preview_path']);
						$img_item['large_path']=str_replace("./public/","/public/",$img_item['large_path']);
						$growth_diary_list[$k]['pic_list'][$index] = $img_item;
					} 					
				}	
				//视频内容
				if($v['has_video'] == 1  && $v['video_ids'] != ''){
					$growth_diary_list[$k]['video_list'] = array();
					$video_ids_arr = explode(',',$v['video_ids']);
					for($index2=0;$index2<count($video_ids_arr);$index2++){ 
						$video_id = $video_ids_arr[$index2];
						$video_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary_upload where id = ".$video_id." and filetype = 'video'");
						$video_item['video_path']=str_replace("./public/","/public/",$video_item['large_path']);
						$growth_diary_list[$k]['video_list'][$index2] = $video_item;
					} 					
				}				
				//喜欢的数量
				$fav_sql_count = "select count(*) from ".DB_PREFIX."growth_diary_favorite where growth_diary_id = ".$v['id'];
				$fav_total = $GLOBALS['db']->getOne($fav_sql_count);
				$growth_diary_list[$k]['fav_count'] = intval($fav_total);				
				//当前登录者是否喜欢过这篇日记
				$growth_diary_list[$k]['is_fav'] = 0;
				if(intval($user_data['id']) > 0){
					$fav_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary_favorite where growth_diary_id = ".$v['id'].
					" and author_user_id != 0 and fav_user_id = ".intval($user_data['id']));
					if($fav_data){
						$growth_diary_list[$k]['is_fav'] = 1;
					}
				}
				//评论的数量
				$reply_sql_count = "select count(*) from ".DB_PREFIX."growth_diary_reply where growth_diary_id = ".$v['id'];
				$reply_count = $GLOBALS['db']->getOne($reply_sql_count);
				$growth_diary_list[$k]['reply_count'] = intval($reply_count);
			}
			$root['total'] = intval($total);
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			$root['growth_diary_list'] = $growth_diary_list;
			
			//最近一篇日记发表距离当天多久
			$sdate = 86400;
			$now_time = time();
			$last_growth_diary_time = $growth_diary_list[0]['create_time'];
			$diff_time = $now_time - $last_growth_diary_time;
			if($diff_time > $sdate){
				$day_time = floor($diff_time / $sdate);
			}else{
				$day_time = 0;
			}
			$root['day_time'] = intval($day_time);
			

		$root['page_title'] = "成长日记";
		$root['city_name']=$city_name;
		output($root);
	}
}
?>