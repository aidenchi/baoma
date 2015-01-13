<?php echo $this->fetch('./inc/header_common.html'); ?>
			<div class="header">
				<div class="c-hd">
					<section class="cut_city">
						  <a onclick="window.history.go(-1);" style="cursor:pointer;">取消</a>
					</section>
					<section class="logo_img"></section>
					<section style="padding:10px 10px;display:inline-block;position:relative;font-size: 18px;">
						<a onclick="check_submit();" style="color:#fff;cursor:pointer;">发送</a>
					</section>
				 </div>	 
			</div>	
			
<form class="am-form">
	<fieldset>
		<div class="am-form-group" >
			<textarea class="" rows="5" name="content" id="content" placeholder="这一刻的想法……"></textarea>
			
			<label class="growth_pic_fileupload" >
			  <span class="am-icon-image"></span>
			  <input type="file" class="filebox" name="growth_diary_image" id="growth_diary_image" onchange="uploadImage();">
			</label>
			<label class="growth_pic_fileupload" >
			  <span class="am-icon-video-camera"></span>
			  <input type="file" class="filebox" name="growth_diary_video" id="growth_diary_video" onchange="uploadVideo();">
			</label>
			<div id="image_box" style="padding-left:15px;">
				
			</div>
		</div>
		<div class="blank8"></div>
		<div class="blank8"></div>
		<div class="blank8"></div>
		<div class="am-form-group">
			<input type="text" class="am-form-field" placeholder="所在位置" name="location" id="location" onclick="get_location()">
		</div>
		<div class="am-form-group">
		  <select id="is_public" name="is_public">
			<option value="0" >私密</option>
			<option value="1" >公开</option>
		  </select>
		  <span class="am-form-caret"></span>
		</div>
	</fieldset>
</form>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>	
<script type="text/javascript" src="./js/ajaxupload.js"></script>	
<script type="text/javascript" src="./js/jquery.bgiframe.js"></script>	
<script type="text/javascript" src="./js/jquery.weebox.js"></script>			
<script type="text/javascript">
//上传视频
function uploadVideo(){
	$.ajaxFileUpload({
		url : '/growthdiaryupload_video.php',
		secureuri : false,
		fileElementId : 'growth_diary_video',
		dataType : 'json',		
		success : function(data, status) {
			alert(data.error);
			//页面操作暂未写
		},
		error : function(data, status, e) {
			
		}
	});
}
//上传图片
function uploadImage(){
	if($("#image_box").find(".image_item").length==9){
		//alert("每篇日记上传的图片不要超过9张");
		$("#alert_content").html("每篇日记上传的图片不要超过9张");
		$('#my-alert').modal({
			relatedTarget: this,
		});
		return;
	}
	$.ajaxFileUpload({
		url : '/growthdiaryupload.php',
		secureuri : false,
		fileElementId : 'growth_diary_image',
		dataType : 'json',		
		success : function(data, status) {
			//alert(data.error+"--"+data.message+"--"+data.name);
			if(data.error==0){
				var html = "<div class='image_item'><input type='hidden' name='growth_diary_image_id' value='"+data.id+
				"' /><span class='del_image' onclick='del_img(this);'>x</span><img src='"+data.message+"' /></div>";
				$("#image_box").html($("#image_box").html()+html);
			}else{
				 //alert(data.message);
				$("#alert_content").html(data.message);
				$('#my-alert').modal({
					relatedTarget: this,
				});
			}
		},
		error : function(data, status, e) {
			//alert('上传出错');
			$("#alert_content").html("上传出错");
			$('#my-alert').modal({
				relatedTarget: this,
			});
		}
	});
}
//删除图片
function del_img(o){
	$(o).parent().remove();
}

function get_location(){
	$("#location").val("正在定位…");
	var geolocation = new BMap.Geolocation(); 
	var geoc = new BMap.Geocoder(); 
	geolocation.getCurrentPosition(function (r) { 	
		if (this.getStatus() == BMAP_STATUS_SUCCESS ) { 
			origin = r.point.lng + "," + r.point.lat; 			
			//alert("我所在位置的坐标："+origin); 
			var pt = r.point;
            geoc.getLocation(pt, function(rs){
                //alert(rs.address);
				$("#location").val(rs.address);
            }); 
		}else{
			//alert('定位失败');
			$("#alert_content").html("定位失败");
			$('#my-alert').modal({
				relatedTarget: this,
			});
			$("#location").val("");
		}
	});	
}

function  check_submit(){	
	var flag = true;
	if($.trim($("#content").val())==''){
		//alert("请输入内容");
		$("#alert_content").html("请输入内容");
		$('#my-alert').modal({
			relatedTarget: this,
		});
		setTimeout(function(){
			$('#my-alert').modal('close');
		},1000);
		flag = false;
	}
	//图片
	var has_pic_val = 0;
	var pic_ids_val = "";
	var growth_diary_image_id = document.getElementsByName("growth_diary_image_id");
	if(growth_diary_image_id.length > 0){
		has_pic_val = 1;
		for (var i=0; i < growth_diary_image_id.length; i++) {
			growth_diary_image_id_val = growth_diary_image_id.item(i).value;
			pic_ids_val = pic_ids_val+","+growth_diary_image_id_val;
		}
		//alert(has_pic_val+"---"+pic_ids_val);
	}	
	
	var query = new Object();
	query.id = $("#growth_diary_id").val();
	query.content = $("#content").val();
	query.location = $("#location").val();
	query.is_public = $("#is_public option:selected").val()
	query.has_pic = has_pic_val;
	query.pic_ids = pic_ids_val;
	query.post_type = "json";
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|growthdiaryadd|"."".""); 
?>';
	if(flag){
		$.ajax({
			url:ajaxurl,
			data:query,
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.status==1){ 	
					//alert(data.info);
					if(data.action_flag == 1){
						window.location.href='<?php
echo parse_wap_url_tag("u:index|growthdiaryitem#index|"."id=".$this->_var['data']['id']."".""); 
?>';					
					}else{
						window.location.href='<?php
echo parse_wap_url_tag("u:index|growthdiarylist#index|"."".""); 
?>';
					}
				}else{
					//alert(data.info);
					$("#alert_content").html(data.info);
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
	}
}
</script>	
				
<?php echo $this->fetch('./inc/footer.html'); ?>				
			