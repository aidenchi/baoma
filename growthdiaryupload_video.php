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
	
	$ext = addslashes(strtolower(substr(strrchr($_FILES['growth_diary_video']['name'], '.'), 1, 10)));
	
	$video_ext  = array('mp4');
	if(in_array($ext, $video_ext)){//检验视频格式
		$error = 0;
	}else{
		$error = 1;//格式不对
		$data['error'] = $error;
		ajax_return($data);
	}
	
	//判断大小
	if($_FILES['growth_diary_video']['size'] > $MAX_SIZE){
		$error = 2;//文件太大
		$data['error'] = $error;
		ajax_return($data);
	}		
	
	if($error == 0){
		//给文件重命名
		$prefix = md5(microtime(true)).rand(10,99);
		$file_name = $prefix.'.'.$ext;
		$file_path = APP_ROOT_PATH."public/growth_diary/" . $dir . "/" . $file_name;
		if(!move_uploaded_file( $_FILES['growth_diary_video']['tmp_name'], $file_path)) {  
			$error = 3;//上传出错
			$data['error'] = $error;
			ajax_return($data);
		}else{//上传成功
			//存入数据库
			$video_data['filetype'] = 'video';
			$video_data['filename'] = $_FILES['growth_diary_video']['name'];
			$video_data['filesize'] =  $_FILES['growth_diary_video']['size'];
			$video_data['small_preview_path'] = '';
			$video_data['large_path'] = "./public/growth_diary/" . $dir . "/" . $file_name;
			$video_data['create_time'] = get_gmtime();
			$GLOBALS['db']->autoExecute(DB_PREFIX."growth_diary_upload",$video_data);	
			$data['id'] = intval($GLOBALS['db']->insert_id());
			$data['error'] = 0;
			$data['video_path'] = "/public/growth_diary/" . $dir . "/" . $file_name;
			
			ajax_return($data);
		}
	}
	
	$data['error'] = $error;
	ajax_return($data);

?>