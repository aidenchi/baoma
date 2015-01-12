<?php echo $this->fetch('./inc/header_common.html'); ?>

			<div class="wrap">
					<!-----------------------------------广告图片------------------------------>
					<div class="top">
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
						<!--
						<div class="flash" id=containerFlashAnimation>
							<section>
								<div id="banner_box" class="box_swipe" style="visibility: visible;height:200px;overflow:hidden;">
									<ul style="list-style: none; width: 2560px; transition: 500ms; -webkit-transition: 500ms;">
										<?php $_from = $this->_var['data']['adv_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'adv');if (count($_from)):
    foreach ($_from AS $this->_var['adv']):
?>
										<li style="vertical-align: top; width: 640px; display: table-cell;">
											<a href=""><img src="<?php echo $this->_var['adv']['img']; ?>" alt="" border="0" style="width:100%;height:200px;"></a>
										</li>
										<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
									</ul>
									<ol>
										<?php $_from = $this->_var['data']['adv_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'adv');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['adv']):
?>
										<li <?php if ($this->_var['key'] == 0): ?>class="on"<?php endif; ?>>
										</li>
										<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
									</ol>
								</div>
							</section>
						</div>
						-->
					</div>
					
					<div class="blank8"></div>
					<!-----------------------------------圆圈图标菜单------------------------------>
					<div class="sort_nav">
					    <div class="sort_list">
					  	    <ul class="am-avg-sm-4">
							  <li>
									<a href='<?php
echo parse_wap_url_tag("u:index|nearbyuserlist#index|"."".""); 
?>'>
									<span class="txt"><span class="am-icon-child am-icon-btn"></span><p>附近玩伴</p></span>
								</a>
								</li>
								<li>
									<?php if ($this->_var['data']['login_user_id'] > 0): ?>
										<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist#index|"."".""); 
?>'>	
									<?php else: ?>
									<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist_public#index|"."".""); 
?>'>	
									<?php endif; ?>
										<span class="txt"><span class="am-icon-calendar am-icon-btn"></span><p>成长日记</p></span>
									</a>
									</li>
								<li>
										<a href='<?php
echo parse_wap_url_tag("u:index|topiclist#index|"."cid=4".""); 
?>'>
										<span class="txt"><span class="am-icon-cny am-icon-btn"></span><p>二手交易</p></span>
									</a>
									</li>
								<li>
									<a href='<?php
echo parse_wap_url_tag("u:index|articlelist#index|"."".""); 
?>'>
									<span class="txt"><span class="am-icon-coffee am-icon-btn"></span><p>免费活动</p></span>
									</a>
									</li>
							</ul>
					    </div><!--sort_list end-->
					</div><!--sort_nav end-->
					
					<div class="blank8"></div>
					<!-----------------------------------推荐活动------------------------------>
					<div class="list-view bor_none">
						 <div class="list_title"><i class="iconfont">&#xe655;</i>推荐</div>
							<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-overlay" data-am-gallery="{pureview: true}">
								<?php $_from = $this->_var['data']['article_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
								  <li>
									<div class="am-gallery-item">
									 <a href='<?php
echo parse_wap_url_tag("u:index|articleitem#index|"."id=".$this->_var['article']['id']."".""); 
?>'>
										<img src="<?php echo $this->_var['article']['icon']; ?>"
										alt="<?php echo $this->_var['article']['name']; ?>" />
										<h3 class="am-gallery-title"><?php echo $this->_var['article']['name']; ?></h3>
										<h3 class="am-gallery-brief"><?php 
$k = array (
  'name' => 'msubstr',
  'v' => $this->_var['article']['brief'],
  'b' => '0',
  'e' => '10',
);
echo $k['name']($k['v'],$k['b'],$k['e']);
?></h3>
										<div class="am-gallery-desc">2375-09-26</div>
									  </a>
									</div>
								  </li>
								<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							</ul>
						 <!--
						 <ul class="sp_ul">
							<?php $_from = $this->_var['data']['article_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'article');if (count($_from)):
    foreach ($_from AS $this->_var['article']):
?>
						 	<li class="sp_li">
						 	    <a href='<?php
echo parse_wap_url_tag("u:index|articleitem#index|"."id=".$this->_var['article']['id']."".""); 
?>'>
						 	    	<img src="<?php echo $this->_var['article']['icon']; ?>" width="100%">
									<div class="h">
                                    	<h4><?php echo $this->_var['article']['name']; ?></h4>
                                    	<p><?php 
$k = array (
  'name' => 'msubstr',
  'v' => $this->_var['article']['brief'],
  'b' => '0',
  'e' => '10',
);
echo $k['name']($k['v'],$k['b'],$k['e']);
?></p>                                        
                                    </div>
						 	    </a>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
						-->
					</div>
					
					<div class="blank8"></div>
					<!-----------------------------------推荐商铺------------------------------>
					<div class="list-view bor_none">
						 <div class="list_title"><i class="iconfont">&#xe60a;</i>推荐店铺</div>
						 <ul class="tuan_ul">
							<?php $_from = $this->_var['data']['recommend_supplier_location_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'location');if (count($_from)):
    foreach ($_from AS $this->_var['location']):
?>
							<li class="tuan_li">
						 	     <a href='<?php
echo parse_wap_url_tag("u:index|merchantitem#index|"."id=".$this->_var['location']['id']."".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="pic">
						 	     		 	<img src="<?php echo $this->_var['location']['logo']; ?>" width="90" height="66">
											<!--<i class="tuan_ico hot">精选</i>-->
										 </div>
										 <div class="info">
										 	<h2><?php echo $this->_var['location']['name']; ?></h2>
											<h3><?php echo $this->_var['location']['mobile_brief']; ?></h3>
											<?php if ($this->_var['location']['tags']): ?>
                                            <p class="txt_tag">
												<?php $_from = $this->_var['location']['tags_arr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'tag');if (count($_from)):
    foreach ($_from AS $this->_var['tag']):
?>
												<span><?php echo $this->_var['tag']; ?></span>
												<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
											</p>
											<?php endif; ?>
											<div class="tuan_price">
                                            	<ul>
                                                	<li class="w_75">
                                                    	<div class="five_star_orange">
								   	    					<i class="fa fa-star orange"></i>
                                                            <i class="fa fa-star orange"></i>
                                                            <i class="fa fa-star orange"></i>
                                                            <i class="fa fa-star orange"></i>
                                                            <i class="fa fa-star orange"></i>
                                                            <div class="five_star_grey" style="width:<?php echo $this->_var['message']['width']; ?>%;">
                                                                <i class="fa fa-star grey"></i>
                                                                <i class="fa fa-star grey"></i>
                                                                <i class="fa fa-star grey"></i>
                                                                <i class="fa fa-star grey"></i>
                                                                <i class="fa fa-star grey"></i>
                                                            </div>
							   							</div>
                                                    </li>                                                    
                                                    <li class="w_25"><span class="am-icon-eye"></span><?php echo $this->_var['location']['hit_count']; ?></li>
                                                    <li class="w_75"><?php echo $this->_var['location']['api_address']; ?></li>
                                                </ul>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul> 
					</div>		
				 
				</div><!--wrap end-->			
<?php echo $this->fetch('./inc/footer.html'); ?>				
			