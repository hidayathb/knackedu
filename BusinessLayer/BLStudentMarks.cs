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
    public class BLStudentMarks
    {
        public List<BOStudentMarks> LoadStudentMarks(int userid, string hostCode)
        {
            DAStudentMarks pDAL = new DAStudentMarks();
            try
            {
                var dtMarks = pDAL.LoadStudentMarks(userid, hostCode);
                var marks = new List<BOStudentMarks>();
                
                BOStudentMarks mark = null;
                foreach (DataRow item in dtMarks.Rows)
                {
                    mark = new BOStudentMarks();

                    int studentId;
                    int.TryParse(item["StudentId"].ToString(), out studentId);
                    mark.StudentId = studentId;

                    int examTypeId;
                    int.TryParse(item["ExamTypeId"].ToString(), out examTypeId);
                    mark.ExamTypeId = examTypeId;

                    int absent;
                    int.TryParse(item["Absent"].ToString(), out absent);
                    mark.Absent = absent;

                    int subjects;
                    int.TryParse(item["Subjects"].ToString(), out subjects);
                    mark.Subjects = subjects;

                    marks.Add(mark);
                }

                return marks;
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

        public int InsertStudentMarks(BOStudentMarks marks)
        {
            DAStudentMarks pDAL = new DAStudentMarks();
            try
            {
                return pDAL.InsertStudentMarks(marks);
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

        public int DeleteStudentMarks(int id)
        {
            DAStudentMarks pDAL = new DAStudentMarks();
            try
            {
                return pDAL.DeleteStudentMarks(id);
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
