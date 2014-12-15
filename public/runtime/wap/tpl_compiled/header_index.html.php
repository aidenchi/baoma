<!DOCTYPE html>
<html>
    <head>
        <title><?php echo $this->_var['data']['page_title']; ?></title>
		<!--
        <link rel="stylesheet" type="text/css" href="./css/style.css" charset="utf-8"> 
		<link rel="stylesheet" type="text/css" href="./css/color.css">
		-->
		<link rel="stylesheet" type="text/css" href="./css/font-awesome/css/font-awesome.css"/>
		<script type="text/javascript" src="./js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="./js/index/swipe.js"></script>
        <script type="text/javascript" src="./js/index/onload.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <meta http-equiv="Expires" CONTENT="-1">
        <meta http-equiv="Cache-Control" CONTENT="no-cache">
        <meta http-equiv="Pragma" CONTENT="no-cache">
	<script type="text/javascript">
		var APP_ROOT = '<?php echo $this->_var['APP_ROOT']; ?>';
	</script> 
	<?php
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/style.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/color.css";
	?>      
	<link rel="stylesheet" type="text/css" href="<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['pagecss'],
);
echo $k['name']($k['v']);
?>" />     
    </head>
	<body>
	<div class="header">
		<div class="c-hd">
            <section class="cut_city">
	              <a href=""><?php if ($this->_var['data']['city_name']): ?><?php echo $this->_var['data']['city_name']; ?><?php else: ?>全国<?php endif; ?><i class="fa fa-angle-down"></i></a>
		    </section>
            <section class="logo_img">宝马母婴</section>
            <section class="h_search">
				 <a href="<?php
echo parse_wap_url_tag("u:index|sea_redcatetype#index|"."".""); 
?>"><i class="fa fa-search"></i></a>
            </section>
         </div>
	</div>