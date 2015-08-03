using System;
using System.Collections.Generic;
using System.Data;
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
    }
}
