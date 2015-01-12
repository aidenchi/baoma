<?php if ($this->_var['is_ajax'] == 1): ?>
<?php echo $this->fetch('./inc/merchantlist_key_item.html'); ?>
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

<div id="J_key_item">
<?php echo $this->fetch('./inc/merchantlist_key_item.html'); ?> 
</div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
<script type="text/javascript">
//首次进入页面判断是否需要定位
$(document).ready(function(){
	if($("#hide_xpoint").val()>0 || $("#hide_quan_id").val()>0){//如果定位坐标有值或位置有值
		//alert($("#hide_xpoint").val()+"yes--"+$("#hide_quan_id").val());
	}else{//如果定位坐标没有值，也没有选择位置，则执行定位获取坐标读取我附近
		//alert("no--"+$("#hide_quan_id").val());
		get_nearby_store();
	}
});

//定位获取
function get_nearby_store(){	
	//alert("get_nearby_store");	
	$(".more_search_pull_down").hide();	
	if($("#hide_xpoint").val()>0 && $("#hide_ypoint").val()>0){
		ajaxgetbyxypoint($("#hide_xpoint").val(),$("#hide_ypoint").val(),'all','default');	
	}else{
		$("#loading").show();
		var geolocation = new BMap.Geolocation(); 
		geolocation.getCurrentPosition(function (r) { 		
			if (this.getStatus() == BMAP_STATUS_SUCCESS ) { 
				//origin = r.point.lng + "," + r.point.lat; 			
				//alert("我所在位置的坐标："+origin); 
				var longitude=r.point.lng;
				var latitude=r.point.lat;	
			/*
			//模拟
			if(1==1){
				var longitude=114.41776;
				var latitude=30.483698;	
			*/
				$("#hide_xpoint").val(longitude);
				$("#hide_ypoint").val(latitude);
				//window.location.href=$("#nearby_part_href").val()+"&xpoint="+longitude+"&ypoint="+latitude;//定位成功，读取我所在位置附近
				//$("#loading").hide();
				ajaxgetbyxypoint(longitude,latitude,'all','default');	
			}else{
				//alert("定位失败，请稍后刷新重试");
				$("#alert_content").html("定位失败，请稍后刷新重试");
				$('#my-alert').modal({
					relatedTarget: this,
				});
				setTimeout(function(){
					$('#my-alert').modal('close');
				},2000);
				//window.location.href=$("#nearby_part_href").val()+"&quan_id=1";//定位失败，读取全部位置	
				ajaxgetbyxypoint(0,0,'all','default');
			}
		});	
	}
}

//ajaxu获取内容
function ajaxgetbyxypoint(longitude,latitude,distance,order_type){
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|merchantlist|"."".""); 
?>';
	var query = new Object();
	query.cate_id = $("#hide_cate_id").val();
	query.age_id = $("#hide_age_id").val();
	query.xpoint = longitude;
	query.ypoint = latitude;
	query.distance = distance;
	query.order_type = order_type;
	query.quan_id = 1;
	query.is_ajax=1;
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"Post",
		dataType:"text",
		success:function(data){
			//alert("yes");
			$("#J_key_item").html(data);
		}
		,error:function(){
			//alert("服务器提交错误");
		}
	});	
}

//根据店铺名查询
function search_submit(){			
	var keyword=$("#keyword").val();
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|merchantlist|"."".""); 
?>';
	var query = new Object();
	query.keyword = keyword;
	query.xpoint = $("#hide_xpoint").val();
	query.ypoint = $("#hide_ypoint").val();
	query.distance = "all";
	query.order_type = "default";
	query.quan_id = 1;
	query.is_ajax=1;
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"Post",
		dataType:"text",
		success:function(data){
		//alert(data);
		$("#J_key_item").html(data);
		}
		,error:function(){
			//alert("服务器提交错误");
		}
	});	
}


//如果当前用户是登录状态，记录它的坐标
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

</script>

<!------------------------------------------footer-------------------------------------------->	
<?php echo $this->fetch('./inc/footer.html'); ?> 