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
					<div class="am-form-group">
						<textarea style=" font-size: 1.2rem;" rows="5" name="content" id="content" placeholder="这一刻的想法……"></textarea>
						<label class="growth_pic_fileupload" >
						  <span class="am-icon-smile-o am-icon-lg" style="color:#ababab" onclick="insertFace();"></span>
						</label>
						<label class="growth_pic_fileupload" >
						  <span class="am-icon-image am-icon-lg" style="color:#ababab"></span>
						  <input type="file" class="filebox" name="growth_diary_image" id="growth_diary_image" onchange="uploadImage();">
						</label>
						<label class="growth_pic_fileupload" >
						  <span class="am-icon-video-camera am-icon-lg" style="color:#ababab"></span>
						  <input type="file" class="filebox" name="growth_diary_video" id="growth_diary_video" onchange="uploadVideo();">
						</label>
						<div id="image_box" style="padding-left:15px;">
						</div>
					</div>
			
					<div id="face_list" style="display:none;background:#fff;width:250px;height:200px;border-radius:3px;box-shadow:0 4px 20px 1px rgba(0,0,0,0.2);
					position:absolute;z-index:9999;margin:-30px 20px;text-align:center;">
						<ul>
						<?php $_from = $this->_var['data']['qq_expression']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'qq_face');if (count($_from)):
    foreach ($_from AS $this->_var['qq_face']):
?>		
							<li style="float: left;border: 1px solid #e8e8e8;width: 26px;height: 26px;overflow: hidden;margin: -1px 0 0 -1px;padding: 0px 2px;text-align: center;">
								<a href="javascript:void(0);" onclick="insertfaceToContent('<?php echo $this->_var['qq_face']['emotion']; ?>')" title="<?php echo $this->_var['qq_face']['emotion']; ?>" rel="<?php echo $this->_var['qq_face']['emotion']; ?>"><img src="<?php echo $this->_var['qq_face']['filename']; ?>"></a>
							</li>							
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						</ul>
					</div>

					<div class="blank8"></div>
					<div class="blank8"></div>
					<div class="blank8"></div>
					<div class="am-form-group am-form-icon">
					<i class="am-icon-location-arrow"></i>
						<input type="text"  style="font-size: 1.2rem;"  class="am-form-field" placeholder="所在位置" name="location" id="location" onclick="get_location()">
					</div>
					<div class="am-form-group">
						
						  <select id="is_public"  style="font-size: 1.2rem;color:#999"  name="is_public">
							<option value="0" >私密</option>
							<option value="1" >公开</option>
						  </select>
					  <span class="am-form-caret"></span>
					</div>
				</fieldset>
			</form>
	<?php echo $this->fetch('./inc/footer.html'); ?>
	
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
	<script type="text/javascript" src="./js/ajaxupload.js"></script>
	<script type="text/javascript">
	//插入表情
	function insertFace(){
		$("#face_list").toggle(300);
	}
	function insertfaceToContent(emotion){
		var old_content = $("#content").val();
		var face_html = emotion;
		new_content = old_content + face_html;
		$("#content").val(new_content);
		$("#content").focus();
		$("#face_list").toggle(300);
	}
	//上传视频
	function uploadVideo(){
		$('#loading_content').html("正在上传……");
		$('#my-loading').modal({
			relatedTarget: this,
		});
		$.ajaxFileUpload({
			url : '/growthdiaryupload_video.php',
			secureuri : false,
			fileElementId : 'growth_diary_video',
			dataType : 'json',
			success : function(data, status) {
				$('#my-loading').modal('close');
				//alert(data.error);
				if(data.error == 1){
					$("#alert_content").html("您上传的视频格式不正确");
					$('#my-alert').modal({
						relatedTarget: this,
					});
				}
				if(data.error == 2){
					$("#alert_content").html("您上传的视频文件太大");
					$('#my-alert').modal({
						relatedTarget: this,
					});
				}
				if(data.error == 3){
					$("#alert_content").html("抱歉，上传失败，稍后重试");
					$('#my-alert').modal({
						relatedTarget: this,
					});
				}
				if(data.error == 0){
					var html = "<div class='video_item'>"+
						"<input type='hidden' name='growth_diary_video_id' value='"+data.id+"'>"+
						"<video height='100' src='"+data.video_path+"' preload='Metadata' controls='controls'>您的浏览器不支持 video 标签。</video ></div>";
					$("#image_box").html($("#image_box").html()+html);
				}
			},
			error : function(data, status, e) {
				$('#my-loading').modal('close');
				$("#alert_content").html("抱歉，上传失败，稍后重试");
				$('#my-alert').modal({
					relatedTarget: this,
				});
			}
		});
	}
	//上传图片
	function uploadImage(){
		$('#loading_content').html("正在上传……");
		$('#my-loading').modal({
			relatedTarget: this,
		});
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
				$('#my-loading').modal('close');
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
				$('#my-loading').modal('close');
				$("#alert_content").html("抱歉，上传失败，稍后重试");
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
		//视频
		var has_video_val = 0;
		var video_ids_val = "";
		var growth_diary_video_id = document.getElementsByName("growth_diary_video_id");
		if(growth_diary_video_id.length > 0){
			has_video_val = 1;
			for (var i=0; i < growth_diary_video_id.length; i++) {
				growth_diary_video_id_val = growth_diary_video_id.item(i).value;
				video_ids_val = video_ids_val+","+growth_diary_video_id_val;
			}
			//alert(has_video_val+"---"+video_ids_val);
		}

		var query = new Object();
		query.id = $("#growth_diary_id").val();
		query.content = $("#content").val();
		query.location = $("#location").val();
		query.is_public = $("#is_public option:selected").val()
		query.has_pic = has_pic_val;
		query.pic_ids = pic_ids_val;
		query.has_video = has_video_val;
		query.video_ids = video_ids_val;
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

	</body>
</html>
	