<!-----------------------------------------------header------------------------------------------>
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
</style>

<div class="header">
	 <div class="search_box_tx">
    	<div class="search_text_tx">
			<input type="text" placeholder="请输入商家名称或标签" id="keyword" value="<?php echo $this->_var['data']['keyword']; ?>">
			<a class="search_ico_tx" onclick="search_submit()"><i class="fa fa-search"></i></a>
		</div>
		<div class="search_more_button_tx" id="more_search">
			 <a href="javascript:void(0);"><i class="fa fa-list-ul"></i></a>
		</div>
     </div>
	 <!--****<?php echo $this->_var['data']['sql']; ?>*****-->
	 <div class="list-view" id="more_search_pull_down" style="display:none;">
		<input type="hidden" id="hide_xpoint" name="hide_xpoint" value=<?php echo $this->_var['data']['xpoint']; ?> />
		<input type="hidden" id="hide_ypoint" name="hide_ypoint" value=<?php echo $this->_var['data']['ypoint']; ?> />
		<input type="hidden" id="hide_cate_id" name="hide_cate_id" value=<?php echo $this->_var['data']['cate_id']; ?> />
		<input type="hidden" id="hide_quan_id" name="hide_quan_id" value=<?php echo $this->_var['data']['quan_id']; ?> />
		<input type="hidden" id="hide_age_id" name="hide_age_id" value=<?php echo $this->_var['data']['age_id']; ?> />
		<ul>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						类别：
					</div>
					<div class="choose_content">
						<?php $_from = $this->_var['data']['bcate_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'cate');if (count($_from)):
    foreach ($_from AS $this->_var['cate']):
?>
							<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['cate']['id']; ?>&quan_id=<?php echo $this->_var['data']['quan_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'>
								<i <?php if ($this->_var['data']['cate_id'] == $this->_var['cate']['id']): ?> class="selected" <?php endif; ?>><?php echo $this->_var['cate']['name']; ?></i>
							</a>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
					</div>
				</div>
			</li>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						位置：
					</div>
					<div class="choose_content">							
						<?php $_from = $this->_var['data']['quan_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'quan');if (count($_from)):
    foreach ($_from AS $this->_var['quan']):
?>
							<?php if ($this->_var['quan']['id'] == 0 || $this->_var['quan']['id'] == 1): ?>
							<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&quan_id=<?php echo $this->_var['quan']['id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=all'>
								<i <?php if ($this->_var['data']['quan_id'] == 1): ?> class="selected" <?php endif; ?>><?php echo $this->_var['quan']['name']; ?></i>							
							</a>
							<?php else: ?>							
							<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&quan_id=<?php echo $this->_var['quan']['id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>'>
								<i <?php if ($this->_var['data']['quan_id'] == $this->_var['quan']['id']): ?> class="selected" <?php endif; ?>><?php echo $this->_var['quan']['name']; ?></i>
							</a>							
							<?php endif; ?>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>						
					</div>
				</div>
			</li>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						排序：
					</div>
					<div class="choose_content">	
						<!--
						<i <?php if ($this->_var['data']['xpoint'] > 0 && $this->_var['data']['ypoint'] > 0 && $this->_var['data']['quan_id'] == 0): ?> class="selected" <?php endif; ?>>				
							<a id="nearby_store" href="javascript:void(0);" onclick="get_nearby_store()">默认</a>
						</i>
						-->
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&quan_id=<?php echo $this->_var['data']['quan_id']; ?>&order_type=default&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'>
							<i <?php if ($this->_var['data']['order_type'] == 'default'): ?> class="selected" <?php endif; ?>>默认</i>
						</a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&quan_id=<?php echo $this->_var['data']['quan_id']; ?>&order_type=hit_count&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'>
							<i <?php if ($this->_var['data']['order_type'] == 'hit_count'): ?> class="selected" <?php endif; ?>>人气最高</i>
						</a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&quan_id=<?php echo $this->_var['data']['quan_id']; ?>&order_type=avg_point&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'>
							<i <?php if ($this->_var['data']['order_type'] == 'avg_point'): ?> class="selected" <?php endif; ?>>评价最好</i>
						</a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&quan_id=<?php echo $this->_var['data']['quan_id']; ?>&order_type=id&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'>
							<i <?php if ($this->_var['data']['order_type'] == 'id'): ?> class="selected" <?php endif; ?>>最新发布</i>
						</a>
					</div>
				</div>
			</li>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						年龄：
					</div>
					<div class="choose_content">
						<?php $_from = $this->_var['data']['age_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'age');if (count($_from)):
    foreach ($_from AS $this->_var['age']):
?>
							<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&quan_id=<?php echo $this->_var['data']['quan_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['age']['id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=<?php echo $this->_var['data']['distance']; ?>'>
								<i <?php if ($this->_var['data']['age_id'] == $this->_var['age']['id']): ?> class="selected" <?php endif; ?>><?php echo $this->_var['age']['name']; ?></i>
							</a>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
					</div>
				</div>
			</li>
			<li class="choose_li">
				<div class="choose_item">
					<div class="choose_title">
						距离：
					</div>
					<div class="choose_content">
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=all'><i <?php if ($this->_var['data']['distance'] == 'all'): ?> class="selected" <?php endif; ?>>全部</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=0.5'><i <?php if ($this->_var['data']['distance'] == '0.5'): ?> class="selected" <?php endif; ?>>500m</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=1'><i <?php if ($this->_var['data']['distance'] == '1'): ?> class="selected" <?php endif; ?>>1km</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=2'><i <?php if ($this->_var['data']['distance'] == '2'): ?> class="selected" <?php endif; ?>>2km</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=3'><i <?php if ($this->_var['data']['distance'] == '3'): ?> class="selected" <?php endif; ?>>3km</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=5'><i <?php if ($this->_var['data']['distance'] == '5'): ?> class="selected" <?php endif; ?>>5km</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=8'><i <?php if ($this->_var['data']['distance'] == '8'): ?> class="selected" <?php endif; ?>>8km</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=10'><i <?php if ($this->_var['data']['distance'] == '10'): ?> class="selected" <?php endif; ?>>10km</i></a>
						<a href='index.php?ctl=merchantlist&cate_id=<?php echo $this->_var['data']['cate_id']; ?>&order_type=<?php echo $this->_var['data']['order_type']; ?>&age_id=<?php echo $this->_var['data']['age_id']; ?>&xpoint=<?php echo $this->_var['data']['xpoint']; ?>&ypoint=<?php echo $this->_var['data']['ypoint']; ?>&distance=gt10'><i <?php if ($this->_var['data']['distance'] == 'gt10'): ?> class="selected" <?php endif; ?>>10km以上</i></a>
					</div>
				</div>
			</li>
		</ul>		
	</div>
</div>

<div class="blank8"></div>

<!------------------------------------------center-------------------------------------------->
<!--店铺列表-->
<div class="wrap">		
	<div class="content">
		<div class="list-view" >			
			<!--<div class="list_title"><span id="store_count"><?php echo $this->_var['data']['total']; ?></span>家</div>-->
			<!--定位加载-->
			<div id="loading" style="display:none;text-align:center;padding:10px 0;">
				<img id="loading_img" src="./images/loading.gif" /><br/><span id="loading_text">正在定位…</span>
			</div>
			<ul class="business_ul">
				<?php $_from = $this->_var['data']['item']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'deal');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['deal']):
?>
				<li class="tuan_li">
					 <a href='<?php
echo parse_wap_url_tag("u:index|merchantitem#index|"."id=".$this->_var['deal']['id']."".""); 
?>'>
						<div class="list_item">
							 <div><img src="<?php echo $this->_var['deal']['logo']; ?>" width="108" height="67"></div>	
							 <div class="good_deta">
								  <h4><?php echo $this->_var['deal']['name']; ?></h4>
								  <!--标签-->
								  <?php if ($this->_var['deal']['tags']): ?>
								  <p class="txt_tag">
									<?php $_from = $this->_var['deal']['tags_arr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'tag');if (count($_from)):
    foreach ($_from AS $this->_var['tag']):
?>
										<span><?php echo $this->_var['tag']; ?></span>
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
								  </p>
								  <?php endif; ?>
								  <p>简介：<?php if ($this->_var['deal']['brief']): ?><?php echo $this->_var['deal']['brief']; ?><?php else: ?>无<?php endif; ?></p>
								  <div class="grade">
										 <span>评分：</span>
										 <div class="five_star_orange" >
											   <i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
											   <div class="five_star_grey" style="width:<?php echo $this->_var['deal']['dp_width']; ?>%">
													<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
											   </div>
										 </div>
										 <b><?php echo $this->_var['deal']['dp_avg_point']; ?></b>
										 <span style="margin-left:10px;">点击量：</span>
										 <span style="color:#f49332;"><?php echo $this->_var['deal']['hit_count']; ?></span>
								  </div>								  
								  <div style="display:-webkit-box; width: 100%;height:20px;font-size:12px;color:#828282;">
									<p style="-webkit-box-flex:1;">
										地址：<?php echo $this->_var['deal']['api_address']; ?>
									</p>
									<p style="text-align: right; display: inline-block;">
										<?php if ($this->_var['data']['xpoint'] > 0): ?>
										<?php 
$k = array (
  'name' => 'display_km',
  'distance' => $this->_var['deal']['distance'],
);
echo $k['name']($k['distance']);
?>
										<?php endif; ?>
									</p>
								  </div>
							 </div>
															
						</div>
					 </a>
				</li>
				<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
			</ul> 
			<?php if ($this->_var['data']['page']['page_total'] > 1): ?>
				<div class="fy">
					<?php echo $this->_var['pages']; ?>
				</div>
			<?php endif; ?>		
		</div>
	</div><!--content end-->
</div><!--wrap end-->


<script>
$(document).ready(function () { 
  var x=$(document).height();
   $(".hide_list").height(x-93);
  
   $("#more_search").click(function(){
       $("#more_search_pull_down").toggle();
   });
});
</script>
			
