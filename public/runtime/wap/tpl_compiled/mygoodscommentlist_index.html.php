<?php echo $this->fetch('./inc/header.html'); ?>
<div class="wrap">
	<div class="content">
	<div class="comment_list_txt1">
		<div id="Tab1">
			<div class="Menubox">
				<ul>
				   <li id="one1" onclick="javascrtpt:window.location.href='<?php
echo parse_wap_url_tag("u:index|mysuppliercommentlist#index|"."".""); 
?>'" style="background:#fff;" border-right:1px solid #ccc;">店铺点评(共<span id="my_supplier_comment_count"><?php echo $this->_var['data']['my_supplier_comment_count']; ?></span>条)</li>
				   <li id="one2" onclick="javascrtpt:window.location.href='<?php
echo parse_wap_url_tag("u:index|mygoodscommentlist#index|"."".""); 
?>'"  class="hover" style="border-left:1px solid #ccc;">商品点评(共<span id="my_goods_comment_count"><?php echo $this->_var['data']['my_goods_comment_count']; ?></span>条)</li>
				</ul>
			</div>
			<div class="Contentbox">  
			   <div id="con_one_1" class="hover">
					<div class="blank8"></div>
					<div class="list-view bor_none">
						 <?php if ($this->_var['data']['my_goods_comment_list']): ?>
							 <ul class="shop_comment_list">
								<?php $_from = $this->_var['data']['my_goods_comment_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comment');if (count($_from)):
    foreach ($_from AS $this->_var['comment']):
?>
								<li id="goods_comment_<?php echo $this->_var['comment']['id']; ?>">
									<div class="name">我对“<a href='<?php
echo parse_wap_url_tag("u:index|goodsdesc#index|"."id=".$this->_var['comment']['goods_id']."".""); 
?>'><?php echo $this->_var['comment']['goods_name']; ?></a>”点评:</div>
									<div class="comment_star">
										<div class="five_star_orange">
												<i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
												<div class="five_star_grey" style="width:<?php echo $this->_var['comment']['width']; ?>%;">
													<i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
												</div>
									   </div>
									   <span class="comment_time">
									   <?php echo $this->_var['comment']['create_time_format']; ?>
									   <?php if ($this->_var['comment']['is_effect'] == 0): ?><i style="color:red;">未审核</i>&nbsp;<?php endif; ?>
									   <a href="javascript:void(0);" onclick="delete_goods_comment_confirm(<?php echo $this->_var['comment']['id']; ?>,$('#goods_comment_<?php echo $this->_var['comment']['id']; ?>'));"><span class="am-icon-remove"></span></a>
									   </span>
									</div>
									<div class="comment_p">
									<?php echo $this->_var['comment']['content']; ?>
									</div>
									<?php if ($this->_var['comment']['admin_reply']): ?>
									<div class="comment_star" style="background-color:#E2E2E2;">
										<span style="color:#6E7D8B;">管理员回复：</span><?php echo $this->_var['comment']['admin_reply']; ?>
										<span class="comment_time"><?php echo $this->_var['comment']['update_time_format']; ?></span>										
									</div>
									<?php endif; ?>
								</li>
								<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							 </ul>
							 <?php if ($this->_var['data']['page']['page_total'] > 1): ?>
							 <div class="fy">
								<?php echo $this->_var['pages']; ?>
							 </div>
							 <?php endif; ?>
							 <?php else: ?>
							 <div class="assess_list" style="text-align:center;padding:10px 0;"> 暂无评论</div>
							 <?php endif; ?>
					</div><!--list-view end-->
			   </div>
			</div>
		</div>	
	</div>
	</div>
</div>

<script type="text/javascript">
function delete_goods_comment_confirm(goods_comment_id,one_goods_comment_li_obj){
	 $("#confirm_content").html("您确定要删除这条点评吗");
	 $('#my-confirm').modal({
        relatedTarget: this,
        onConfirm: function(options) {
			delete_goods_comment(goods_comment_id,one_goods_comment_li_obj); 
		},
        onCancel: function() {
			
        }
      });
}

function delete_goods_comment(goods_comment_id,one_goods_comment_li_obj){
	var query = new Object();
	query.goods_comment_id = goods_comment_id;
	query.post_type = "json";
	var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|goodscommentdel#index|"."".""); 
?>';
	//alert(query.topic_reply_id);	
	$.ajax({
		url:ajaxurl,
		data:query,
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.status==1){ 	
				one_goods_comment_li_obj.hide();
				var my_goods_comment_count = $("#my_goods_comment_count").html();
				my_goods_comment_count = parseInt(my_goods_comment_count)-1;
				$("#my_goods_comment_count").html(my_goods_comment_count);
				//alert(data.info);
				location.reload();
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
</script>

<div class="amz-toolbar" id="amz-toolbar">
<a href="#top" title="回到顶部" class="am-icon-btn am-icon-arrow-up am-active" id="amz-go-top"></a>
</div>	