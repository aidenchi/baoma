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

<style type="text/css">
    td span label{float:left; padding:3px; margin:2px; background:#E6E6E6; cursor:pointer; display:inline-block;}
    td span label.active{background:#F60; color:#fff;}
    #container{height:200px; width: 200px; float:left;}  
    #container_front{width: 600px; height:500px; border: 1px solid #000; position: absolute; top: 10px; background-color: #fff; overflow: hidden;}
    #container_m{ width: 550px; height: 450px; margin: 0 auto;}
    #cancel_btn{display: block; width: 600px; height: 18px; line-height: 18px; text-align: right;}
</style>
<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.php?lang=zh-cn" ></script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/js/calendar/calendar.css" />
<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script> 
<script type="text/javascript" src="__TMPL__Common/js/map.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/event.js"></script>
<script type="text/javascript">
	var blue_point = "__ROOT__/system/blue_point.png";
	var red_point = "__ROOT__/system/red_point.png";
	$(document).ready(function(){
	
		 $("input[name='search_api']").bind("click",function(){  
		 	var api_address = $("input[name='search_api_address']").val();
			var city=$("select[name='city_id']").find("option:selected").attr("rel");
			if ($.trim(api_address) == '') {
				alert("<?php echo L("INPUT_KEY_PLEASE");?>");
			}
			else 
			{
				search_api(api_address, city);
			}
        });
		draw_map('0','0');
		$("#container_front").hide();
        $("#cancel_btn").bind("click",function(){ $("#container_front").hide(); });
        $("input[name='chang_api']").bind("click",function(){ 
            editMap($("input[name='xpoint']").attr('value'),$("input[name='ypoint']").attr('value'));
        });
	});
</script>
<div class="main">
<div class="main_title"><?php echo L("ADD");?> <a href="<?php echo u("Event/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("EVENT_NAME");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="name" /></td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("EVENT_ICON");?>:</td>
		<td class="item_input">
			<div style='width:120px; height:40px; margin-left:10px; display:inline-block;  float:left;' class='none_border'><script type='text/javascript'>var eid = 'icon';KE.show({id : eid,items : ['upload_image'],skinType: 'tinymce',allowFileManager : true,resizeMode : 0});</script><div style='font-size:0px;'><textarea id='icon' name='icon' style='width:120px; height:25px;' ></textarea> </div><input type='text' id='focus_icon' style='font-size:0px; border:0px; padding:0px; margin:0px; line-height:0px; width:0px; height:0px;' /></div><img src='./admin/Tpl/default/Common/images/no_pic.gif'  style='display:inline-block; float:left; cursor:pointer; margin-left:10px; border:#ccc solid 1px; width:35px; height:35px;' id='img_icon' /><img src='/admin/Tpl/default/Common/images/del.gif' style='display:none; margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' id='img_del_icon' onclick='delimg("icon")' title='删除' />
		</td>
	</tr>
		
	<tr>
		<td class="item_title"><?php echo L("EVENT_BEGIN_TIME");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="event_begin_time" id="event_begin_time" value="" onfocus="this.blur(); return showCalendar('event_begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_event_begin_time');" />
			<input type="button" class="button" id="btn_event_begin_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('event_begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_event_begin_time');" />	
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#event_begin_time').val('');" />	
			<span class='tip_span'>[<?php echo L("NO_TIME_SET_TIP");?>]</span>

		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("EVENT_END_TIME");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="event_end_time" id="event_end_time" value="" onfocus="this.blur(); return showCalendar('event_end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_event_end_time');" />
			<input type="button" class="button" id="btn_event_end_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('event_end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_event_end_time');" />	
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#event_end_time').val('');" />
			<span class='tip_span'>[<?php echo L("NO_TIME_SET_TIP");?>]</span>
		</td>
	</tr>
	<!--
	<tr>
		<td class="item_title"><?php echo L("SUBMIT_BEGIN_TIME");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="submit_begin_time" id="submit_begin_time" value="" onfocus="this.blur(); return showCalendar('submit_begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_submit_begin_time');" />
			<input type="button" class="button" id="btn_submit_begin_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('submit_begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_submit_begin_time');" />	
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#submit_begin_time').val('');" />	
			<span class='tip_span'>[<?php echo L("NO_TIME_SET_TIP");?>]</span>

		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("SUBMIT_END_TIME");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="submit_end_time" id="submit_end_time" value="" onfocus="this.blur(); return showCalendar('submit_end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_submit_end_time');" />
			<input type="button" class="button" id="btn_submit_end_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('submit_end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_submit_end_time');" />	
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#submit_end_time').val('');" />
			<span class='tip_span'>[<?php echo L("NO_TIME_SET_TIP");?>]</span>
		</td>
	</tr>
	-->
	<tr>
		<td class="item_title"><?php echo L("PARENT_CITY");?>:</td>
		<td class="item_input">
		<select name="city_id">
			<?php if(is_array($city_list)): foreach($city_list as $key=>$city_item): ?><option value="<?php echo ($city_item["id"]); ?>" rel="<?php echo ($city_item["name"]); ?>"><?php echo ($city_item["title_show"]); ?></option><?php endforeach; endif; ?>
		</select>
		</td>
	</tr>
	
	<tr id="sub_area_box">
		<td class="item_title"><?php echo L("AREA_LIST");?>:</td>
		<td class="item_input" id="area_list">
			
		</td>
	</tr>
	<!--
	<tr>
		<td class="item_title"><?php echo L("CATE_TREE");?>:</td>
		<td class="item_input">
		<select name="cate_id" class="require">
			<option value="0">==<?php echo L("NO_SELECT_CATE");?>==</option>
			<?php if(is_array($cate_tree)): foreach($cate_tree as $key=>$cate_item): ?><option value="<?php echo ($cate_item["id"]); ?>"><?php echo ($cate_item["name"]); ?></option><?php endforeach; endif; ?>
		</select>		
		</td>
	</tr>

	<tr>
		<td class="item_title"><?php echo L("SUPPLIER_NAME");?>:</td>
		<td class="item_input">
			<span id="supplier_list">
			<select name="supplier_id">
				<option value="0"><?php echo L("EMPTY_SELECT_SUPPLIER");?></option>
				<?php if($supplier_info): ?><option value="<?php echo ($supplier_info["id"]); ?>" selected="selected"><?php echo ($supplier_info["name"]); ?></option><?php endif; ?>
			</select>
			</span>
			<input type="text" class="textbox" name="supplier_key" /> 
			<input type="button" name="supplier_key_btn" class="button" value="<?php echo L("SEARCH");?>" />
			<input type="hidden" name="address" />
		</td>
	</tr>
	
	<tr id="supplier_location">
		<td class="item_title"><?php echo L("SUPPLIER_LOCATION");?>:</td>
		<td class="item_input">
			
		</td>
	</tr>
	-->
	<tr>
		<td class="item_title"><?php echo L("EVENT_ADDRESS");?>:</td>
		<td class="item_input"><input type="text" class="textbox" name="address" /></td>
	</tr>
	<tr>
            <td class="item_title">地图定位</td>
            <td class="item_input">            	
            	关键词：<input type="text" class="textbox" name="search_api_address" value="" /> 
				<input type="button" value="查找" class="button" name="search_api" id="search_api" >
				<div style="height:10px; clear:both;"></div>
                <div id="container"></div>
				<div style="height:10px; clear:both;"></div>
                <script type="text/javascript"></script> 
                <input type="button" value="手动修改" name="chang_api" id="chang_api">
                <div style="position:relative; top:-400px;">
                    <div  id="container_front">
                        <a href="#" id="cancel_btn">取消</a>
                        <div id="container_m"></div>
                    </div>
                </div>
				<input type="hidden" name="xpoint" />
				<input type="hidden" name="ypoint" />
            </td>
    </tr>
	
	<tr>
		<td class="item_title"><?php echo L("IS_EFFECT");?>:</td>
		<td class="item_input">
			<lable><?php echo L("IS_EFFECT_1");?><input type="radio" name="is_effect" value="1" checked="checked" /></lable>
			<lable><?php echo L("IS_EFFECT_0");?><input type="radio" name="is_effect" value="0" /></lable>
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("SORT");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="sort" value="<?php echo ($new_sort); ?>" />
		</td>
	</tr>
	
	
	
	<tr>
		<td class="item_title">简介:</td>
		<td class="item_input">
			<textarea class="textarea" name="brief" ></textarea>
		</td>
	</tr>
	

	<tr>
		<td class="item_title">内容:</td>
		<td class="item_input">
			 <script type='text/javascript'> var eid = 'content';KE.show({id : eid,skinType: 'tinymce',allowFileManager : true,resizeMode : 0,items : [
							'source','fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
							'plainpaste', 'wordpaste', 'justifyleft', 'justifycenter', 'justifyright',
							'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
							'superscript', 'selectall', '-',
							'title', 'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold',
							'italic', 'underline', 'strikethrough', 'removeformat', 'image',
							'flash', 'media', 'table', 'hr', 'emoticons', 'link', 'unlink'
						]});</script><div  style='margin-bottom:5px; '><textarea id='content' name='content' style='width:750px; height:350px;' ><?php echo ($vo["content"]); ?></textarea> </div>
		</td>
	</tr>
	<!--
	<tr>
		<td class="item_title">报名项配置: [<a href='javascript:void(0);' onclick="add_submit_row(0);">+</a>]</td>
		<td class="item_input" id="submit_row">
			 
		</td>
	</tr>
	-->
	<tr>
		<td class="item_title"></td>
		<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="Event" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="insert" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("ADD");?>" />
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