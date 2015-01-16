	//登录提示
	function login_ts(){
		$("#alert_content").html("请先<a href='index.php?ctl=login'>登录</a>");
		$('#my-alert').modal({
			relatedTarget: this,
		});
	}
	
	$(document).ready(function () {
		//回到顶部
		$("#amz-toolbar").hide();
		//gotop
		$(window).scroll(function () {
			var scrollTop = $(document).scrollTop();   
			var windowHeight = $(window).height();
			var scrollHeight = $(document).height();
			var proportion = parseFloat((scrollTop + windowHeight)/scrollHeight);
			//if (scrollTop + windowHeight == scrollHeight) {   
			if (proportion>0.9){
				$("#amz-toolbar").show();
			}else{
				$("#amz-toolbar").hide();
			}
		});
	 });