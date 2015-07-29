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
            sqlParams[0] = new SqlParameter("@HostCode", hostCode);
            sqlParams[1] = new SqlParameter("@UserId", userid);

            return cmnDA.ExecuteSQLDataTable("pr_Gradings_GetAll", sqlParams);
        }

        public int InsertStudentMarks(BOStudentMarks plans)
        {
            SqlParameter[] sqlParams = new SqlParameter[11];
            sqlParams[0] = new SqlParameter("@TermTypeId", plans.StudentId);
            sqlParams[1] = new SqlParameter("@TermFromId", plans.ExamTypeId);
            sqlParams[2] = new SqlParameter("@TermToId", plans.Absent);
            sqlParams[3] = new SqlParameter("@ClassId", plans.Subjects);
            sqlParams[4] = new SqlParameter("@Status", plans.Status);
            sqlParams[5] = new SqlParameter("@HostCode", plans.HostCode);
            sqlParams[6] = new SqlParameter("@RecordId", plans.Id);
            sqlParams[7] = new SqlParameter("@CreatedDate", DateTime.Now);
            sqlParams[8] = new SqlParameter("@ModifiedDate", DateTime.Now);
            sqlParams[9] = new SqlParameter("@CreatedBy", plans.UserId);
            sqlParams[10] = new SqlParameter("@ModifiedBy", plans.UserId);

            return cmnDA.ExecuteNonQuery("pr_TermPlans_AddOrUpdate", sqlParams);
        }

        public int DeleteStudentMarks(int id)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@RecordId", id);

            return cmnDA.ExecuteNonQuery("pr_Gradings_Delete", sqlParams);
        }
    }
}
