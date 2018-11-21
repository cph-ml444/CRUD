using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class UI_DataList : System.Web.UI.Page
{
    string connection = ConfigurationManager.ConnectionStrings["connstring"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetEmpDataList();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connection))
        {
            using (SqlCommand cmd = new SqlCommand("sp_InsertPestData", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@name", SqlDbType.VarChar).Value = txtname.Text.Trim();
                cmd.Parameters.AddWithValue("@price", SqlDbType.VarChar).Value = txtprice.Text.Trim();

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Clear();
                Response.Write("<script type=\"text/javascript\">alert('Record Inserted Successfully');</script>");
                GetEmpDataList();
            }
        }
    }
    void Clear()
    {
        txtname.Text = String.Empty;
        txtprice.Text = String.Empty;
    }
    private void GetEmpDataList()
    {
        using (SqlConnection con = new SqlConnection(connection))
        {
            SqlDataAdapter sd = new SqlDataAdapter("sp_FillData", con);
            sd.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();

            sd.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataList.DataSource = dt;
                DataList.DataBind();
            }
        }
    }
    protected void DataListEmp_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int pestID = Convert.ToInt32(DataList.DataKeys[e.Item.ItemIndex].ToString());

        using (SqlConnection con = new SqlConnection(connection))
        {
            using (SqlCommand cmd = new SqlCommand("sp_DeleteEmployeeData", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pestID", pestID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script type=\"text/javascript\">alert('Record Deleted Successfully');</script>");
                GetEmpDataList();
            }
        }
    }
    protected void DataListEmp_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList.EditItemIndex = e.Item.ItemIndex;
        GetEmpDataList();
    }
    protected void DataListEmp_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DataListEmp.EditItemIndex = -1;
        GetEmpDataList();
    }
    protected void DataList_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        int EmpID = Convert.ToInt32(DataListEmp.DataKeys[e.Item.ItemIndex].ToString());

        TextBox txtname = (TextBox)e.Item.FindControl("txtname");
        TextBox txtprice = (TextBox)e.Item.FindControl("txtprice");

        using (SqlConnection con = new SqlConnection(connection))
        {
            using (SqlCommand cmd = new SqlCommand("sp_UpdateEmployeeData", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@pestID", pestID);
                cmd.Parameters.AddWithValue("@name", SqlDbType.VarChar).Value = txtname.Text.Trim();
                cmd.Parameters.AddWithValue("@orice", SqlDbType.VarChar).Value = txtprice.Text.Trim();
           

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Clear();
                Response.Write("<script type=\"text/javascript\">alert('Record Update Successfully');</script>");
                DataList.EditItemIndex = -1;
                GetEmpDataList();
            }
        }
    }
}