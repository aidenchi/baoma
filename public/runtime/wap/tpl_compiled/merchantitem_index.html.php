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
<div class="cover_tx" style="display:none;">
	<div class="alert_block_tx"></div>
	<div class="alert_text_tx">
		<h3><?php echo $this->_var['data']['name']; ?></h3>
		<p>
			<?php echo $this->_var['data']['mobile_brief']; ?>
		</p>
		<div class="import_tx">
			<span>请输入下单金额 :</span>
			<div>
				<input type="text" name="money" id="J_order_money">
			</div>
		</div>
		<div class="button_tx">
			<div class="sure_tx">
				<div class="block_tx">
				<button id="J_order_auto" type="submit"  >确认</button>
				</div>
			</div>
			<div class="cancel_tx">
				<div class="block_tx">
				<button id="J_order_del" type="submit"  >取消</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="wrap">
				<div class="content">
					
					<div class="list-view">
						 <div class="whole_grade">
						 	   <a href="">
						 	   	  <div class="g_pic">
						 	   	  	<img src="<?php echo $this->_var['data']['logo']; ?>" width="58" height="56">
						 	   	  </div>
						 	   	  <div class="grade_num">
						 	   	  	  <h3><?php echo $this->_var['data']['name']; ?></h3>
									  <div class="grade">
									  	   <span>评分:</span>
										   <div class="five_star_orange" >
											   	    <i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
											   	    <div class="five_star_grey" style="width:<?php echo $this->_var['data']['width']; ?>px">
											   	    	<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
											   	    </div>
											   </div>
										   <b><?php echo round($this->_var['data']['avg_point'],1); ?></b>
									  </div>
						 	   	  </div> 
								   
						 	   </a>
						 </div>
						
						 <div class="business_info">
						 	   <div class="business_address">
						 	   	 	 <!--h3><?php echo $this->_var['data']['brand_name']; ?></h3-->
									 <span><?php echo $this->_var['data']['brief']; ?></span>
						 	   </div>
						 </div>
						
					</div>	
					
					
					
	<div class="blank8"></div>
	<?php if ($this->_var['data']['is_auto_order'] == 1): ?>
	<?php if ($this->_var['is_login'] == 1): ?>
			<input type="hidden" id="J_location_id" value="<?php echo $this->_var['data']['id']; ?>">
			<button id="J_order_cart" type="submit"  name="Submit" class="plank"  >立即付款</button>
		<?php else: ?>
			<button onclick="window.location.href ='<?php
echo parse_wap_url_tag("u:index|login#index|"."".""); 
?>'" type="submit"  name="Submit" class="plank"  >登录后下单</button>
		<?php endif; ?>
	<div class="blank8"></div>
	<?php endif; ?>
	<script type="text/javascript">
			$("#J_order_cart").click(function(){
				$(".cover_tx").css("display","block");
			});	
			$("#J_order_del").click(function(){
				$(".cover_tx").css("display","none");
				$("#J_order_money").val("");
			});
			$("#J_order_auto").click(function(){
			
				var money=$("#J_order_money").val();
				
				$('#J_order_auto').attr('disabled',"true");//添加disabled属性
				
		
				var location_id=$("#J_location_id").val();
				
				if(!money){
					alert("下单金额输入不能为空!");
					return false;
				}
				var query = new Object();
				query.money = money;
				query.location_id=location_id;
				query.post_type="json";
				var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|auto_order|"."".""); 
?>';
				$.ajax({
					url:ajaxurl,
					data:query,
					type:"Post",
					dataType:"json",
					success:function(obj){
						if(obj.status==1){			
							alert(obj.info);
							window.location.href = '<?php
echo parse_wap_url_tag("u:index|my_order_detail#index|"."".""); 
?>'+'&id='+obj.order_id;
						}
					}
					,error:function(){
						alert("服务器提交错误");
						$('#J_order_auto').removeAttr("disabled"); //移除disabled属性 
					}
				});	
			});
	</script>
				<div class="list-view">
						 <div class="evaluate_title">商家信息</div>
						 <div class="business_info">
						 	   <div class="business_address">
						 	   	     <h3><?php echo $this->_var['data']['supplier_name']; ?></h3>
									 <span><?php echo $this->_var['data']['address']; ?></span>
						 	   </div>
							   <a href="tel:<?php echo $this->_var['data']['tel']; ?>" class="business_phone" style="display:block;">
							   	     <i class="fa fa-phone"></i>
							   </a>
						 </div>
						
					</div>	
		<?php if ($this->_var['data']['other_supplier_location']): ?>
	<div class="blank8"></div>
				<div class="list-view">	
						 <div class="evaluate_title">其它门店</div>
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
					
	
	
					
	<div class="blank8"></div>
					<!--
					<?php if ($this->_var['data']['tuan_list']): ?>
					<div class="list-view">
						 <div class="list_title">该商家的团购</div>
						 <ul class="tuan_ul">
						 	<?php $_from = $this->_var['data']['tuan_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'tlist');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['tlist']):
?>
						 	<li class="tuan_li">
						 	     <a href="<?php
echo parse_wap_url_tag("u:index|goodsdesc#index|"."id=".$this->_var['tlist']['id']."".""); 
?>">
						 	     	<div class="list_item">
						 	     		 <div class="pic">
						 	     		 	<img src="<?php echo $this->_var['tlist']['img']; ?>" width="108" height="67">
											<?php if ($this->_var['tlist']['auto_order'] == 1): ?><i class="tuan_ico order">免预约</i><?php endif; ?>
						 	     		 </div>
										 <div class="info">
										 	<h2><?php echo $this->_var['tlist']['name']; ?></h2>
											<h3><?php echo $this->_var['tlist']['brief']; ?></h3>
											<div class="tuan_price">
						                         <p class="price">
						                         	 <em><?php echo $this->_var['tlist']['current_price']; ?><i>元</i></em>
													 <del><?php echo $this->_var['tlist']['origin_price']; ?>元</del>
												 </p>
						                         <p class="bought"><i></i>已售<?php echo $this->_var['tlist']['buy_count']; ?></p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							
						 </ul>
						
					</div>
					<?php endif; ?>
					-->
	<div class="blank8"></div>
					<?php if ($this->_var['data']['goods_list']): ?>
					<div class="list-view">
						 <div class="list_title">该商家的商品</div>
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
						 	     		 	<img src="<?php echo $this->_var['glist']['img']; ?>" width="108" height="67">
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
												 <!--
						                         <p class="bought"><i></i>已售<?php echo $this->_var['glist']['buy_count']; ?></p>
												 -->
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						 </ul>
						 
					</div>
					<?php endif; ?>
      <div class="blank8"></div>
	                  <!-- 
					 <?php if ($this->_var['data']['youhui_list']): ?>  
					<div class="list-view">
						 <div class="list_title">该商家的优惠券</div>
						 <ul class="youhui_ul">
						 	<?php $_from = $this->_var['data']['youhui_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'ylist');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['ylist']):
?>
						 	<li class="tuan_li">
						 	     <a href="<?php
echo parse_wap_url_tag("u:index|youhuiitem#index|"."id=".$this->_var['ylist']['id']."".""); 
?>">
						 	     	<div class="list_item">
						 	     		 <div class="pic">
						 	     		 	<img src="<?php echo $this->_var['ylist']['merchant_logo']; ?>" width="86" height="83">
										</div>
										 <div class="info">
										 	<h2><?php echo $this->_var['ylist']['title']; ?></h2>
											<h3><?php echo $this->_var['ylist']['content']; ?></h3>
											<div class="tuan_price">
												 <p>发布时间：<?php echo $this->_var['ylist']['begin_time']; ?></p>
						                         <div class="downloader">已下载 :<?php echo $this->_var['ylist']['down_count']; ?></div>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							</ul>
						 
					</div>
					<?php endif; ?>
					-->
   <div class="blank8"></div>
   
                 <div class="list-view">
						 <div class="evaluate_title">评价</div>
						 <?php if ($this->_var['data']['comment_list']): ?>
						 <div class="assess_list">
						 	
						 	  <ul>
						 	  	<?php $_from = $this->_var['data']['comment_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'plist');$this->_foreach['abc'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['abc']['total'] > 0):
    foreach ($_from AS $this->_var['plist']):
        $this->_foreach['abc']['iteration']++;
?> 
						 	  	 <li>
						 	  	 	  <div class="assess_detail">
						 	  	 	  	  <div class="a_d_left">
						 	  	 	  	  	   <span class="s_d_name"><?php echo $this->_var['plist']['user_name']; ?></span>
											   <div class="five_star_orange">
											   	    <i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
											   	    <div class="five_star_grey" style="width:<?php echo $this->_var['plist']['width']; ?>">
											   	    	<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
											   	    </div>
											   </div>
						 	  	 	  	  </div>
						 	  	 	  	  <span class="a_d_right"><?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['plist']['create_time'],
);
echo $k['name']($k['v']);
?></span>
						 	  	 	  </div>
									  <p>
									  	<?php echo $this->_var['plist']['content']; ?>
									  </p>
						 	  	 </li>
								 <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
								
						 	  </ul>
							  
						 </div>
						 <?php else: ?>
							 <div class="assess_list" style="text-align:center;padding:10px 0;"> 暂无评论</div>
						<?php endif; ?>
						 <div class="see_more">
						 	<a href="<?php
echo parse_wap_url_tag("u:index|supplier_message_list#index|"."merchant_id=".$this->_var['data']['id']."".""); 
?>">查看全部评价</a>
						</div>
					</div>
					
				 
				</div>
<?php echo $this->fetch('./inc/footer.html'); ?> 
