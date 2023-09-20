using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminUserForm2
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionCon"].ConnectionString);
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUpClick(object sender, EventArgs e)
        {
            Response.Redirect("UserForm1.aspx");
        }
        protected void lgnClick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("select * from AdminUserForm2_tb where Name ='" + nmTbx2.Text + "'and Password ='" + emlTbx2.Text + "'", con);
            SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
            sqlDa.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string UType = ds.Tables[0].Rows[0]["UserType"].ToString();
                if (UType == "Admin")
                {
                    Response.Cookies["ID"].Value = ds.Tables[0].Rows[0]["ID"].ToString();
                    string ID2 = ds.Tables[0].Rows[0]["ID"].ToString();
                    Response.Cookies["Nam"].Value = ds.Tables[0].Rows[0]["Name"].ToString();
                    Response.Cookies["Uty"].Value = ds.Tables[0].Rows[0]["UserType"].ToString();



                    DateTime logIntime2 = DateTime.Now;

                    int isDelet = 0;



                    string query = "INSERT INTO logDetails (LoginName,LID,isDelete,logInTime) VALUES (@LoginName, @LID, @isDelete,@logInTime)";

                    using (SqlCommand cmd2 = new SqlCommand(query, con))
                    {

                        cmd2.Parameters.AddWithValue("@LoginName", nmTbx2.Text);
                        cmd2.Parameters.AddWithValue("@LID", ID2.ToUpperInvariant());
                        cmd2.Parameters.AddWithValue("@isDelete", isDelet);
                        cmd2.Parameters.AddWithValue("@logInTime", logIntime2);


                        cmd2.ExecuteNonQuery();

                    }

                    Response.Redirect("Admin.aspx");
                }



                else if (UType == "User")
                {
                    Response.Cookies["ID"].Value = ds.Tables[0].Rows[0]["ID"].ToString();
                    string ID2 = ds.Tables[0].Rows[0]["ID"].ToString();
                    Response.Cookies["Nam"].Value = ds.Tables[0].Rows[0]["Name"].ToString();
                    Response.Cookies["Uty"].Value = ds.Tables[0].Rows[0]["UserType"].ToString();


                    DateTime logIntime2 = DateTime.Now;

                    int isDelet = 0;



                    string query = "INSERT INTO logDetails (LoginName,LID,isDelete,logInTime) VALUES (@LoginName, @LID, @isDelete,@logInTime)";

                    using (SqlCommand cmd2 = new SqlCommand(query, con))
                    {

                        cmd2.Parameters.AddWithValue("@LoginName", nmTbx2.Text);
                        cmd2.Parameters.AddWithValue("@LID", ID2.ToUpperInvariant());
                        cmd2.Parameters.AddWithValue("@isDelete", isDelet);
                        cmd2.Parameters.AddWithValue("@logInTime", logIntime2);


                        cmd2.ExecuteNonQuery();
                        Response.Redirect("user.aspx");
                    }
                            
                }
            }
            else
            {
                lblReg.Text = "Enter valid name And Password";
            }

        }
    }
}