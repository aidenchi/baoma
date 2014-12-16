<?php echo $this->fetch('./inc/header.html'); ?>
<div class="wrap">
	<div class="content">
					
					<div class="goods_abbr">
						  <div class="person_account">
						  	 
							   <div class="account_info">
							   	    <div class="pic">
							   	    	<img src="<?php echo $this->_var['data']['user_avatar']; ?>" width="59" height="59">
							   	    </div>
									<div class="name">
										  <b><?php echo $this->_var['data']['user_name']; ?></b>
										  <p><?php echo $this->_var['data']['user_point_level']; ?>&nbsp;&nbsp;经验值:<font class="font-fc8"><?php echo $this->_var['data']['user_point']; ?></font></p>
									</div>
							   </div>
						  </div>
						  
					</div>	

 <div class="blank8"></div>
	
	          <div class="list-view">
				       <ul class="person_details one">
				       	    <li>
				       	    	<a href=''  p="pay_status=0"}">
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-tags"></i>
										<span>评论回复</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
							<li>
				       	    	<a href=''>
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-truck"></i>
										<span>论坛回复</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
							<li>
				       	    	<a href=''>
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-tag"></i>
										<span>私信</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
				       </ul>		 
				</div>       
							
   <div class="blank8"></div>
   
              <div class="list-view">
				       <ul class="person_details one">
				       	    <li>
				       	    	<a href=''>
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-map-marker"></i>
										<span>我的点评</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
							<li>
				       	    	<a href='<?php
echo parse_wap_url_tag("u:index|mytopiclist#index|"."".""); 
?>'>
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-bullhorn "></i>
										<span>我的主帖</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>							
							<li>
								<a href='<?php
echo parse_wap_url_tag("u:index|collect_list#index|"."".""); 
?>'>
									<div class="per_li">
										<i class="fa fa-bullhorn "></i>
										<span>我的收藏</span>
										<i class="fa fa-chevron-right"></i>
									</div>
								</a>
							</li>
				       </ul>		 
				</div>
			   				
	<div class="blank8"></div>
   
                 <div class="list-view">
				       <ul class="person_details one">
				       	    <li>
				       	    	<a href="">
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-bullhorn "></i>
										<span>草稿箱</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
							<li>
				       	    	<a href="">
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-bullhorn "></i>
										<span>浏览历史</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
				       </ul>		 
				</div>

	<div class="blank8"></div>
   
                 <div class="list-view">
				       <ul class="person_details one">
				       	    <li>
				       	    	<a href="">
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-bullhorn "></i>
										<span>我的关注</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
							<li>
				       	    	<a href="">
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-bullhorn "></i>
										<span>我的粉丝</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
				       </ul>		 
				</div>
				
	<div class="blank8"></div>
   
                 <div class="list-view">
				       <ul class="person_details one">
				       	    <li>
				       	    	<a href="">
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-bullhorn "></i>
										<span>个人资料</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
							<li>
				       	    	<a href='<?php
echo parse_wap_url_tag("u:index|pwd#index|"."".""); 
?>'>
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-lock"></i>
										<span>修改密码</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
							<li>
				       	    	<a href='<?php
echo parse_wap_url_tag("u:index|login_out#index|"."&post_type=unset".""); 
?>'>
				       	    	    <div class="per_li">
				       	    	    	<i class="fa fa-lock"></i>
										<span>退出当前账号</span>
										<i class="fa fa-chevron-right"></i>
				       	    	    </div>
				       	        </a>
							</li>
				       </ul>		 
				</div>
				<!--
					<div class="buy ">
						  <a href="<?php
echo parse_wap_url_tag("u:index|login_out#index|"."&post_type=unset".""); 
?>" class="plank">退出当前账号</a>
					</div>	
				-->
				</div>

</div>
<?php echo $this->fetch('./inc/footer.html'); ?> 