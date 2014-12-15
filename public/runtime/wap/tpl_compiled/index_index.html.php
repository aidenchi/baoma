<?php echo $this->fetch('./inc/header_index.html'); ?>
<script type="text/javascript">
/*
var has_location = <?php echo $this->_var['has_location']; ?>;

	 if(has_location == 0 && navigator.geolocation)
	 {
		 var geolocationOptions={timeout:10000,enableHighAccuracy:true,maximumAge:5000};
		 
		 navigator.geolocation.getCurrentPosition(getPositionSuccess, getPositionError, geolocationOptions);
	}

	function getPositionSuccess(p){  
		has_location = 1;//定位成功; 
	    m_latitude = p.coords.latitude//纬度
	    m_longitude = p.coords.longitude;
		userxypoint(m_latitude, m_longitude);
	}
	 
	function getPositionError(error){  
		switch(error.code){  
		    case error.TIMEOUT:  
		        alert("定位连接超时，请重试");  
		        break;  
		    case error.PERMISSION_DENIED:  
		        alert("您拒绝了使用位置共享服务，查询已取消");  
		        break;  
		    default:
		    	alert("定位失败");		       
		}  
	}	 
	 //将坐标返回到服务端;
	 function userxypoint(latitude,longitude){	 	
			var query = new Object();
			query.latitude = latitude;
			query.longitude = longitude;
			query.post_type = "json";
			var ajaxurl = '<?php
echo parse_url_tag("u:index|userxypoint|"."".""); 
?>';
			$.ajax({
				url:ajaxurl,
				data:query,
				type:"post",
				dataType:"json",
				success:function(data){					
				}
				,error:function(){					
				}
			});		 		
	} 
	*/
</script>
			<div class="wrap">
					<div class="blank8"></div>
					
					<div class="list-view">
						 <div class="list_title"><i class="fa fa-bullhorn"></i>活动信息</div>
						 <ul class="">
							<li class="topic_li">
						 	      <a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=1".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src="/public/avatar/000/00/00/48virtual_avatar_middle.jpg" width="58">
											<i class="topic_ico ico">推荐</i>
						 	     		 </div>
										 <div class="info">
										 	<h2>标题</h2>
											<h3>部分内容内容内容内容内容内容内容内容</h3>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<i>admin</i><i>&nbsp;•</i><i>2014-12-10</i><i>&nbsp;•</i>
						                         	<em>2<i>条回复</i></em>													 
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<li class="topic_li">
						 	      <a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=1".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src="/public/avatar/000/00/00/48virtual_avatar_middle.jpg" width="58">
											<i class="topic_ico ico">推荐</i>
						 	     		 </div>
										 <div class="info">
										 	<h2>标题</h2>
											<h3>部分内容内容内容内容内容内容内容内容</h3>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<i>admin</i><i>&nbsp;•</i><i>2014-12-10</i><i>&nbsp;•</i>
						                         	<em>2<i>条回复</i></em>													 
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
						 </ul>						 
					</div><!--list-view end-->
					
					<div class="blank8"></div>
					
					<div class="list-view">
						 <div class="list_title"><i class="fa fa-suitcase"></i>论坛精选</div>
						 <ul class="">
							<li class="topic_li">
						 	      <a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=1".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src="/public/avatar/000/00/00/48virtual_avatar_middle.jpg" width="58">
											<i class="topic_ico ico">精华</i>
						 	     		 </div>
										 <div class="info">
										 	<h2>标题</h2>
											<h3>部分内容内容内容内容内容内容内容内容</h3>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<i>admin</i><i>&nbsp;•</i><i>2014-12-10</i><i>&nbsp;•</i>
						                         	<em>2<i>条回复</i></em>													 
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<li class="topic_li">
						 	      <a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=1".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src="/public/avatar/000/00/00/48virtual_avatar_middle.jpg" width="58">
											<i class="topic_ico ico">精华</i>
						 	     		 </div>
										 <div class="info">
										 	<h2>标题</h2>
											<h3>部分内容内容内容内容内容内容内容内容</h3>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<i>admin</i><i>&nbsp;•</i><i>2014-12-10</i><i>&nbsp;•</i>
						                         	<em>2<i>条回复</i></em>													 
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
						 </ul>						 
					</div><!--list-view end-->
					
					<div class="blank8"></div>	                   
					   
					<div class="list-view">
						 <div class="list_title"><i class="fa fa-money"></i>优惠活动</div>
						 <ul class="">
							<li class="topic_li">
						 	      <a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=1".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src="/public/avatar/000/00/00/48virtual_avatar_middle.jpg" width="58">
											<i class="topic_ico ico">推荐</i>
						 	     		 </div>
										 <div class="info">
										 	<h2>标题</h2>
											<h3>部分内容内容内容内容内容内容内容内容</h3>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<i>admin</i><i>&nbsp;•</i><i>2014-12-10</i><i>&nbsp;•</i>
						                         	<em>2<i>条回复</i></em>													 
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
							<li class="topic_li">
						 	      <a href='<?php
echo parse_wap_url_tag("u:index|topicitem#index|"."id=1".""); 
?>'>
						 	     	<div class="list_item">
						 	     		 <div class="topic_user_headimg">
						 	     		 	<img src="/public/avatar/000/00/00/48virtual_avatar_middle.jpg" width="58">
											<i class="topic_ico ico">推荐</i>
						 	     		 </div>
										 <div class="info">
										 	<h2>标题</h2>
											<h3>部分内容内容内容内容内容内容内容内容</h3>	
											<div class="topic_bottom">
						                         <p class="topic_bottom_text">
													<i>admin</i><i>&nbsp;•</i><i>2014-12-10</i><i>&nbsp;•</i>
						                         	<em>2<i>条回复</i></em>													 
												 </p>
						                     </div>
										 </div>
						 	     	</div>
						 	     </a>
						 	</li>
						</ul>						
					</div><!--list-view end-->
					
  					<div class="blank8"></div>  					
				 
				</div><!--wrap end-->			
<?php echo $this->fetch('./inc/footer.html'); ?>				
			