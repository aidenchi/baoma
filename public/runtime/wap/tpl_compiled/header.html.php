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
	<!--
	<link rel="stylesheet" type="text/css" href="./css/style.css" >
	<link rel="stylesheet" type="text/css" href="./css/activity_list.css">  
	<link rel="stylesheet" type="text/css" href="./css/activity_subject.css"> 
	<link rel="stylesheet" type="text/css" href="./css/business_details.css"> 
	<link rel="stylesheet" type="text/css" href="./css/business_list.css"> 
	<link rel="stylesheet" type="text/css" href="./css/good_details.css">
	<link rel="stylesheet" type="text/css" href="./css/personal_index.css"> 
	<link rel="stylesheet" type="text/css" href="./css/login.css"> 
	<link rel="stylesheet" type="text/css" href="./css/order.css">
	<link rel="stylesheet" type="text/css" href="./css/comment_list.css">
	<link rel="stylesheet" type="text/css" href="./css/search.css">
	<link rel="stylesheet" type="text/css" href="./css/color.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/font-awesome/css/font-awesome.css"/>        
	<!--
	<script type="text/javascript" src="./js/jquery-1.6.2.min.js"></script>
	-->
	<link rel="stylesheet" type="text/css" href="./js/assets/css/amazeui.min.css"/>
	<link rel="stylesheet" type="text/css" href="./js/assets/css/app.css"/>
	<script src="./js/assets/js/jquery.min.js"></script>
	<script src="./js/assets/js/amazeui.min.js"></script>
	
	<script type="text/javascript" src="./js/public_jquery.js" ></script>
	
	<script type="text/javascript">
		var APP_ROOT = '<?php echo $this->_var['APP_ROOT']; ?>';
	</script>
	
    <?php
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/style.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/activity_list.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/activity_subject.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/business_details.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/business_list.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/good_details.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/personal_index.css";
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/login.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/order.css";	
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/comment_list.css";
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/search.css";
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

<header data-am-widget="header" class="am-header am-header-default">
  <div class="am-header-left am-header-nav">
    <a  href="javascript:void(0);" onclick="window.history.go(-1);">
      <img class="am-header-icon-custom" src="data:image/svg+xml;charset=utf-8,&lt;svg xmlns=&quot;http://www.w3.org/2000/svg&quot; viewBox=&quot;0 0 12 20&quot;&gt;&lt;path d=&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill=&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
      alt="" />
    </a>
  </div>
</header>

<!-------------------------------confirm确认框-------------------------------->
<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-bd" id="confirm_content">
      你确定要删除吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>	
<!-------------------------------alert弹出框-------------------------------->
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
  <div class="am-modal-dialog">
	<div class="am-modal-hd">
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd" id="alert_content">
      信息提醒
    </div>
  </div>
</div>


