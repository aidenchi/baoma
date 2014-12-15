/**
 * Created by Administrator on 14-3-15.
 */
$(document).ready(function () {
    $('#dialog').dialog({
        autoOpen: false,
        closeBtn: false,
        buttons: {
            '取消': function () {
                this.close();
            },
            '确定': function () {
                this.close();
                $('#dialog2').dialog('open');
            }
        }
    });

    $('#btn1').click(function () {
        $('#dialog').dialog('open');
    });
});


