using CommonObject;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DAStudentMarks
    {
        commonDA cmnDA = new commonDA();

        public DataTable LoadStudentMarks(int userid, string hostCode)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@UserId", userid);
            sqlParams[1] = new SqlParameter("@HostCode", hostCode);

            return cmnDA.ExecuteSQLDataTable("pr_StudentMarks_GetAll", sqlParams);
        }

        public int InsertStudentMarks(BOStudentMarks plans)
        {
            SqlParameter[] sqlParams = new SqlParameter[9];
            sqlParams[0] = new SqlParameter("@StudentId", plans.StudentId);
            sqlParams[1] = new SqlParameter("@ExamTypeId", plans.ExamTypeId);
            sqlParams[2] = new SqlParameter("@Marks", plans.Subjects);
            sqlParams[3] = new SqlParameter("@RecordId", plans.Id);
            sqlParams[4] = new SqlParameter("@HostCode", plans.HostCode);
            sqlParams[5] = new SqlParameter("@CreatedDate", DateTime.Now);
            sqlParams[6] = new SqlParameter("@ModifiedDate", DateTime.Now);
            sqlParams[7] = new SqlParameter("@CreatedBy", plans.UserId);
            sqlParams[8] = new SqlParameter("@ModifiedBy", plans.UserId);

            return cmnDA.ExecuteNonQuery("pr_StudentMarks_AddOrUpdate", sqlParams);
        }

        public int InsertAttendence(BOStudents presents)
        {
            SqlParameter[] sqlParams = new SqlParameter[9];
            sqlParams[0] = new SqlParameter("@Date", presents.PresentDate);
            sqlParams[1] = new SqlParameter("@Attendence", presents.Presents);
            sqlParams[4] = new SqlParameter("@HostCode", presents.HostCode);
            sqlParams[3] = new SqlParameter("@RecordId", presents.Id);
            sqlParams[5] = new SqlParameter("@CreatedDate", DateTime.Now);
            sqlParams[6] = new SqlParameter("@ModifiedDate", DateTime.Now);
            sqlParams[7] = new SqlParameter("@CreatedBy", presents.UserId);
            sqlParams[8] = new SqlParameter("@ModifiedBy", presents.UserId);

            return cmnDA.ExecuteNonQuery("pr_StudentMarks_AddOrUpdate", sqlParams);
        }

        public int DeleteStudentMarks(int id)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@RecordId", id);

            return cmnDA.ExecuteNonQuery("pr_Gradings_Delete", sqlParams);
        }
    }
}
