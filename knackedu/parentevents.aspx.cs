using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class parentevents : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Myconstr"].ToString());
        string CurrentMonth1 = "";
        string CurrentMonth = "";
        string currentyear = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CurrentMonth = DateTime.Now.Month.ToString();
                currentyear = DateTime.Now.Year.ToString();
                Session["currentyear"] = currentyear;
                string month = Convert.ToString(DateTime.Now.ToString("MMMM"));
                Session["month"] = month;
                //Session["month"] = Convert.ToString(DateTime.Now.ToString("MMMM"));
                calmethod();
                bindmethod();
            }
        }
        protected void bindmethod()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from parentevents order by id desc", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                gvEvents.DataSource = ds;
                gvEvents.DataBind();
            }
        }
        public void calmethod()
        {
            SqlCommand cmd;
            SqlCommand cmd1;
            string nextmonth = Convert.ToString(Session["CurrentMonth1"]);
            string month = "";
            if (nextmonth != "")
            {

                // cmd = new SqlCommand("select culeventname,Eventdate as Eventdate,cid from culturalcal where  month(Eventdate)='" + nextmonth + "' and typeofoc='Festivals'", con);
                cmd1 = new SqlCommand("select culeventname,Eventdate as Eventdate,cid from culturalcal where  month(Eventdate)='" + nextmonth + "' and typeofoc='Events'", con);
                //
                cmd = new SqlCommand("select * from parentevents where  month(eventdate)='" + nextmonth + "' and eventtype='Festivals' order by Eventdate asc", con);

                cmd1 = new SqlCommand("select * from parentevents where  month(eventdate)='" + nextmonth + "' and eventtype='Events' order by Eventdate asc", con);

            }
            else
            {
                month = Convert.ToString(DateTime.Now.ToString("MMMM"));

                // cmd = new SqlCommand("select culeventname,Eventdate,cid from culturalcal where  month(Eventdate)='" + DateTime.Now.Month.ToString() + "' and typeofoc='Festivals'", con);
                // cmd1 = new SqlCommand("select culeventname,Eventdate,cid from culturalcal where  month(Eventdate)='" + DateTime.Now.Month.ToString() + "' and typeofoc='Events'", con);

                cmd = new SqlCommand("select * from parentevents where  month(eventdate)='" + DateTime.Now.Month.ToString() + "' and eventtype='Festivals' order by Eventdate asc", con);

                cmd1 = new SqlCommand("select * from parentevents where  month(eventdate)='" + DateTime.Now.Month.ToString() + "' and eventtype='Events' order by Eventdate asc", con);

            }

            con.Open();
            // SqlDataReader dr = cmd.ExecuteReader();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);

            DataSet ds3 = new DataSet();
            SqlDataAdapter da3 = new SqlDataAdapter(cmd1);
            da3.Fill(ds3);


            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Calendar1.SelectedDates.Add(Convert.ToDateTime(ds.Tables[0].Rows[i]["eventdate"].ToString()));

                Calendar1.SelectedDayStyle.BackColor = System.Drawing.Color.Red;

            }
            for (int i = 0; i < ds3.Tables[0].Rows.Count; i++)
            {
                Calendar1.SelectedDates.Add(Convert.ToDateTime(ds3.Tables[0].Rows[i]["eventdate"].ToString()));
                Calendar1.SelectedDayStyle.BackColor = System.Drawing.Color.SkyBlue;


            }


            con.Close();



        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }
        protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            string s2 = Calendar1.VisibleDate.ToString();
            string s3 = Calendar1.VisibleDate.ToString("MMMM");
            string[] month = (s2.Split('/'));
            CurrentMonth1 = month[0];

            Session["CurrentMonth1"] = CurrentMonth1;
            Session["month"] = s3;


            calmethod();
        }
        protected void cal_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
        {
            CalendarDay day = (CalendarDay)e.Day;
            SqlCommand cmd = new SqlCommand("select *  from parentevents", con);



            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dtEvents = new DataTable();
            da.Fill(dtEvents);
            foreach (DataRow oItem in dtEvents.Rows)
            {
                if (Convert.ToDateTime(oItem["eventdate"]).ToString("dd-MM-yyyy") == e.Day.Date.ToString("dd-MM-yyyy"))
                {
                    Literal ltrl = new Literal();
                    ltrl.Text = "<BR />";
                    e.Cell.Controls.Add(ltrl);

                    // e.Cell.BorderColor = System.Drawing.Color.Aqua;
                    e.Cell.BackColor = System.Drawing.Color.SkyBlue;
                    e.Cell.BorderStyle = BorderStyle.Solid;
                    e.Cell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#003399");
                    e.Cell.BorderWidth = 1;

                    Label b = new Label();
                    b.Font.Size = 8;
                    b.Font.Bold = true;
                    b.ForeColor = System.Drawing.ColorTranslator.FromHtml("#003399");
                    b.Text = oItem["eventname"].ToString();
                    e.Cell.Controls.Add(b);
                    
                }
                if (e.Day.IsToday)
                    e.Cell.BackColor = System.Drawing.Color.Salmon;

            }
        }
    }
}