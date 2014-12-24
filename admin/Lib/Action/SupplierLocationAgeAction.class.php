<?php

class SupplierLocationAgeAction extends CommonAction{
	public function index()
	{		
		$page_idx = intval($_REQUEST['p'])==0?1:intval($_REQUEST['p']);
		$page_size = C('PAGE_LISTROWS');
		$limit = (($page_idx-1)*$page_size).",".$page_size;
		
		if (isset ( $_REQUEST ['_order'] )) {
			$order = $_REQUEST ['_order'];
		}		
		//排序方式默认按照倒序排列
		//接受 sost参数 0 表示倒序 非0都 表示正序
		if (isset ( $_REQUEST ['_sort'] )) {
			$sort = $_REQUEST ['_sort'] ? 'asc' : 'desc';
		} else {
			$sort = $asc ? 'asc' : 'desc';
		}
		if($order=="")
			$order = "id";
		$orderby = "order by ".$order." ".$sort;
		
		$total = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."supplier_location_age");
		$list= $GLOBALS['db']->getAll("select * from ".DB_PREFIX."supplier_location_age $orderby limit ".$limit);

		$p = new Page ( $total, '' );
		$page = $p->show ();		
		
		$sortImg = $sort; //排序图标
		$sortAlt = $sort == 'desc' ? l("ASC_SORT") : l("DESC_SORT"); //排序提示
		$sort = $sort == 'desc' ? 1 : 0; //排序方式

		
		//模板赋值显示
		$this->assign ( 'sort', $sort );
		$this->assign ( 'order', $order );
		$this->assign ( 'sortImg', $sortImg );
		$this->assign ( 'sortType', $sortAlt );
			
		$this->assign ( 'list', $list );
		$this->assign ( "page", $page );
		$this->assign ( "nowPage",$p->nowPage);
			
		$this->display ();
		return;		
	}
	
	public function add()
	{
		$this->assign("new_sort", M("supplier_location_age")->max("sort")+1);

		$this->display();
	}
	
	public function insert() {
		B('FilterString');
		$ajax = intval($_REQUEST['ajax']);
		$data = M("supplier_location_age")->create ();

		//开始验证有效性
		$this->assign("jumpUrl",u("SupplierLocationAge/add"));
		if(!check_empty($data['name']))
		{
			$this->error(L("名称不能为空"));
		}	
		
		$log_info = $data['name'];
		if(M("supplier_location_age")->where("name='".$data['name']."'")->find()){
			$this->error("该年龄段已存在");
		}else{
			$list=M("supplier_location_age")->add($data);	
		}
		if (false !== $list) {
			//成功提示
			save_log($log_info.L("INSERT_SUCCESS"),1);
			$this->success(L("INSERT_SUCCESS"));
		} else {
			//错误提示
			save_log($log_info.L("INSERT_FAILED"),0);
			$this->error(L("INSERT_FAILED"));
		}
	}	
	
	public function edit() {		
		$id = intval($_REQUEST ['id']);
		$condition['id'] = $id;		
		$vo = M("supplier_location_age")->where($condition)->find();		
		$this->assign ( 'vo', $vo );
		$this->display ();
	}
	
	public function update() {
		B('FilterString');
		$data = M("supplier_location_age")->create ();
		
		$log_info = M("supplier_location_age")->where("id=".intval($data['id']))->getField("name");
		//开始验证有效性
		$this->assign("jumpUrl",u("SupplierLocationAge/edit",array("id"=>$data['id'])));
		if(!check_empty($data['name']))
		{
			$this->error("该年龄段已经存在");
		}	

		// 更新数据
		$list=M("supplier_location_age")->save ($data);
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
	
	
	
	public function foreverdelete() {
		//彻底删除指定记录
		$ajax = intval($_REQUEST['ajax']);
		$id = $_REQUEST ['id'];
		if (isset ( $id )) {
				$condition = array ('id' => array ('in', explode ( ',', $id ) ) );
				$list = M("supplier_location_age")->where ( $condition )->delete();	
			
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
	
}
?>