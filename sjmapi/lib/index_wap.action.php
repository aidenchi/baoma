<?php
class index_wap
{
	public function index()
	{
		
		
		$root = array();
		$root['return'] = 1;
		
		$city_id =intval($GLOBALS['request']['city_id']);
		$city_name =strim($GLOBALS['request']['city_name']);	

		$root['city_id']=$city_id;
		$root['city_name']=$city_name;
		$adv_list = $GLOBALS['cache']->get("WAP_INDEX_ADVS_".intval($city_id));

		//广告列表
		if($adv_list===false){								
			$sql = " select * from ".DB_PREFIX."m_adv where page = 'wap' and city_id in (0,1,".intval($city_id).") and status = 1 order by sort desc ";			
			$advs = $GLOBALS['db']->getAll($sql);		
			
			$adv_list = array();
			foreach($advs as $k=>$v){
				$adv_list[$k]['id'] = $v['id'];
				$adv_list[$k]['name'] = $v['name'];
				$adv_list[$k]['img'] = get_abs_img_root($v['img']);//get_abs_img_root(get_spec_image($v['img'],640,100,0));
				//$adv_list[$k]['img2'] = get_spec_image($v['img'],640,100,1);
				$adv_list[$k]['type'] = $v['type'];
				$adv_list[$k]['data'] = $v['data'] = unserialize($v['data']);
				
				$adv_list[$k]['url'] = getWebAdsUrl($v['type'],$v['data']);
			}
			$GLOBALS['cache']->set("WAP_INDEX_ADVS_".intval($city_id),$adv_list,300);
		}
		$root['advs'] = $adv_list;
		
		$root['page_title'] = $GLOBALS['m_config']['program_title'];
		output($root);
	}
}
?>