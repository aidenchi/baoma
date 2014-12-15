<?php echo $this->fetch('./inc/header_growth.html'); ?>
<div class="header">
	<div class="c-hd">
        <section class="cut_city">
              <a onclick="window.history.go(-1);"><i class="fa fa-chevron-left"></i></a>
	    </section>
        <section class="logo_img"><?php echo $this->_var['data']['page_title']; ?></section>
        <section class="h_search"><!--这里是头部的隐藏列表，点击可操作-->
			<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarywrite#index|"."".""); 
?>'><i>记录一下</i></a>
	    </section>
     </div>	 
</div>	
				<?php if ($this->_var['data']['growth_diary_item']): ?>			
				<div id="wrap" class="wrap">
					<div class="blank8"></div>					
					<div class="list-view">
						 <ul class="">
							<li class="growth_li">						 	     
						 	     <div class="list_item">
									 <div class="info">
									 	<h2><i>[<?php echo $this->_var['data']['growth_diary_item']['record_date']; ?>]</i>&nbsp;<?php echo $this->_var['data']['growth_diary_item']['title']; ?></h2>
										<p class="growth_content"><?php echo $this->_var['data']['growth_diary_item']['content']; ?></p>	
										</a>
										<div class="growth_write">
						                    <p class="growth_writetime">	 
											</p>
											<p class="growth_writedetail">
												<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarywrite#index|"."id=".$this->_var['data']['growth_diary_item']['id']."".""); 
?>'><i>编辑</i></a>&nbsp;&nbsp;
												<a href="javascript:void(0);" onclick="delete_growth_diary(<?php echo $this->_var['data']['growth_diary_item']['id']; ?>,$('#wrap'));"><i>删除</i></a>
											</p>
						                </div>
									 </div>
						 	     </div>						 	     
						 	</li>						
						 </ul>						 
					</div><!--list-view end-->				 
				</div><!--wrap end-->	
				<?php else: ?>
				<div style="margin-top:10px;margin-bottom:10px;text-align:center;">
					抱歉，这篇成长日记不存在！
				</div>
				<?php endif; ?>
				
				<!--帖子删除成功后的提示语-->
				<div id="growth_diarydel" style="display:none;margin-top:10px;margin-bottom:10px;text-align:center;">
					<span id="growth_diarydelmsg"></span>
				</div>

<script type="text/javascript">
function delete_growth_diary(growth_diary_id,growth_diary_obj){
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
				growth_diary_obj.hide();
				$("#growth_diarydel").show();
				$("#growth_diarydelmsg").html(data.info);
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
			