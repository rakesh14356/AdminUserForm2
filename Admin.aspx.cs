using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminUserForm2
{
    public partial class Admin : System.Web.UI.Page
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionCon"].ConnectionString);
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            Gridviewshow();

        }
        protected void Gridviewshow()
        {
            


            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            if (Request.Cookies["ID"] != null)
            {
                var id = Request.Cookies["ID"].Value;

                DataSet ds = new DataSet();
                //use dataset when you want apply any condition also by using dataset we can take perticular row operation
                string sqlStatement;
                sqlStatement = "select * from AdminUserForm2_tb";
                SqlCommand sqlCmd = new SqlCommand(sqlStatement, con);
                SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
                sqlDa.Fill(ds);

                var pass = Request.Cookies["Nam"].Value;
                lblId.Text = " Hi " + pass;


                if (ds.Tables.Count > 0)
                {

                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                }
                else
                {
                    lbtGrid.Text = "Invalid Data";
                }
            }
        }

        protected void BackClick(object sender ,EventArgs e)
        {
           
            Conn.Open();
            




            DataSet ds = new DataSet();
            //use dataset when you want apply any condition also by using dataset we can take perticular row operation
            string sqlStatement;
            sqlStatement = "select * from logDetails order by SID desc";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, Conn);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(ds);


            var Sid = ds.Tables[0].Rows[0]["SID"].ToString();

            if (ds.Tables.Count > 0)
            {
                DateTime logout = DateTime.Now;
                string formattedLogout = logout.ToString("yyyy-MM-dd HH:mm:ss");

                string query = "update logDetails set logOutTime='" + formattedLogout + "' where SID='" + Sid + "'";
                SqlCommand cmd2 = new SqlCommand(query, Conn);
                cmd2.ExecuteNonQuery();
            }
            Response.Redirect("SignUp.aspx");



        }
        protected void DeleteClick(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32((GridView2.Rows[rowIndex].Cells[7].Text));
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from AdminUserForm2_tb where ID='" + id + "'", conn);

            DateTime dtd = DateTime.Now;
            cmd.ExecuteNonQuery();


          

            string AID = Request.Cookies["ID"].Value;
            string Nam2 = Request.Cookies["Nam"].Value;
            string Utype = Request.Cookies["Uty"].Value;


            int Dtime = 0;
            

            string query = "INSERT INTO LogDetails2 (ID,Modify_By,Modifier,DeletedTimes,DeletedTime,Did) VALUES (@ID, @Modify_By, @Modifier,@DeletedTimes,@DeletedTime,@Did)";

            using (SqlCommand cmd2 = new SqlCommand(query, conn))
            {

                cmd2.Parameters.AddWithValue("@ID", AID);
                cmd2.Parameters.AddWithValue("@Modify_By", Nam2);
                cmd2.Parameters.AddWithValue("@Modifier", Utype);
                cmd2.Parameters.AddWithValue("@DeletedTimes", Dtime);
                cmd2.Parameters.AddWithValue("@DeletedTime", dtd);
                cmd2.Parameters.AddWithValue("@Did", id);
               


                cmd2.ExecuteNonQuery();
              
            }




            conn.Close();
            Gridviewshow();
        }
        protected void EditClick(object sender, EventArgs e)
        {
            divId2.Visible = false;
            div1id.Visible = true;


            Conn.Open();

            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int id = Convert.ToInt32((GridView2.Rows[rowIndex].Cells[7].Text));


            DataSet ds = new DataSet();

            string sqlStatement;
            sqlStatement = "select * from AdminUserForm2_tb where ID='" + id + "'";

            SqlCommand sqlCmd = new SqlCommand(sqlStatement, Conn);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                TextBox1.TextMode = TextBoxMode.SingleLine;//from thise line Now password is visible and we manipulate them
                                                           //Value from database to TextBoxs are passing
                nmTbx.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                TextBox5.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                TextBox1.Text = ds.Tables[0].Rows[0]["Password"].ToString();
                emlTbx.Text = ds.Tables[0].Rows[0]["Email"].ToString();

                TextBox4.Text = ds.Tables[0].Rows[0]["AadharNo"].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0]["PAN"].ToString();
                //passing id from thise method to front end update label id

                Idlbl.Text= ds.Tables[0].Rows[0]["ID"].ToString();


                //changing the name of submit button to update now
                Conn.Close();
            }


        }

        protected void UpdateClick(object sender,EventArgs e)
        {
            Conn.Open();
            //take selected row from front end pass from edit method
           
           
            //take Utype from database
           






            //it is for update database
            string querystat = "update AdminUserForm2_tb set Name='" + nmTbx.Text + "', Address='" + TextBox5.Text + "', ContactNo='" + TextBox2.Text + "',Password='" + TextBox1.Text + "',Email='" + emlTbx.Text + "',AadharNo='" + TextBox4.Text + "',PAN='" + TextBox3.Text + "'where ID='" + Idlbl.Text + "'";
            SqlCommand cmd = new SqlCommand(querystat, Conn);
            cmd.ExecuteNonQuery();











            var id2 = Idlbl.Text;
            //from here new data will putted when data updated with time and from whom and when updated
            DateTime dtd = DateTime.Now;
            string Utype = Request.Cookies["Uty"].Value;
            string AID = Request.Cookies["ID"].Value;
            string Nam2 = Request.Cookies["Nam"].Value;
           
            int ch = 1;
      
            DateTime dtD = DateTime.Now;
            string query = "INSERT INTO LogDetails2 (ID,Modify_By,Modifier,Eid,Changed,DateTimeE) VALUES (@ID, @Modify_By, @Modifier,@Eid,@Changed,@DateTimeE)";
            using (SqlCommand cmd2 = new SqlCommand(query, Conn))
            {

                cmd2.Parameters.AddWithValue("@ID", AID);
                cmd2.Parameters.AddWithValue("@Modify_By", Nam2);
                cmd2.Parameters.AddWithValue("@Modifier", Utype);
                cmd2.Parameters.AddWithValue("@Eid", id2);
                cmd2.Parameters.AddWithValue("@Changed", ch);
                cmd2.Parameters.AddWithValue("@DateTimeE", dtD);
                cmd2.ExecuteNonQuery();
            }
            Conn.Close();
            divId2.Visible = true;
            div1id.Visible = false;
            Gridviewshow();
        }
        protected void DwnlExl2(object sender, EventArgs e)
        {
            string Name = Response.Cookies["Nam"].Value;


            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", "attachment; filename=UserInfo.xls");
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            //here you will encounter a exception plase add one line  enableEventValidation ="false" in aspx page of same
            GridView2.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.End();

            lblId.Text = " Hi " + Name;
        }
        //below method is mandatory if not put then error will shown like gridview not putted inside form tag
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }


    }
}