using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DAParent
    {
        commonDA cmnDA = new commonDA();

        public DataTable LoadParentTimeTable(int studentId)
        {
            return cmnDA.ExecuteSQL("select * from Mtimetable").Tables[0];
        }

        public DataTable LoadAnnouncements()
        {
            return cmnDA.ExecuteSQL("select convert (varchar(10),eventdate,103)as edate,title,announcedescrip from pa_announcement").Tables[0];
        }

        public DataTable LoadReportCards(int userid, string hostCode)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@HostCode", hostCode);
            sqlParams[1] = new SqlParameter("@UserId", userid);

            return cmnDA.ExecuteSQLDataTable("pr_StudentMarks_GetAll", sqlParams);
        }
    }

}
