<?php
	require './system/common.php';
	
	$MAX_SIZE = 20000000;//文件最大大小   
	
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
	
	if($_FILES['growth_diary_video']['type'] == 'video/mp4'){//检验视频格式，未写完
		$error = 0;
	}else{
		$error = 1;//格式不对
	}
	
	//判断大小
	if($_FILES['growth_diary_video']['size'] > $MAX_SIZE){
		$error = 2;//文件太大
	}		
	
	if($error == 0){
		//给文件重命名暂未写	
		//………………
		$file_path = APP_ROOT_PATH."public/growth_diary/" . $dir . "/" . $_FILES['growth_diary_video']['name'];
		if(!move_uploaded_file( $_FILES['growth_diary_video']['tmp_name'], $file_path)) {  
			$error = 3;//上传出错
		}else{//上传成功
			//存入数据库
			/*
			$image_data['filename'] = $_FILES['growth_diary_video']['name'];
			$image_data['filesize'] =  $_FILES['growth_diary_video']['size'];
			$image_data['small_preview_path'] = '';
			$image_data['large_path'] = $file_path;
			$image_data['create_time'] = get_gmtime();
			$GLOBALS['db']->autoExecute(DB_PREFIX."growth_diary_upload",$image_data);	
			*/			
		}
	}

	
	$data['error'] = $error;
	//$data['id'] = intval($GLOBALS['db']->insert_id());
		
	ajax_return($data);

?>