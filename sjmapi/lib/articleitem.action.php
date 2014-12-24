<?php
class articleitem
{
	public function index()	{
		$email = strim($GLOBALS['request']['email']);//用户名或邮箱
		$pwd = strim($GLOBALS['request']['pwd']);//密码
		
		//检查用户,用户密码
		$user = user_check($email,$pwd);
		$user_id  = intval($user['id']);			
		$root = array();
		
		$article_id = intval($GLOBALS['request']['id']);//帖子id
		$page = intval($GLOBALS['request']['page']); //分页
		
		//读取主帖子
		$article_item = $GLOBALS['db']->getRow("select * from ".DB_PREFIX."article where id = ".$article_id." and is_effect= 1");
		$article_item['content']=str_replace("./public/","/public/",$article_item['content']);
		//点击量加1
		$GLOBALS['db']->query("update ".DB_PREFIX."article set click_count = click_count + 1 where id = ".$article_id);
		
		if($article_item){
			$root['exit']=1;			
		}else{
			$root['exit']=0;
			$root['msg']='抱歉，该文章不存在！';
		}
		
		$root['article_item']=$article_item;
		$root['page_title']='文章详情';
		output($root);
	}
}
?>