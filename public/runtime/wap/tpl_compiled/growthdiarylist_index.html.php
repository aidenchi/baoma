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
	<style>
	.wrap .iconfont{font-size:12px;}
	</style>
</head> 
<body>
	<?php echo $this->fetch('./inc/pop.html'); ?>
			<div class="growth_diary_top">
				<div class="growth_diary_date">
					<div style="float:left;width:50%;text-align:left;">
						<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarydate#index|"."".""); 
?>'>
							<span class="am-icon-calendar" style="font-size:30px; color:#fff;margin:10px;"></span>							
						</a>
					</div>
					<div style="float:left;width:50%;text-align:right;">
						<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarywrite#index|"."".""); 
?>'>
							<span class="am-icon-plus" style="font-size:30px; color:#fff;margin:10px;"></span>
						</a>
					</div>
				</div>
				<div class="growth_diary_user">
					<img style="border-radius:70px;border: 3px solid #8aa06c;" src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['data']['login_user_id'],
  'type' => 'middle',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
					<br/>
					<span style="color:#fff; font-size:18px; line-height:24px;"><?php echo $this->_var['data']['login_user_name']; ?></span><br/>
					<span style="color:#F08D1B; font-size:16px; line-height:18px;"><?php 
$k = array (
  'name' => 'get_user_age_byid',
  'uid' => $this->_var['data']['login_user_id'],
);
echo $k['name']($k['uid']);
?></span>
				 </div>	
				 <div class="growth_circle">
					<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist_public#index|"."".""); 
?>'>
						<span  class="am-icon-calendar" style="margin-left:6px;color:#fff;"></span><span style="padding-left:10px;line-height:30px;font-size:16px;color:#fff;font-weight:bold">成长圈</span>
					</a>
				 </div>
			</div>
			
			<div class="wrap">
					<?php if ($this->_var['data']['growth_diary_list']): ?>					
					<div class="list-view" >
						<div class="list_title"><span style="display:inline-block; width:35%;">共<?php echo $this->_var['data']['total']; ?>篇日记</span><span style="font-size:12px; color:#bbb;">最近一篇日志发表于<?php if ($this->_var['data']['day_time'] > 0): ?><?php echo $this->_var['data']['day_time']; ?>天前<?php else: ?>今天<?php endif; ?></span></div>
						<table style="background-color:#ecd9bc" cellspacing="0" cellpadding="0" border="0" class="growth_diary_list_table" >							
							<?php $_from = $this->_var['data']['growth_diary_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'growth_diary');if (count($_from)):
    foreach ($_from AS $this->_var['growth_diary']):
?>								
							<tbody id="growth_diary_<?php echo $this->_var['growth_diary']['id']; ?>">
								<tr>
									<td class="td_line" width="50" style="text-align:center;color:#676767" valign="top">
										<span style="font-size:22px;"><?php echo $this->_var['growth_diary']['record_month']; ?>.<?php echo $this->_var['growth_diary']['record_day']; ?></span>
									</td>								
									<td class="td_line" style="padding:10px;">	
										<table cellspacing="0" cellpadding="0" border="0" width="100%">		
											<tr>								
												<td>
													<!--文字内容-->
													<a style="font-size:14px; line-height:14px;" href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitem#index|"."id=".$this->_var['growth_diary']['id']."".""); 
?>'>
													<?php echo $this->_var['growth_diary']['short_content']; ?>	
													</a>
													<!--图片内容-->
													<?php if ($this->_var['growth_diary']['has_pic']): ?>
													<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-imgbordered" data-am-gallery="{pureview: true}">
														<?php $_from = $this->_var['growth_diary']['pic_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'pic_item');if (count($_from)):
    foreach ($_from AS $this->_var['pic_item']):
?>
														  <li style="width:120px;">
															<div class="am-gallery-item">
																<img src="<?php echo $this->_var['pic_item']['small_preview_path']; ?>" data-rel="<?php echo $this->_var['pic_item']['large_path']; ?>" />
															</div>
														  </li>
														<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
													</ul>
													<?php endif; ?>
													<!--视频内容-->
													<?php if ($this->_var['growth_diary']['has_video']): ?>
													<ul style="padding-left:10px;padding-top:10px;">
														<?php $_from = $this->_var['growth_diary']['video_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'video_item');if (count($_from)):
    foreach ($_from AS $this->_var['video_item']):
?>
														  <li style="float:left;padding-right:10px;padding-bottom:5px;">
															<div>
																<video id="video_<?php echo $this->_var['video_item']['id']; ?>" width="110" src="<?php echo $this->_var['video_item']['video_path']; ?>" preload="Metadata"  onclick="FullscreenPlay($('#video_<?php echo $this->_var['video_item']['id']; ?>'))">
																您的浏览器不支持 video 标签。
																</video >
													
															</div>
														  </li>
														<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
													</ul>
													<?php endif; ?>
												</td>
												<td width="35px;" align="center" valign="top" >	
													<a href="javascript:void(0);" onclick="delete_growth_diary_confirm(<?php echo $this->_var['growth_diary']['id']; ?>,$('#growth_diary_<?php echo $this->_var['growth_diary']['id']; ?>'));"><span class="am-icon-remove am-icon-sm" style="color:#A97F5D"></span></a>				
												</td>
											</tr>	
											<tr>								
												<td style="padding-top:10px;">                                                	
													<?php if ($this->_var['growth_diary']['is_public'] == 1): ?>
													<span style="padding-right:10px;"><span class="am-icon-eye"></span>&nbsp;<?php echo $this->_var['growth_diary']['hit_count']; ?></span>
													<span style="padding-right:10px;"><span class="am-icon-heart-o"></span>&nbsp;<?php echo $this->_var['growth_diary']['fav_count']; ?></span>										
													<a href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitem#index|"."id=".$this->_var['growth_diary']['id']."".""); 
?>'>
														<span style="padding-right:10px;color:#A97F5D;"><span class="am-icon-comment-o"></span>&nbsp;<?php echo $this->_var['growth_diary']['reply_count']; ?></span>
													</a>
													<?php endif; ?>	
												</td>
												<td width="35px;" align="center">	
													<?php if ($this->_var['growth_diary']['is_public'] == 1): ?>
														<span style="cursor:pointer;" id="public_status_<?php echo $this->_var['growth_diary']['id']; ?>" onclick="change_public_status(<?php echo $this->_var['growth_diary']['id']; ?>)"><span id="lock_icon_<?php echo $this->_var['growth_diary']['id']; ?>" class="am-icon-unlock am-icon-sm"></span></span>
														<span class="am-icon-share-alt" data-am-modal="{target:'#share-actions'}"></span>
													<?php endif; ?>
													<?php if ($this->_var['growth_diary']['is_public'] == 0): ?>
														<span style="cursor:pointer;" id="public_status_<?php echo $this->_var['growth_diary']['id']; ?>" onclick="change_public_status(<?php echo $this->_var['growth_diary']['id']; ?>)"><span id="lock_icon_<?php echo $this->_var['growth_diary']['id']; ?>" class="am-icon-lock am-icon-sm"></span></span>
													<?php endif; ?>
												</td>
											</tr>				
										</table>									
									</td>
								</tr>						
							</tbody>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>							
						</table>						
						<!--分页-->
						<?php if ($this->_var['data']['page']['page_total'] > 1): ?>
						<div class="fy">
							<?php echo $this->_var['pages']; ?>
						</div>
						<?php endif; ?>
					</div><!--list-view end-->	
					<?php else: ?>
					<div style="margin-top:10px;margin-bottom:10px;text-align:center;">
					暂无成长日记
					</div>
					<?php endif; ?>					
					
				</div><!--wrap end-->	

				<!---------------分享-------------->
				<div class="am-modal-actions" id="share-actions">
				  <div class="am-modal-actions-group">
					<ul class="am-list">
					  <li class="am-modal-actions-header">...</li>
					  <li><a href="#"><span class="am-icon-wechat"></span> ...</a></li>
					  <li class="am-modal-actions-danger">
						<a href="#"><i class="am-icon-twitter"></i> ...</a>
					  </li>
					</ul>
				  </div>
				  <div class="am-modal-actions-group">
					<button class="am-btn am-btn-secondary am-btn-block" data-am-modal-close>取消</button>
				  </div>
				</div>

	<?php echo $this->fetch('./inc/footer.html'); ?>			
	
	<script type="text/javascript">
	//点击全屏播放视频
	function FullscreenPlay(obj){
		 obj[0].webkitEnterFullscreen();
		 obj[0].play();
	}

	function change_public_status(growth_diary_id){
		var public_status_id = "public_status_"+growth_diary_id;
		var lock_icon_id = "lock_icon_"+growth_diary_id;
		//alert(public_status_id);
		var query = new Object();
		query.growth_diary_id = growth_diary_id;
		query.post_type = "json";
		var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|growthdiarypublicstatus#index|"."".""); 
?>';
		$.ajax({
			url:ajaxurl,
			data:query,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.status==1){
					if(data.public_status == 0){
						//document.getElementById(public_status_id).innerText = "私有";	
						document.getElementById(lock_icon_id).className = "am-icon-lock am-icon-sm";	
					}
					if(data.public_status == 1){
						//document.getElementById(public_status_id).innerText = "公开";	
						document.getElementById(lock_icon_id).className = "am-icon-unlock am-icon-sm";	
					}
					//alert(data.info);
					$("#alert_content").html(data.info);
					$('#my-alert').modal({
						relatedTarget: this,
					});
					setTimeout(function(){
						$('#my-alert').modal('close');
					},1000);
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
	}
	//删除成长日记confirm
	function delete_growth_diary_confirm(growth_diary_id,one_growth_diary_obj){
		 $("#confirm_content").html("您确定要删除这篇成长日记吗");
		 $('#my-confirm').modal({
			relatedTarget: this,
			onConfirm: function(options) {
				delete_growth_diary(growth_diary_id,one_growth_diary_obj);      },
			onCancel: function() {
				
			}
		  });
	}

	//删除成长日记
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
					one_growth_diary_obj.remove();
					location.reload();
					//alert(data.info);
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
	}
	</script>				
</body>
</html>			
			