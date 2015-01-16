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
	<?php echo $this->fetch('./inc/pop.html'); ?>
	
			<div class="topic_list_top">
				<div class="topic_list_top_left" style="color:#838383">
				<span class="am-icon-search"></span>
				</div>
				<div class="topic_list_top_center">	
					<div class="am-dropdown" data-am-dropdown>
					  <button class="am-btn am-btn-primary am-dropdown-toggle" data-am-dropdown-toggle>
						<?php echo $this->_var['data']['cate_name']; ?>
					  <span class="am-icon-caret-down"></span>
					  </button>
					  <ul class="am-dropdown-content">
						<li class="am-dropdown-header"><a href='<?php
echo parse_wap_url_tag("u:index|topiclist#index|"."".""); 
?>'><span <?php if ($this->_var['data']['cate_id'] == 0): ?>class='selected'<?php endif; ?>>精选</span></a></li>
						<?php $_from = $this->_var['data']['cate_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'cate');if (count($_from)):
    foreach ($_from AS $this->_var['cate']):
?>
						<li><a href='<?php
echo parse_wap_url_tag("u:index|topiclist#index|"."cid=".$this->_var['cate']['id']."".""); 
?>'><span <?php if ($this->_var['data']['cate_id'] == $this->_var['cate']['id']): ?>class='selected'<?php endif; ?>><?php echo $this->_var['cate']['name']; ?></span></a></li>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
					  </ul>
					</div>
					<!--
					<a href='<?php
echo parse_wap_url_tag("u:index|topiclist#index|"."".""); 
?>'><span <?php if ($this->_var['data']['cate_id'] == 0): ?>class='selected'<?php endif; ?>>精选</span></a>
					<?php $_from = $this->_var['data']['cate_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'cate');if (count($_from)):
    foreach ($_from AS $this->_var['cate']):
?>
					<a href='<?php
echo parse_wap_url_tag("u:index|topiclist#index|"."cid=".$this->_var['cate']['id']."".""); 
?>'><span <?php if ($this->_var['data']['cate_id'] == $this->_var['cate']['id']): ?>class='selected'<?php endif; ?>><?php echo $this->_var['cate']['name']; ?></span></a>
					<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>		
					-->
				</div>
				<div class="topic_list_top_right" >
				    <a href='<?php
echo parse_wap_url_tag("u:index|topicwrite#index|"."".""); 
?>'>
					<span class="am-icon-edit"  style="color:#838383"></span>
					</a>
				</div>
			</div>
			
			 <input type="hidden" name="cid" id="cid" value="<?php echo $this->_var['data']['cate_id']; ?>" />
			 <div style="display:none;" id="topic_search_box" class="am-input-group am-input-group-sm">
				  <input type="text" class="am-form-field" placeholder="" id="keyword" value="<?php echo $this->_var['data']['keyword']; ?>" onkeydown="keySearch();">
				  <span class="am-input-group-label" onclick="search_submit()" > <span class="am-icon-search"></span></span>
   		     </div>
			
			<div class="topic_list_bg">
				<!--<div style="padding:30px;">贝欧论坛……</div>-->
						<div data-am-widget="slider" class="am-slider am-slider-a1" data-am-slider='{&quot;directionNav&quot;:false}'>
						  <ul class="am-slides">
							<?php $_from = $this->_var['data']['adv_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'adv');if (count($_from)):
    foreach ($_from AS $this->_var['adv']):
?>
							<li>
							  <img src="<?php echo $this->_var['adv']['img']; ?>">
							</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						  </ul>
						</div>	
			</div>

				<div class="wrap">
					<div class="list-view">
						 <!--<div class="list_title">共<?php echo $this->_var['data']['total']; ?>篇帖子</div>-->
						 <?php if ($this->_var['data']['one_cate_topic_list']): ?>
						 <ul class="topic_list_ul">
						 <?php $_from = $this->_var['data']['one_cate_topic_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'topic');if (count($_from)):
    foreach ($_from AS $this->_var['topic']):
?>
							<li class="topic_li">						 	      
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
											<?php if ($this->_var['data']['login_user_id'] == $this->_var['topic']['user_id']): ?>
											<a href='<?php
echo parse_wap_url_tag("u:index|user_center#index|"."".""); 
?>'>
											<?php else: ?>
											<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['topic']['user_id']."".""); 
?>'>
											<?php endif; ?>
						 	     		 	<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['topic']['user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>' width="50" height="50">
                                            <p><?php echo $this->_var['topic']['user_name']; ?></p>											
											</a>
						 	     		 </div>										 
										 <div class="info">
											<a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=".$this->_var['topic']['id']."".""); 
?>'>
												<i><?php echo $this->_var['topic']['forum_title']; ?>
												<?php if ($this->_var['topic']['is_best'] > 0): ?>
												<span class="jin">精</span>
												<?php endif; ?>
												<?php if ($this->_var['topic']['is_recommend'] > 0): ?>
												<span class="jian">荐</span>
												<?php endif; ?>												
												<?php if ($this->_var['topic']['is_top'] > 0): ?>
												<span class="ding">顶</span>
												<?php endif; ?>											
												</i>
												<div style="font-size:12px; color:#888;">
													<?php 
$k = array (
  'name' => 'pass_date',
  'time' => $this->_var['topic']['create_time'],
);
echo $k['name']($k['time']);
?>
												</div>
												<h3><?php echo $this->_var['topic']['short_content']; ?></h3>	
												
												
											</a>
											<div class="topic_bottom">
												<div  class="dw-r-time">
													<span style="padding-right:10px;"><span class="am-icon-eye"></span>&nbsp;<?php echo $this->_var['topic']['hit_count']; ?></span>
													<span style="cursor:pointer; padding-right:10px;" onclick="favorite_topic(<?php echo $this->_var['topic']['id']; ?>,<?php echo $this->_var['topic']['user_id']; ?>)">
														<?php if ($this->_var['topic']['is_fav'] == 1): ?>
														<font id="fav_text_<?php echo $this->_var['topic']['id']; ?>"><span id="fav_icon_<?php echo $this->_var['topic']['id']; ?>" class="am-icon-heart" style="color:#ff537b"></span>&nbsp;</font><font id="fav_count_<?php echo $this->_var['topic']['id']; ?>"><?php echo $this->_var['topic']['fav_count']; ?></font>
														<?php else: ?>
														<font id="fav_text_<?php echo $this->_var['topic']['id']; ?>"><span id="fav_icon_<?php echo $this->_var['topic']['id']; ?>" class="am-icon-heart-o"></span>&nbsp;</font><font id="fav_count_<?php echo $this->_var['topic']['id']; ?>"><?php echo $this->_var['topic']['fav_count']; ?></font>
														<?php endif; ?>
													</span>
													<a style="color:#b2b2b2;" href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=".$this->_var['topic']['id']."".""); 
?>'>
													<span><span class="am-icon-comment-o"></span>&nbsp;<?php echo $this->_var['topic']['reply_count']; ?></span>
													</a>
												</div>
						                     </div>											 
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
						 <div class="assess_list" style="text-align:center;padding:10px 0;">该版块还没有帖子</div>
						<?php endif; ?>
					</div><!--list-view end-->		
				 
				</div><!--wrap end-->	
				
	<?php echo $this->fetch('./inc/footer.html'); ?>	
	
	<script>
	function favorite_topic(topic_id,author_user_id){
		//alert(topic_id+"--"+author_user_id);
		var fav_icon_id = "fav_icon_"+topic_id;
		var text_id = "fav_text_"+topic_id;
		var count_id = "fav_count_"+topic_id;
		var query = new Object();
		query.topic_id = topic_id;
		query.author_user_id = author_user_id;
		query.post_type = "json";
		var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|topicfavorite#index|"."".""); 
?>';

		$.ajax({
			url:ajaxurl,
			data:query,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.user_login_status==0){
					//alert(data.login_info);
					$("#alert_content").html(data.login_info);
					$('#my-alert').modal({
						relatedTarget: this,
					});
				}else{
					if(data.fav_status == 1){									
						//document.getElementById(text_id).innerText = "点赞";	
						document.getElementById(fav_icon_id).className = "am-icon-heart-o";
						document.getElementById(fav_icon_id).style.color = "";			
						var fav_count = document.getElementById(count_id).innerText;
						fav_count = parseInt(fav_count) - 1;
						document.getElementById(count_id).innerText = fav_count;
						//alert("取消点赞成功！");	
						$("#alert_content").html("取消点赞成功！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
						setTimeout(function(){
							$('#my-alert').modal('close');
						},1000);
					}
					if(data.fav_status == 2){					
						//document.getElementById(text_id).innerText = "已点赞";
						document.getElementById(fav_icon_id).className = "am-icon-heart";
						document.getElementById(fav_icon_id).style.color = "#ff537b";
						var fav_count = document.getElementById(count_id).innerText;
						fav_count = parseInt(fav_count) + 1;
						document.getElementById(count_id).innerText = fav_count;
						//alert("点赞成功！");
						$("#alert_content").html("点赞成功！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
						setTimeout(function(){
							$('#my-alert').modal('close');
						},1000);
					}
					if(data.fav_status == 3){
						//alert("操作失败");
						$("#alert_content").html("操作失败！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
					}
					if(data.fav_status == 4){
						//alert("自己不能点赞自己的帖子");
						$("#alert_content").html("自己不能点赞自己的帖子！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
					}
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
	}

	$(document).ready(function () {   
	   $(".topic_list_top_left").click(function(){
		   $("#topic_search_box").toggle();
	   });
	});

	//根据帖子标题关键字
	function keySearch(){
	  if (event.keyCode==13)   //回车键的键值为13
		 search_submit();  //调用登录按钮的登录事件
	}

	function search_submit(){
		window.location.href='index.php?ctl=topiclist&cid='+$("#cid").val()+'&keyword='+$("#keyword").val();
	}
	</script>
				
</body>
</html>				
			