<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />	
    <!-- Mobile Devices Support @begin -->
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="false" name="twcClient" id="twcClient">
    <meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="0" http-equiv="expires">
    <!--允许全屏模式-->
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <!--指定sari的样式-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta content="telephone=no" name="format-detection" />
    <!-- Mobile Devices Support @end -->
	<title><?php echo $this->_var['data']['page_title']; ?></title>
	<?php echo $this->fetch('./inc/common.html'); ?>
</head> 
<body>
	<?php echo $this->fetch('./inc/header.html'); ?>
	<?php echo $this->fetch('./inc/pop.html'); ?>
	
			<div class="wrap">
					<div class="blank8"></div>
					<div class="list-view">
						<div class="list_title">共<span id="myfans_count"><?php echo $this->_var['data']['total']; ?></span>人</div>
						 <?php if ($this->_var['data']['fans_list']): ?>
						 <ul class="">
						 <?php $_from = $this->_var['data']['fans_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'fans');if (count($_from)):
    foreach ($_from AS $this->_var['fans']):
?>
							<li class="focus_item_li">
						 	     	<div class="list_item">
						 	     		 <div class="focus_user_headimg">
											<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['fans']['id']."".""); 
?>'>
						 	     		 	<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['fans']['id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
											</a>
						 	     		 </div>
										 <div class="info">
											<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['fans']['id']."".""); 
?>'>
										 	<i><?php echo $this->_var['fans']['user_name']; ?></i>
											</a>
											&nbsp;&nbsp;
											<?php if ($this->_var['fans']['focused'] == 0): ?>
												<a href="javascript:void(0);" onclick="focus_user(<?php echo $this->_var['fans']['id']; ?>,this);" class="add_focus">关注TA</a>
											<?php else: ?>
												<a href="javascript:void(0);" onclick="focus_user(<?php echo $this->_var['fans']['id']; ?>,this);" class="remove_focus">取消关注</a>
											<?php endif; ?>
										 </div>
						 	     	</div>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>							
						 </ul>	
						<?php if ($this->_var['data']['page']['page_total'] > 1): ?>	
						<div class="fy">
							<?php echo $this->_var['pages']; ?>
						</div>
						<?php endif; ?>
						 <?php else: ?>
						 <div class="assess_list" style="text-align:center;padding:10px 0;">您还没有粉丝</div>
						 <?php endif; ?>
					</div><!--list-view end-->		
				 
			</div><!--wrap end-->	
	
	<?php echo $this->fetch('./inc/footer.html'); ?>				
	
	<script type="text/javascript">
	function focus_user(uid,o){
		var query = new Object();
		query.post_type = "json";
		var ajaxurl = APP_ROOT+"/index.php?ctl=userfocus&user_id="+uid;
		$.ajax({ 
			url:ajaxurl,
			data:query,
			type:"post",
			dataType:"json",
			success: function(data){
				if(data.tag==1)	{
					$(o).removeClass("add_focus");
					$(o).removeClass("remove_focus");
					$(o).addClass("remove_focus");
					$(o).html(data.html);
				}
				if(data.tag==2)	{
					$(o).removeClass("add_focus");
					$(o).removeClass("remove_focus");
					$(o).addClass("add_focus");
					$(o).html(data.html);
				}
				if(data.tag==3)	{
					alert(data.html);
				}
				if(data.tag==4)	{
					alert(data.html);
				}	
			},
			error:function(ajaxobj)	{
				alert("出现错误");
			}
		});	
	}
	</script>
					
</body>
</html>	
			