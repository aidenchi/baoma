<ul class="business_ul">
 	<?php $_from = $this->_var['data']['item']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'deal');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['deal']):
?>
	<li class="tuan_li">
 	     <a href="<?php
echo parse_wap_url_tag("u:index|merchantitem#index|"."id=".$this->_var['deal']['id']."".""); 
?>">
 	     	<div class="list_item">
 	     		 <div><img src="<?php echo $this->_var['deal']['logo']; ?>" width="108" height="67"></div>	
				 <div class="good_deta">
				 	  <h4><?php echo $this->_var['deal']['name']; ?></h4>
					  <p>地址:<?php echo $this->_var['deal']['api_address']; ?></p>
					  <div class="grade">
			  	             <span>评分:</span>
				             <div class="five_star_orange" >
					   	           <i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i><i class="fa fa-star orange"></i>
					   	           <div class="five_star_grey" style="width:<?php echo $this->_var['deal']['width']; ?>%">
					   	    	        <i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i><i class="fa fa-star grey"></i>
					   	           </div>
					         </div>
				             <b><?php echo $this->_var['deal']['avg_point']; ?></b>
			            </div>
				 </div>
				 								
		    </div>
 	     </a>
 	</li>
	<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
</ul> 

<?php if ($this->_var['pages']): ?>
	<div class="fy">
		<?php echo $this->_var['pages']; ?>
	</div>
<?php endif; ?>