<?php echo $this->fetch('./inc/header_growth.html'); ?>
<div class="header">
	<div class="c-hd">
        <section class="header_left_text">
              <a href='<?php
echo parse_wap_url_tag("u:index|growthdiarydate#index|"."".""); 
?>'>日历</a>
	    </section>
        <section class="logo_img"><?php echo $this->_var['data']['page_title']; ?></section>
        <section class="h_search">
			<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarywrite#index|"."".""); 
?>'><i>记录一下</i></a>
	    </section>
     </div>	 
</div>	
			<div class="wrap">
					<div class="blank8"></div>
					<?php if ($this->_var['data']['growth_diary_list']): ?>					
					<div class="list-view">
						 <ul class="">
							<?php $_from = $this->_var['data']['growth_diary_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'growth_diary');if (count($_from)):
    foreach ($_from AS $this->_var['growth_diary']):
?>
							<li class="growth_li" id="growth_diary_<?php echo $this->_var['growth_diary']['id']; ?>">						 	     
						 	     <div class="list_item">
									 <div class="info">
										<a href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitem#index|"."id=".$this->_var['growth_diary']['id']."".""); 
?>'>
									 	<h2><i>[<?php echo $this->_var['growth_diary']['record_date']; ?>]</i>&nbsp;<?php echo $this->_var['growth_diary']['title']; ?></h2>
										<p class="growth_content"><?php echo $this->_var['growth_diary']['short_content']; ?></p>	
										</a>
										<div class="growth_write">
						                    <p class="growth_writetime">	 
											</p>
											<p class="growth_writedetail">
											<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarywrite#index|"."id=".$this->_var['growth_diary']['id']."".""); 
?>'><i>编辑</i></a>&nbsp;&nbsp;
											<a href="javascript:void(0);" onclick="delete_growth_diary(<?php echo $this->_var['growth_diary']['id']; ?>,$('#growth_diary_<?php echo $this->_var['growth_diary']['id']; ?>'));"><i>删除</i></a>
											</p>
						                </div>
									 </div>
						 	     </div>						 	     
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>	
						 </ul>		
						<div class="fy">
							<?php echo $this->_var['pages']; ?>
						</div>
					</div><!--list-view end-->	
					<?php else: ?>
					<div style="margin-top:10px;margin-bottom:10px;text-align:center;">
					您的成长日历为空
					</div>
					<?php endif; ?>					
					
				</div><!--wrap end-->		

<script type="text/javascript">
function delete_growth_diary(growth_diary_id,one_growth_diary_obj){
	var query = new Object();
	query.id = growth_diary_id;
	query.post_type = "json";
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|growthdiarydel#index|"."".""); 
?>';
	//alert(query.topic_id);
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 
				one_growth_diary_obj.hide();
				//alert(data.info);
			}else{
				alert(data.info);
			}
		}
		,error:function(){
			alert("服务器提交错误");
		}
	});
}
</script>				
<?php echo $this->fetch('./inc/footer.html'); ?>				
			