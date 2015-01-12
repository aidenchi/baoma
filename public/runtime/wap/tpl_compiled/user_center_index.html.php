<?php echo $this->fetch('./inc/header_common.html'); ?>
<div class="wrap">
	<div class="content">
					<div class="list-view">
						  <div class="person_account">						  	 
							   <div class="account_info">
							   	    <div class="pic">
							   	    	<img src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['data']['uid'],
  'type' => 'middle',
);
echo $k['name']($k['uid'],$k['type']);
?>' width="80" height="80">
							   	    </div>
									<div class="name">
										  <b style="padding-right:5px; font-size:16px;"><?php echo $this->_var['data']['user_name']; ?></b>
										  <b>
											<?php if ($this->_var['user']['sex'] == 0): ?>
											<span class="am-icon-female" style="color:#EF62E5"></span>
											<?php endif; ?>
											<?php if ($this->_var['user']['sex'] == 1): ?>
											<span class="am-icon-male" style="color:#35A7F9"></span>
											<?php endif; ?>
										  </b>
										  <P style="color:#F9E734;">
										  <span class="am-icon-paw am-icon-spin"  style="color:#F3F927;"></span><?php echo $this->_var['data']['score']; ?>&nbsp;&nbsp;&nbsp;&nbsp;
										  <span class="am-icon-btc  am-icon-spin"   style="color:#F3F927;"></span><?php echo $this->_var['data']['user_point']; ?>
										  </P>
										  <p style="color:#F9E734;">
										  <span class="am-icon-long-arrow-up"  style="color:#F3F927;"></span><?php echo $this->_var['data']['user_point_level']; ?>&nbsp;&nbsp;
										  </p>
									</div>
							   </div>
						  </div>
						  
					</div>	

                <!--2015-01-07添加-->
                <div class="list-view">
                	<ul class="user-center am-avg-sm-3 am-avg-md-3 am-avg-lg-3">
                    	<li>
                        	
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|myfocuslist#index|"."".""); 
?>'>
                            	<span class="am-icon-at am-icon-btn"></span><p>我的关注</p>
                                </a>
                            </div>
                        </li>
                        <li>
                        	<div>
                                <a href='<?php
echo parse_wap_url_tag("u:index|myfanslist#index|"."".""); 
?>'>
                            	<span class="am-icon-child am-icon-btn"></span><p>我的粉丝</p>
                                </a>
                            </div>
                        </li>
                        <li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|mytopiclist#index|"."".""); 
?>'>
                            	<span class="am-icon-child am-icon-btn"></span><p>我的帖子</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|mymsglist#index|"."".""); 
?>'>
                            	<span class="am-icon-envelope am-icon-btn"></span>
								<p>私信
								<?php if ($this->_var['data']['msg_noread_count'] > 0): ?>
								<span class="user-message am-icon-btn"><?php echo $this->_var['data']['msg_noread_count']; ?></span>
								<?php endif; ?>
								</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<?php if ($this->_var['data']['growth_diary_total_noread_count'] > 0): ?>
				       	    	<a href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitemreplymsg#index|"."".""); 
?>'>
								<?php else: ?>
								<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist_public#index|"."".""); 
?>'>
								<?php endif; ?>
                            	<span class="am-icon-calendar am-icon-btn"></span>
								<p>成长日历
								<?php if ($this->_var['data']['growth_diary_total_noread_count'] > 0): ?>
								<span class="user-message am-icon-btn"><?php echo $this->_var['data']['growth_diary_total_noread_count']; ?></span>
								<?php endif; ?>
								</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<a href="#">
                            	<span class="am-icon-gift am-icon-btn"></span><p>积分商城</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|mygoodscommentreplylist#index|"."".""); 
?>'>
                            	<span class="am-icon-comment am-icon-btn"></span>
								<p>评论回复
								<?php if ($this->_var['data']['goods_dp_reply_noread_count'] > 0): ?>
								<span class="user-message am-icon-btn"><?php echo $this->_var['data']['goods_dp_reply_noread_count']; ?></span>
								<?php endif; ?>
								</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|topicitemreplymsg#index|"."".""); 
?>'>
                            	<span class="am-icon-comments am-icon-btn"></span>
								<p>论坛回复
								<?php if ($this->_var['data']['topic_replynoread_count_total'] > 0): ?>
								<span class="user-message am-icon-btn"><?php echo $this->_var['data']['topic_replynoread_count_total']; ?></span>
								<?php endif; ?>
								</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|mysuppliercommentlist#index|"."".""); 
?>'>
                            	<span class="am-icon-child am-icon-btn"></span><p>我的点评</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<a href="#">
                            	<span class="am-icon-edit am-icon-btn"></span><p>草稿箱</p>
                                </a>
                            </div>
                        </li>
                         <li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|mycollectlist#index|"."".""); 
?>'>
                            	<span class="am-icon-star am-icon-btn"></span><p>收藏</p>
                                </a>
                            </div>
                        </li>
                        <li>
                        	<div>
                            	<a href="#">
                            	<span class="am-icon-history am-icon-btn"></span><p>浏览历史</p>
                                </a>
                            </div>
                        </li>
						<li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|myinfo#index|"."".""); 
?>'>
                            	<span class="am-icon-user am-icon-btn"></span><p>个人资料</p>
                                </a>
                            </div>
                        </li>
						<li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|pwd#index|"."".""); 
?>'>
                            	<span class="am-icon-shield am-icon-btn"></span><p>修改密码</p>
                                </a>
                            </div>
                        </li>
						<li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|login_out#index|"."&post_type=unset".""); 
?>'>
                            	<span class="am-icon-power-off am-icon-btn"></span><p>退出</p>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>

</div>



<?php echo $this->fetch('./inc/footer.html'); ?> 