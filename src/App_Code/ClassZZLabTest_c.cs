using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



/// <summary>
///ClassZZLabTest_c 的摘要说明
/// </summary>
/// InitRtv 1:合格
///         0:不合格
///         -1:输入不合法
public class ClassZZLabTest_c : ClassTestBase
{
    private int InitRtv;
    private string Res1, Res2, Res3, Res4, Res5, Res6, Res7, Res8, Res9, ResA;
    private string Result1, Result2, Result3, Result4, Result5, Result6, Result7, Result8;
    private string ResTotal;
    
	public ClassZZLabTest_c(string strv1,string strv2,string strv3,
        string strv4,string strv5,string strv6,
        string strv7,string strv8,string strc1,
        string strc2)
	{
        double dParam1, dParam2, dParam3, dParam4, dParam5, dParam6, dParam7, dParam8;
        dParam1 = 2800; dParam2 = 0.8; dParam3 = 0.3; dParam4 = 1.5;
        dParam5 = 5.2; dParam6 = 60; dParam7 = 33.3; dParam8 = 50;

        double douv1, douv2, douv3, douv4, douv5, douv6, douv7, douv8;
        if (double.TryParse(strv1, out douv1) && double.TryParse(strv2, out douv2) && double.TryParse(strv3, out douv3) &&
            double.TryParse(strv4, out douv4) && double.TryParse(strv5, out douv5) && double.TryParse(strv6, out douv6) &&
            double.TryParse(strv7, out douv7) && double.TryParse(strv8, out douv8)){
            
            Result1 = string.Format("{0:0.00}rad/min",douv1);
            Result2 = string.Format("{0:0.00}mm/(s*s)",douv2);
            Result3 = string.Format("{0:0.00}mm/s",douv3);
            Result4 = string.Format("{0:0.00}mm/(s*s)",douv4);
            Result5 = string.Format("{0:0.00}mm/s",douv5);
            Result6 = string.Format("{0:0.00}Hz",douv6);
            Result7 = string.Format("{0:0.00}Hz",douv7);
            Result8 = string.Format("{0:0.00}",douv8);

            if (douv1>=dParam1){
                Res1 = "合格";
            }
            else{
                Res1 = "不合格";
            }

            if (douv2<dParam2){
                Res2 = "合格";
            } 
            else{
                Res2 = "不合格";
            }

            if (douv3 < dParam3){
                Res3 = "合格";
            }
            else{
                Res3 = "不合格";
            }

            if (douv4 > dParam4){
                Res4 = "合格";
            }
            else{
                Res4 = "不合格";
            }

            if (douv5 > dParam5){
                Res5 = "合格";
            }
            else{
                Res5 = "不合格";
            }

            if (douv6 > dParam6){
                Res6 = "合格";
            }
            else{
                Res6 = "不合格";
            }

            if (douv7 > dParam7 * 0.95 && douv7 < dParam7 * 1.05){
                Res7 = "合格";
            }
            else{
                Res7 = "不合格";
            }

            if (douv8 >dParam8){
                Res8 = "合格";
            }
            else{
                Res8 = "不合格";
            }

            if (strc1 == "on"){
                Res9 = "合格";
            }
            else{
                Res9 = "不合格";
            }

            if (strc2 == "on"){
                ResA = "合格";
            }
            else{
                ResA = "不合格";
            }

            if (Res1 == "合格" && Res2 == "合格" && Res3 == "合格"
                && Res4 == "合格" && Res5 == "合格" && Res6 == "合格"
                && Res7 == "合格" && Res8 == "合格" && Res9 == "合格"
                && ResA == "合格" ){
                InitRtv = 1;
                ResTotal = "本产品经检验合格";
            }
            else{
                InitRtv = 0;
                ResTotal = "本产品经检验不合格";
            }
        }
        else{
            ResTotal = null;
            InitRtv = -1;
        }
	}

    public string GetSNCode()
    {
        return "DRZZSY" + this.GetBaseSNCode();
    }

    public int GetInitRtv()
    {
        return InitRtv;
    }

    public List<string> GetTestResult()
    {
        List<string> ListTestResRtv = new List<string>();
        ListTestResRtv.Add(Result1);
        ListTestResRtv.Add(Result2);
        ListTestResRtv.Add(Result3);
        ListTestResRtv.Add(Result4);
        ListTestResRtv.Add(Result5);
        ListTestResRtv.Add(Result6);
        ListTestResRtv.Add(Result7);
        ListTestResRtv.Add(Result8);
        return ListTestResRtv;
    }

    public List<string> GetResult()
    {
        List<string> ListResRtv = new List<string>();
        ListResRtv.Add(Res1);
        ListResRtv.Add(Res2);
        ListResRtv.Add(Res3);
        ListResRtv.Add(Res4);
        ListResRtv.Add(Res5);
        ListResRtv.Add(Res6);
        ListResRtv.Add(Res7);
        ListResRtv.Add(Res8);
        ListResRtv.Add(Res9);
        ListResRtv.Add(ResA);
        return ListResRtv;
    }

    public string GetTotalResult()
    {
        return ResTotal;
    }
}