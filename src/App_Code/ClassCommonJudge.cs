using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///ClassCommonJudge 的摘要说明
/// </summary>
public class ClassCommonJudge :ClassTestBase
{
    List<string> rtv_list_result;
    
    public ClassCommonJudge(List<string> list_result){
        rtv_list_result = new List<string>();
        for (int i = 0; i < list_result.Count; i++){
            if (list_result[i] == "on"){
                rtv_list_result.Add("合格");
            }
            else{
                rtv_list_result.Add("不合格");
            }
        }
	}

    public List<string> GetItemResult() {
        return rtv_list_result;
    }

    public string GetTotalResult() {
        for (int i = 0; i < rtv_list_result.Count;i++ ){
            if (rtv_list_result[i] == "不合格"){
                return "本产品经检验不合格";
            }
        }
        return "本产品经检验合格";
    }

    public string GetSNCode() {
        return "DRZZSYT" + this.GetBaseSNCode();
    }
}