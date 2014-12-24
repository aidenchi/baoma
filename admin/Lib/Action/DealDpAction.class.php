<?php
// +----------------------------------------------------------------------
// | Fanwe 方维o2o商业系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://www.fanwe.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 云淡风轻(88522820@qq.com)
// +-----------------------------------------

class DealDpAction extends CommonAction
{
	public function index() {
		$reminder = M("RemindCount")->find();
		$reminder['msg_count_time'] = get_gmtime();
		$reminder['buy_msg_count_time'] = get_gmtime();
		M("RemindCount")->save($reminder);
		
		$map = $this->_search ();
		
		$map['rel_table'] = 'deal';
		$map['rel_id'] = intval($_REQUEST ['rel_id']);
		/*
		if(trim($_REQUEST['rel_table'])=='all')
		{
			unset($map['rel_table']);
		}		
		*/
		//追加默认参数
		if($this->get("default_map"))
		$map = array_merge($map,$this->get("default_map"));
		
		if (method_exists ( $this, '_filter' )) {
			$this->_filter ( $map );
		}
		//$name=$this->getActionName();
		$model = D ("Message");
		if (! empty ( $model )) {
			$this->_list ( $model, $map );
		}
		$this->display ();
		return;
	}
	
	public function edit() {		
		$id = intval($_REQUEST ['id']);
		$condition['id'] = $id;		
		$vo = M("Message")->where($condition)->find();	
		$this->assign ( 'vo', $vo );
		$this->display ();
	}
	
	public function foreverdelete() {
		//彻底删除指定记录
		$ajax = intval($_REQUEST['ajax']);
		$id = $_REQUEST ['id'];
		if (isset ( $id )) {
				$condition = array ('id' => array ('in', explode ( ',', $id ) ) );
				
				$rel_data = M("Message")->where($condition)->findAll();				
				foreach($rel_data as $data)
				{
					$info[] = $data['content'];	
				}
				if($info) $info = implode(",",$info);
				$list = M("Message")->where ( $condition )->delete();	
		
				if ($list!==false) {					
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
		$data = M("Message")->create ();
		$data['update_time'] = get_gmtime();
		$log_info = M("Message")->where("id=".intval($data['id']))->getField("content");
		//开始验证有效性
		$this->assign("jumpUrl",u("DealDp"."/edit",array("id"=>$data['id'])));
		if(!check_empty($data['admin_reply']))
		{
			$this->error(L("ADMIN_REPLY_EMPTY_TIP"));
		}
		// 更新数据
		$list=M("Message")->save ($data);
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