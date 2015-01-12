<?php echo $this->fetch('./inc/header.html'); ?>
			<div class="wrap">
					<div class="blank8"></div>
					<div class="list-view">
						<div class="list_title">共<span id="myfocus_count"><?php echo $this->_var['data']['total']; ?></span>人</div>
						 <?php if ($this->_var['data']['focus_list']): ?>						
						 <ul class="">
						 <?php $_from = $this->_var['data']['focus_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'focus');if (count($_from)):
    foreach ($_from AS $this->_var['focus']):
?>
							<li class="focus_item_li">
						 	     	<div class="list_item">
						 	     		 <div class="focus_user_headimg">
											<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['focus']['id']."".""); 
?>'>
						 	     		 	<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['focus']['id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>	
											</a>
						 	     		 </div>
										 <div class="info">
											<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['focus']['id']."".""); 
?>'>
										 	<i><?php echo $this->_var['focus']['user_name']; ?></i>
											</a>
											&nbsp;&nbsp;
											<a href="javascript:void(0);" onclick="focus_user(<?php echo $this->_var['focus']['id']; ?>,this);" class="remove_focus">取消关注</a>
											
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
						 <div class="assess_list" style="text-align:center;padding:10px 0;">您还未关注任何人</div>
						 <?php endif; ?>
					</div><!--list-view end-->		
				 
				</div><!--wrap end-->	

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
				
<?php echo $this->fetch('./inc/footer.html'); ?>				
			