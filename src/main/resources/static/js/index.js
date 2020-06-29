$(function(){
   $('input').focus(function(e) {
        $(this).val('');
	});	 
	$('textarea').focus(function(e) {
        $(this).val('');
	});	
	 //清除input
   var timer;
   var num=0;
   $('.btn li').eq(num).addClass('mycurrent');
   var nextfn=function(){  		
		  num=num+1;
		  if(num>2){num=0;}
		$('.btn li').eq(num).addClass('mycurrent');
		$('.btn li').eq(num).siblings('li').removeClass('mycurrent') ;
		$('.myimg li').eq(num).fadeIn();
		$('.myimg li').eq(num).siblings('li').hide();
	
	   }
	   
	var prevfn=function(){
		  num=num-1;
		  if(num<0){num=2;}
		$('.btn li').eq(num).addClass('mycurrent');
		$('.btn li').eq(num).siblings('li').removeClass('mycurrent') ;
		$('.myimg li').eq(num).fadeIn();
		$('.myimg li').eq(num).siblings('li').hide();
		
		}
	timer=setInterval(nextfn,5000);

    $('.btn li').click(function(e) {
		  var i=$(this).index();
		  $(this).addClass('mycurrent');
		  $(this).siblings('li').removeClass('mycurrent');
		  $('.myimg li').eq(i).fadeIn(); 
		  $('.myimg li').eq(i).siblings('li').hide();
		  num=i;
  	});
    $('.banner').hover(function() {
				clearInterval(timer);
			}, function() {
				clearInterval(timer);
				timer=setInterval(nextfn, 5000); 
		});
	//轮番

	$('.news_nav li').hover(function(){
		$(this).children('a').children('p').css('display','block');
		
	},function(){
		$(this).children('a').children('p').css('display','none');
		
	});
	
	$('.show_top li').hover(function(){
		$(this).children('a').children('span').css({'background':'#fff','color':'#26895c','border':'1px solid #26895c'});
	},function(){
		$(this).children('a').children('span').css({'background':'#26895c','color':'#fff',});
	});
	$('.text_right').hover(function(){
	 //alert(123);
	 $(this).children('h1').css('border-bottom','1px solid #333333');
	 $(this).children('h1').children('a').css({'color':'#007440'});
	  $(this).children('p').children('a').children('b').css({'color':'#333333'});
	 $(this).children('p').children('a').css({'color':'#007440'});
	 $(this).children('h1').children('span').css({'background':'#333333'});
	},function(){
		$(this).children('h1').css('border-bottom','1px solid #007440');
		$(this).children('h1').children('a').css({'color':'black'});
		 $(this).children('p').children('a').children('b').css({'color':'#007440'});
		$(this).children('p').children('a').css({'color':'black'});
		$(this).children('h1').children('span').css({'background':'#007440'});
	});
})

