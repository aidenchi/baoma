<?php echo $this->fetch('./inc/header.html'); ?>
<div class="content">
	<div class="blank8"></div>
	<div class="list-view">
		<div class="list_title">共<span id="mycollect_count"><?php echo $this->_var['data']['mycollect_count']; ?></span>条</div>
		<?php if ($this->_var['data']['mycollectlist']): ?>
		 <ul class="tuan_ul">
		 	<?php $_from = $this->_var['data']['mycollectlist']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'collect');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['collect']):
?>
		 	<li class="tuan_li">
		 	     <a href='<?php
echo parse_wap_url_tag("u:index|goodsdesc#index|"."id=".$this->_var['collect']['deal_id']."".""); 
?>'>
		 	     	<div class="list_item">
		 	     		 <div class="pic">
		 	     		 	<img src="<?php echo $this->_var['collect']['icon']; ?>" width="108" height="67">
		 	     		 </div>
						 <div class="info">
						 	<h2><?php echo $this->_var['collect']['name']; ?></h2>
							<h3> <?php echo $this->_var['collect']['brief']; ?></h3>
							<div class="tuan_price">
		                         <p class="price">
		                         	 <em><?php echo $this->_var['collect']['current_price']; ?><i>元</i></em>
									 <del><?php echo $this->_var['collect']['origin_price']; ?>元</del>
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
		<?php else: ?>
		 <div class="assess_list" style="text-align:center;padding:10px 0;">您未收藏任何商品</div>
		<?php endif; ?>
	</div>
<?php echo $this->fetch('./inc/footer.html'); ?> 