<?php echo $this->fetch('./inc/header.html'); ?>
<?php
		$this->_var['parse_pagecss'][] = $this->_var['TMPL_REAL']."/css/merchantitem_index.css";	
?>
<link rel="stylesheet" type="text/css" href="<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['parse_pagecss'],
);
echo $k['name']($k['v']);
?>" />


<script>
	var u=$(document).height();
	 $(".cover_tx").height(u);
	// alert(u);
</script>

<div class="wrap">
				<div class="content">
					<div class="blank8"></div>
					
					<!------------------------------------店铺信息--------------------------------->
					<div class="list-view">
						<div class="list_title">店铺简介</div>
						 <div class="good_detail">
						 	   	  <div class="good_pic">
						 	   	  	<img src="<?php echo $this->_var['data']['logo']; ?>" width="108" height="67">
						 	   	  </div>
						 	   	  <div class="goods_price">
									<div class="price">
						 	   	  	  <h3 class="goods_name"><?php echo $this->_var['data']['name']; ?></h3>	
									  <span style="color:#838383;line-height:30px;">营业时间：<?php echo $this->_var['data']['open_time']; ?></span>
									</div>
						 	   	  </div>
						 </div>				
						 <div class="business_info">
						 	   <div style="color:#a3a3a3;font-size:12px;width:96%">
									 <?php echo $this->_var['data']['brief']; ?>
						 	   </div>
						 </div>			 
					</div><!--list-view end-->				
					
					<div class="blank8"></div>
					
					<!------------------------------------商家信息--------------------------------->
					<div class="list-view">
						 <div class="list_title">店铺地址</div>
						 <div class="business_info">
						 	   <div class="business_address">																 
									<span>电话：<?php echo $this->_var['data']['tel']; ?></span><br/>	
									<span>地址：<?php echo $this->_var['data']['address']; ?></span><br/>	
									<style type="text/css">
										#container{height:150px; width: 240px; border:#ccc solid 1px;}  
									</style>
									<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script> 
									<script type="text/javascript">
										function draw_map(xpoint,ypoint){
											var map = new BMap.Map("container"); 
											var opts = {type: BMAP_NAVIGATION_CONTROL_ZOOM}  
											map.addControl(new BMap.NavigationControl());  
											// map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  
											// 创建地理编码服务实例  
											var point = new BMap.Point(xpoint,ypoint);
											
											// 将结果显示在地图上，并调整地图视野  
											map.centerAndZoom(point, 16);  
											map.addOverlay(new BMap.Marker(point));
										}
										
										$(document).ready(function(){
											draw_map('<?php echo $this->_var['data']['xpoint']; ?>','<?php echo $this->_var['data']['ypoint']; ?>');											
										});
									</script>
									<div id="container"></div>	
						 	   </div>
							   <a href="tel:<?php echo $this->_var['data']['tel']; ?>" class="business_phone" style="display:block;">
							   	     <i class="fa fa-phone"></i>
							   </a>
						 </div><!--business_info end-->							
					</div><!--list-view end-->		
					
					<!------------------------------------其它门店--------------------------------->
					<!--
					<div class="blank8"></div>
					<?php if ($this->_var['data']['other_supplier_location']): ?>
					<div class="blank8"></div>					
					<div class="list-view">	
						 <div class="list_title">其它门店</div>
						 <?php $_from = $this->_var['data']['other_supplier_location']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'supplier_location');if (count($_from)):
    foreach ($_from AS $this->_var['supplier_location']):
?>
							<div class="business_info" onclick = "javascript:window.location.href='<?php
echo parse_wap_url_tag("u:index|merchantitem|"."id=".$this->_var['supplier_location']['id']."".""); 
?>'" >
						 	   <div class="business_address">
						 	   	     <h3><?php echo $this->_var['supplier_location']['name']; ?></h3>
									 <span><?php echo $this->_var['supplier_location']['address']; ?></span>
									 <span><?php echo $this->_var['supplier_location']['tel']; ?></span>
						 	   </div>
							   <a class="business_phone" href="tel:<?php echo $this->_var['supplier_location']['tel']; ?>" style="display: block;">
							   	     <i class="fa fa-phone"></i>
							   </a>
							</div>
						 <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
					</div>	
					<?php endif; ?>	
					-->
					<div class="blank8"></div>
					
					<!------------------------------------该店铺的商品--------------------------------->										
					<div class="list-view">
						 <div class="list_title">店铺商品</div>
						 <?php if ($this->_var['data']['goods_list']): ?>
						 <ul class="tuan_ul">
						 	<?php $_from = $this->_var['data']['goods_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'glist');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['glist']):
?>
						 	<li class="tuan_li">
						 	     <a href="<?php
echo parse_wap_url_tag("u:index|goodsdesc#index|"."id=".$this->_var['glist']['id']."".""); 
?>">
						 	     	<div class="list_item">
						 	     		 <div class="pic">
						 	     		 	<img src="<?php echo $this->_var['glist']['icon']; ?>" width="108" height="67">
											<?php if ($this->_var['glist']['is_hot'] == 1): ?><i class="tuan_ico hot">热</i><?php endif; ?>
						 	     		 </div>
										 <div class="info">
										 	<h2><?php echo $this->_var['glist']['name']; ?></h2>
											<h3><?php echo $this->_var['glist']['brief']; ?></h3>
											<div class="tuan_price">
						                         <p class="price">
						                         	 <em><?php echo $this->_var['glist']['current_price']; ?><i>元</i></em>
													 <del><?php echo $this->_var['glist']['origin_price']; ?>元</del>
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						 </ul>						 
						 <div class="see_more">
						 	<a href='<?php
echo parse_wap_url_tag("u:index|goodslist#index|"."merchant_id=".$this->_var['data']['id']."".""); 
?>'>查看全部商品</a>
						 </div>
						 <?php else: ?>
						 <div class="assess_list" style="text-align:center;padding:10px 0;"> 暂无商品</div>					
						 <?php endif; ?>
					</div><!--list-view end-->	
					
      
				 <div class="blank8"></div>
				
				<!------------------------------------店铺评价--------------------------------->
				
				<div class="list-view">
					<div class="list_title">总体评分</div>
					<div class="overall_merit">
						<div class="left">
							 <div class="total">
							 	<?php echo $this->_var['data']['buy_dp_avg']; ?>
							 </div>
							 <div class="total_star">
							 	<div class="tatal_num">
							 		<?php echo $this->_var['data']['comment_count']; ?>
							 	</div>
								<div class="five_star_orange">
							   	    <i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
							   	    <div class="five_star_grey" style="width:<?php echo $this->_var['data']['buy_dp_width']; ?>%;left:2px;">
							   	    	<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
							   	    </div>
							   </div>
							 </div>
						</div>
						<div class="right">
							<ul class="critical">
								<li>
									<div class="people_num"><?php echo $this->_var['data']['star_5']; ?></div>
									<div class="percentage_block">
										<div class="percentage" style=" width:<?php echo $this->_var['data']['star_dp_width_5']; ?>%;"></div>
									</div>
									<div class="star_num">5星</div>
								</li>
								<li>
									<div class="people_num"><?php echo $this->_var['data']['star_4']; ?></div>
									<div class="percentage_block">
										<div class="percentage" style=" width:<?php echo $this->_var['data']['star_dp_width_4']; ?>%;"></div>
									</div>
									<div class="star_num">4星</div>
								</li>
								<li>
									<div class="people_num"><?php echo $this->_var['data']['star_3']; ?></div>
									<div class="percentage_block">
										<div class="percentage" style=" width:<?php echo $this->_var['data']['star_dp_width_3']; ?>%;"></div>
									</div>
									<div class="star_num">3星</div>
								</li>
								<li>
									<div class="people_num"><?php echo $this->_var['data']['star_2']; ?></div>
									<div class="percentage_block">
										<div class="percentage" style=" width:<?php echo $this->_var['data']['star_dp_width_2']; ?>%;"></div>
									</div>
									<div class="star_num">2星</div>
								</li>
								<li>
									<div class="people_num"><?php echo $this->_var['data']['star_1']; ?></div>
									<div class="percentage_block">
										<div class="percentage" style=" width:<?php echo $this->_var['data']['star_dp_width_1']; ?>%;"></div>
									</div>
									<div class="star_num">1星</div>
								</li>
							</ul>
						</div>
					</div> 
				 </div>
					
				 <div class="blank8"></div>
					
                 <div class="list-view">
					<div class="list_title">最新点评</div>
						 <?php if ($this->_var['data']['comment_list']): ?>
						 <ul class="shop_comment_list">
							<?php $_from = $this->_var['data']['comment_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'plist');$this->_foreach['abc'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['abc']['total'] > 0):
    foreach ($_from AS $this->_var['plist']):
        $this->_foreach['abc']['iteration']++;
?> 
							<li>
								<div class="name"><?php echo $this->_var['plist']['user_name']; ?></div>
								<div class="comment_star">
									<div class="five_star_orange">
											<i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
											<div class="five_star_grey" style="width:<?php echo $this->_var['plist']['width']; ?>%;">
												<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
											</div>
								   </div>
								   <span class="comment_time"><?php echo $this->_var['plist']['create_time_format']; ?></span>
								</div>
								<div class="comment_p">
								<?php echo $this->_var['plist']['content']; ?>
								</div>							
							</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						 </ul>
						 <?php if ($this->_var['data']['comment_count'] > 3): ?>
						 <div class="see_more">
						 	<a href='<?php
echo parse_wap_url_tag("u:index|suppliercommentlist#index|"."merchant_id=".$this->_var['data']['id']."".""); 
?>'>查看全部评价</a>
						 </div>
						 <?php endif; ?>
						 <?php else: ?>
						 <div class="assess_list" style="text-align:center;padding:10px 0;"> 暂无评论</div>
						 <?php endif; ?>						 
					</div>	
					<div class="i_say">
						<input type="submit" class="plank" value="我要点评" onclick="javascrtpt:window.location.href='<?php
echo parse_wap_url_tag("u:index|suppliercommentwrite#index|"."id=".$this->_var['data']['id']."".""); 
?>'" style="background:none;"/> 
					</div>
				</div><!--list-view end-->	
				
				
<?php echo $this->fetch('./inc/footer.html'); ?> 
