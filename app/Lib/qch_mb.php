<?php
 //���¼����̼�
$new_store = get_store(0,'id desc',10);
$GLOBALS['tmpl']->assign("new_store",$new_store);
//��ҳ������Ʒ
$index_tuan_hot=get_tuan("0","0","buy_count desc","10");
$GLOBALS['tmpl']->assign("index_tuan_hot",$index_tuan_hot);
//�����µ�
$index_tuan_new = get_tuan(4,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"is_recommend = 1","begin_time desc");
$index_tuan_new = $index_tuan_new['list'];
$GLOBALS['tmpl']->assign("index_tuan_new",$index_tuan_new);
//��ҳ�Ҳ��Ƽ�
$index_tuan_right = get_tuan(6,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"is_recommend = 1","buy_count desc");
$index_tuan_right = $index_tuan_right['list'];
$GLOBALS['tmpl']->assign("index_tuan_right",$index_tuan_right);

//������ʳ��Ŀ
$scate_food_hot = get_cate(8,"id asc","0,3");
$GLOBALS['tmpl']->assign("scate_food_hot",$scate_food_hot);
$scate_food = get_cate(8,"id asc",999);
$GLOBALS['tmpl']->assign("scate_food",$scate_food);
//����������Ŀ
$scate_Entertainment_hot = get_cate(9,"id asc","0,4");
$GLOBALS['tmpl']->assign("scate_Entertainment_hot",$scate_Entertainment_hot);
$scate_Entertainment = get_cate(9,"id asc",999);
$GLOBALS['tmpl']->assign("scate_Entertainment",$scate_Entertainment);
//�Ƶ���Ŀ
$scate_hotel_hot = get_cate(10,"id asc","0,3");
$GLOBALS['tmpl']->assign("scate_hotel_hot",$scate_hotel_hot);
$scate_hotel = get_cate(10,"id asc",999);
$GLOBALS['tmpl']->assign("scate_hotel",$scate_hotel);
//������Ŀ
$scate_travel_hot = get_cate(14,"id asc","0,3");
$GLOBALS['tmpl']->assign("scate_travel_hot",$scate_travel_hot);
$scate_travel = get_cate(14,"id asc",999);
$GLOBALS['tmpl']->assign("scate_travel",$scate_travel);
//��ױŮ����Ŀ
$scate_Cosmetic_hot = get_cate(13,"id asc","0,3");
$GLOBALS['tmpl']->assign("scate_Cosmetic_hot",$scate_Cosmetic_hot);
$scate_Cosmetic = get_cate(13,"id asc",999);
$GLOBALS['tmpl']->assign("scate_Cosmetic",$scate_Cosmetic);
//���������Ŀ
$scate_service_hot = get_cate(11,"id asc","0,3");
$GLOBALS['tmpl']->assign("scate_service_hot",$scate_service_hot);
$scate_service = get_cate(11,"id asc",999);
$GLOBALS['tmpl']->assign("scate_service",$scate_service);


//��Ȧ
$shangquan_hot = get_quan(0,"sort asc","3");
$GLOBALS['tmpl']->assign("shangquan_hot",$shangquan_hot);
$shangquan = get_quan(17,"sort asc",999);
$GLOBALS['tmpl']->assign("shangquan",$shangquan);


//������ʳ�б�
$tuan_food_list=get_tuan(12,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"cate_id in(8) and is_recommend = 1","sort desc");
$tuan_food_list = $tuan_food_list['list'];
$GLOBALS['tmpl']->assign("tuan_food_list",$tuan_food_list);
//���������б�
$tuan_entertainment_list=get_tuan(9,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"cate_id in(9) and is_recommend = 1","sort desc");
$tuan_entertainment_list = $tuan_entertainment_list['list'];
$GLOBALS['tmpl']->assign("tuan_entertainment_list",$tuan_entertainment_list);
//�Ƶ��б�
$tuan_hotel_list=get_tuan(6,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"cate_id in(10) and is_recommend = 1","sort desc");
$tuan_hotel_list = $tuan_hotel_list['list'];
$GLOBALS['tmpl']->assign("tuan_hotel_list",$tuan_hotel_list);
//�����б�
$tuan_travel_list=get_tuan(9,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"cate_id in(14) and is_recommend = 1","sort desc");
$tuan_travel_list = $tuan_travel_list['list'];
$GLOBALS['tmpl']->assign("tuan_travel_list",$tuan_travel_list);
//�ز��б�
$techan_list = search_goods_list_d(intval(app_conf("REC_BEST_LIMIT")),0," is_best = 1 and buy_type <> 1 ","",false);
$techan_list = $techan_list['list'];
$GLOBALS['tmpl']->assign("techan_list",$techan_list);

//��ױ�����б�
$tuan_cosmetic_list=get_tuan(9,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"cate_id in(13) and is_recommend = 1","sort desc");
$tuan_cosmetic_list = $tuan_cosmetic_list['list'];
$GLOBALS['tmpl']->assign("tuan_cosmetic_list",$tuan_cosmetic_list);
//��������б�
$tuan_service_list=get_tuan(9,0,$GLOBALS['deal_city']['id'],array(DEAL_ALL),"cate_id in(11) and is_recommend = 1","sort desc");
$tuan_service_list = $tuan_service_list['list'];
$GLOBALS['tmpl']->assign("tuan_service_list",$tuan_service_list);
//�ײ���������
$notice_help_foot_list = get_notice_list(4,7);
$GLOBALS['tmpl']->assign("notice_help_foot_list",$notice_help_foot_list);
//�ײ��̼Һ���
$notice_store_foot_list = get_notice_list(4,10);
$GLOBALS['tmpl']->assign("notice_store_foot_list",$notice_store_foot_list);
//�ײ���˾��Ϣ
$notice_company_foot_list = get_notice_list(4,11);
$GLOBALS['tmpl']->assign("notice_company_foot_list",$notice_company_foot_list);
//������ʳ�Ƽ��̼�
$hot_food_store = get_store(8,'dp_count desc',4);
$GLOBALS['tmpl']->assign("hot_food_store",$hot_food_store);
//�Ƶ������̼ҵ���
$hot_hotel_store = get_store(10,'dp_count desc',6);
$GLOBALS['tmpl']->assign("hot_hotel_store",$hot_hotel_store);
//��ױ�����̼ҵ���
$hot_cosmetic_store = get_store(13,'dp_count desc',6);
$GLOBALS['tmpl']->assign("hot_cosmetic_store",$hot_cosmetic_store);
//��������̼ҵ���
$hot_service_store = get_store(11,'dp_count desc',6);
$GLOBALS['tmpl']->assign("hot_service_store",$hot_service_store);
//���¼����̼�
$hot_service_store = get_store(11,'dp_count desc',6);
$GLOBALS['tmpl']->assign("hot_service_store",$hot_service_store);
?>