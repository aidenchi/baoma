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
<div class="main_title"><?php echo L("EDIT");?> <a href="<?php echo u("TopicTagCate/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title">版块名称:</td>
		<td class="item_input"><input type="text" class="textbox require" name="name" value="<?php echo ($vo["name"]); ?>" /></td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("SUB_NAME");?>:</td>
		<td class="item_input"><input type="text" class="textbox" name="sub_name" value="<?php echo ($vo["sub_name"]); ?>" /></td>
	</tr>
	<!--
	<tr>
		<td class="item_title"><?php echo L("MOBILE_TITLE_BG");?></td>
		<td class="item_input">
		<div style='width:120px; height:40px; margin-left:10px; display:inline-block;  float:left;' class='none_border'><script type='text/javascript'>var eid = 'mobile_title_bg';KE.show({id : eid,items : ['upload_image'],skinType: 'tinymce',allowFileManager : true,resizeMode : 0});</script><div style='font-size:0px;'><textarea id='mobile_title_bg' name='mobile_title_bg' style='width:120px; height:25px;' ><?php echo ($vo["mobile_title_bg"]); ?></textarea> </div></div><input type='text' id='focus_mobile_title_bg' style='font-size:0px; border:0px; padding:0px; margin:0px; line-height:0px; width:0px; height:0px;' /></div><img src='<?php if($vo["mobile_title_bg"] == ''): ?>./admin/Tpl/default/Common/images/no_pic.gif<?php else: ?><?php echo ($vo["mobile_title_bg"]); ?><?php endif; ?>' <?php if($vo["mobile_title_bg"] != ''): ?>onclick='openimg("mobile_title_bg")'<?php endif; ?> style='display:inline-block; float:left; cursor:pointer; margin-left:10px; border:#ccc solid 1px; width:35px; height:35px;' id='img_mobile_title_bg' /><img src='/admin/Tpl/default/Common/images/del.gif' style='<?php if($vo["mobile_title_bg"] == ''): ?>display:none;<?php else: ?>display:inline-block;<?php endif; ?> margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' id='img_del_mobile_title_bg' onclick='delimg("mobile_title_bg")' title='删除' />
		<span class='tip_span'>[<?php echo L("MOBILE_TITLE_BG_TIPS");?>]</span>
		</td>
	</tr>
	-->
	<tr>
		<td class="item_title"><?php echo L("SORT");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="sort" value="<?php echo ($vo["sort"]); ?>" />
		</td>
	</tr>	
	<tr style="display:none;">
		<td class="item_title"><?php echo L("SHOWIN_WEB");?>:</td>
		<td class="item_input">
			<select name="showin_web">
				<option value="1" <?php if($vo['showin_web'] == 1): ?>selected<?php endif; ?>><?php echo L("YES");?></option>
				<option value="0" <?php if($vo['showin_web'] == 0): ?>selected<?php endif; ?>><?php echo L("NO");?></option>
			
		</select>
		</td>
	</tr>	
	<tr style="display:none;">
		<td class="item_title"><?php echo L("SHOWIN_MOBILE");?>:</td>
		<td class="item_input">
			<select name="showin_mobile">
				<option value="1" <?php if($vo['showin_mobile'] == 1): ?>selected<?php endif; ?>><?php echo L("YES");?></option>
				<option value="0" <?php if($vo['showin_mobile'] == 0): ?>selected<?php endif; ?>><?php echo L("NO");?></option>
			
		</select>
		</td>
	</tr>	
	
	<tr>
		<td class="item_title"></td>
		<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="TopicTagCate" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="update" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("EDIT");?>" />
			<input type="reset" class="button" value="<?php echo L("RESET");?>" />
		</td>
	</tr>
	<tr>
		<td colspan=2 class="bottomTd"></td>
	</tr>
</table>	 
</form>
</div>
</body>
</html>