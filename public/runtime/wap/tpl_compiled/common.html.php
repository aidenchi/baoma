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
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/merchantlist_index.css";
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/merchantitem_index.css";
		$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/change_password.css";		
	?>
   <link rel="stylesheet" type="text/css" href="<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['pagecss'],
);
echo $k['name']($k['v']);
?>" />

