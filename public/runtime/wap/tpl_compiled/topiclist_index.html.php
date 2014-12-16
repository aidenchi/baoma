<?php echo $this->fetch('./inc/header_topic.html'); ?>
			<div class="wrap">
					<div class="blank8"></div>
					<div class="list-view">
						 <div class="list_title"><i class="fa fa-bullhorn"></i><?php echo $this->_var['data']['cate_name']; ?>&nbsp;(共<?php echo $this->_var['data']['total']; ?>篇帖子)</div>
						 <ul class="">
						 <?php $_from = $this->_var['data']['one_cate_topic_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'topic');if (count($_from)):
    foreach ($_from AS $this->_var['topic']):
?>
							<li class="topic_li">
						 	      <a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=".$this->_var['topic']['id']."".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['topic']['user_id'],
  'type' => 'small',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
											<?php if ($this->_var['topic']['is_best'] > 0): ?>
											<i class="topic_ico ico">精华</i>
											<?php endif; ?>
											<?php if ($this->_var['topic']['is_recommend'] > 0): ?>
											<i class="topic_ico ico">推荐</i>
											<?php endif; ?>
						 	     		 </div>
										 <div class="info">
										 	<i><?php echo $this->_var['topic']['forum_title']; ?></i>
											<h3><?php echo $this->_var['topic']['short_content']; ?></h3>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<em>
													<i><?php echo $this->_var['topic']['user_name']; ?></i><i>&nbsp;•</i>
													<i><?php 
$k = array (
  'name' => 'pass_date',
  'time' => $this->_var['topic']['create_time'],
);
echo $k['name']($k['time']);
?></i><i>&nbsp;•</i>
						                         	<?php echo $this->_var['topic']['reply_count']; ?><i>&nbsp;条回复</i>
													</em>												 
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>							
						 </ul>		
						<div class="fy">
							<?php echo $this->_var['pages']; ?>
						</div>
					</div><!--list-view end-->		
				 
				</div><!--wrap end-->						
<?php echo $this->fetch('./inc/footer.html'); ?>				
			