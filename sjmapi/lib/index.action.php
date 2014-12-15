<?php
class index
{
	public function index()
	{
		if($GLOBALS['request']['from']=="wap"){			
			require_once "index_wap.action.php";			
			$obj = new index_wap;
			$obj->index();
		}else{
			$root = array();
			$root['return'] = 1;
			
			$ypoint =  $m_latitude = doubleval($GLOBALS['request']['m_latitude']);  //ypoint
			$xpoint = $m_longitude = doubleval($GLOBALS['request']['m_longitude']);  //xpoint			
			$pi = 3.14159265;  //圆周率
			$r = 6378137;  //地球平均半径(米)
			$root['m_latitude'] = $ypoint;
			$root['m_longitude'] = $xpoint;
			
			$city_id = intval($GLOBALS['request']['city_id']);
			if ($city_id == 0)
				$city_id=intval($GLOBALS['city_id']);
			
			
			
			$root['city_id'] = $city_id;
			output($root);
		}
	}
}
?>