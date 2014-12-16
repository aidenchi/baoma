<?php echo $this->fetch('./inc/header.html'); ?>
<div class="wrap">

	<div class="content">
	 <div class="comment_list_txt">
		<form id="topic_add_form" action='<?php
echo parse_wap_url_tag("u:index|topicadd|"."".""); 
?>' autocomplete="off" method="post" onsubmit="return check(this)">		 
		 <div class="Contentbox">				
				<div class="inputtxt">
					<div class="input_sr"><input style="font-size:12px;" type="text" placeholder="&nbsp;&nbsp;&nbsp;请输入主题" name="forum_title" id="forum_title"></div>
				</div>		   
				<div class="topic_write_txt">
					<input type="hidden" id="type" name="type" value="share" />
					<textarea name="content" id="content" placeholder="请输入内容"></textarea>
					<div class="blank"></div>					
				</div>
				<div class="inputtxt2 chk2"> 
					<span class="chk_sp1">选择板块:</span>
					<?php $_from = $this->_var['data']['cate_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'cate');if (count($_from)):
    foreach ($_from AS $this->_var['cate']):
?>
						<input class="mt_sex" type="radio" name="cate_name" value="<?php echo $this->_var['cate']['id']; ?>" /><span class="chk_sp2"><?php echo $this->_var['cate']['name']; ?></span>
					<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
				</div>
				<div class="btn_login">
				<input type="submit" name="Submit" class="mj-submit" value="发帖" style="background: none;">
				</div>
		 </div>	            
		</form>
	 </div>
	</div>
</div>				
<script type="text/javascript">
function  check(){	
	var form = $("#topic_add_form");			
	var textarea = $(form).find("textarea");
	if($.trim(textarea.val())==''){
		alert("请输入内容");
		return false;
	}
	var cate_name = document.getElementsByName("cate_name");
	var cate_name_val = "";
	var cate_name_flag = false;
	for (var i=0; i < cate_name.length; i++) {
		if (cate_name.item(i).checked) {
			cate_name_flag = true
			cate_name_val = cate_name.item(i).value;
			break;
		}
	}
	if(!cate_name_flag){
		alert("请选择板块");
		return false;
	}
	var query = new Object();
	query.forum_title = $("#forum_title").val();
	query.content = textarea.val();
	query.type = $("#type").val();
	query.cate_id = cate_name_val;
	query.post_type = "json";
	//alert(query.forum_title+"--"+query.content+"--"+query.type+"--"+query.post_type+"--"+query.cate_id);
	var ajaxurl = form.attr("action");
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 	
				alert(data.info);
				window.location.href="<?php
echo parse_wap_url_tag("u:index|topiccatelist#index|"."".""); 
?>";
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