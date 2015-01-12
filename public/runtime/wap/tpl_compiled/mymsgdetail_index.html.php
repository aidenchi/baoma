<?php echo $this->fetch('./inc/header.html'); ?>
<style>
.msg_list_table {
	width:100%;
}
.msg_list_table td {
	line-height: 22px;
	padding: 10px;
	text-align: center;
}
.pm_pic {
	background: url(./images/sys_pm.gif) no-repeat;
	display: inline-block;
	width: 48px;
	height: 48px;
}
.new_pm {
	background: url(./images/new_pm.gif) no-repeat;
	display: inline-block;
	width: 18px;
	height: 12px;
}
.sys_msg_title {
	color: #FE7000;
	font-weight: bolder;
	font-size: 14px;
	padding: 10px;
	text-align: center;
}
.fans_user {
	width: 80px;
	height: 100px;
	margin: 10px;
	float: left;
	text-align: center;
}
</style>

<div class="wrap">
	<div class="content">
				<?php if ($this->_var['data']['page_flag'] != 0 && $this->_var['data']['page_flag'] != 1 && $this->_var['data']['page_flag'] != 2): ?>
					<div class="blank8"></div>
					<div class="list-view">
						<div class="assess_list" style="text-align:center;padding:10px 0;">抱歉，该页面不存在！</div>
					</div><!--list-view end-->			
				<?php endif; ?>
				
				<!--写私信-->
				<?php if ($this->_var['data']['page_flag'] == 0): ?>
					<div class="blank8"></div>
					<div class="list-view">
						<div class="list_title">给TA写信</div>
						<div style="padding:10px 10px; ">		
							<form id="mysendmsg_form" action='<?php
echo parse_wap_url_tag("u:index|mymsgsend#index|"."".""); 
?>' autocomplete="off" method="post" onsubmit="return check(this)">
								<table style="width:100%">
									<tr>
										<td colspan="2">
											<div style="color:#adadad;font-style:italic; padding-bottom:10px;">提示：请从底下列表中选择收件人。</div>
										</td>
									<tr>
									<tr>
										<td width=80>收件人:</td>
										<td>
											<div class="inputtxt3">
												<div class="input_sr"><input type="text" name="to_user_name" id="to_user_name" disabled="disabled" value=""></div>
											</div>											
										</td>
									</tr>
									<tr>
										<td>信息内容:</td>
										<td>
											<div class="myintro_txt">					
												<textarea name="content" id="content" maxlength=200 placeholder="点击输入您要发送的信息，最多200字"></textarea>				
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div class="btn_login">
												<input type="submit" name="Submit" class="mj-submit" value="发送" style="background: none;">
											</div>
										</td>
									</tr>
								</table>
							<form>
							<div class="blank8"></div>
							<table style="width:100%; color:#adadad;">									
								<tr>										
									<td>
										<!--
										<?php $_from = $this->_var['data']['fans_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'fans_item');if (count($_from)):
    foreach ($_from AS $this->_var['fans_item']):
?>		
											<div class="fans_user" style="cursor:pointer;" onclick="set_to_user('<?php echo $this->_var['fans_item']['user_name']; ?>');">					
												<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['fans_item']['id'],
  't' => 'small',
);
echo $k['name']($k['uid'],$k['t']);
?>' /> 		
												<br />	
												<?php echo $this->_var['fans_item']['user_name']; ?>
											</div>						
										<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
										-->
										<?php $_from = $this->_var['data']['user_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'user_item');if (count($_from)):
    foreach ($_from AS $this->_var['user_item']):
?>		
											<div class="fans_user" style="cursor:pointer;" onclick="set_to_user('<?php echo $this->_var['user_item']['user_name']; ?>');">					
												<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['user_item']['id'],
  't' => 'small',
);
echo $k['name']($k['uid'],$k['t']);
?>' /> 		
												<br />	
												<?php echo $this->_var['user_item']['user_name']; ?>
											</div>						
										<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
									</td>
								<tr>
								<tr>
									<td>
										<?php if ($this->_var['data']['page']['page_total'] > 1): ?> 
										<div class="fy">
											<?php echo $this->_var['pages']; ?>
										</div>
										<?php endif; ?>
									</td>
								<tr>									
							</table>
						</div>
					</div><!--list-view end-->	
				<?php endif; ?>
				
				<!--系统信息-->
				<?php if ($this->_var['data']['page_flag'] == 1): ?>
					<div class="blank8"></div>
					<div class="list-view">
						<div class="list_title">系统消息</div>
						<div class="sys_msg_title">
							系统消息:<?php echo $this->_var['data']['sys_msg']['title']; ?>	
						</div>
						<div style="padding:5px 10px; line-height:25px;">			
							<?php 
$k = array (
  'name' => 'nl2br',
  'v' => $this->_var['data']['sys_msg']['content'],
);
echo $k['name']($k['v']);
?>
						</div>
						<div style="padding:5px 10px; text-align: right;">							
							<span class="date" style="color:#999; font-size:12px;"><?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['data']['sys_msg']['create_time'],
);
echo $k['name']($k['v']);
?></span>
						</div>
					</div><!--list-view end-->		
				<?php endif; ?>
				
				<!--我与某某的私信-->
				<?php if ($this->_var['data']['page_flag'] == 2): ?>
					<div class="blank8"></div>
					<div class="list-view">
						<div class="list_title">我与<?php echo $this->_var['data']['dest_user_name']; ?>共<span id="my_msg_count"><?php echo $this->_var['data']['one_to_one_msg_count']; ?></span>条交流信息</div>						
						<!--------------------------------------------------信息记录------------------------------------------------>
						<?php if ($this->_var['data']['one_to_one_msg_list']): ?>
						<div style="padding-left:10px;padding-top:5px;">
							<input type="checkbox" name="checkall" />
							<a style="padding-left:18px;" href="javascript:void(0);" onclick="delete_msg()">删除</a>
						</div>
						<div>
						<form name="pm_list">	
							<table cellspacing="0" cellpadding="0" border="0" class="msg_list_table">
								<?php $_from = $this->_var['data']['one_to_one_msg_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'msg_item');if (count($_from)):
    foreach ($_from AS $this->_var['msg_item']):
?>
								<tbody id="msg_<?php echo $this->_var['msg_item']['id']; ?>">									
									<tr class="pm_row">
										<td width=15>					
											<input type="checkbox" value="<?php echo $this->_var['msg_item']['id']; ?>" name="id[]" />					
										</td>
										<td width="60">
											<?php if ($this->_var['msg_item']['system_msg_id'] == 0 && $this->_var['msg_item']['is_notice'] == 0): ?>
												<?php if ($this->_var['msg_item']['to_user_id'] == $this->_var['data']['login_user_id']): ?>
												<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['msg_item']['from_user_id']."".""); 
?>'>
													<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['msg_item']['from_user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
												</a>
												<?php endif; ?>
												<?php if ($this->_var['msg_item']['from_user_id'] == $this->_var['data']['login_user_id']): ?>
												<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['msg_item']['to_user_id']."".""); 
?>'>
													<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['data']['login_user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
												</a>
												<?php endif; ?>
											<?php endif; ?>
										</td>									
										<td valign="top" style="text-align:left;">										
											<?php if ($this->_var['msg_item']['system_msg_id'] == 0 && $this->_var['msg_item']['is_notice'] == 0): ?>
												<span style="color:#6E7D8B;">
												<?php if ($this->_var['msg_item']['from_user_id'] == $this->_var['data']['login_user_id']): ?>
													我
												<?php else: ?>
													<?php 
$k = array (
  'name' => 'get_user_name_by_user_id',
  'v' => $this->_var['msg_item']['from_user_id'],
);
echo $k['name']($k['v']);
?>
												<?php endif; ?>
												</span>												
												<!--
													对
												<?php if ($this->_var['msg_item']['to_user_id'] == $this->_var['data']['login_user_id']): ?>
													我
												<?php else: ?>
													<?php 
$k = array (
  'name' => 'get_user_name_by_user_id',
  'v' => $this->_var['msg_item']['to_user_id'],
);
echo $k['name']($k['v']);
?>
												<?php endif; ?>
												
													说：
												-->	：						
											<?php endif; ?>
											<br />
											<span style="color:#adadad;"><?php echo $this->_var['msg_item']['content']; ?></span>				
										</td>
										<td width="100" valign="top" style="text-align:right;">										
											<span style="color:#adadad;font-size:12px;"><?php 
$k = array (
  'name' => 'pass_date',
  'v' => $this->_var['msg_item']['create_time'],
);
echo $k['name']($k['v']);
?></span>								
										</td>
									</tr>
								</tbody>
								<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>							
							</table>
							<?php if ($this->_var['data']['page']['page_total'] > 1): ?> 
							<div class="fy">
								<?php echo $this->_var['pages']; ?>
							</div>
							<?php endif; ?>
						</form>
						</div>
						<!--------------------------------------------------发信息------------------------------------------------>
						<div style="padding: 10px 10px;">
							<form id="mysendmsg_form" action='<?php
echo parse_wap_url_tag("u:index|mymsgsend#index|"."".""); 
?>' autocomplete="off" method="post" onsubmit="return check(this)">
								<input type="hidden" name="to_user_name" id="to_user_name" value="<?php echo $this->_var['data']['dest_user_name']; ?>">
								<table style="width:100%">
									<tr>
										<td width=80 align="center">信息内容:</td>
										<td>
											<div class="myintro_txt">					
												<textarea name="content" id="content" maxlength=200 placeholder="点击输入您要发送的信息，最多200字"></textarea>				
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<div class="btn_login">
												<input type="submit" name="Submit" class="mj-submit" value="发送" style="background: none;">
											</div>
										</td>
									</tr>
								</table>
							<form>
						</div>	
						<?php else: ?>
						<div class="assess_list" style="text-align:center;padding:10px 0;">暂无</div>
						<?php endif; ?>
					</div><!--list-view end-->
				<?php endif; ?>
					
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("input[name='checkall']").click(function(){    
		if(this.checked){    
			$("input[name='id[]']").attr("checked", true);   
		}else{    
			$("input[name='id[]']").attr("checked", false); 
		}    
	});
});

function delete_msg(){
	var cbos = $("input[name='id[]']:checked");
	if(cbos.length==0){
		//alert("请选中您要删除的消息记录");
		$("#alert_content").html("请选中您要删除的消息记录！");
		$('#my-alert').modal({
			relatedTarget: this,
		});
		setTimeout(function(){
			$('#my-alert').modal('close');
		},2000);
	}else{
		 $("#confirm_content").html("您确定要删除选中的消息记录吗");
		 $('#my-confirm').modal({
			relatedTarget: this,
			onConfirm: function(options) {
				var msg_ids = $("input[name='id[]']:checked");
				//alert(msg_ids.length);
				var msg_ids_val = "";
				for (var i=0; i < msg_ids.length; i++) {
					msg_id_val = msg_ids[i].value;
					msg_ids_val = msg_ids_val+","+msg_id_val;
				}
				//alert(msg_ids_val);
				var query = new Object();
				query.msg_ids_val = msg_ids_val;
				query.post_type = "json";
				var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|mymsgdel#index|"."".""); 
?>';
				$.ajax({
					url:ajaxurl,
					data:query,
					type:"post",
					dataType:"json",
					success:function(data){
						//alert(data.msg_ids_val);
						location.reload();
					}
					,error:function(){
						//alert("服务器提交错误");
						$("#alert_content").html("服务器提交错误，请稍后重新操作");
						$('#my-alert').modal({
							relatedTarget: this,
						});
					}
				});
			},
			onCancel: function() {
				
			}
		  });
	}
}

function set_to_user(user_name){
	$("#to_user_name").val(user_name);
}

function  check(){	
	var form = $("#mysendmsg_form");	
	if($.trim($("#to_user_name").val()) == '')	{
		//alert("收件人不能为空！");
		$("#alert_content").html("收件人不能为空！");
		$('#my-alert').modal({
			relatedTarget: this,
		});
		setTimeout(function(){
			$('#my-alert').modal('close');
		},1000);
		return false;
	}
	if($.trim($("#content").val()) == '')	{
		//alert("信息内容不能为空！");
		$("#alert_content").html("信息内容不能为空！");
		$('#my-alert').modal({
			relatedTarget: this,
		});
		setTimeout(function(){
			$('#my-alert').modal('close');
		},1000);
		return false;
	}
	var query = new Object();
	query.to_user_name = $("#to_user_name").val();
	query.content = $("#content").val();
	query.post_type = "json";
	var ajaxurl = form.attr("action");
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 	
				//alert(data.info);
				window.location.href=data.href;
			}else{
				//alert(data.info);
				$("#alert_content").html(data.info);
				$('#my-alert').modal({
					relatedTarget: this,
				});
			}
		}
		,error:function(){
			//alert("服务器提交错误");
			$("#alert_content").html("服务器提交错误，请稍后重新操作");
			$('#my-alert').modal({
				relatedTarget: this,
			});
		}
	});	
		return false;
}
</script>

<?php echo $this->fetch('./inc/footer.html'); ?> 