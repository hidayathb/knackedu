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
    public class BLGradeSystem
    {
        public List<BOGradeSytem> LoadGradeSystems(int userid, string hostCode)
        {
            DAGradeSystem pDAL = new DAGradeSystem();
            try
            {
                var dtCategories = pDAL.LoadGradeSystem(userid, hostCode);
                var grades = new List<BOGradeSytem>();
                BOGradeSytem grade = null;
                foreach (DataRow item in dtCategories.Rows)
                {
                    grade = new BOGradeSytem();

                    int firstMark;
                    int.TryParse(item["FirstMarks"].ToString(), out firstMark);
                    grade.FirstMarks = firstMark;

                    int secondMark;
                    int.TryParse(item["SecondMarks"].ToString(), out secondMark);
                    grade.SecondMarks = secondMark;

                    int examType;
                    int.TryParse(item["ExamTypeId"].ToString(), out examType);
                    grade.ExamTypeId = examType;
                    
                    int gradeid;
                    int.TryParse(item["GradeId"].ToString(), out gradeid);
                    grade.GradeId = gradeid;

                    grade.ExamType = item["ExamType"].ToString();
                    grade.Grade = item["Grade"].ToString();
                    grade.Marks = item["Marks"].ToString();
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

        public int InsertGradeSystem(BOGradeSytem grades)
        {
            DAGradeSystem pDAL = new DAGradeSystem();
            try
            {
                return pDAL.InsertGradeSystem(grades);
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

        public int DeleteCategories(int id)
        {
            DAGradeSystem pDAL = new DAGradeSystem();
            try
            {
                return pDAL.DeleteGradeSystem(id);
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
