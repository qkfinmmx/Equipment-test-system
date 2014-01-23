// JavaScript Document
$(document).ready(function () {
        var win_width = $(window).width();
        if (win_width <= 982) {
            $(".content").css("left", "20%");
        }
        else {
            $(".content").css("left", ((win_width - 600) / 2).toString() + "px");
        }

        $(window).resize(function () {
            var win_width = $(window).width();
            if (win_width <= 982) {
                $(".content").css("left", "20%");
            }
            else {
                $(".content").css("left", ((win_width - 600) / 2).toString() + "px");
            }
        });
        $("#close").click(function () {
            $("#maskdiv").fadeOut(100);
            $("#contentdiv").fadeOut(100);
        });
        $("#close").hover(function () {
            $("#close").css("background-color", "#E04343");
            $("#close").css("color", "#FFFFFF");
        }, function () {
            $("#close").css("background-color", "#FFFFFF");
            $("#close").css("color", "#888888");
        });
        $.ajax({
            type: "post",
            url: "HandFuncTest.ashx",
            datatype: "json",
            success: function (obj) {
                var data = eval(obj);
                for (var i = 0; i < data.length; i++) {
                    $("#funclist").append(data[i]);
                }
            }
        });
    });