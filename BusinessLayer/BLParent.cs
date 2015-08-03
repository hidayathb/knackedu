using CommonObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class BLParent
    {
        public DataTable LoadParentTimeTable(int studentId)
        {
            DAParent pDAL = new DAParent();
             try
             {
                 return pDAL.LoadParentTimeTable(studentId);
             }
             catch
             {
                 throw;
             }
        }

        public DataTable LoadAnnouncements()
        {
            DAParent pDAL = new DAParent();
            try
            {
                return pDAL.LoadAnnouncements();
            }
            catch
            {
                throw;
            }
        }

        public List<BOAllMarks> LoadReportCards(int userid, string hostCode)
        {
            DAParent pDAL = new DAParent();
            try
            {
                var dtCards = pDAL.LoadReportCards(userid, hostCode);
                var users = new List<BOAllMarks>();

                BOAllMarks std = null;
                foreach (DataRow item in dtCards.Rows)
                {
                    std = new BOAllMarks();
                    std.AdmissionId = item["StudentAdminId"].ToString();
                    std.ClassName = item["StudentClass"].ToString();
                    std.SectionName = item["StudentSection"].ToString();
                    std.ExamType = item["ExamType"].ToString();
                    std.FirstName = item["StudentName"].ToString();
                    std.Telugu = item["Telugu"].ToString();
                    std.Hindi = item["Hindi"].ToString();
                    std.English = item["English"].ToString();
                    std.Mathematics = item["Mathmatics"].ToString();
                    std.Science = item["Science"].ToString();
                    std.Social = item["Social"].ToString();

                    users.Add(std);
                }

                return users;
            }
            catch
            {
                throw;
            }
        }
    }
}
