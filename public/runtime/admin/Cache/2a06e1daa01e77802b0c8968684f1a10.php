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

<?php function get_is_main_location($is_main,$id)
	{
		if($is_main==1)
		{
			return l("YES");
		}
		else
		{
			return l("NO");
		}
	}

	function getViewSub($id,$vo)
	{
		$str .= "<a href='".u("SupplierLocationDp/index",array("supplier_location_id"=>$vo['id']))."'>查看点评(共".$vo['dp_total_count']."条，".$vo['dp_iseffect_count']."条有效)</a>&nbsp;";
		//$str .= "<a href='".u("SupplierLocationImages/index",array("supplier_location_id"=>$vo['id']))."'>查看图库(".$vo['image_count'].")</a>";
		return $str;
	} ?>
<div class="main">
<div class="main_title"><?php echo ($main_title); ?></div>
<div class="blank5"></div>
<div class="button_row">
	<input type="button" class="button" value="<?php echo L("ADD");?>" onclick="location.href='__APP__?m=SupplierLocation&a=add'" />
	<input type="button" class="button" value="<?php echo L("FOREVERDEL");?>" onclick="foreverdel();" />
</div>
<div class="blank5"></div>
<div class="search_row">
	<form name="search" action="__APP__" method="get">	
		名称：<input type="text" class="textbox" name="name" value="<?php echo trim($_REQUEST['name']);?>" />		
		商户：
		<select name="supplier_id">
			<option value="0" <?php if(intval($_REQUEST['supplier_id']) == 0): ?>selected="selected"<?php endif; ?>>未选择商户</option>
			<?php if(is_array($supplier_list)): foreach($supplier_list as $key=>$supplier_item): ?><option value="<?php echo ($supplier_item["id"]); ?>" <?php if(intval($_REQUEST['supplier_id']) == $supplier_item['id']): ?>selected="selected"<?php endif; ?>><?php echo ($supplier_item["name"]); ?></option><?php endforeach; endif; ?>
		</select>
		<input type="hidden" value="SupplierLocation" name="m" />
		<input type="hidden" value="index" name="a" />
		<input type="submit" class="button" value="<?php echo L("SEARCH");?>" />
	</form>
</div>
<div class="blank5"></div>
<!-- Think 系统列表组件开始 -->
<table id="dataTable" class="dataTable" cellpadding=0 cellspacing=0 ><tr><td colspan="9" class="topTd" >&nbsp; </td></tr><tr class="row" ><th width="8"><input type="checkbox" id="check" onclick="CheckAll('dataTable')"></th><th width="50px"><a href="javascript:sortBy('id','<?php echo ($sort); ?>','SupplierLocation','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('name','<?php echo ($sort); ?>','SupplierLocation','index')" title="按照<?php echo L("LOCATION_NAME");?><?php echo ($sortType); ?> "><?php echo L("LOCATION_NAME");?><?php if(($order)  ==  "name"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('is_recommend','<?php echo ($sort); ?>','SupplierLocation','index')" title="按照<?php echo L("IS_RECOMMEND");?><?php echo ($sortType); ?> "><?php echo L("IS_RECOMMEND");?><?php if(($order)  ==  "is_recommend"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('is_verify','<?php echo ($sort); ?>','SupplierLocation','index')" title="按照<?php echo L("IS_VERIFY_SHOP");?><?php echo ($sortType); ?> "><?php echo L("IS_VERIFY_SHOP");?><?php if(($order)  ==  "is_verify"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('is_main','<?php echo ($sort); ?>','SupplierLocation','index')" title="按照<?php echo L("IS_MAIN_LOCATION");?><?php echo ($sortType); ?> "><?php echo L("IS_MAIN_LOCATION");?><?php if(($order)  ==  "is_main"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('sort','<?php echo ($sort); ?>','SupplierLocation','index')" title="按照排序<?php echo ($sortType); ?> ">排序<?php if(($order)  ==  "sort"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('is_effect','<?php echo ($sort); ?>','SupplierLocation','index')" title="按照有效<?php echo ($sortType); ?> ">有效<?php if(($order)  ==  "is_effect"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th >操作</th></tr><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$location): ++$i;$mod = ($i % 2 )?><tr class="row" ><td><input type="checkbox" name="key" class="key" value="<?php echo ($location["id"]); ?>"></td><td>&nbsp;<?php echo ($location["id"]); ?></td><td>&nbsp;<a href="javascript:edit('<?php echo (addslashes($location["id"])); ?>')"><?php echo ($location["name"]); ?></a></td><td>&nbsp;<?php echo (get_toogle_status($location["is_recommend"],$location['id'],is_recommend)); ?></td><td>&nbsp;<?php echo (get_toogle_status($location["is_verify"],$location['id'],is_verify)); ?></td><td>&nbsp;<?php echo (get_is_main_location($location["is_main"],$location['id'])); ?></td><td>&nbsp;<?php echo (get_sort($location["sort"],$location['id'])); ?></td><td>&nbsp;<?php echo (get_toogle_status($location["is_effect"],$location['id'],is_effect)); ?></td><td> <?php echo (getViewSub($location["id"],$location)); ?>&nbsp;<a href="javascript:edit('<?php echo ($location["id"]); ?>')"><?php echo L("EDIT");?></a>&nbsp;<a href="javascript: foreverdel('<?php echo ($location["id"]); ?>')"><?php echo L("FOREVERDEL");?></a>&nbsp;</td></tr><?php endforeach; endif; else: echo "" ;endif; ?><tr><td colspan="9" class="bottomTd"> &nbsp;</td></tr></table>
<!-- Think 系统列表组件结束 -->
 

<div class="blank5"></div>
<div class="page"><?php echo ($page); ?></div>
</div>
</body>
</html>