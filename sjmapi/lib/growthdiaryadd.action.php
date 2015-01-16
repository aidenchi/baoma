<?php
class growthdiaryadd
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
			$root['page_title'] = "成长日历";
			
			$id = intval($GLOBALS['request']['id']);				
			$content = $GLOBALS['request']['content'];			
			$location = $GLOBALS['request']['location'];
			$is_public = intval($GLOBALS['request']['is_public']);
			$has_pic = intval($GLOBALS['request']['has_pic']);
			$pic_ids = $GLOBALS['request']['pic_ids'];
			$pic_ids = substr($pic_ids,1);
			$has_video = intval($GLOBALS['request']['has_video']);
			$video_ids = $GLOBALS['request']['video_ids'];
			$video_ids = substr($video_ids,1);
			$record_date = date('Y-m-d');//记录日期
			$record_date_arr = explode('-',$record_date); 
			$record_year = intval($record_date_arr[0]);
			$record_month = intval($record_date_arr[1]);
			$record_day = intval($record_date_arr[2]);
			
			//替换成表情图片
			$expression_replace_array = get_expression();
			$content = str_replace($expression_replace_array['search'],$expression_replace_array['replace'],$content);
			
			$growthdiary = array();
			$growthdiary['user_id'] = $user_data['id'];
			$growthdiary['user_name'] = $user_data['user_name'];
			$growthdiary['record_date'] = $record_date;
			$growthdiary['record_year'] = $record_year;
			$growthdiary['record_month'] = $record_month;
			$growthdiary['record_day'] = $record_day;
			$growthdiary['content'] = $content;
			$growthdiary['location'] = $location;
			$growthdiary['is_public'] = $is_public;
			$growthdiary['has_pic'] = $has_pic;
			$growthdiary['pic_ids'] = $pic_ids;
			$growthdiary['has_video'] = $has_video;
			$growthdiary['video_ids'] = $video_ids;
			$growthdiary['create_time'] = get_gmtime();			
			if($id==0){//新增insert记录操作
				$GLOBALS['db']->autoExecute(DB_PREFIX."growth_diary",$growthdiary,"INSERT","");
				$id = intval($GLOBALS['db']->insert_id());
				if($id>0){
					increase_user_active_growth_diary(intval($user_data['id']),"发表了一篇成长日记");
					$root['status']=1;
					$root['info']='提交成功';
					$root['action_flag']=0;
				}else{
					$root['status']=0;
					$root['info']='提交失败';
				}
			}else{//修改update记录操作
				$root['status']=0;
				$root['info']='修改失败';
				//$sql = "update ".DB_PREFIX."growth_diary set record_date = '".$record_date."', title = '".$title."', content = '".$content."' where id = ".$id;
				$sql = "update ".DB_PREFIX."growth_diary set content = '".$content."', location = '".$location."', is_public = '".$is_public."' where id = ".$id;
				$GLOBALS['db']->query($sql);
				$root['status']=1;
				$root['info']='修改成功';
				$root['action_flag']=1;
			}		
			
		}
		
		$root['city_name']=$city_name;
		output($root);
	}
}

function get_expression(){
	$qq_expression = $GLOBALS['db']->getAll("select * from ".DB_PREFIX."expression where type='qq'");
	foreach($qq_expression as $item){
		$search[] = $item['emotion'];
		$replace[] = "<img src='/public/expression/".$item['type']."/".$item['filename']."' alt='".$item['title']."' />";
	}
	$expression_replace_array['search'] = $search;
	$expression_replace_array['replace'] = $replace;
	return $expression_replace_array;
}
?>