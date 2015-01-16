<?php if ($this->_var['is_ajax'] == 1): ?>
<?php echo $this->fetch('./inc/growthdiarylist_public_key_item.html'); ?>
<?php die();?>
<?php endif; ?>

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
	
		<?php if ($this->_var['data']['login_user_id'] > 0): ?>
			<div class="growth_diary_top">
				<div class="growth_diary_date">
					<div style="float:left;width:50%;text-align:left;">
						<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarydate#index|"."".""); 
?>'>
							<span class="am-icon-calendar" style="font-size:30px; color:#fff;margin:10px;"></span>							
						</a>
					</div>
					<div style="float:left;width:50%;text-align:right;">
						<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarywrite#index|"."".""); 
?>'>
							<span class="am-icon-plus" style="font-size:30px; color:#fff;margin:10px;"></span>
						</a>
					</div>
				</div>
				<div class="growth_diary_user">
					<img style="border-radius:70px;border: 3px solid #8aa06c;" src='<?php 
$k = array (
  'name' => 'get_user_avatar',
  'uid' => $this->_var['data']['login_user_id'],
  'type' => 'middle',
);
echo $k['name']($k['uid'],$k['type']);
?>'>
					<br/>
					<span style="color:#fff; font-size:18px; line-height:24px;"><?php echo $this->_var['data']['login_user_name']; ?></span><br/>
					<span style="color:#F08D1B; font-size:16px; line-height:18px;"><?php 
$k = array (
  'name' => 'get_user_age_byid',
  'uid' => $this->_var['data']['login_user_id'],
);
echo $k['name']($k['uid']);
?></span>
				 </div>	
				 <div class="growth_circle">
					<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist#index|"."".""); 
?>'>
						<span class="am-icon-calendar" style="margin-left:6px;color:#fff;"></span><span style="padding-left:10px;line-height:30px;font-size:16px;color:#fff;font-weight:bold">我的成长日记</span>
					</a>
				 </div>
			</div>
		<?php endif; ?>
			
			<div class="wrap">					
					<?php if ($this->_var['data']['growth_diary_list']): ?>					
					<div class="list-view">
						<div class="list_title">成长圈<span style="display:inline-block; width:35%;">&nbsp;&nbsp;共<?php echo $this->_var['data']['total']; ?>篇日记</span><span style="font-size:12px; color:#bbb;">最近一篇日志发表于<?php if ($this->_var['data']['day_time'] > 0): ?><?php echo $this->_var['data']['day_time']; ?>天前<?php else: ?>今天<?php endif; ?></span></div>
						<div id="pagecontent"   style="background-color:#ecd9bc">
							<?php echo $this->fetch('./inc/growthdiarylist_public_key_item.html'); ?>
						</div>						
						<input type="hidden" name="currentpage" id="currentpage" value="<?php echo $this->_var['data']['page']['page']; ?>" />
						<input type="hidden" name="totalpage" id="totalpage" value="<?php echo $this->_var['data']['page']['page_total']; ?>" />
					</div><!--list-view end-->	
					<?php else: ?>
					<div style="margin-top:10px;margin-bottom:10px;text-align:center;">
					暂无成长日记
					</div>
					<?php endif; ?>					
					
				</div><!--wrap end-->		
	<?php echo $this->fetch('./inc/footer.html'); ?>	
	
	<script type="text/javascript">
	function favorite_growth_diary(growth_diary_id,author_user_id){
		//alert(growth_diary_id+"--"+author_user_id);
		var text_id = "fav_text_"+growth_diary_id;
		var fav_icon_id = "fav_icon_"+growth_diary_id;
		var count_id = "fav_count_"+growth_diary_id;
		var query = new Object();
		query.growth_diary_id = growth_diary_id;
		query.author_user_id = author_user_id;
		query.post_type = "json";
		var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|growthdiaryfavorite#index|"."".""); 
?>';

		$.ajax({
			url:ajaxurl,
			data:query,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.user_login_status==0){
					//alert(data.login_info);
					$("#alert_content").html(data.login_info);
					$('#my-alert').modal({
						relatedTarget: this,
					});
				}else{
					if(data.fav_status == 1){
						//alert("取消喜欢成功！");					
						//document.getElementById(text_id).innerText = "喜欢";
						document.getElementById(fav_icon_id).className = "am-icon-heart-o";
						document.getElementById(fav_icon_id).style.color = "";						
						var fav_count = document.getElementById(count_id).innerText;
						fav_count = parseInt(fav_count) - 1;
						document.getElementById(count_id).innerText = fav_count;
						$("#alert_content").html("取消喜欢成功！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
						setTimeout(function(){
							$('#my-alert').modal('close');
						},1000);
					}
					if(data.fav_status == 2){
						//alert("喜欢成功！");
						//document.getElementById(text_id).innerText = "已喜欢";
						document.getElementById(fav_icon_id).className = "am-icon-heart";
						document.getElementById(fav_icon_id).style.color = "#ff537b";	
						var fav_count = document.getElementById(count_id).innerText;
						fav_count = parseInt(fav_count) + 1;
						document.getElementById(count_id).innerText = fav_count;
						$("#alert_content").html("喜欢成功！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
						setTimeout(function(){
							$('#my-alert').modal('close');
						},1000);
					}
					if(data.fav_status == 3){
						//alert("操作失败");
						$("#alert_content").html("操作失败！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
						setTimeout(function(){
							$('#my-alert').modal('close');
						},2000);
					}
					if(data.fav_status == 4){
						//alert("自己不能喜欢自己的日记");
						$("#alert_content").html("自己不能喜欢自己的日记！");
						$('#my-alert').modal({
							relatedTarget: this,
						});
						setTimeout(function(){
							$('#my-alert').modal('close');
						},2000);
					}
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
	}


	$(window).scroll(function () {
		var scrollTop = $(document).scrollTop();   
		var windowHeight = $(window).height();
		var scrollHeight = $(document).height();
		//console.log("滚动条到顶部的垂直高度: "+scrollTop);     
		//console.log('浏览器的高度：'+windowHeight);  
		//console.log("页面的文档高度 ："+scrollHeight); 
		var proportion = parseFloat((scrollTop + windowHeight)/scrollHeight);
		//console.log(proportion); 
		//if (scrollTop + windowHeight == scrollHeight) {   
		if (proportion>0.98){
			//此处是滚动条到底部时候触发的事件，在这里写要加载的数据，或者是拉动滚动条的操作
			var totalpage = parseInt($("#totalpage").val());
			var currentpage = parseInt($("#currentpage").val());
			//alert("currentpage："+currentpage+"------totalpage："+totalpage);
			if(totalpage>1 && currentpage<totalpage){
				//alert("11");
				var page = currentpage+1;
				$("#currentpage").val(page);
				$("#loading").show();
				getNextPageContent(page);
			}else{
				//alert("22");
				$("#loading").slideUp("slow")
			}
		}
	});

	function getNextPageContent(page){
		var ajaxurl = '/wap/index.php?ctl=growthdiarylist_public&page='+page;
		var query = new Object();
		query.is_ajax=1;
		$.ajax({
			url:ajaxurl,
			data:query,
			type:"Post",
			dataType:"text",
			success:function(data){			
				//$("#pagecontent").html(data);
				$("#loading").slideUp("slow")
				$("#pagecontent").append(data);
			}
			,error:function(){
				//alert("服务器提交错误");
			}
		});	
	}
	</script>				
				
</body>
</html>			