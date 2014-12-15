<?php
/*********黔城惠自定义函数库***********************/
function load_nav($navid,$order,$num){
	$query = "SELECT a.id AS aid, b.id AS bid, c.cate_id AS cate_id, c.deal_cate_type_id AS deal_cate_type_id, a.`name` AS aname, b.`name` AS bname, b.is_recommend AS is_recommend, b.sort AS sort FROM fanwe_deal_cate AS a, fanwe_deal_cate_type AS b, fanwe_deal_cate_type_link AS c WHERE a.id = c.cate_id AND b.id = c.deal_cate_type_id AND a.id = ".$navid." ORDER BY ".$order." ASC LIMIT ".$num."";
	if (!$result = mysql_query($query)){
		print "Query Error: ".mysql_error();
		exit;
		}
	while($qch = mysql_fetch_array($result)){
  	$count_num = count($qch[cate_id]);
    $url=parse_url_tag("u:tuan|store|id=".$qch[cate_id]."&tid=".$qch[deal_cate_type_id]."");
		//print "<span><a href=/tuan.php?id=".$qch[cate_id]."&tid=".$qch[deal_cate_type_id]." target=_blank>".$qch[bname]."</a></span>";
    print "<span><a href=".$url." title=".$qch[bname]." target=_blank>".$qch[bname]."</a></span>";
	}
}
//调用商圈
function shangquan($navid,$order,$num){
	$query = "SELECT * FROM fanwe_area WHERE pid in(".$navid.") ORDER BY ".$order." ASC LIMIT ".$num."";
	if (!$result = mysql_query($query)){
		print "Query Error: ".mysql_error();
		exit;
		}
	while($qch = mysql_fetch_array($result)){
  $url=parse_url_tag("u:youhui|store|aid=".$qch[id]."");
		//print "<a href=youhui.php?ctl=store&aid=".$qch[id]." target=_blank>".$qch[name]."</a>";
    print "<a href=".$url." title=".$qch[name]." target=_blank>".$qch[name]."</a>";
	}
}


//优惠推荐
function tuan_hot($order,$num){
	$query = "SELECT a.id AS aid, b.id AS bid, c.id AS cid, a.is_recommend, a.sub_name, a.cate_id AS acid, a.buy_count, a.buy_type, a.is_effect, a.`name` AS aname, a.icon, b.`name` AS bname, a.origin_price, a.current_price, a.cate_id, a.img, a.is_shop, a.publish_wait, a.is_delete, d.location_id, d.area_id, c.supplier_id AS csid, a.supplier_id AS asid FROM fanwe_deal AS a , fanwe_area AS b , fanwe_supplier_location AS c , fanwe_supplier_location_area_link AS d WHERE a.is_shop = 0 AND d.location_id = c.id AND d.area_id = b.id AND a.supplier_id = c.supplier_id AND a.is_effect = 1 AND is_delete = 0 group by a.id ORDER BY ".$order." DESC LIMIT ".$num."";
if (!$result = mysql_query($query)){
		print "Query Error: ".mysql_error();
		exit;
		}
	while($qch = mysql_fetch_array($result)){
  	$url=parse_url_tag("u:tuan|deal|id=".$qch[aid]."");
echo "<li><div class=pic><a href=".$url." title=".$qch[aname]." target=_blank><img src=".get_spec_image($qch[img],$width=180,$height=108,$gen=1,$is_preview=true)." alt=".$qch[aname]." /></a></div><div class=con><a href=".$url." title=".$qch[aname]." target=_blank>".$qch[aname]."</a></div><div class=other><i class=ico>".$qch[bname]."</i><a href=".$url." title=".$qch[aname]." class=btn target=_blank>去看看</a></div></li>";
	}
}

//团购列表
function tuan_list($navid,$order,$num){
	$query = "SELECT a.id AS aid, b.id AS bid, c.id AS cid, a.is_recommend, a.sub_name, a.cate_id AS acid, a.buy_count, a.buy_type, a.is_effect, a.`name` AS aname, a.icon, b.`name` AS bname, a.origin_price, a.current_price, a.cate_id, a.img, a.is_shop, a.publish_wait, a.is_delete, a.time_status, d.location_id, d.area_id, c.supplier_id AS csid, a.supplier_id AS asid FROM fanwe_deal AS a , fanwe_area AS b , fanwe_supplier_location AS c , fanwe_supplier_location_area_link AS d WHERE a.is_shop = 0 AND d.location_id = c.id AND d.area_id = b.id AND a.supplier_id = c.supplier_id AND a.buy_type <=4 AND a.is_effect = 1 AND a.is_recommend = 1 AND is_delete = 0 AND a.cate_id in (".$navid.") group by a.id ORDER BY ".$order." DESC LIMIT ".$num."";
	if (!$result = mysql_query($query)){
		print "Query Error: ".mysql_error();
		exit;
		}
	while($qch = mysql_fetch_array($result)){
  	$url=parse_url_tag("u:tuan|deal|id=".$qch[aid]."");
		print "<dl class='lb'>
<dt class='pic'><a href=".$url." title=".$qch[aname]." target=_blank><img src=".get_spec_image($qch[img],$width=230,$height=160,$gen=1,$is_preview=true)." alt=".$qch[aname]." /></a></dt>
<dd class=price><span class='fl f_yh'>￥".number_format($qch[current_price], 0)."<del>￥".number_format($qch[origin_price], 0)."</del></span><span class='fr'>".$qch[buy_count]."人购买</span></dd>
<dd class=title><a href=".$url." title=".$qch[aname]." target=_blank>".$qch[aname]."</a></dd>
<dd class=wz><i class=ico>".$qch[bname]."</i>
<a href=".$url." title=".$qch[aname]." class=btn target=_blank>去看看</a></dd>
</dl>";
	}
}

//调用商家
function shop($navid,$order,$num){
  $query = "SELECT a.*, b.* FROM fanwe_supplier_location AS a , fanwe_deal_cate_type_location_link AS b WHERE a.id = b.location_id AND a.is_recommend = 1 AND b.deal_cate_type_id = ".$navid." ORDER BY ".$order." DESC LIMIT ".$num."";
	if (!$result = mysql_query($query)){
		print "Query Error: ".mysql_error();
		exit;
		}
	while($qch = mysql_fetch_array($result)){
  $url=parse_url_tag("u:youhui|store#view|id=".$qch[id]."");
		print "<li><a href=".$url." title=".$qch[name]." class=pic target=_blank><img src=".get_spec_image($qch[preview],$width=60,$height=60,$gen=1,$is_preview=true)." alt=".$qch[name]."></a><p><a href=".$url." title=".$qch[name]." target=_blank>".$qch[name]."</a><span class=index_start_bar title=".$qch[dp_count]."封点评><i style=width:".intval($qch[avg_point]/5*100)."%;></i>
				</span><br>
        ".$qch[dp_count]."封点评</p></li>";
	}
}

function get_list_hot($limit,$cate_id=0,$where='',$orderby='',$buy_tpye=''){
	$time = get_gmtime();
}



?>