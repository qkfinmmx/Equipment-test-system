using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///ClassTestBase 的摘要说明
/// </summary>
public class ClassTestBase
{
    private string BaseSNCode;
    private string CheckTime;

	public ClassTestBase()
	{
        DateTime dt = DateTime.Now;
        CheckTime = dt.ToString("yyyy年MM月dd日");
        BaseSNCode = dt.ToString("MMyyddmmHHssff");
	}

    protected string GetBaseSNCode()
    {
        return BaseSNCode;
    }

    public string GetCheckTime()
    {
        return CheckTime;
    }
}