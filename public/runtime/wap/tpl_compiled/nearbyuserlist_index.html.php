<?php if ($this->_var['is_ajax'] == 1): ?>
<?php echo $this->fetch('./inc/nearbyuserlist_key_item.html'); ?>
<?php die();?>
<?php endif; ?>
<?php echo $this->fetch('./inc/header_common.html'); ?>
<?php
		$this->_var['parse_pagecss'][] = $this->_var['TMPL_REAL']."/css/merchantlist_index.css";	
			
?>
<link rel="stylesheet" type="text/css" href='<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['parse_pagecss'],
);
echo $k['name']($k['v']);
?>' />
<!--ajax 刷新数据部分 start-->
<div id="ajax_user_list">
	<?php echo $this->fetch('./inc/nearbyuserlist_key_item.html'); ?>
</div><!--ajax_user_list end-->
<!--ajax 刷新数据部分 end-->

<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
<script>
$(document).ready(function () {	
	if($("#hide_xpoint").val()>0){//如果定位坐标有值或位置有值
	
	}else{//如果定位坐标没有值，也没有选择位置，则执行定位获取坐标读取我附近
		get_nearby_user();
	}
});

function get_nearby_user(){
	$(".more_search_pull_down").hide();	
	if($("#hide_xpoint").val()>0 && $("#hide_ypoint").val()>0){
		ajaxgetbyxypoint($("#hide_xpoint").val(),$("#hide_ypoint").val(),'all');	
	}else{
		$("#loading").show();
		var geolocation = new BMap.Geolocation(); 
		var geoc = new BMap.Geocoder(); 
		geolocation.getCurrentPosition(function (r) { 			
			
			if (this.getStatus() == BMAP_STATUS_SUCCESS ) { 
				//origin = r.point.lng + "," + r.point.lat; 			
				//alert("我所在位置的坐标："+origin); 
				var longitude=r.point.lng;
				var latitude=r.point.lat;			
				var pt = r.point;
				geoc.getLocation(pt, function(rs){
					//alert(rs.address);
					var location = rs.address;
					userxypoint(longitude,latitude,location);
				});
			/*	
			//模拟
			if(1==1){
				var longitude=114.41776;
				var latitude=30.483698;	
			*/
				$("#hide_xpoint").val(longitude);
				$("#hide_ypoint").val(latitude);
				ajaxgetbyxypoint(longitude,latitude,'all');				
			}else{
				//alert("定位失败，请稍后刷新重试");	
				$("#alert_content").html("定位失败，请稍后刷新重试");
				$('#my-alert').modal({
					relatedTarget: this,
				});
				setTimeout(function(){
					$('#my-alert').modal('close');
				},2000);
				ajaxgetbyxypoint(0,0,'all');
			}
		});	
	}
}

function ajaxgetbyxypoint(longitude,latitude,distance){
	//alert("ajaxgetbyxypoint");
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|nearbyuserlist|"."".""); 
?>';
	var query = new Object();
	query.sex = $("#hide_sex").val();
	query.xpoint = longitude;
	query.ypoint = latitude;
	query.distance = distance;
	query.is_ajax=1;
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"Post",
		dataType:"text",
		success:function(data){
			//alert("yes");
			$("#ajax_user_list").html(data);
		}
		,error:function(){
			alert("服务器提交错误");
		}
	});	
}

//如果当前用户是登录状态，记录它的坐标
function userxypoint(longitude,latitude,location){	
	//alert("userxypoint");
	var query = new Object();
	query.latitude = latitude;
	query.longitude = longitude;
	query.location = location;
	//alert(query.latitude+"--"+query.longitude+"--"+query.location);
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
			//alert("userxypoint--yes");
		}
		,error:function(){	
			//alert("userxypoint--no");
		}
	});		 		
}

//根据昵称查询
function search_submit(){			
	var keyword=$("#keyword").val();
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|nearbyuserlist|"."".""); 
?>';
	var query = new Object();
	query.keyword = keyword;
	query.xpoint = $("#hide_xpoint").val();
	query.ypoint = $("#hide_ypoint").val();
	query.distance = "all";
	query.is_ajax=1;
	//alert(query.keyword);
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"Post",
		dataType:"text",
		success:function(data){
			//alert(data);
			$("#ajax_user_list").html(data);
		}
		,error:function(){
			//alert("服务器提交错误");
		}
	});	
}
</script>

			
<!------------------------------------------footer-------------------------------------------->				
<?php echo $this->fetch('./inc/footer.html'); ?>				
			