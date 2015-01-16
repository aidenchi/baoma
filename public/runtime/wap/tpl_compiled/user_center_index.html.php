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
				<div class="content">
					<div class="list-view">
						  <div class="person_account">						  	 
							   <div class="account_info">
							   	    <div class="pic" style="float:left; margin-right:12px; width:80px;">
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
										  <p style="padding-right:5px; font-size:18px; color:#fff;"><?php echo $this->_var['data']['user_name']; ?>
										  <?php if ($this->_var['data']['sex'] == 0): ?>
											<span class="am-icon-female" style="color:#f60;margin-left: 6px;
line-height: 34px" ></span>
											<?php endif; ?>
											<?php if ($this->_var['data']['sex'] == 1): ?>
											<span class="am-icon-male" style="color:#0c9f02;margin-left: 6px;
line-height: 34px"></span>
											<?php endif; ?>
										      
										  </p>
										  
										  <p style="color:#497746;">
										  <span class="am-icon-bookmark"  style="color:#0c9f02;"></span><?php echo $this->_var['data']['user_point_level']; ?>&nbsp;&nbsp;
										  </p>
										  <P style="color:#497746;">
										  <span class="am-icon-paw am-icon-spin"  style="color:#0c9f02;"></span><?php echo $this->_var['data']['score']; ?>&nbsp;&nbsp;&nbsp;&nbsp;
										  <span class="am-icon-btc  am-icon-spin"   style="color:#0c9f02;"></span><?php echo $this->_var['data']['user_point']; ?>&nbsp;
										  </P>
										  
									</div>
							   </div>
						  </div>						  
					</div>	<!--list-view end-->

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
                            	<span class="am-icon-smile-o am-icon-btn"></span><p>我的粉丝</p>
                                </a>
                            </div>
                        </li>
                        <li>
                        	<div>
                            	<a href='<?php
echo parse_wap_url_tag("u:index|mytopiclist#index|"."".""); 
?>'>
                            	<span class="am-icon-file-text-o am-icon-btn"></span><p>我的帖子</p>
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
                            	<span class="am-icon-reply am-icon-btn"></span><p>我的点评</p>
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
                </div><!--list-view end-->

			</div><!--content end-->
		</div><!--wrap end-->

	<?php echo $this->fetch('./inc/footer.html'); ?> 
	
</body>
</html>	