(function(b,c){var a={close:'<a class="ui-dialog-close" title="\u5173\u95ed"><span class="ui-icon ui-icon-delete"></span></a>',mask:'<div class="ui-mask"></div>',title:'<div class="ui-dialog-title"><h3><%=title%></h3></div>',wrap:'<div class="ui-dialog"><div class="ui-dialog-content"></div><% if(btns){ %><div class="ui-dialog-btns"><% for(var i=0, length=btns.length; i<length; i++){var item = btns[i]; %><a class="ui-btn ui-btn-<%=item.index%>" data-key="<%=item.key%>"><%=item.text%></a><% } %></div><% } %></div> '};b.ui.define("dialog",{_data:{autoOpen:true,buttons:null,closeBtn:true,mask:true,width:300,height:"auto",title:null,content:null,scrollMove:true,container:null,maskClick:null,position:null},getWrap:function(){return this._data._wrap},_setup:function(){var d=this._data;d.content=d.content||this._el.show();d.title=d.title||this._el.attr("title")},_init:function(){var g=this,h=g._data,f,e=0,d=b.proxy(g._eventHandler,g),j={};h._container=b(h.container||document.body);(h._cIsBody=h._container.is("body"))||h._container.addClass("ui-dialog-container");j.btns=f=[];h.buttons&&b.each(h.buttons,function(i){f.push({index:++e,text:i,key:i})});h._mask=h.mask?b(a.mask).appendTo(h._container):null;h._wrap=b(b.parseTpl(a.wrap,j)).appendTo(h._container);h._content=b(".ui-dialog-content",h._wrap);h._title=b(a.title);h._close=h.closeBtn&&b(a.close).highlight("ui-dialog-close-hover");g._el=g._el||h._content;g.title(h.title);g.content(h.content);f.length&&b(".ui-dialog-btns .ui-btn",h._wrap).highlight("ui-state-hover");h._wrap.css({width:h.width,height:h.height});b(window).on("ortchange",d);h._wrap.on("click",d);h._mask&&h._mask.on("click",d);h.autoOpen&&g.root().one("init",function(){g.open()})},_eventHandler:function(j){var h=this,d,g,i=h._data,f;switch(j.type){case"ortchange":this.refresh();break;case"touchmove":i.scrollMove&&j.preventDefault();break;case"click":if(i._mask&&(b.contains(i._mask[0],j.target)||i._mask[0]===j.target)){return h.trigger("maskClick")}g=i._wrap.get(0);if((d=b(j.target).closest(".ui-dialog-close",g))&&d.length){h.close()}else{if((d=b(j.target).closest(".ui-dialog-btns .ui-btn",g))&&d.length){f=i.buttons[d.attr("data-key")];f&&f.apply(h,arguments)}}}},_calculate:function(){var i=this,j=i._data,h,k,e=document.body,g={},d=j._cIsBody,f=Math.round;j.mask&&(g.mask=d?{width:"100%",height:Math.max(e.scrollHeight,e.clientHeight)-1}:{width:"100%",height:"100%"});h=j._wrap.offset();k=b(window);g.wrap={left:"50%",marginLeft:-f(h.width/2)+"px",top:d?f(k.height()/2)+window.pageYOffset:"50%",marginTop:-f(h.height/2)+"px"};return g},refresh:function(){var e=this,g=e._data,d,f;if(g._isOpen){f=function(){d=e._calculate();d.mask&&g._mask.css(d.mask);g._wrap.css(d.wrap)};if(b.os.ios&&document.activeElement&&/input|textarea|select/i.test(document.activeElement.tagName)){document.body.scrollLeft=0;b.later(f,200)}else{f()}}return e},open:function(d,f){var e=this._data;e._isOpen=true;e._wrap.css("display","block");e._mask&&e._mask.css("display","block");d!==c&&this.position?this.position(d,f):this.refresh();b(document).on("touchmove",b.proxy(this._eventHandler,this));return this.trigger("open")},close:function(){var d,e=this._data;d=b.Event("beforeClose");this.trigger(d);if(d.defaultPrevented){return this}e._isOpen=false;e._wrap.css("display","none");e._mask&&e._mask.css("display","none");b(document).off("touchmove",this._eventHandler);return this.trigger("close")},title:function(e){var d=this._data,f=e!==c;if(f){e=(d.title=e)?"<h3>"+e+"</h3>":e;d._title.html(e)[e?"prependTo":"remove"](d._wrap);d._close&&d._close.prependTo(d.title?d._title:d._wrap)}return f?this:d.title},content:function(e){var d=this._data,f=e!==c;f&&d._content.empty().append(d.content=e);return f?this:d.content},destroy:function(){var e=this._data,d=this._eventHandler;b(window).off("ortchange",d);b(document).off("touchmove",d);e._wrap.off("click",d).remove();e._mask&&e._mask.off("click",d).remove();e._close&&e._close.highlight();return this.$super("destroy")}})})(Zepto);