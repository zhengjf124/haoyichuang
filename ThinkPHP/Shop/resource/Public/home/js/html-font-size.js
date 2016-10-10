        (function (doc, win) { //立即执行函数			
	            var docEl = doc.documentElement,    
	            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize', //orientationchange 旋转，如果窗体支持旋转，就使用，不可以就用大小重定义 
	            recalc = function () {    
	            var clientWidth = docEl.clientWidth;    
	            if (!clientWidth) return;    
	            docEl.style.fontSize = 20 * (clientWidth / 640) + 'px';  
				//alert(20 * (clientWidth / 320));  
	        }; 
	        recalc();    
	        if (!doc.addEventListener) return;   //addEventListener  绑定事件
	        win.addEventListener(resizeEvt, recalc, false);    
	        doc.addEventListener('DOMContentLoaded', recalc, false);  //DOMContentLoaded 文档加载时就运行，onload是在文档都加载完后运行
			//document.addeventListener('DOMContentLoaded',function(){...},false);  
        })(document, window);   
