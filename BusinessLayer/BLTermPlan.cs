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
    public class BLTermPlan
    {
        public List<BOTermPlan> LoadTermPlans(int userid, string hostCode)
        {
            DATermPlan pDAL = new DATermPlan();
            try
            {
                var dtCategories = pDAL.LoadTermPlans(userid, hostCode);
                var grades = new List<BOTermPlan>();
                BOTermPlan grade = null;
                foreach (DataRow item in dtCategories.Rows)
                {
                    grade = new BOTermPlan();

                    int plan;
                    int.TryParse(item["Plan"].ToString(), out plan);
                    grade.Plan = plan;

                    int from;
                    int.TryParse(item["From"].ToString(), out from);
                    grade.From = from;

                    int To;
                    int.TryParse(item["To"].ToString(), out To);
                    grade.To = To;                                       

                    int pclass;
                    int.TryParse(item["Class"].ToString(), out pclass);
                    grade.Class = pclass;

                    int month;
                    int.TryParse(item["Month"].ToString(), out month);
                    grade.Month = month;

                    int subject;
                    int.TryParse(item["Subject"].ToString(), out subject);
                    grade.Subject = subject;

                    grade.Syllabus = item["Syllabus"].ToString();
                    grade.Id = Convert.ToInt32(item["Id"]);

                    grades.Add(grade);
                }

                return grades;
            }
            catch
            {
                throw;
            }
            finally
            {
                pDAL = null;
            }
        }

        public int InsertTermPlan(BOTermPlan plans)
        {
            DATermPlan pDAL = new DATermPlan();
            try
            {
                return pDAL.InsertTermPlan(plans);
            }
            catch
            {
                throw;
            }
            finally
            {
                pDAL = null;
            }
        }

        public int DeleteTermPlans(int id)
        {
            DATermPlan pDAL = new DATermPlan();
            try
            {
                return pDAL.DeleteTermPlan(id);
            }
            catch
            {
                throw;
            }
            finally
            {
                pDAL = null;
            }
        }
    }
}
