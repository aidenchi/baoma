<?php if ($this->_var['is_ajax'] == 1): ?>
<?php echo $this->fetch('./inc/merchantlist_key_item.html'); ?>
<?php die();?>
<?php endif; ?>
<?php echo $this->fetch('./inc/header.html'); ?> 
<?php
		$this->_var['parse_pagecss'][] = $this->_var['TMPL_REAL']."/css/merchantlist_index.css";	
			
?>
<link rel="stylesheet" type="text/css" href="<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['parse_pagecss'],
);
echo $k['name']($k['v']);
?>" />

<div class="wrap">
   <div class="search_box_tx">
		
    </div>
	<script type="text/javascript">
		
			function  search_submit(){
			
				var keyword=$("#keyword").val();
				var is_auto_order=$("#J_is_auto_order").val();
				var ajaxurl = '<?php
echo parse_wap_url_tag("u:index|merchantlist|"."".""); 
?>';
				var query = new Object();
				query.keyword = keyword;
				if(is_auto_order != null){
					query.is_auto_order = is_auto_order;
				}
				query.is_ajax=1;
				$.ajax({
					url:ajaxurl,
					data:query,
					type:"Post",
					dataType:"text",
					success:function(data){
						$("#J_key_item").html(data);
					}
					,error:function(){
						//alert("服务器提交错误");
					}
				});	
			}
		
	</script>

	<div class="content">
		<div class="list-view bor_none " id="J_key_item">
			<?php echo $this->fetch('./inc/merchantlist_key_item.html'); ?>
			
		</div>
	</div>
	<?php echo $this->fetch('./inc/footer.html'); ?> 