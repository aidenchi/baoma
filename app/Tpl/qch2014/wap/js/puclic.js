/**
 * 公用调试函数
 * @param prefix 调试标识
 * @param message 通过浏览器控制台输出的调试信息
 */
function debug(prefix, message) {
    console.log("%s %s", prefix, message);
}

$(document).ready(function () {
    cart_item_count_init();
});

function cart_item_count_init() {

    $('input[id^=goods_count_]').each(function () {
        if ($(this).val() > 1) {
            $(this).prev('div[id^=goods_count_sub_]').addClass('active');
        } else {
            $(this).prev('div[id^=goods_count_sub_]').removeClass('remove');
        }
    });
}


/**
 * 弹出确认对话框,只有一个确认按钮
 * @param title 对话框提示标题
 * @param content 对话框提示内容
 * @param fun_close 点击确定按钮后的回调函数
 */
function show_msg_only_confirm(title, content, fun_close) {
    $('#dialog_msg').dialog({
        autoOpen: false,
        closeBtn: false,		
        title: title,
        content: content,
        buttons: {
            '确定': function () {
                this.close();
                fun_close();
            }
        }		
    });
    $('#dialog_msg').dialog('open');
}

/**
 * 弹出确认对话框

 */
function show_msg(title, content ,fun_close) {
    $('#dialog_msg').dialog({
        autoOpen: false,
        closeBtn: true,		
        title: title,
        content: content,
		close:fun_close
		
    });
    $('#dialog_msg').dialog('open');
}

   

   
