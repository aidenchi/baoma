<?php
class growthdiaryitem
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
				
		$id = intval($GLOBALS['request']['id']);
		
		//点击量加1
		$u_sql = "update ".DB_PREFIX."growth_diary set hit_count = hit_count + 1 where id = ".$id;
		$GLOBALS['db']->query($u_sql);
		
		$condition = " where id = ".$id;
		$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary".$condition);
		if($growth_diary_item){
			$growth_diary_item['exit'] = 1;
			//图片
			if($growth_diary_item['has_pic'] == 1){
				$growth_diary_item['pic_list'] = array();
				$pic_ids_arr = explode(',',$growth_diary_item['pic_ids']);
				for($index=0;$index<count($pic_ids_arr);$index++){ 
					$img_id = $pic_ids_arr[$index];
					$img_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary_upload where id = ".$img_id);
					$img_item['small_preview_path']=str_replace("./public/","/public/",$img_item['small_preview_path']);
					$img_item['large_path']=str_replace("./public/","/public/",$img_item['large_path']);
					$growth_diary_item['pic_list'][$index] = $img_item;
				} 					
			}
			//喜欢的数量
			$fav_sql_count = "select count(*) from ".DB_PREFIX."growth_diary_favorite where growth_diary_id = ".$id;
			$fav_total = $GLOBALS['db']->getOne($fav_sql_count);
			$growth_diary_item['fav_count'] = intval($fav_total);	
			//当前登录者是否喜欢过这篇日记
			$growth_diary_item['is_fav'] = 0;
			if(intval($user_data['id']) > 0){
				$fav_data = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary_favorite where growth_diary_id = ".$id.
				" and author_user_id != 0 and fav_user_id = ".intval($user_data['id']));
				if($fav_data){
					$growth_diary_item['is_fav'] = 1;
				}
			}	
			//评论
			$page = intval($GLOBALS['request']['page']); //分页
			$page=$page==0?1:$page;
			$page_size = PAGE_SIZE;//10
			$limit = (($page-1)*$page_size).",".$page_size;
			$limit_sql=" limit ".$limit;
			$reply_sql_count = "select count(*) from ".DB_PREFIX."growth_diary_reply where growth_diary_id = ".$id;
			$reply_count = $GLOBALS['db']->getOne($reply_sql_count);
			$page_total = ceil($reply_count/$page_size);
			$reply_sql = "select * from ".DB_PREFIX."growth_diary_reply where growth_diary_id = ".$id." order by create_time asc".$limit_sql;
			$reply_list = $GLOBALS['db']->getAll($reply_sql);			
			$growth_diary_item['reply_count'] = intval($reply_count);	
			$growth_diary_item['reply_list'] = $reply_list;	
			$root['page'] = array("page"=>$page,"page_total"=>$page_total,"page_size"=>$page_size);
			
		}else{
			$growth_diary_item['exit'] = 0;
		}	
		
		$root['growth_diary_item']=$growth_diary_item;
		$root['page_title'] = "成长日记详情";			
		
		/*
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$root['page_title'] = "成长日记详情";
			
			$id = intval($GLOBALS['request']['id']);
			$condition = " where user_id = ".intval($user_data['id'])." and id = ".$id;
			$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary".$condition);
			$root['growth_diary_item']=$growth_diary_item;
		}
		*/
		$root['city_name']=$city_name;
		output($root);
	}
}
?>