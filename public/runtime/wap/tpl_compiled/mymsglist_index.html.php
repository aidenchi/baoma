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
</style>
	
<div class="wrap">
	<div class="content">
					<div class="blank8"></div>
					<div class="list-view">
						<div class="list_title">
							我的私信(共<span id="my_msg_count"><?php echo $this->_var['data']['msg_count']; ?></span>条)
							<i style="float:right;font-size:12px;"><a href='<?php
echo parse_wap_url_tag("u:index|mymsgdetail#index|"."".""); 
?>'>写私信</a></i>
						</div>
						<?php if ($this->_var['data']['msg_list']): ?>
						<div style="padding-left:10px;padding-top:5px;">
							<input type="checkbox" name="checkall" />
							<a style="padding-left:18px;" href="javascript:void(0);" onclick="delete_msg()">删除</a>
						</div>
						<form name="pm_list">	
						 <table cellspacing="0" cellpadding="0" border="0" class="msg_list_table">
							<tbody>
								<?php $_from = $this->_var['data']['msg_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'msg_item');if (count($_from)):
    foreach ($_from AS $this->_var['msg_item']):
?>
								<tr class="pm_row">
									<td width="15">					
										<input type="checkbox" value="<?php echo $this->_var['msg_item']['group_key']; ?>" name="pm_key[]">					
									</td>
									<td width="15">
										<?php if ($this->_var['msg_item']['system_msg_id'] != 0 || $this->_var['msg_item']['is_notice']): ?><span class="pm_pic"></span><?php endif; ?>
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
  'uid' => $this->_var['msg_item']['to_user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
											</a>
											<?php endif; ?>
										<?php endif; ?>
									</td>									
									<td style="text-align:left;">										
										<?php if ($this->_var['msg_item']['type'] == 0 && $this->_var['msg_item']['is_read'] == 0): ?><span class="new_pm"></span><?php endif; ?>		
										<?php if ($this->_var['msg_item']['system_msg_id'] != 0 || $this->_var['msg_item']['is_notice']): ?>
											<?php if ($this->_var['msg_item']['is_notice']): ?>
												系统通知:
											<?php else: ?>
												系统消息:
											<?php endif; ?>
											<span style="font-weight:bolder;"><?php echo $this->_var['msg_item']['title']; ?></span>
										<?php endif; ?>
										<?php if ($this->_var['msg_item']['system_msg_id'] == 0 && $this->_var['msg_item']['is_notice'] == 0): ?>		
											<?php if ($this->_var['msg_item']['from_user_id'] == $this->_var['data']['login_user_id']): ?>
												我
											<?php else: ?>
												<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['msg_item']['to_user_id']."".""); 
?>'>
												<?php 
$k = array (
  'name' => 'get_user_name_by_user_id',
  'v' => $this->_var['msg_item']['from_user_id'],
);
echo $k['name']($k['v']);
?>
												</a>
											<?php endif; ?>
												对
											<?php if ($this->_var['msg_item']['to_user_id'] == $this->_var['data']['login_user_id']): ?>
												我
											<?php else: ?>
												<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['msg_item']['to_user_id']."".""); 
?>'>
												<?php 
$k = array (
  'name' => 'get_user_name_by_user_id',
  'v' => $this->_var['msg_item']['to_user_id'],
);
echo $k['name']($k['v']);
?>
												</a>
											<?php endif; ?>
												说:									
										<?php endif; ?>
										<br />
										<a href='<?php
echo parse_wap_url_tag("u:index|mymsgdetail#index|"."id=".$this->_var['msg_item']['group_key']."".""); 
?>'>
											<?php 
$k = array (
  'name' => 'msubstr',
  'v' => $this->_var['msg_item']['content'],
  'b' => '0',
  'e' => '15',
);
echo $k['name']($k['v'],$k['b'],$k['e']);
?>
										</a>&nbsp;&nbsp;
										<a href='<?php
echo parse_url_tag("u:index|mymsgdetail#index|"."id=".$this->_var['msg_item']['group_key']."".""); 
?>' class="view_pm">
											<?php if ($this->_var['msg_item']['system_msg_id'] == 0 && $this->_var['msg_item']['type'] == 0 && $this->_var['msg_item']['is_notice'] == 0): ?>
												[查看回复]
											<?php else: ?>
												[查看]			
											<?php endif; ?>			
										</a>								
									</td>
									<td width="80" style="text-align:right;">
										<?php 
$k = array (
  'name' => 'sprintf',
  'f' => '共%s封',
  'v' => $this->_var['msg_item']['total'],
);
echo $k['name']($k['f'],$k['v']);
?>
										<br />
										<?php 
$k = array (
  'name' => 'pass_date',
  'v' => $this->_var['msg_item']['create_time'],
);
echo $k['name']($k['v']);
?>			
									</td>
								</tr>				
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>								
							</tbody>
						</table>
						<?php if ($this->_var['data']['page']['page_total'] > 1): ?>  
						<div class="fy">
							<?php echo $this->_var['pages']; ?>
						</div>
						</form>
						<?php endif; ?>
						<?php else: ?>
						<div class="assess_list" style="text-align:center;padding:10px 0;">暂无私信</div>
						<?php endif; ?>
					</div><!--list-view end-->
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("input[name='checkall']").click(function(){    
		if(this.checked){    
			$("input[name='pm_key[]']").attr("checked", true);   
		}else{    
			$("input[name='pm_key[]']").attr("checked", false); 
		}    
	});
});

function delete_msg(){
	var cbos = $("input[name='pm_key[]']:checked");
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
				var group_keys = $("input[name='pm_key[]']:checked");
				//alert(group_keys.length);
				var group_keys_val = "";
				for (var i=0; i < group_keys.length; i++) {
					group_key_val = group_keys[i].value;
					group_keys_val = group_keys_val+","+group_key_val;
				}
				//alert(group_keys_val);
				var query = new Object();
				query.group_keys_val = group_keys_val;
				query.post_type = "json";
				var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|mymsgdelbykey#index|"."".""); 
?>';
				$.ajax({
					url:ajaxurl,
					data:query,
					type:"post",
					dataType:"json",
					success:function(data){
						//alert(data.group_keys_val);
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
</script>

<?php echo $this->fetch('./inc/footer.html'); ?> 