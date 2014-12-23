<?php


class TopicImageAction extends CommonAction{
	public function delete()
	{
		$id = intval($_REQUEST['id']);
		$data = M("TopicImage")->getById($id);
		if(!$data)
		$this->ajaxReturn(l("IMAGE_NOT_EXIST"),"",0);
		
		$info = $data['topic_id'].l("TOPIC_IMAGE");
		@unlink(APP_ROOT_PATH.$data['path']);
		@unlink(APP_ROOT_PATH.$data['o_path']);
		M("TopicImage")->where("id=".$id)->delete();
		save_log($info.l("DELETE_SUCCESS"),0);
		$this->ajaxReturn("","",1);
	}
	
}
?>