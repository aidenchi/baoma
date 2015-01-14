<?php if (!defined('THINK_PATH')) exit();?>

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/style.css" />
<script type="text/javascript">
 	var VAR_MODULE = "<?php echo conf("VAR_MODULE");?>";
	var VAR_ACTION = "<?php echo conf("VAR_ACTION");?>";
	var MODULE_NAME	=	'<?php echo MODULE_NAME; ?>';
	var ACTION_NAME	=	'<?php echo ACTION_NAME; ?>';
	var ROOT = '__APP__';
	var ROOT_PATH = '<?php echo APP_ROOT; ?>';
	var CURRENT_URL = '<?php echo trim($_SERVER['REQUEST_URI']);?>';
	var INPUT_KEY_PLEASE = "<?php echo L("INPUT_KEY_PLEASE");?>";
	var TMPL = '__TMPL__';
	var APP_ROOT = '<?php echo APP_ROOT; ?>';
</script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.timer.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/script.js"></script>
<script type="text/javascript" src="__ROOT__/public/runtime/admin/lang.js"></script>
<script type='text/javascript'  src='__ROOT__/admin/public/kindeditor/kindeditor.js'></script>
</head>
<body>
<div id="info"></div>


<div class="main">
<div class="main_title">商品点评<a href="<?php echo u("Deal/shop");?>" class="back_list">返回列表</a></div>
<div class="blank5"></div>

<div class="blank5"></div>
<div class="search_row">
	<form name="search" action="__APP__" method="get">	
		<input type="button" class="button" value="<?php echo L("FOREVERDEL");?>" onclick="foreverdel();" />
	</form>
</div>
<div class="blank5"></div>
<!-- Think 系统列表组件开始 -->
<table id="dataTable" class="dataTable" cellpadding=0 cellspacing=0 ><tr><td colspan="9" class="topTd" >&nbsp; </td></tr><tr class="row" ><th width="8"><input type="checkbox" id="check" onclick="CheckAll('dataTable')"></th><th width="50px  "><a href="javascript:sortBy('id','<?php echo ($sort); ?>','DealDp','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('rel_table','<?php echo ($sort); ?>','DealDp','index')" title="按照标题  <?php echo ($sortType); ?> ">标题  <?php if(($order)  ==  "rel_table"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('user_id','<?php echo ($sort); ?>','DealDp','index')" title="按照<?php echo L("USER_NAME");?>  <?php echo ($sortType); ?> "><?php echo L("USER_NAME");?>  <?php if(($order)  ==  "user_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('create_time','<?php echo ($sort); ?>','DealDp','index')" title="按照点评时间  <?php echo ($sortType); ?> ">点评时间  <?php if(($order)  ==  "create_time"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('update_time','<?php echo ($sort); ?>','DealDp','index')" title="按照回复时间   <?php echo ($sortType); ?> ">回复时间   <?php if(($order)  ==  "update_time"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('point','<?php echo ($sort); ?>','DealDp','index')" title="按照<?php echo L("MESSAGE_POINT");?>  <?php echo ($sortType); ?> "><?php echo L("MESSAGE_POINT");?>  <?php if(($order)  ==  "point"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('is_effect','<?php echo ($sort); ?>','DealDp','index')" title="按照是否生效<?php echo ($sortType); ?> ">是否生效<?php if(($order)  ==  "is_effect"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th >操作</th></tr><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$message): ++$i;$mod = ($i % 2 )?><tr class="row" ><td><input type="checkbox" name="key" class="key" value="<?php echo ($message["id"]); ?>"></td><td>&nbsp;<?php echo ($message["id"]); ?></td><td>&nbsp;<?php echo (get_message_type($message["rel_table"],$message['rel_id'])); ?></td><td>&nbsp;<?php echo (get_user_name($message["user_id"])); ?></td><td>&nbsp;<?php echo (to_date($message["create_time"])); ?></td><td>&nbsp;<?php echo (to_date($message["update_time"])); ?></td><td>&nbsp;<?php echo (get_point($message["point"])); ?></td><td>&nbsp;<?php echo (get_toogle_status($message["is_effect"],$message['id'],is_effect)); ?></td><td><a href="javascript:edit('<?php echo ($message["id"]); ?>')"><?php echo L("VIEW");?></a>&nbsp;<a href="javascript:foreverdel('<?php echo ($message["id"]); ?>')"><?php echo L("FOREVERDEL");?></a>&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?><tr><td colspan="9" class="bottomTd"> &nbsp;</td></tr></table>
<!-- Think 系统列表组件结束 -->
 

<div class="blank5"></div>
<div class="page"><?php echo ($page); ?></div>
</div>
</body>
</html>