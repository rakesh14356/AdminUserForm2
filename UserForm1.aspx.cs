using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminUserForm2
{
    public partial class UserForm1 : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionCon"].ConnectionString);
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignClick(object sender, EventArgs e)
        {


            Response.Redirect("SignUp.aspx");



        }
        protected void RegClick(object sender, EventArgs e)
        {

            {

                if(TextBox1.Text != TextBox6.Text)
                {
                    lblPass.Text = "Your Password is not match";
                }
                else if (Page.IsValid && TextBox1.Text == TextBox6.Text)
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    con.Open();
                    // SqlCommand cmd = new SqlCommand("insert into AdminUserForm2_tb values @Name='"+ nmTbx.Text + "',@Email='"+ emlTbx.Text + "',@Password='"+ TextBox1.Text + "',@ContactNo='"+ TextBox2.Text + "',@PAN='"+TextBox3.Text+"',@AadharNo='"+ TextBox4.Text + "',@Address='"+ TextBox5 + "'",con);
                    // cmd.ExecuteNonQuery();

                    string query = "INSERT INTO AdminUserForm2_tb (Name, Email, Password, ContactNo, PAN, AadharNo, Address,UserType) VALUES (@Name, @Email, @Password, @ContactNo, @PAN, @AadharNo, @Address,@UserType)";

                    

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", nmTbx.Text);
                        cmd.Parameters.AddWithValue("@Email", emlTbx.Text);
                        cmd.Parameters.AddWithValue("@Password", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@ContactNo", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@PAN", TextBox3.Text);
                        cmd.Parameters.AddWithValue("@AadharNo", TextBox4.Text);
                        cmd.Parameters.AddWithValue("@Address", TextBox5.Text);
                        cmd.Parameters.AddWithValue("@UserType", DropDownList1.SelectedValue);

                        cmd.ExecuteNonQuery();
                        Response.Redirect("SignUp.aspx");
                    }
                }
                else
                {
                    
                    lblReg.Text = " Validation Error";
                }





            }







        }
    }
}