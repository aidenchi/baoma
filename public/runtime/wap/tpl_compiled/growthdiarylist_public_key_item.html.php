						<table cellspacing="0" cellpadding="0" border="0" class="growth_diary_list_table">
							<tbody>
								<?php $_from = $this->_var['data']['growth_diary_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'growth_diary');if (count($_from)):
    foreach ($_from AS $this->_var['growth_diary']):
?>
								<tr>
									<td class="td_line" width="80" style="text-align:center;" valign="top">
										<?php if ($this->_var['data']['login_user_id'] > 0): ?>
											<?php if ($this->_var['data']['login_user_id'] == $this->_var['growth_diary']['user_id']): ?>
											<a href='<?php
echo parse_wap_url_tag("u:index|user_center#index|"."".""); 
?>'>
											<?php else: ?>
											<a href='<?php
echo parse_wap_url_tag("u:index|userinfo#index|"."user_id=".$this->_var['growth_diary']['user_id']."".""); 
?>'>
											<?php endif; ?>
										<?php else: ?>
											<a href='javascript:void(0);' onclick="login_ts()">
										<?php endif; ?>
										<img style="border-radius:70px;border: 2px solid #fff;" src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['growth_diary']['user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
										</a>
										<br/>
										<?php echo $this->_var['growth_diary']['user_name']; ?>
									</td>								
									<td class="td_line" style="padding:10px;">	
										<table cellspacing="0" cellpadding="0" border="0">		
											<tr>								
												<td>
													<!--文字内容-->
													<?php if ($this->_var['data']['login_user_id'] > 0): ?>
													<a style="font-size:14px;" href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitem#index|"."id=".$this->_var['growth_diary']['id']."".""); 
?>'>
													<?php else: ?>
													<a href='javascript:void(0);' onclick="login_ts()">
													<?php endif; ?>
													<?php echo $this->_var['growth_diary']['short_content']; ?>	
													</a>
													<p><span style="color:#a79384"><?php 
$k = array (
  'name' => 'pass_date',
  'time' => $this->_var['growth_diary']['create_time'],
);
echo $k['name']($k['time']);
?></span></p>
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
																<video width="110" src="<?php echo $this->_var['video_item']['video_path']; ?>" preload="Metadata" >
																您的浏览器不支持 video 标签。
																</video >
															</div>
														  </li>
														<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
													</ul>
													<?php endif; ?>
												</td>
											</tr>	
											<tr>								
												<td style="padding-top:10px;color:#8C5225">
													<span style="padding-right:10px;"><span class="am-icon-eye"></span>&nbsp;<?php echo $this->_var['growth_diary']['hit_count']; ?></span>
													<span style="padding-right:10px; cursor:pointer;" onclick="favorite_growth_diary(<?php echo $this->_var['growth_diary']['id']; ?>,<?php echo $this->_var['growth_diary']['user_id']; ?>)">
														<?php if ($this->_var['growth_diary']['is_fav'] == 1): ?>
														<span id="fav_icon_<?php echo $this->_var['growth_diary']['id']; ?>" class="am-icon-heart" style="color:#ff537b"></span>&nbsp;<font id="fav_count_<?php echo $this->_var['growth_diary']['id']; ?>"><?php echo $this->_var['growth_diary']['fav_count']; ?></font>
														<?php else: ?>
														<span id="fav_icon_<?php echo $this->_var['growth_diary']['id']; ?>" class="am-icon-heart-o"></span>&nbsp;<font id="fav_count_<?php echo $this->_var['growth_diary']['id']; ?>"><?php echo $this->_var['growth_diary']['fav_count']; ?></font>
														<?php endif; ?>
													</span>
													<?php if ($this->_var['data']['login_user_id'] > 0): ?>
													<a href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitem#index|"."id=".$this->_var['growth_diary']['id']."".""); 
?>'>
													<?php else: ?>
													<a href='javascript:void(0);' onclick="login_ts()">
													<?php endif; ?>
													<span style="padding-right:10px;"><span class="am-icon-comment-o"></span>&nbsp;<?php echo $this->_var['growth_diary']['reply_count']; ?></span>
													</a>																
												</td>
											</tr>				
										</table>									
									</td>
								</tr>				
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>								
							</tbody>
						</table>
						<!--正在加载-->
						<div id="loading" style="display:none;text-align:center;padding:10px 0;">
							<span class="am-icon-spinner am-icon-spin"></span><span id="loading_text">正在加载…</span>
						</div>
						
						