<style>
.search_box_tx .search_more_button_tx {
	position: absolute;
	width: 30px;
	height: 50px;
	border-radius: 5px;
	font-size: 13px;
	top: 15px;
	right: 10px;
}
.search_box_tx .search_more_button_tx a i {
	font-size: 18px;
}
.nearby_user_list_table {
	width:100%;
	color: #adadad;
	font-size:12px;
}
.nearby_user_list_table td {
	line-height: 22px;
	padding: 10px 5px 10px 5px;
	height: 90px;
	border-top: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
}
.distance{font-size:16px; position:absolute; right:0; top:3px;}
</style>

<!-----------------------------------------------header------------------------------------------>
<div class="header">
	<div class="search_box_tx">
    	<div class="search_text_tx">
			<input type="text" placeholder="请输入昵称" id="keyword" value="<?php echo $this->_var['data']['keyword']; ?>">
			<a class="search_ico_tx" onclick="search_submit()"><i class="fa fa-search"></i></a>
		</div>
		<div class="search_more_button_tx" id="more_search">
			 <a href="javascript:void(0);"><i class="fa fa-list-ul"></i></a>
		</div>
     </div>
	 <!--****<?php echo $this->_var['data']['sql']; ?>*****-->
	 <div class="list-view" id="more_search_pull_down" style="margin-bottom:10px;display:none;">
		<input type="hidden" id="hide_xpoint" name="hide_xpoint" value=<?php echo $this->_var['data']['xpoint']; ?> />
		<input type="hidden" id="hide_ypoint" name="hide_ypoint" value=<?php echo $this->_var['data']['ypoint']; ?> />
		<input type="hidden" id="hide_sex" name="hide_sex" value=<?php echo $this->_var['data']['sex']; ?> />
		<input type="hidden" id="user_location" name="user_location" value="" />
	       <ul>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						位置：
					</div>
					<div class="choose_content">							
						<?php $_from = $this->_var['data']['quan_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'quan');if (count($_from)):
    foreach ($_from AS $this->_var['quan']):
?>
							<?php if ($this->_var['quan']['id'] == 0): ?>
							<i <?php if ($this->_var['data']['quan_id'] == 1 && $this->_var['data']['xpoint'] <= 0): ?> class="selected" <?php endif; ?>>								
								<a href='index.php?ctl=nearbyuserlist&quan_id=all&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><?php echo $this->_var['quan']['name']; ?></a>
							</i>
							<?php else: ?>
							<i <?php if ($this->_var['data']['quan_id'] == $this->_var['quan']['id']): ?> class="selected" <?php endif; ?>>								
								<a href='index.php?ctl=nearbyuserlist&quan_id=<?php echo $this->_var['quan']['id']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><?php echo $this->_var['quan']['name']; ?></a>
							</i>
							<?php endif; ?>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>						
					</div>
				</div>
			</li>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						年龄：
					</div>
					<div class="choose_content">
						<a href='index.php?ctl=nearbyuserlist&age_id=0&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['age_id'] == '0'): ?> class="selected" <?php endif; ?>>全部</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=1&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['age_id'] == '1'): ?> class="selected" <?php endif; ?>>0-6月</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=2&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['age_id'] == '2'): ?> class="selected" <?php endif; ?>>6-12月</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=3&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['age_id'] == '3'): ?> class="selected" <?php endif; ?>>1-2岁</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=4&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['age_id'] == '4'): ?> class="selected" <?php endif; ?>>3-4岁</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=5&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['age_id'] == '5'): ?> class="selected" <?php endif; ?>>5-6岁</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=6&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['age_id'] == '6'): ?> class="selected" <?php endif; ?>>7-8岁</i></a>
					</div>
				</div>
			</li>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						距离：
					</div>
					<div class="choose_content">
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=all'><i <?php if ($this->_var['data']['distance'] == 'all'): ?> class="selected" <?php endif; ?>>全部</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=0.5'><i <?php if ($this->_var['data']['distance'] == '0.5'): ?> class="selected" <?php endif; ?>>0.5km</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=1'><i <?php if ($this->_var['data']['distance'] == '1'): ?> class="selected" <?php endif; ?>>1km</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=2'><i <?php if ($this->_var['data']['distance'] == '2'): ?> class="selected" <?php endif; ?>>2km</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=3'><i <?php if ($this->_var['data']['distance'] == '3'): ?> class="selected" <?php endif; ?>>3km</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=5'><i <?php if ($this->_var['data']['distance'] == '5'): ?> class="selected" <?php endif; ?>>5km</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=8'><i <?php if ($this->_var['data']['distance'] == '8'): ?> class="selected" <?php endif; ?>>8km</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=10'><i <?php if ($this->_var['data']['distance'] == '10'): ?> class="selected" <?php endif; ?>>10km</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=<?php echo $this->_var['data']['sex']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=gt10'><i <?php if ($this->_var['data']['distance'] == 'gt10'): ?> class="selected" <?php endif; ?>>10km以上</i></a>
					</div>
				</div>
			</li>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						性别：
					</div>
					<div class="choose_content">
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=0&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['sex'] == '0'): ?> class="selected" <?php endif; ?>>全部</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=2&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i <?php if ($this->_var['data']['sex'] == '2'): ?> class="selected" <?php endif; ?>>公主</i></a>
						<a href='index.php?ctl=nearbyuserlist&age_id=<?php echo $this->_var['data']['age_id']; ?>&sex=1&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'><i  <?php if ($this->_var['data']['sex'] == '1'): ?> class="selected" <?php endif; ?>>王子</i></a>
					</div>
				</div>
			</li>
		</ul>
	 </div>
</div>

<!------------------------------------------center-------------------------------------------->
			<div class="wrap">
					<div class="list-view">
						<!--定位加载-->
						<div id="loading" style="display:none;text-align:center;padding:10px 0;">
							<img id="loading_img" src="./images/loading.gif" /><br/><span id="loading_text">正在定位…</span>
						</div>
						<?php if ($this->_var['data']['user_list']): ?>
						<table cellspacing="0" cellpadding="0" border="0" class="nearby_user_list_table">
							<tbody>
								<?php $_from = $this->_var['data']['user_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'user');if (count($_from)):
    foreach ($_from AS $this->_var['user']):
?>
								<tr>
									<td width="90" style="text-align:center;">
										<img style="width:60px;border-radius:60px;" src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['user']['id'],
  'type' => 'middle',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
									</td>									
									<td valign="top" width="80%">
										<div style="position:relative;">
											<span style="padding:5px 0px;font-size:16px;color:#f59436; display:inline-block;"><?php echo $this->_var['user']['user_name']; ?></span>
											<span class="distance"><?php if ($this->_var['data']['xpoint'] > 0): ?><?php 
$k = array (
  'name' => 'display_km',
  'distance' => $this->_var['user']['distance'],
);
echo $k['name']($k['distance']);
?><?php endif; ?></span>
										</div>
										<div>
											<?php if ($this->_var['user']['sex'] == 0): ?>
											公主
											<?php endif; ?>
											<?php if ($this->_var['user']['sex'] == 1): ?>
											王子
											<?php endif; ?>
											&nbsp;&nbsp;
											<?php 
$k = array (
  'name' => 'get_user_age_byid',
  'uid' => $this->_var['user']['id'],
);
echo $k['name']($k['uid']);
?>
										</div>
										<div><i class="iconfont" style="font-size:14px;">&#xe61f;</i><?php if ($this->_var['data']['location']): ?><?php echo $this->_var['user']['location']; ?><?php else: ?>未知<?php endif; ?></div>
									</td>
									<!--
									<td width="50" align="right" valign="top">	
										<div style="padding:10px 0px;">
											<?php if ($this->_var['data']['xpoint'] > 0): ?>
											<?php 
$k = array (
  'name' => 'display_km',
  'distance' => $this->_var['user']['distance'],
);
echo $k['name']($k['distance']);
?>
											<?php endif; ?>
										</div>
									</td>	
									-->
								</tr>				
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>								
							</tbody>
						</table>
						<?php if ($this->_var['data']['page']['page_total'] > 1): ?>
						<!--分页-->
						<div class="fy">
							<?php echo $this->_var['pages']; ?>
						</div>
						<?php endif; ?>
						<?php else: ?>
						 <div class="assess_list" style="text-align:center;padding:10px 0;">暂没有玩伴</div>
						<?php endif; ?>
					</div><!--list-view end-->		
				 
				</div><!--wrap end-->	


<script>
$(document).ready(function () {
    $("#more_search").click(function(){
       $("#more_search_pull_down").toggle();
    });
});
</script>				
			