<?php echo $this->fetch('./inc/header.html'); ?>

<div class="wrap">
	<div class="content">	
	
					<div class="blank8"></div>
					
					<!------------------------------------商品简介-------------------------------->
					<div class="list-view">
						<div class="list_title">商品简介</div>
						<div class="good_detail">
							    <div class="good_pic"> 						       
									<a>
							       	  	<img src="<?php echo $this->_var['data']['icon']; ?>" width="108" height="67">											
							       	</a>									
							    </div>       
								<div class="goods_price">
								    <div class="price">
										<h3 class="goods_name"><?php echo $this->_var['data']['name']; ?></h3>
										<b><span class="j_discount_price" rel="<?php echo $this->_var['data']['current_price_format']; ?>"><?php echo $this->_var['data']['current_price_format']; ?></span></b>
										<del><?php echo $this->_var['data']['origin_price_format']; ?></del>
								    </div>								
								</div>
						 </div>
						 
						 <div class="business_info">
						 	   <div style="color:#a3a3a3;font-size:12px;width:96%">
									<?php echo $this->_var['data']['description']; ?>
						 	   </div>							   
						 </div>		 
						 
						 <div class="barter">
						 	<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
							<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
								<?php if ($this->_var['is_login'] == 1): ?>							
							   <div class="bshare-custom share ">
						 	   	    <a class="bshare-more" >
						 	   	    	<i class="fa fa-share-square-o"></i>
										<span>分享</span>
						 	   	    </a>
						 	   </div>
							   <div class="share j_share">
						 	   	    <a onclick="add_collect(<?php echo $this->_var['data']['id']; ?>,this);">
						 	   	    	<?php if ($this->_var['data']['is_collect'] == 0): ?>
						 	   	    	<i class="fa fa-star-o"></i><span class="collect_text">收藏</span>
										<?php else: ?>
										<i class="fa fa-star"></i><span class="collect_text">已收藏</span>
										<?php endif; ?>										
						 	   	    </a>
						 	   </div>
							   <?php endif; ?>
							   <script type="text/javascript">
							   	function add_collect(id,obj){
									var query = new Object();
									query.id = id;
									query.post_type = "json";
									var ajaxurl ="<?php
echo parse_wap_url_tag("u:index|add_collect|"."".""); 
?>";
									$.ajax({
										url:ajaxurl,
										data:query,
										type:"POST",
										dataType:"json",
										success:function(data){											
											if(data.status==1){
												//alert("变为取消收藏");
												$(".j_share .fa").removeClass("fa-star-o");
												$(".j_share .fa").addClass("fa-star");
												$(".collect_text").html("已收藏");
											}else{
												//alert("变为收藏");
												$(".j_share .fa").removeClass("fa-star");
												$(".j_share .fa").addClass("fa-star-o");
												$(".collect_text").html("收藏");
											}
											//alert(data.info);
											$("#alert_content").html(data.info);
											$('#my-alert').modal({
												relatedTarget: this,
											});
											setTimeout(function(){
												$('#my-alert').modal('close');
											},1000);	
										}
										,error:function(){
											//alert("服务器提交错误");
											$("#alert_content").html("服务器提交错误，请稍后重新操作");
											$('#my-alert').modal({
												relatedTarget: this,
											});
										}
									});	
									return false;
								}
							   </script>
						 </div>					
					</div>		

					<!--
					<div class="blank8"></div>		
					
					<div class="list-view">						 
						 <div class="see_more">
						 	<a href='<?php
echo parse_wap_url_tag("u:index|tuaninfo#index|"."goods_id=".$this->_var['data']['goods_id']."".""); 
?>'>查看图文详情</a>
						 </div>						
					</div>--><!--list-view end-->							
			
				   <div class="blank8"></div>
					
				   <div class="list-view">
						 <div class="evaluate_title">支持门店</div>
						 <?php $_from = $this->_var['data']['supplier_location_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'supplier_location');if (count($_from)):
    foreach ($_from AS $this->_var['supplier_location']):
?>						 
						 <div class="business_info">							  
						 	   <div class="business_address">
									 <a href='<?php
echo parse_wap_url_tag("u:index|merchantitem#index|"."id=".$this->_var['supplier_location']['id']."".""); 
?>'>
						 	   	     <h3>店铺名称：<?php echo $this->_var['supplier_location']['name']; ?></h3>
									 </a>
									 <span>店铺地址：<?php echo $this->_var['supplier_location']['address']; ?></span><br/>
									 <span>联系电话：<?php echo $this->_var['supplier_location']['tel']; ?></span>
						 	   </div>						
							   <a class="business_phone" href="tel:<?php echo $this->_var['supplier_location']['tel']; ?>" style="display: block;">
							   	     <i class="fa fa-phone"></i>
							   </a>
						 </div>
						 
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
					</div><!--list-view end-->					
	
				    <div class="blank8"></div>   	
					
					<!----------------------------------------商品评价---------------------------------------->
					<div class="list-view">
						<div class="list_title">总体评分</div>
						<div class="overall_merit">
							<div class="left">
								 <div class="total">
									<?php echo $this->_var['data']['point']; ?>
								 </div>
								 <div class="total_star">
									<div class="tatal_num">
										<?php echo $this->_var['data']['message_count']; ?>
									</div>
									<div class="five_star_orange">
										<i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
										<div class="five_star_grey" style="width:<?php echo $this->_var['data']['width']; ?>%;left:2px;">
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
							 <?php if ($this->_var['data']['message_list']): ?>
							 <ul class="shop_comment_list">
								<?php $_from = $this->_var['data']['message_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'message');$this->_foreach['abc'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['abc']['total'] > 0):
    foreach ($_from AS $this->_var['message']):
        $this->_foreach['abc']['iteration']++;
?> 
								<li>
									<div class="name"><?php echo $this->_var['message']['user_name']; ?></div>
									<div class="comment_star">
										<div class="five_star_orange">
												<i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
												<div class="five_star_grey" style="width:<?php echo $this->_var['message']['width']; ?>%;">
													<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
												</div>
									   </div>
									   <span class="comment_time"><?php echo $this->_var['message']['create_time_format']; ?></span>
									</div>
									<div class="comment_p">
									<?php echo $this->_var['message']['content']; ?>
									</div>							
								</li>
								<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							 </ul>	
							 <?php if ($this->_var['data']['message_count'] > 3): ?>
							 <div class="see_more">
								<a href='<?php
echo parse_wap_url_tag("u:index|goodscommentlist#index|"."goods_id=".$this->_var['data']['id']."".""); 
?>'>查看全部评价</a>
							 </div>
							 <?php endif; ?>
							 <?php else: ?>
							 <div class="assess_list" style="text-align:center;padding:10px 0;"> 暂无评论</div>
							 <?php endif; ?>						 
						</div>	
						<div class="i_say">
							<input type="submit" class="plank" value="我要点评" onclick="javascrtpt:window.location.href='<?php
echo parse_wap_url_tag("u:index|goodscommentwrite#index|"."goods_id=".$this->_var['data']['id']."".""); 
?>'" style="background:none;"/> 
						</div>
					</div><!--list-view end-->	
					
	</div><!---content end-->
</div><!---wrap end-->

<?php echo $this->fetch('./inc/footer.html'); ?> 
