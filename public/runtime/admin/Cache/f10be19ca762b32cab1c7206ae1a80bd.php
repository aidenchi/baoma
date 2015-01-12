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
<div class="main_title"><?php echo L("VIEW");?> <a href="<?php echo u("DealDp/index",array("rel_id"=>$vo['rel_id']));?>" class="back_list"><?php echo L("BACK_LIST");?></a>
<?php echo (get_message_type($vo["rel_table"],$vo['rel_id'])); ?>
</div>
<div class="blank5"></div>
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=4 class="topTd"></td>
	</tr>
	<?php if($vo['rel_table'] == 'seller'): ?><tr>
		<td class="item_title"><?php echo L("MESSAGE_SUPPLIER_NAME");?>:</td>
		<td colspan=3><?php echo ($vo["title"]); ?></td>
	</tr>	
	<tr>
		<td class="item_title"><?php echo L("MESSAGE_CONTACT");?>:</td>
		<td colspan=3><?php echo ($vo["contact"]); ?></td>
	</tr>	
	<tr>
		<td class="item_title"><?php echo L("MESSAGE_CONTACT_NAME");?>:</td>
		<td colspan=3><?php echo ($vo["contact_name"]); ?></td>
	</tr><?php endif; ?>
	<tr>
		<td class="item_title">点评内容:</td>
		<td colspan=3><?php echo (decode_topic(nl2br($vo["content"]))); ?></td>
	</tr>
	<tr>
		<td class="item_title">点评时间:</td>
		<td class="item_input"><?php echo (to_date($vo["create_time"])); ?></td>
		<td class="item_title"><?php echo L("MESSAGE_UPDATE_TIME");?>:</td>
		<td class="item_input"><?php echo (to_date($vo["update_time"])); ?></td>
	</tr>		
	<tr>
		<td colspan=4 class="bottomTd"></td>
	</tr>
</table>
<div class="blank5"></div>

<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("ADMIN_REPLY");?>:</td>
		<td class="item_input">
			<script type='text/javascript'> var eid = 'editor';KE.show({id : eid,skinType: 'tinymce',allowFileManager : true,resizeMode : 0,items : [
							'source','fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
							'plainpaste', 'wordpaste', 'justifyleft', 'justifycenter', 'justifyright',
							'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
							'superscript', 'selectall', '-',
							'title', 'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold',
							'italic', 'underline', 'strikethrough', 'removeformat', 'image',
							'flash', 'media', 'table', 'hr', 'emoticons', 'link', 'unlink'
						]});</script><div  style='margin-bottom:5px; '><textarea id='editor' name='admin_reply' style='width:750px; height:350px;' ><?php echo ($vo["admin_reply"]); ?></textarea> </div>
		</td>
	</tr>
	<tr>
		<td class="item_title"></td>
		<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="Message" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="update" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("EDIT");?>" />
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