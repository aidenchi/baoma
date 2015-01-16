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
	<style>
	.wrap{font: 16px/1.6em Arial, Geneva, Helvetica, sans-serif;background-image: linear-gradient(-180deg,#26afcf 0%,#2acdcd 100%);}
	.current_date{font-size:16px;font-weight:bold;margin-bottom:6px;padding-top:10px;color:#d3d3d3}
	.calendar{width:95%}
	.calendar a {display:block; width:100%; height:100%;}
	td,th{/*border-left:1px solid #999;border-bottom:1px solid #999;*/width:120px;padding:10px 0;text-align:center;color:#fff}
	table{/*border-right:1px solid #999;border-top:1px solid #999*/}
	th{color:#d3d3d3}
	.other-month{}
	.calendar td  span {padding-left:4px;}
	.am-icon-tag {color:#97D34B}
	.am-icon-tags {color:#97D34B}
	table a {color:#97D34B}
	table a:hover {color:#97D34B}
	</style>
</head> 
<body>
	<?php echo $this->fetch('./inc/pop.html'); ?>

			<div class="growth_diary_top">
				<div class="growth_diary_date">
					<div style="float:left;width:50%;text-align:left;">
						<a href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist#index|"."".""); 
?>'>
							<span class="am-icon-list" style="font-size:30px; color:#fff;margin:10px;"></span>
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
					<img style="border-radius:60px;" src='<?php 
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
echo parse_wap_url_tag("u:index|growthdiarylist_public#index|"."".""); 
?>'>
						<span class="am-icon-calendar" style="margin-left:6px;color:#fff;"></span><span style="padding-left:10px;line-height:30px;font-size:16px;color:#fff;font-weight:bold">成长圈</span>
					</a>
				 </div>
			</div>

			<div class="wrap">
				<center>
				<div class="current_date">
					<a href="javascript:void(0);" onclick="preMonth()"><span class="am-icon-chevron-circle-left am-icon-sm" style="color:#f0f0f0"></span></a>
					&nbsp;<font id="current_year"></font>年<font id="current_month"></font>月
					<a href="javascript:void(0);" onclick="nextMonth()"><span class="am-icon-chevron-circle-right am-icon-sm" style="color:#f0f0f0"></span></a>
					<!--<input type="button" value="当月" onclick="nowMonth()"/>-->
				</div>
				<div class="calendar" id="calendar"></div>
				</center>

			</div><!--wrap end-->
	<?php echo $this->fetch('./inc/footer.html'); ?>

	<script type="text/javascript" src="./js/calendar/jquery.calendar-widget.js"></script>
	<script type="text/javascript">
	//获取当前年月
	var myDate = new Date();
	var now_year = myDate.getFullYear();//获取完整的年份(4位,1970-????)
	var now_month = myDate.getMonth();//(0-11,0代表1月)

	$(function(){
		//页面首次加载时显示当前年月的日历
		$("#current_year").html(now_year);
		$("#current_month").html(now_month+1);
		$('#calendar').calendarWidget({month:now_month,year:now_year});
		getGrowthdairy(now_year,now_month+1);
	});

	//下一个月
	function nextMonth(){
		if(now_month>=0 && now_month<11){
			now_month = now_month+1;
		}else{
			if(now_month == 11){
				now_month = 0;
				now_year = now_year+1;
			}
		}
		$("#current_year").html(now_year);
		$("#current_month").html(now_month+1);
		$('#calendar').calendarWidget({month:now_month,year:now_year});
		getGrowthdairy(now_year,now_month+1);
	}

	//上一个月
	function preMonth(){
		if(now_month == 0){
			now_month = 11;
			now_year = now_year-1;
		}else{
			if(now_month>0 && now_month<=11){
				now_month = now_month-1;
			}
		}
		$("#current_year").html(now_year);
		$("#current_month").html(now_month+1);
		$('#calendar').calendarWidget({month:now_month,year:now_year});
		getGrowthdairy(now_year,now_month+1);
	}

	/*
	//当月
	function nowMonth(){
		now_year = myDate.getFullYear();
		now_month = myDate.getMonth();
		$("#current_year").html(now_year);
		$("#current_month").html(now_month+1);
		$('#calendar').calendarWidget({month:now_month,year:now_year});
	}
	*/

	//获取日历界面所显示的年月的成长日记
	function getGrowthdairy(current_year_val, current_month_year){
		var query = new Object();
		query.current_year = current_year_val;
		query.current_month = current_month_year;
		query.post_type = "json";
		var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|growthdiarydate#index|"."".""); 
?>';
		$.ajax({
			url:ajaxurl,
			data:query,
			type:"post",
			dataType:"json",
			success:function(data){
				$.each(data.growth_diary_list, function(i, item){
					var day_id = "day"+item['record_day'];
					var tag_icon_html = "<span class='am-icon-tag'></span>"				
					var td_old_content = document.getElementById(day_id).innerHTML;
					var icon_html = "";					
					if(td_old_content.indexOf("am-icon") <= 0 ){
						icon_html = tag_icon_html;
					}
					var td_new_content = "<a href='index.php?ctl=growthdiarydatelist&year="+current_year_val+"&month="+current_month_year+"&day="+item['record_day']+"'>"+icon_html+td_old_content+"</a>"
					document.getElementById(day_id).innerHTML = td_new_content;
				});
			},
			error:function(){
				//alert("服务器提交错误");
				$("#alert_content").html("服务器提交错误，请稍后重新操作");
				$('#my-alert').modal({
					relatedTarget: this,
				});
			}
		});
	}
	</script>
</body>
</html>	
