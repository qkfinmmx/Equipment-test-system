// JavaScript Document
var flag = 0;
$(function(){
	$(".Menu").css("display","none");
	$(".Menu").hover(function(){
		flag = 1;
		},function(){
			flag = 0;
		 	$(".Menu").css("display","none");
	});
	$("#EventJsNav").hover(function () {  
				var Nav_left = $("#EventJsNav").offset().left-4;
				var Nav_top = $("#EventJsNav").offset().top-99;
				$(".Menu").css("display","block");
				$(".Menu").css("left",Nav_left);
				$(".Menu").css("top",Nav_top);
             	},function(){
				 	setTimeout(function(){
					if(flag != 1){
						$(".Menu").css("display","none");
						}
					 },300);
			});
	}); 