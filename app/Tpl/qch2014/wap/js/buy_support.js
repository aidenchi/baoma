/**
 * Created by chechi on 14-3-15.
 */

 $(document).ready(function(){
	
	//关于订单购物车提交按钮的事件
	$("#order_done").click(function(){
	
		submit_buy();
	});
 
 });
 
/* 加入购物车 */
function add_cart(id, attr) {

    var ajaxurl = APP_ROOT + "/wap.php?ctl=cart&act=addcart&id=" + id;
	
    if (attr && attr != '') {
        ajaxurl += attr;

    }
    else {
      
		attrs = $("select[name='attr[]']");
        for (i = 0; i < attrs.length; i++) {
            ajaxurl += "&attr[]=" + $(attrs[i]).val();
        }
	
    }
    var number = $("input[name='number']").val();
    if (number)
	{
        ajaxurl += "&number=" + number;
	}
	
	
	
    $.ajax({
        url: ajaxurl,
        dataType: "json",
        success: function (obj) {
			
            if (obj.open_win == 1) {

                /*
                 if($(".dialog-mask").css("display")=='block')
                 {
                 $(".dialog-mask,.dialog-box").remove();
                 }
                 */

				var msg_content = "<span class='cart-error'>"+obj.html+"</span>";
				
                show_msg('友情提示', msg_content,function(){
				
					window.location.reload();
				});  

                if (obj.err == 1) {
                    show_msg_only_confirm('友情提示', '添加商品信息错误,请稍后添加!', function () {
                    });
                }else{
                  
				}
            }else if (obj.open_win == 2) {
                show_msg_only_confirm('友情提示', obj.info, function () {
                });
                //  $('#dialog_msg').dialog('open');
            }else if (obj.open_win == 3) {
                show_msg_only_confirm('友情提示', '您还没有登录!', function () {
				
					  window.location = APP_ROOT + "/wap.php?ctl=user&act=login";
                });
               
            }else {
                //alert("跳转购物车");
                /*  if($(".dialog-mask").css("display")=='block')
                 {
                 $(".dialog-mask,.dialog-box").remove();
                 }*/
                /* $("#cart_count").html(parseInt(obj.number));*/
                /*$.weeboxs.open(obj.html, {contentType:'text',showButton:false,title:LANG['ADDCART_SUCCESS'],width:570,type:'wee'});*/

                //跳转到购物车列表页
                window.location = CART_URL;
                //$('#dialog_msg').html(obj.info);
                //$('#dialog_msg').dialog('open',);
                //show_msg("111","2222",function(){  });

            }
        },
        error: function (ajaxobj) {

        }
    });

}


/**
 * 修改购物车中的产品数量
 * @param deal_id 产品ID
 * @param goods_count 修改的产品数量
 */
function modify_cart(deal_id, goods_count) {

    var MODIFY_GOODS_COUNT_URL = APP_ROOT + '/wap.php?ctl=cart&act=modifycart&id=' + deal_id + "&number=" + goods_count;

    $.ajax({
        url: MODIFY_GOODS_COUNT_URL,
        dataType: "json",
        success: function (data) {
            if (data.status == 1) {
                $('#total_price').html(data.total_price_format);
                $('#item_total_price_' + deal_id).html(data.cart_item.total_price_format);
                $('#goods_count_' + deal_id).val(data.cart_item.number);
            } else {
                var message = data.info.split("|");
                show_msg_only_confirm("友情提示", message[0], function () {
                    location.href = location.href;
                });
            }
        },
        error: function (data) {
        }
    });
    return;
}

/**
 * 向购物车增加产品数量
 * @param deal_id 产品ID
 */
function add_goods_count(deal_id) {
    var goods_count = parseInt($('#goods_count_' + deal_id).val()) + 1;
    $('#goods_count_sub_' + deal_id).addClass('active');
    modify_cart(deal_id, goods_count);
    return;
}

/**
 * 删除购物车的产品数量
 * @param deal_id 产品ID
 */
function sub_goods_count(deal_id) {

    if ($('#goods_count_' + deal_id).val() < 2) {
        $(this).removeClass('active');
        $('#goods_count_' + deal_id).val(1);
        return;
    } else {
        var goods_count = $('#goods_count_' + deal_id).val() - 1;
        modify_cart(deal_id, goods_count);
        if(goods_count < 2){
            $('#goods_count_sub_' + deal_id).removeClass('active');
        }
        return;
    }

}

/**
 * 清空购物车
 */
function clear_cart() {
    var ajaxurl = APP_ROOT + "/wap.php?ctl=cart&act=clear_cart";

    $.ajax({
        url: ajaxurl,
        success: function (obj) {
            location.href = location.href;
        },
        error: function (ajaxobj) {

        }
    });
}


/**
 * 删除购物车中的产品
 * @param id 产品ID
 */
function del_cart(id) {
    var ajaxurl = APP_ROOT + "/wap.php?ctl=cart&act=delcart&id=" + id;
    $.ajax({
        url: ajaxurl,
        dataType: "json",
        success: function (obj) {
            location.href = CART_URL;
        },
        error: function (ajaxobj) {

        }
    });
}

/**
 *购物车结算，提交订单
 */
function submit_cart() {
    var verify_code = $("input[name='verify_code']").val();
    // var mobile = $("input[name='lottery_mobile']").val();
    var ajaxurl = APP_ROOT + "/wap.php?ctl=cart&act=check&ajax=1&verify=" + verify_code;

    $.ajax({
        url: ajaxurl,
        dataType: "json",
        success: function (data) {

            if (data.status == 1) {
                location.href = CART_CHECK_URL;
            }
            else {
                if (data.open_win == 1) {
                    show_msg_only_confirm('友情提示', data.info, function () {
                        location.href = APP_LOGIN_URL;
                        return;
                    });

                }
                else {
                    var message = data.info.split("|");
                    show_msg_only_confirm('友情提示', message[0], function () {
                        return;
                    });

                }
            }
        },
        error: function (ajaxobj) {

        }
    });
}

//关于购物结算页的相关脚本
//装载配送地区
function load_consignee(consignee_id)
{
	var ajaxurl = APP_ROOT+"/wap.php?ctl=ajax&act=load_consignee&id="+consignee_id;
	$.ajax({ 
		url: ajaxurl,
		success: function(html){
			$("#cart_consignee").html(html);
			load_delivery();
		},
		error:function(ajaxobj)
		{
//			if(ajaxobj.responseText!='')
//			alert(LANG['REFRESH_TOO_FAST']);
		}
	});	
}

//载入配送方式
function load_delivery()
{
	
	var select_last_node = $("#cart_consignee").find(".select-common");
	if(select_last_node.length>0)
	{		
		var region_id = $(select_last_node[select_last_node.length - 1]).val();
	}
	else
	{
		var region_id = 0;
		
	}
	
	var ajaxurl = APP_ROOT+"/wap.php?ctl=ajax&act=load_delivery&id="+region_id+"&order_id="+$("input[name='id']").val();
	
	
	$.ajax({ 
		url: ajaxurl,
		success: function(html){
		
			
			$("#cart_delivery").html(html);
			//count_buy_total();  //加载完配送方式重新计算总价
		},
		error:function(ajaxobj)
		{
//			if(ajaxobj.responseText!='')
//			alert(LANG['REFRESH_TOO_FAST']);
		}
	});	
}

//计算购物总价
function count_buy_total()
{
	
	$("#order_done").attr("disabled",true);
	var query = new Object();
	
	//获取配送方式
	var delivery_id = $("input[name='delivery']:checked").val();

	if(!delivery_id)
	{
		delivery_id = 0;
	}
	
	query.delivery_id = delivery_id;

	//配送地区
	var select_last_node = $("#cart_consignee").find(".select-common");
	if(select_last_node.length>0)
	{		
		var region_id = $(select_last_node[select_last_node.length - 1]).val();
	}
	else
	{
		var region_id = 0;
	}
	query.region_id = region_id;

	//余额支付
	var account_money = $("input[name='account_money']").val();
	if(!account_money||$.trim(account_money)=='')
	{
		account_money = 0;
	}
	query.account_money = account_money;
	
	//全额支付
	if($("#check-all-money").attr("checked"))
	{
		query.all_account_money = 1;
	}
	else
	{
		query.all_account_money = 0;
	}
	
	//代金券
	var ecvsn = $("input[name='ecvsn']").val();
	if(!ecvsn)
	{
		ecvsn = '';
	}
	var ecvpassword = $("input[name='ecvpassword']").val();
	if(!ecvpassword)
	{
		ecvpassword = '';
	}
	query.ecvsn = ecvsn;
	query.ecvpassword = ecvpassword;
	
	//支付方式
	var payment = $("input[name='payment']:checked").val();	
	if(!payment)
	{
		payment = 0;
	}
	query.payment = payment;
	query.bank_id = $("input[name='payment']:checked").attr("rel");
	if(!isNaN(order_id)&&order_id>0)
	var ajaxurl = APP_ROOT+"/shop.php?ctl=ajax&act=count_order_total&id="+order_id;
	else
	var ajaxurl = APP_ROOT+"/shop.php?ctl=ajax&act=count_buy_total";
	
	
	$.ajax({ 
		url: ajaxurl,
		data:query,
		type: "POST",
		dataType: "json",
		success: function(data){			
			
			var show_order_total = $('#show_order_total').html();
			//修改显示订单总额
			//alert(data.pay_price);
			var order_total = parseFloat(data.account_money)+parseFloat(data.pay_price);
			$('#order_total').html('￥' + order_total);
			if( show_order_total != undefined){
				//修改显示还需支付金额				
				$('#show_order_total').html('￥' + parseFloat(data.pay_price));
					
			}
						
			if(data.pay_price == 0)
			{
				$("input[name='payment']").attr("checked",false);
			}			
				
			$("#order_done").removeAttr("disabled",false);
		},
		error:function(ajaxobj)
		{
//			if(ajaxobj.responseText!='')
//			alert(LANG['REFRESH_TOO_FAST']);
		}
	});	
}

function checkMobilePhone(value){

	if($.trim(value)!='')
		return /^\d{6,}$/i.test($.trim(value));
	else
		return true;
};


//购物提交
function submit_buy()
{
	
	
	$("#order_done").attr("disabled",true);
	var query = new Object();
	
	
	//获取配送方式
	var delivery_id = $("input[name='delivery']:checked").val();
	
	if(!delivery_id)
	{
		delivery_id = 0;
	}
	query.delivery_id = delivery_id;
	
	
	//配送地区
	var select_last_node = $("#cart_consignee").find(".select-common");
	if(select_last_node.length>0)
	{	
		//alert(delivery_id);
		var region_id = $(select_last_node[select_last_node.length - 1]).val();
	}
	else
	{
		var region_id = 0;
	}
	query.region_id = region_id;
	
	//余额支付
	var account_money = $("input[name='account_money']").val();
	if(!account_money||$.trim(account_money)=='')
	{
		account_money = 0;
	}
	query.account_money = account_money;
	
	//全额支付
	if($("#check-all-money").attr("checked"))
	{
		query.all_account_money = 1;
	}
	else
	{
		query.all_account_money = 0;
	}
	
	//代金券
	var ecvsn = $("input[name='ecvsn']").val();
	if(!ecvsn)
	{
		ecvsn = '';
	}
	var ecvpassword = $("input[name='ecvpassword']").val();
	if(!ecvpassword)
	{
		ecvpassword = '';
	}
	query.ecvsn = ecvsn;
	query.ecvpassword = ecvpassword;
	
	//支付方式
	var payment = $("input[name='payment']:checked").val();
	if(!payment)
	{
		payment = 0;
	}
	query.payment = payment;
	
	
	
	if(!isNaN(order_id)&&order_id>0)
	var ajaxurl = APP_ROOT+"/shop.php?ctl=ajax&act=count_order_total&id="+order_id;
	else
	var ajaxurl = APP_ROOT+"/shop.php?ctl=ajax&act=count_buy_total";
	
	$.ajax({ 
		url: ajaxurl,
		data:query,
		type: "POST",
		dataType: "json",
		success: function(data){	
			
			/* alert("发货方式--->"+data.delivery_info);
			alert("支付方式--->"+data.payment_info);
			alert("余额支付--->"+data.account_money);
			alert("支付金额--->"+data.pay_price); */
			if(data.payment_info == null){
				//余额支付 //修改支付总额
				var account_money = parseFloat(data.account_money)+parseFloat(data.pay_price);
				$("input[name='account_money']").val(account_money);	
				data.pay_price = 0;	
				//alert("余额支付");
			
			}else{
				if(data.pay_price!=0){
					
					//修改支付总额
					account_money =  parseFloat(data.pay_price);
					$("input[name='account_money']").val(account_money);			
					//alert("提交了的金额"+data.pay_price);
					data.pay_price = 0;
					//alert("提交了");
				}
			
			}
			
			
			if(data.is_delivery == 1)
			{
				
				//配送验证
				if(!data.region_info||data.region_info.region_level != 4)
				{
					
					show_msg_only_confirm('友情提示',LANG['FILL_CORRECT_CONSIGNEE_ADDRESS'], function () {
                        return;
                    });					
					$("#order_done").removeAttr("disabled",false);
					return;
				}
				if($.trim($("input[name='consignee']").val())=='')
				{
					
					show_msg_only_confirm('友情提示',LANG['FILL_CORRECT_CONSIGNEE'], function () {
                        return;
                    });
					$("#order_done").removeAttr("disabled",false);
					return;
				}
				if($.trim($("#from_address").val())=='')
				{
					
					show_msg_only_confirm('友情提示',LANG['FILL_CORRECT_ADDRESS'], function () {
                        return;
                    });
					$("#order_done").removeAttr("disabled",false);
					return;
				}
				if($.trim($("input[name='zip']").val())=='')
				{
					
					show_msg_only_confirm('友情提示',LANG['FILL_CORRECT_ZIP'], function () {
                        return;
                    });
					$("#order_done").removeAttr("disabled",false);
					return;
				}
				if($.trim($("input[name='mobile']").val())=='')
				{
					
					show_msg_only_confirm('友情提示',LANG['FILL_MOBILE_PHONE'], function () {
                        return;
                    });
					$("#order_done").removeAttr("disabled",false);
					return;
				}
				if(!checkMobilePhone($("input[name='mobile']").val()))
				{
					
					show_msg_only_confirm('友情提示',LANG['FILL_CORRECT_MOBILE_PHONE'], function () {
                        return;
                    });
					$("#order_done").removeAttr("disabled",false);
					return;
				}
				if(!data.delivery_info)
				{
				
					show_msg_only_confirm('友情提示',LANG['PLEASE_SELECT_DELIVERY'], function () {
                        return;
                    });
					$("#order_done").removeAttr("disabled");
					return;
				}			
			}
			
			
			if(data.pay_price!=0&&!data.payment_info)
			{
				
				show_msg_only_confirm('友情提示',LANG['PLEASE_SELECT_PAYMENT'], function () {
                        return;
                    });
				$("#order_done").removeAttr("disabled",false);
				return;
			}	
			
			//alert("支付成功");
			$("#cart_form").submit();  
		},
		error:function(ajaxobj)
		{			
//			alert("error: "+ajaxobj.responseText);
//			return false;
		}
	});	
}


