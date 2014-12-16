<?php echo $this->fetch('./inc/header_growth.html'); ?>
<div class="header">
	<div class="c-hd">
        <section class="cut_city">
              <a onclick="window.history.go(-1);"><i class="fa fa-chevron-left"></i></a>
	    </section>
        <section class="logo_img">成长日历</section>
        <section class="h_search">
			
	    </section>
     </div>	 
</div>	
			<div class="wrap">
					<div class="content">
					 <div class="comment_list_txt">
						<form id="growth_dairy_add_form" action='<?php
echo parse_wap_url_tag("u:index|growthdiaryadd|"."".""); 
?>' autocomplete="off" method="post" onsubmit="return check(this)">		 
						 <div class="Contentbox">
								<input type="hidden" name="growth_dairy_id" id="growth_dairy_id" value="<?php echo $this->_var['data']['id']; ?>">
								<div class="inputtxt">
									<?php if ($this->_var['data']['id'] > 0): ?>
									<div class="input_sr"><input style="font-size:12px;" type="text" name="record_date" id="record_date" value="<?php echo $this->_var['data']['growth_diary_item']['record_date']; ?>"></div>
									<?php else: ?>
									<div class="input_sr"><input style="font-size:12px;" type="text" name="record_date" id="record_date" value="<?php echo $this->_var['data']['today']; ?>"></div>
									<?php endif; ?>
								</div>	
								<div class="inputtxt">
									<div class="input_sr"><input style="font-size:12px;" type="text" placeholder="&nbsp;&nbsp;&nbsp;请输入标题" name="title" id="title" value="<?php echo $this->_var['data']['growth_diary_item']['title']; ?>"></div>
								</div>		   
								<div class="topic_write_txt">
									<textarea name="content" id="content" placeholder="请输入内容"><?php echo $this->_var['data']['growth_diary_item']['content']; ?></textarea>
									<div class="blank"></div>					
								</div>								
								<div class="btn_login">
								<input type="submit" name="Submit" class="mj-submit" value="提交" style="background: none;">
								</div>
						 </div>	            
						</form>
					 </div><!--comment_list_txt end-->
					</div><!--content end-->				
				 
				</div><!--wrap end-->	

<script type="text/javascript">
function  check(){	
	var form = $("#growth_dairy_add_form");
	var title = $("#title");
	if($.trim(title.val())==''){
		alert("请输入标题");
		return false;
	}
	var textarea = $(form).find("textarea");
	if($.trim(textarea.val())==''){
		alert("请输入内容");
		return false;
	}
	var query = new Object();
	query.id = $("#growth_dairy_id").val();
	query.record_date = $("#record_date").val();
	query.title = title.val();
	query.content = textarea.val();
	query.post_type = "json";
	//alert(query.id+"--"+query.action_flag+"--"+query.record_date+"--"+query.title+"--"+query.content+"--"+query.post_type);
	var ajaxurl = form.attr("action");
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 	
				alert(data.info);
				if(data.action_flag == 1){
					window.location.href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitem#index|"."id=".$this->_var['data']['id']."".""); 
?>';					
				}else{
					window.location.href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist#index|"."".""); 
?>';
				}
			}else{
				alert(data.info);
			}
		}
		,error:function(){
			alert("服务器提交错误");
		}
	});	
		return false;
	}
</script>	
				
<?php echo $this->fetch('./inc/footer.html'); ?>				
			