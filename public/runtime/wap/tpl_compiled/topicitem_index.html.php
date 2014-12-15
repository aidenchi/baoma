<?php echo $this->fetch('./inc/header_topic.html'); ?>
				<div class="wrap" id="wrap">
				<?php if ($this->_var['data']['exit'] == 1): ?>
					<div class="blank8"></div>					
					<div class="list-view">
						 <div class="list_title"><i class="fa fa-bullhorn"></i>论坛/<?php echo $this->_var['data']['topic_item']['cate_match_row']; ?></div>
						 <ul class="">
							<li class="topic_item_li">
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['data']['topic_item']['user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
						 	     		 </div>
										 <div class="info">
										 	<i><?php echo $this->_var['data']['topic_item']['forum_title']; ?></i>
											<p class="content">
											<?php echo $this->_var['data']['topic_item']['content']; ?>
											</p>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<em><i><?php echo $this->_var['data']['topic_item']['user_name']; ?><i>&nbsp;•&nbsp;</i>发表于<?php 
$k = array (
  'name' => 'pass_date',
  'time' => $this->_var['data']['topic_item']['create_time'],
);
echo $k['name']($k['time']);
?></i></em>			 
												 </p>
												 <p class="topic_bottom_text_right">
													<a href='#topic_reply' onclick="set_topic_reply()"><i>回复</i></a>
													<?php if ($this->_var['data']['topic_item']['user_id'] == $this->_var['data']['user_id']): ?>
													<a href="javascript:void(0);" onclick="delete_topic(<?php echo $this->_var['data']['topic_item']['id']; ?>,$('#wrap'));"><i>删除</i></a>
													<?php endif; ?>
												</p>
						                     </div>
										 </div>
						 	     	</div>
						 	</li>							
						 </ul>						 
					</div><!--list-view end-->
			
					<div class="blank8"></div>  	
					
					<div class="list-view">
						 <div class="list_title"><i class="fa fa-bullhorn"></i><span id="topic_reply_count"><?php echo $this->_var['data']['topic_item']['reply_count']; ?></span>条回复</div>
						 <ul class="">
						 <?php $_from = $this->_var['data']['topic_reply_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'topic_reply');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['topic_reply']):
?>
							<li class="topic_item_reply_li" id="reply_item_<?php echo $this->_var['topic_reply']['id']; ?>">
						 	     <div class="list_item">
						 	    	 <div class="topic_user_headimg">
						 	    	 	<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['topic_reply']['user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
						 	     	 </div>
									 <div class="info">										
										<div class="reply_topic_bottom">
						                    <p class="reply_topic_bottom_text">
												<em><i><?php echo $this->_var['topic_reply']['user_name']; ?><i>&nbsp;•&nbsp;</i><?php 
$k = array (
  'name' => 'pass_date',
  'time' => $this->_var['topic_reply']['create_time'],
);
echo $k['name']($k['time']);
?>说</i></em>					 
											</p>		
											<p class="reply_topic_bottom_text_right">
												#<?php 
$k = array (
  'name' => 'floor_num',
  'k' => $this->_var['key'],
  'base_size' => $this->_var['data']['base_size'],
);
echo $k['name']($k['k'],$k['base_size']);
?>
												<a href="#topic_reply" onclick="set_reply(<?php echo $this->_var['topic_reply']['id']; ?>,'<?php echo $this->_var['topic_reply']['user_id']; ?>','<?php echo $this->_var['topic_reply']['user_name']; ?>');"><i>回复</i></a>
												<?php if ($this->_var['topic_reply']['user_id'] == $this->_var['data']['user_id']): ?>
												<a href="javascript:void(0);" onclick="delete_topic_reply(<?php echo $this->_var['topic_reply']['id']; ?>,$('#reply_item_<?php echo $this->_var['topic_reply']['id']; ?>'));"><i>删除</i></a>
												<?php endif; ?>
											</p>
						                </div>
										<div class="reply_topic_bottom_p">
											<p class="content"><?php 
$k = array (
  'name' => 'nl2br',
  'v' => $this->_var['topic_reply']['content'],
);
echo $k['name']($k['v']);
?></p>	
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
					
					<div class="blank8"></div>
					<div id="topic_reply">
					<form id="" name="topic_reply_form" method="post" action='<?php
echo parse_wap_url_tag("u:index|topicreply|"."".""); 
?>' onsubmit="return check(this);">
					<div class="list-view">
						<ul class="">	
							<li class="topic_item_reply_li">
								<div class="topic_write_txt">
									<input type="hidden" name="topic_id" id="topic_id" value="<?php echo $this->_var['data']['topic_item']['id']; ?>" />
									<input type="hidden" name="reply_id" id="reply_id" value="0" />
									<input type="hidden" name="reply_user_id" id="reply_user_id" value="0" />
									<input type="hidden" name="reply_user_name" id="reply_user_name" value="" />
									<textarea name="content" id="content" placeholder="请输入内容"></textarea>
									<div class="blank"></div>					
								</div>
								<div class="btn_login">
									<input type="submit" name="Submit" class="mj-submit" value="回复" style="background: none;">
								</div>
							</li>
						</ul>							 
					</div><!--list-view end-->
					</form>
					</div>					
			    <?php endif; ?>
				<?php if ($this->_var['data']['exit'] == 0): ?>
					<div style="margin-top:10px;margin-bottom:10px;text-align:center;">
					<?php echo $this->_var['data']['msg']; ?>
					</div>
				<?php endif; ?>
				</div><!--wrap end-->	
				
				<!--帖子删除成功后的提示语-->
				<div id="topicdel" style="display:none;margin-top:10px;margin-bottom:10px;text-align:center;">
					<span id="topicdelmsg"></span>
				</div>

<script type="text/javascript">
function set_topic_reply(){
	$("#reply_id").val(0);
	$("#reply_user_id").val(0);
	$("#reply_user_name").val("");
	$("textarea[name='content']").val("");	
}

function set_reply(id,user_id,user_name){
		$("form[name='topic_reply_form']").find("input[name='reply_id']").val(id);
		if(user_name!='')
		$("textarea[name='content']").val("回复@"+user_name+"：");	
		$("#reply_user_id").val(user_id);
		$("#reply_user_name").val(user_name);
}
	
function delete_topic(topic_id,one_topic_obj){
	var query = new Object();
	query.topic_id = topic_id;
	query.post_type = "json";
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|topicdel#index|"."".""); 
?>';
	//alert(query.topic_id);
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 
				one_topic_obj.hide();
				$("#topicdel").show();
				$("#topicdelmsg").html(data.info);
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

function delete_topic_reply(topic_reply_id,one_reply_li_obj){
	var query = new Object();
	query.topic_reply_id = topic_reply_id;
	query.post_type = "json";
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|topicreplydel#index|"."".""); 
?>';
	//alert(query.topic_reply_id);	
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 	
				one_reply_li_obj.hide();
				var topic_reply_count = $("#topic_reply_count").html();
				topic_reply_count = parseInt(topic_reply_count)-1;
				$("#topic_reply_count").html(topic_reply_count);
				alert(data.info);
			}else{
				alert(data.info);
			}
		}
		,error:function(){
			alert("服务器提交错误");
		}
	});
}

function  check(){	
	var form = $("form[name='topic_reply_form']")			
	var textarea = $(form).find("textarea");
	if($.trim(textarea.val())==''){
		alert("请输入内容");
		return false;
	}
	var query = new Object();
	query.content = textarea.val();
	query.topic_id = $("#topic_id").val();
	query.reply_id = $("#reply_id").val();
	query.reply_user_id = $("#reply_user_id").val();
	query.reply_user_name = $("#reply_user_name").val();
	query.post_type = "json";
	//alert(query.content+"--"+query.topic_id+"--"+query.post_type+"--"+query.reply_id+"--"+query.reply_user_id+"--"+query.reply_user_name);
	var ajaxurl = form.attr("action");
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 	
				alert(data.info);
				location.href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=".$this->_var['data']['topic_item']['id']."".""); 
?>';
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
			