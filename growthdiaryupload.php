<?php
	require './system/common.php';

	if (!is_dir(APP_ROOT_PATH."public/growth_diary")) { 
		@mkdir(APP_ROOT_PATH."public/growth_diary");
		@chmod(APP_ROOT_PATH."public/growth_diary", 0777);
	}
			
	$dir = to_date(get_gmtime(),"Ym");
	if (!is_dir(APP_ROOT_PATH."public/growth_diary/".$dir)) { 
		@mkdir(APP_ROOT_PATH."public/growth_diary/".$dir);
		@chmod(APP_ROOT_PATH."public/growth_diary/".$dir, 0777);
	}
				
	$dir = $dir."/".to_date(get_gmtime(),"d");
	if (!is_dir(APP_ROOT_PATH."public/growth_diary/".$dir)) { 
		@mkdir(APP_ROOT_PATH."public/growth_diary/".$dir);
		 @chmod(APP_ROOT_PATH."public/growth_diary/".$dir, 0777);
	}
			 
	$dir = $dir."/".to_date(get_gmtime(),"H");
	if (!is_dir(APP_ROOT_PATH."public/growth_diary/".$dir)) { 
		@mkdir(APP_ROOT_PATH."public/growth_diary/".$dir);
		@chmod(APP_ROOT_PATH."public/growth_diary/".$dir, 0777);
	}

	if(app_conf("IS_WATER_MARK")==1){
		$img_result = save_image_upload($_FILES,"growth_diary_image","growth_diary/".$dir,$whs=array('thumb'=>array(100,100,1,0)),1,1);
	}else{
		$img_result = save_image_upload($_FILES,"growth_diary_image","growth_diary/".$dir,$whs=array('thumb'=>array(100,100,1,0)),0,1);	
	}
	
	if(intval($img_result['error'])!=0)	{
		ajax_return($img_result);
	}
	
	$data['error'] = 0; 
	$message = $img_result['growth_diary_image']['thumb']['thumb']['url'];
	$message=str_replace("./public/","/public/",$message);
	$data['message'] = $message;
	$data['name'] = valid_str($_FILES['growth_diary_image']['name']);		
	
	//保存图像信息
	require_once APP_ROOT_PATH."system/utils/es_imagecls.php";
	$image = new es_imagecls();
	$info = $image->getImageInfo($img_result['growth_diary_image']['path']);		
	$image_data['filename'] = valid_str($_FILES['growth_diary_image']['name']);
	$image_data['filesize'] = filesize($img_result['growth_diary_image']['path']);
	$image_data['small_preview_path'] = $img_result['growth_diary_image']['thumb']['thumb']['url'];
	$image_data['large_path'] = $img_result['growth_diary_image']['url'];
	$image_data['create_time'] = get_gmtime();
	$GLOBALS['db']->autoExecute(DB_PREFIX."growth_diary_upload",$image_data);	
		
	$data['id'] = intval($GLOBALS['db']->insert_id());
		
	ajax_return($data);

?>