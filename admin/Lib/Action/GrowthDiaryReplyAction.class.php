<?php

class GrowthDiaryReplyAction extends CommonAction
{
	public function index() {		
		$map = $this->_search ();		
		$map['growth_diary_id'] = intval($_REQUEST ['growth_diary_id']);

		//追加默认参数
		if($this->get("default_map"))
		$map = array_merge($map,$this->get("default_map"));
		
		if (method_exists ( $this, '_filter' )) {
			$this->_filter ( $map );
		}
		//$name=$this->getActionName();
		$model = D ("growth_diary_reply");
		if (! empty ( $model )) {
			$this->_list ( $model, $map );
		}
		$this->display ();
		return;
	}
	
	public function edit() {		
		$id = intval($_REQUEST ['id']);
		$condition['id'] = $id;		
		$vo = M("growth_diary_reply")->where($condition)->find();	
		$this->assign ( 'vo', $vo );
		$this->display ();
	}
	
	public function foreverdelete() {
		//彻底删除指定记录
		$ajax = intval($_REQUEST['ajax']);
		$id = $_REQUEST ['id'];
		if (isset ( $id )) {
				$condition = array ('id' => array ('in', explode ( ',', $id ) ) );
				
				$rel_data = M("growth_diary_reply")->where($condition)->findAll();	
				$count =  M("growth_diary_reply")->where($condition)->count();	
				$growth_diary_id =  M("growth_diary_reply")->where($condition)->getField("growth_diary_id");	
				foreach($rel_data as $data)
				{
					$info[] = $data['content'];	
				}
				if($info) $info = implode(",",$info);
				$list = M("growth_diary_reply")->where ( $condition )->delete();	
		
				if ($list!==false) {	
					$GLOBALS['db']->query("update ".DB_PREFIX."growth_diary set reply_count = reply_count - ".$count." where id = ".$growth_diary_id);
					save_log($info.l("FOREVER_DELETE_SUCCESS"),1);
					$this->success (l("FOREVER_DELETE_SUCCESS"),$ajax);
				} else {
					save_log($info.l("FOREVER_DELETE_FAILED"),0);
					$this->error (l("FOREVER_DELETE_FAILED"),$ajax);
				}
			} else {
				$this->error (l("INVALID_OPERATION"),$ajax);
		}
	}	
	
	
	public function update() {
		B('FilterString');
		$data = M("growth_diary_reply")->create ();
		$log_info = M("growth_diary_reply")->where("id=".intval($data['id']))->getField("content");
		//开始验证有效性
		$this->assign("jumpUrl",u("GrowthDiaryReply"."/edit",array("id"=>$data['id'])));
		// 更新数据
		$list=M("growth_diary_reply")->save ($data);
		if (false !== $list) {
			//成功提示
			save_log($log_info.L("UPDATE_SUCCESS"),1);
			$this->success(L("UPDATE_SUCCESS"));
		} else {
			//错误提示
			save_log($log_info.L("UPDATE_FAILED"),0);
			$this->error(L("UPDATE_FAILED"),0,$log_info.L("UPDATE_FAILED"));
		}
	}	
	

}	
?>