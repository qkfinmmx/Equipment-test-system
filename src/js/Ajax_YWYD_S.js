// JavaScript Document
$(document).ready(function () {
    var g_data;
    $("#buildbtn").click(function () {
        if ($("#tabsConstantdiv").css("display") == "none") {
            $.ajax({
                type: "post",
                url: "HandAjax_YWYD_S.ashx",
                data: { c1: $('input[name="check1"]:checked').val(),
                    c2: $('input[name="check2"]:checked').val(),
                    c3: $('input[name="check3"]:checked').val(),
                    c4: $('input[name="check4"]:checked').val(),
                    c5: $('input[name="check5"]:checked').val()
                },
                datatype: "json",
                success: function (obj) {
                    var data = eval(obj);
                    g_data = data;
                    $("#errorMsgdiv").hide();
                    var divrunathtml = $("#ContentPlaceHolderReport_divrunat").html();
                    divrunathtml = divrunathtml.replace("$SNLabel$", data[0].toString());
                    divrunathtml = divrunathtml.replace("$检验时间$", "检测时间:" + data[1].toString());
                    divrunathtml = divrunathtml.replace("$总体结论$", data[7].toString());
                    divrunathtml = divrunathtml.replace("$检验员$", $("#username").html());
                    for (var i = 0; i < 5; i++) {
                        divrunathtml = divrunathtml.replace("$" + (i + 1).toString() + "结论$", data[2 + i].toString());
                    }
                    $("#ContentPlaceHolderReport_divrunat").html(divrunathtml);
                    $("#tabsConstantdiv").show();
                    $("#ContentPlaceHolderReport_divrunat").fadeIn(500);
                }
            });
        }
        return false;
    });
    $("#ButtonFinish").click(function () {
        return true;
    });
    $("#ButtonPrint").click(function () {
        g_data.push($("#username").text());
        g_data.push("YWYD-S-LAB-TEMPLATE.html");
        $.ajax({
            type: "post",
            url: "HandPrintCommon.ashx",
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