<?php
class growthdiarydel
{
	public function index()
	{
		$email = strim($GLOBALS['request']['email']);
		$pwd = strim($GLOBALS['request']['pwd']);	
		$city_name =strim($GLOBALS['request']['city_name']);//城市名称
		
		$root = array();		
		
		$user_data = user_check($email,$pwd);		
		$user_id = intval($user_data['id']);
		
		if($user_id == 0){
			$root['user_login_status'] = 0;
			$root['info'] = "请先登录";	
			$root['page_title'] = "登录";			
		}else{
			$root['user_login_status'] = 1;
			$root['page_title']='成长日历';
			$root['status']=0;
			$root['info']='删除失败';
			$id = intval($GLOBALS['request']['id']);
			//删除成长日记里的图片和视频记录
			
			$growth_diary_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."growth_diary where id = ".$id);
			
			if($growth_diary_item['has_pic'] == 1){
				$pic_ids_arr = explode(',',$growth_diary_item['pic_ids']);
				for($index=0;$index<count($pic_ids_arr);$index++){ 
					$GLOBALS['db']->query("delete from ".DB_PREFIX."growth_diary_upload where id = ".$pic_ids_arr[$index]);
				}
			}
			if($growth_diary_item['has_video'] == 1){
				$video_ids_arr = explode(',',$growth_diary_item['video_ids']);
				for($index2=0;$index2<count($video_ids_arr);$index2++){ 
					$GLOBALS['db']->query("delete from ".DB_PREFIX."growth_diary_upload where id = ".$video_ids_arr[$index2]);
				}
			}
			
			//删除成长日记记录
			$GLOBALS['db']->query("delete from ".DB_PREFIX."growth_diary where id = ".$id);
			
			$root['status']=1;
			$root['info']='删除成功'.$growth_diary_item['has_pic'];			
		}				
		
		$root['city_name']=$city_name;
		output($root);
	}
}
?>