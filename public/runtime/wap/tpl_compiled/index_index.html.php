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
						
					</div>
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
					
					
					<!-----------------------------------推荐活动------------------------------>
					<div class="list-view bor_none">
						 <div class="list_title"><span class="am-icon-thumbs-o-up"></span>推荐</div>
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
					</div>
					<!-----------------------------------推荐商铺------------------------------>
					<div class="list-view bor_none">
						 <div class="list_title"><span class="am-icon-thumbs-o-up"></span>推荐店铺</div>
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
						 	     		 	<img src="<?php echo $this->_var['location']['logo']; ?>">
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
                                                	<!-- <li class="w_75">
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
                                                    </li>   -->                                                  
                                                   
                                                    <li><span class="am-icon-map-marker"></span>&nbsp;<?php echo $this->_var['location']['api_address']; ?></li>
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
</body>
</html>				