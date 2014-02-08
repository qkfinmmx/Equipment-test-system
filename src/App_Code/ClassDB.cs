using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
///ClassDB 的摘要说明
/// </summary>
public class ClassDB
{
    SqlConnection gsql_connect;
    string gl_Columns = "";

	public ClassDB(){
        string t_sqlconnectstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        try{
            gsql_connect = new SqlConnection(t_sqlconnectstr);
            gsql_connect.Open();
        }
        catch (System.Exception ex){
            throw ex;
        }
	}

    public bool SetTestData(string SNCode, List<string> ColumnName, List<string> Value) {
        foreach (string s in ColumnName){
            gl_Columns += s + ",";
        }
        gl_Columns = gl_Columns.Substring(0, gl_Columns.Length - 1);

        string ItemNO = ExtractionItemNO(SNCode);
        List<string> DBUserFormList = new List<string>();
        DataTable DBFormDT = new DataTable();
        DBFormDT = GetAllUserForm();
        if (DBFormDT.Rows.Count <= 0)
            return false;
        for (int i = 1; i < DBFormDT.Rows.Count;i++ ){
            if (ItemNO == DBFormDT.Rows[i][0].ToString()){
                //Insert Data Into Form
                InsertDataIntoForm(ItemNO, Value);
                return true;
            }
        }
        //Create New Form
        CreateInsertTestDataForm(ItemNO, ColumnName,Value);
        return true;
    }

    protected void CreateInsertTestDataForm(string ItemNO, List<string> ColumnName, List<string> Value){
        string sqlCommandTemplate = "CREATE TABLE $FormName$ ( Id_PK int IDENTITY , $AddColumn$);";
        sqlCommandTemplate = sqlCommandTemplate.Replace("$FormName$", ItemNO);
        string AddColumns = "";
        foreach (string s in ColumnName){
            AddColumns += s + " varchar(50) ,";
        }
        AddColumns = AddColumns.Substring(0, AddColumns.Length - 1);
        sqlCommandTemplate = sqlCommandTemplate.Replace("$AddColumn$", AddColumns);

        string sqlCommandTemplate_1 = "INSERT INTO $ItemNO$ ($Columns$) VALUES ( $ValueList$ );";
        sqlCommandTemplate_1 = sqlCommandTemplate_1.Replace("$ItemNO$", ItemNO);
        sqlCommandTemplate_1 = sqlCommandTemplate_1.Replace("$Columns$", gl_Columns);
        string valueliststr = "";
        foreach (string s in Value)
            valueliststr += "'" + s + "'" + ",";
        valueliststr = valueliststr.Substring(0, valueliststr.Length - 1);
        sqlCommandTemplate_1 = sqlCommandTemplate_1.Replace("$ValueList$", valueliststr);

        string sqlCommandTemplate_2 = "delete from $ItemNO$ where SN序列号 in (select SN序列号 from $ItemNO$ group by SN序列号 having count(SN序列号) > 1) and Id_PK not in (select min(Id_PK) from $ItemNO$ group by SN序列号 having count(SN序列号)>1);";
        sqlCommandTemplate_2 = sqlCommandTemplate_2.Replace("$ItemNO$", ItemNO);

        SqlCommand command = new SqlCommand(sqlCommandTemplate + sqlCommandTemplate_1 + sqlCommandTemplate_2, gsql_connect);
        command.ExecuteReader();
    }

    protected void InsertDataIntoForm(string ItemNO, List<string> Value) {
        string sqlCommandTemplate = "INSERT INTO $ItemNO$ ($Columns$) VALUES ( $ValueList$ );";
        sqlCommandTemplate = sqlCommandTemplate.Replace("$ItemNO$", ItemNO);
        sqlCommandTemplate = sqlCommandTemplate.Replace("$Columns$", gl_Columns);
        string valueliststr = "";
        foreach (string s in Value) {
            valueliststr += "'" + s + "'" + ",";
        }
        valueliststr = valueliststr.Substring(0, valueliststr.Length - 1);
        sqlCommandTemplate = sqlCommandTemplate.Replace("$ValueList$",valueliststr);

        //查找删除重复SN
        string sqlCommandTemplate_Add = "delete from $ItemNO$ where SN序列号 in (select SN序列号 from $ItemNO$ group by SN序列号 having count(SN序列号) > 1) and Id_PK not in (select min(Id_PK) from $ItemNO$ group by SN序列号 having count(SN序列号)>1);";
        sqlCommandTemplate_Add = sqlCommandTemplate_Add.Replace("$ItemNO$", ItemNO);

        SqlCommand command = new SqlCommand(sqlCommandTemplate + sqlCommandTemplate_Add, gsql_connect);
        command.ExecuteReader();
    }

    protected string ExtractionItemNO(string SNCode){
        string rtStr="";
        char[] chArray = SNCode.ToCharArray();
        foreach (char ch in chArray){
            if (ch >='A' && ch <= 'Z'){
                rtStr += ch;
            }
        }
        return rtStr;
    }

    protected DataTable GetAllUserForm() {
        DataTable dt = new DataTable();
        SqlDataAdapter adapter = new SqlDataAdapter("SELECT name FROM sys.sysobjects WHERE (xtype = 'u')", gsql_connect);
        adapter.Fill(dt);
        return dt;
    }
}