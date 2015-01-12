<?php echo $this->fetch('./inc/header.html'); ?>
<div class="wrap">
		<div class="content">
					<!--------------------------------评分星星----------20140916----------------->
					<div class="tx_star">
						<div class="five_star_grey">
								<i class="fa fa-star grey" style="color:#fc8600;"></i>
								<i class="fa fa-star grey" style="color:#fc8600;"></i>
								<i class="fa fa-star grey" style="color:#fc8600;"></i>
								<i class="fa fa-star grey" style="color:#fc8600;"></i>
								<i class="fa fa-star grey" style="color:#fc8600;"></i>
						</div>
						<b><span>5</span>分</b>
					</div> 
				
					
					<div class="comment_list_txt">
						<input type="hidden" value="<?php echo $this->_var['request']['id']; ?>" id="id">
						<input type="hidden" id = "point" value="5">
						<textarea name="content" id="content" maxlength = 140 placeholder="点击输入您的评论，最多140字"></textarea>
					</div>   
					      
					<div class="comment_commentary" onclick="add_comment()">发表评论</div>						 	
				</div>
</div>				
<script type="text/javascript">
$(".tx_star .five_star_grey i").mouseover(function(){
 	    var t=$(this).index() + 1;
        $(".tx_star .five_star_grey i").css("color","#e2e2e2");
	 	$(".tx_star .five_star_grey i:lt("+t+")").css("color","#fc8600");
        $(".tx_star b span").html(t);
        
        $("#point").val(t);
})


function  add_comment(){
	var content=$("#content").val();
	var point=$("#point").val();
	var id=$("#id").val();
	
	if(!content){
		//alert("请填写评论内容");
		$("#alert_content").html("请填写评论内容");
		$('#my-alert').modal({
			relatedTarget: this,
		});
		setTimeout(function(){
			$('#my-alert').modal('close');
		},1000);
		return false;		
	}
	
	var query = new Object();
	query.id = id;
	query.point = point;
	query.content = content;
	query.post_type = "json";
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|add_supplier_dp|"."".""); 
?>';
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data["status"]==1){ 
				//alert(data.info);
				$("#alert_content").html(data.info);
				$('#my-alert').modal({
					relatedTarget: this,
				});
				setTimeout(function(){
					$('#my-alert').modal('close');
					window.location.href="<?php
echo parse_wap_url_tag("u:index|suppliercommentlist|"."type=".$this->_var['request']['type']."&merchant_id=".$this->_var['request']['id']."".""); 
?>";
				},2000);				
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
	return false;
}

</script>
<?php echo $this->fetch('./inc/footer.html'); ?>	