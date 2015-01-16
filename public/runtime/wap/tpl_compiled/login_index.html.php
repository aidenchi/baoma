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
	<?php echo $this->fetch('./inc/header.html'); ?>
	<?php echo $this->fetch('./inc/pop.html'); ?>
		<div class="wrap">	
			<div class="content">
				<div class="comment_list_txt1">
					<div id="Tab1">
					<div class="Menubox">
					<ul>
					   <li id="one1" class="hover">账号登录<a style="float:right;padding-right:10px; color:#4f8fdd;" href='<?php
echo parse_url_tag("u:index|register#index|"."".""); 
?>'>注册</a></li>
					</ul>
					</div>
					 <div class="Contentbox">  
					   <div id="con_one_1" class="hover">
							<div class="inputtxt">
							<div class="inputpc"><i class="fa fa-user"></i></div>	
							<div class="input_sr"><input type="text" id = "email" placeholder="请输入邮箱或昵称" name="email" ></div>
							</div>
							<div class="inputtxt"> 
							<div class="inputpc"><i class="fa fa-lock"></i></div>
							<div class="input_sr"><input type="password" id = "pwd" placeholder="请输入密码" name="pwd"></div>	 
							</div>
							
							<div class="btn_login">
							<input type="Button" value="登录" onclick = "javascript:do_login()" style="background: none;">
							</div>
					   </div>
					 </div>
					</div> 				
				 </div>
			</div>
		</div>
	<?php echo $this->fetch('./inc/footer.html'); ?> 
	<script type="text/javascript">
	function  do_login(){		
		var obj1=$("#email").val();
		var obj2=$("#pwd").val();
		if(!obj1){
			//alert("请填写账户或邮箱");
			$("#alert_content").html("请输入邮箱或昵称");
			$('#my-alert').modal({
				relatedTarget: this,
			});
			setTimeout(function(){
				$('#my-alert').modal('close');
			},1000);
			return false;	
		}
		if(!obj2){
			//alert("请填写密码");
			$("#alert_content").html("请输入密码");
			$('#my-alert').modal({
				relatedTarget: this,
			});
			setTimeout(function(){
				$('#my-alert').modal('close');
			},1000);
			return false;	
		}	
		
		var query = new Object();
		query.email = obj1;
		query.pwd = obj2;
		query.post_type = "json";
		var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|login|"."".""); 
?>';
		//alert(ajaxurl);
		
		$.ajax({
			url:ajaxurl,
			data:query,
			type:"Post",
			dataType:"json",
			success:function(data){
				//alert(data.info);
				/*
				if(data.user_login_status == 1){
					if(document.referrer.indexOf("login") > 0){
						window.location.href = "<?php
echo parse_wap_url_tag("u:index|index#index|"."".""); 
?>";
					}else{
						location.replace(document.referrer);
					}
				}*/
				if(data.user_login_status == 1){
					window.location.href="<?php
echo parse_wap_url_tag("u:index|user_center#index|"."".""); 
?>";
				}else{
					$("#alert_content").html("账号或密码错误，登录失败");
					$('#my-alert').modal({
						relatedTarget: this,
					});
				}
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
</body>
</html>	

