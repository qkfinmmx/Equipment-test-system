// JavaScript Document
	$(document).ready(function () {
        var flag = 0;
        var addDomcount = 0;
        $.ajax({
            type: "post",
            url: "HandMenuNav.ashx",
            datatype: "json",
            success: function (obj) {
                var data = eval(obj);
                addDomcount = data.length;
                for (var i = 0; i < data.length; i++) {
                    $("#NavMenuDIV").append(data[i]);
                }
            }
        });
        $(".Menu").css("display", "none");
        $(".Menu").hover(function () {
            flag = 1;
        }, function () {
            flag = 0;
            $(".Menu").css("display", "none");
        });
        $("#EventJsNav").hover(function () {
            var Nav_left = $("#EventJsNav").offset().left - 4;
            var Nav_top = $("#EventJsNav").offset().top - addDomcount*25;
            $(".Menu").css("display", "block");
            $(".Menu").css("left", Nav_left);
            $(".Menu").css("top", Nav_top);
        }, function () {
            setTimeout(function () {
                if (flag != 1) {
                    $(".Menu").css("display", "none");
                }
            }, 300);
        });
    });