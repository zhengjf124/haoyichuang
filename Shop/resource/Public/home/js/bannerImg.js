

(function($){
	$.bannerImg = function(ImgConf){		
		
		var objBannerId = $("#"+ImgConf.bannerBox);
		var speed = ImgConf.speed;
		//dom Obj
		var bannerIcoLi = $("#" + ImgConf.bannerBox + ' .bannerIco li');
		var bannerImg_btn_left = $("#" + ImgConf.bannerBox + ' .bannerImg_btn_left');
		var bannerImg_btn_right = $("#" + ImgConf.bannerBox + ' .bannerImg_btn_right');
		var bannerImgLi = $("#" + ImgConf.bannerBox + ' .bannerImg li');
		
		
		var bannerImgNum = bannerImgLi.length;
		var bannerImgPage = 0;
		var bannerImgTimer = null;
		var hoverTime = 0;
		
		
		//外部获得当毅所在位置
		this.Page=function(){
			return bannerImgPage;
		}
		
		
		//外部获得定时器名称
		this.BannerTimer = function(){
			return bannerImgTimer;
		}
		
		//向左移动
		this.bannerMoveLeft = function(){
			bannerImgPage--;
			bannerImgPlay();
		}
		
		//向右移动
		this.bannerMoveRight = function(){
			bannerImgPage++;
			bannerImgPlay();
		}
		
		//设置跳动
		this.bannerSetTimer = function(){			
			bannerImgTimer = setInterval(bannerImgStarMove,speed);
		}
		
		
		this.starPlayBanner = function(){
			//设备订时器
			
			bannerImgTimer = setInterval(bannerImgStarMove,speed);
			
			
			//单击左按钮时的动作
			bannerImg_btn_left.click(function(){
				bannerImgPage--;
				bannerImgPlay();
			});
			
			//单击右按钮时的动作
			bannerImg_btn_right.click(function(){
				bannerImgPage++;
				bannerImgPlay();
			});
			
			//单击点的时候
			bannerIcoLi.bind('click',function(){		
				var timestamp = new Date().getTime();						
				if((timestamp - hoverTime)>500){
					hoverTime = timestamp;
					var index = bannerIcoLi.index(this);		
					bannerImgPage = index;
					bannerImgPlay();
				}
			});
			
			//鼠标经过时停止跳动
			objBannerId.mousemove(function(){
				clearInterval(bannerImgTimer);	
			});
			
			//鼠标移出时开始跳动
			objBannerId.mouseout(function(){
				bannerImgTimer = setInterval(bannerImgStarMove,speed);
			});
			
			
			
			var a = new LSwiperMaker({
				bind:document.getElementById(ImgConf.bannerBox),  // 绑定的DOM对象
				dire_h:true,     //true 判断左右， false 判断上下
				backfn:function(o){    //回调事件
					 //document.getElementById("dire").innerHTML = "向"+ o.dire + "滑"; 
					 clearInterval(bannerImgTimer);
					 
					 if(o.dire == 'L'){				 
						bannerImgPage++;		
						bannerImgPlay();					 
					}else if(o.dire == 'R'){
						 bannerImgPage--;		
						bannerImgPlay();
						 
					}					
					bannerImgTimer = setInterval(bannerImgStarMove,speed);
			 	}
			})
			
			
			
			
		}
		
		//移动函数
		function bannerImgPlay(){			
			if(bannerImgPage < 0){
				bannerImgPage = bannerImgNum;	
			}else if(bannerImgPage > bannerImgNum){
				bannerImgPage = 0;	
			}
			bannerIcoLi.eq(bannerImgPage).addClass('active').siblings().removeClass('active');
			bannerImgLi.eq(bannerImgPage).show(1000).siblings().hide(1000);		
		}
		
		//订时器所需要的运行函数
		function bannerImgStarMove(){
			bannerImgPage++;
			bannerImgPlay();
			
		}
						
		
	}
})(jQuery);


/*焦点图片滑动*/
(function(){
	
        var LSwiperMaker = function(o){ 
 
            var that = this;
            this.config = o;
            this.control = false;
            this.sPos = {};
            this.mPos = {};
            this.dire;
     
            // this.config.bind.addEventListener('touchstart', function(){ return that.start(); } ,false);
            // 这样不对的，event对象只在事件发生的过程中才有效;
            this.config.bind.addEventListener('touchstart', function(e){ return that.start(e); } ,false);
            this.config.bind.addEventListener('touchmove', function(e){ return that.move(e); } ,false);
            this.config.bind.addEventListener('touchend', function(e){ return that.end(e); } ,false);
          
        }
        
        LSwiperMaker.prototype.start = function(e){
             
             var point = e.touches ? e.touches[0] : e;
             this.sPos.x = point.screenX;
             this.sPos.y = point.screenY;
             //document.getElementById("start").innerHTML = "开始位置是:"+this.sPos.x +" "+ this.sPos.y ;
 
        }
        LSwiperMaker.prototype.move = function(e){  
 
            var point = e.touches ? e.touches[0] : e;
            this.control = true;
            this.mPos.x = point.screenX;
            this.mPos.y = point.screenY;
            //document.getElementById("move").innerHTML = "您的位置是："+this.mPos.x +" "+ this.mPos.y ;
 
        }
 
        LSwiperMaker.prototype.end = function(e){
			
			//多少算是滑动成功
			var moverWidth = 50;
 
            this.config.dire_h  && (!this.control ? this.dire = null : this.mPos.x > this.sPos.x+moverWidth ? this.dire = 'R' : this.dire = 'L')
            this.config.dire_h  || (!this.control ? this.dire = null : this.mPos.y > this.sPos.y ? this.dire = 'D' : this.dire = 'U')
 
            this.control = false;
            this.config.backfn(this);
 
        }
 
        window.LSwiperMaker = LSwiperMaker;
        //document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);// 禁止微信touchmove冲突
 
    }())
 
