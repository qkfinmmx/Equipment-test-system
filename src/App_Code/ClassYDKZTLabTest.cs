using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///ClassYDKZTLabTest 的摘要说明
/// </summary>
public class ClassYDKZTLabTest : ClassTestBase
{
    private int InitRtv;
    List<string> testdata = new List<string>();
    List<string> testresult = new List<string>();

	public ClassYDKZTLabTest(string val1 , List<string> checklist){
        double dval1;
        double pval1 = 1200;
        if (double.TryParse(val1, out dval1)){
            InitRtv = 1;
            testdata.Add(string.Format("{0:0.00}rad/min",dval1));
            if (dval1 >= pval1)
                testresult.Add("合格");
            else
                testresult.Add("不合格");
            for (int i = 0; i < checklist.Count;i++ ){
                if (checklist[i] == "on"){
                    testresult.Add("合格");
                }
                else {
                    testresult.Add("不合格");
                }
            }
        }
        else
            InitRtv = -1;
	}

    public int rtvInitVal() { return InitRtv; }

    public List<string> rtTestData() { return testdata; }

    public List<string> rtResultData() { return testresult; }

    public string rtTotalResult(){
        foreach (string s in testresult){
            if (s == "不合格")
                return "本产品经检验不合格";
        }
        return "本产品经检验合格";
    }

    public string GetSNCode() { return "DRYDCT" + this.GetBaseSNCode(); }
}