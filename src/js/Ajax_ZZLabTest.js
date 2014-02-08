// JavaScript Document
$(document).ready(function () {
    var g_data;
    var g_flag = 0;
    $("#buildbtn").click(function () {
        if ($("#tabsConstantdiv").css("display") == "none") {
            $.ajax({
                type: "post",
                url: "HandAjax_ZZLabTest_m.ashx",
                data: { v1: $("#value1").val(),
                    v2: $("#value2").val(),
                    v3: $("#value3").val(),
                    v4: $("#value4").val(),
                    v5: $("#value5").val(),
                    v6: $("#value6").val(),
                    v7: $("#value7").val(),
                    v8: $("#value8").val(),
                    c1: $('input[name="check1"]:checked').val(),
                    c2: $('input[name="check2"]:checked').val()
                },
                datatype: "json",
                success: function (obj) {
                    var data = eval(obj);
                    if (data[0].toString() == "InputScuess") {  //scuess
                        g_data = data;
                        $("#errorMsgdiv").hide();
                        var divrunathtml = $("#ContentPlaceHolderReport_divrunat").html();
                        divrunathtml = divrunathtml.replace("$SNLabel$", data[1].toString());
                        divrunathtml = divrunathtml.replace("$检验时间$", "检测时间:" + data[2].toString());
                        divrunathtml = divrunathtml.replace("$总体结论$", data[21].toString());
                        divrunathtml = divrunathtml.replace("$检验员$", $("#username").html());
                        for (var i = 0; i < 8; i++) {
                            divrunathtml = divrunathtml.replace("$" + (i + 1).toString() + "测试结果$", data[3 + i].toString());
                        }
                        for (var i = 0; i < 10; i++) {
                            divrunathtml = divrunathtml.replace("$" + (i + 1).toString() + "结论$", data[11 + i].toString());
                        }
                        $("#ContentPlaceHolderReport_divrunat").html(divrunathtml);
                        $("#tabsConstantdiv").show();
                        $("#ContentPlaceHolderReport_divrunat").fadeIn(500, function () {
                            $("html, body").animate({ scrollTop: $(document).height() }, 'slow');
                        });
                    }
                    else {  //error
                        $("#errorMsgdiv").show();
                    }
                }
            });
        }
        return false;
    });
    $("#ButtonFinish").click(function () {
        return true;
    });
    $("#ButtonPrint").click(function () {
        if (g_flag == 0) {
            g_data.push($("#username").text());
            g_flag = 1;
        }
        $.ajax({
            type: "post",
            url: "HandAjax_Print.ashx",
            data: {
                GAjaxData: JSON.stringify(g_data)
            },
            datatype: "json",
            success: function (obj) {
                var data = eval(obj);
                if (data[0].toString() == "Success") {
                    var winPrint = window.open(data[1].toString(), "_blank", "", "");
                    winPrint.document.location.reload();
                    winPrint.print();
                }
            }
        });
        return false;
    });
});