<?php echo $this->fetch('./inc/header.html'); ?>
<?php
		$this->_var['parse_pagecss'][] = $this->_var['TMPL_REAL']."/css/activity_list.css";	
		$this->_var['parse_pagecss'][] = $this->_var['TMPL_REAL']."/css/comment_list.css";
			
?>
<link rel="stylesheet" type="text/css" href="<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['parse_pagecss'],
);
echo $k['name']($k['v']);
?>" />

<div class="wrap">
				<div class="content">
					<div class="blank8"></div>
					
					<div class="list-view">
					<div class="list_title">总体评分</div>
					<div class="overall_merit">
						<div class="left">
							 <div class="total">
							 	<?php echo $this->_var['data']['buy_dp_avg']; ?>
							 </div>
							 <div class="total_star">
							 	<div class="tatal_num">
							 		<?php echo $this->_var['data']['total']; ?>
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
						<div class="list_title">共<?php echo $this->_var['data']['total']; ?>条点评</div>
						<ul class="shop_comment_list">
						<?php $_from = $this->_var['data']['message_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'message_list');if (count($_from)):
    foreach ($_from AS $this->_var['message_list']):
?>
						<li>
							<div class="name"><?php echo $this->_var['message_list']['user_name']; ?></div>
							<div class="comment_star">
								<div class="five_star_orange">
								   	    <i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
								   	    <div class="five_star_grey" style="width:<?php echo $this->_var['message_list']['width']; ?>%;">
								   	    	<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
								   	    </div>
							    </div>
							   <span class="comment_time"><?php echo $this->_var['message_list']['create_time_format']; ?></span>
							</div>
							<div class="comment_p">
							<?php echo $this->_var['message_list']['content']; ?>
							</div>							
						</li>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
						<?php if ($this->_var['data']['page']['page_total'] > 1): ?>
						<div class="fy">
							<?php echo $this->_var['pages']; ?>
						</div>
						<?php endif; ?>
					</div>
				
					<div class="i_say">
						<input type="submit" class="plank" value="我要点评" onclick="javascrtpt:window.location.href='<?php
echo parse_wap_url_tag("u:index|suppliercommentwrite#index|"."id=".$this->_var['data']['merchant_id']."".""); 
?>'" style="background:none;"/> 
					</div>
					
			
	</div>
	</div>
<?php echo $this->fetch('./inc/footer.html'); ?>	