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
    public class DATermPlan
    {
        commonDA cmnDA = new commonDA();

        public DataTable LoadTermPlans(int userid, string hostCode)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@HostCode", hostCode);
            sqlParams[1] = new SqlParameter("@UserId", userid);

            return cmnDA.ExecuteSQLDataTable("pr_Gradings_GetAll", sqlParams);
        }

        public int InsertTermPlan(BOTermPlan plans)
        {
            SqlParameter[] sqlParams = new SqlParameter[14];
            sqlParams[0] = new SqlParameter("@TermTypeId", plans.Plan);
            sqlParams[1] = new SqlParameter("@TermFromId", plans.From);
            sqlParams[2] = new SqlParameter("@TermToId", plans.To);
            sqlParams[3] = new SqlParameter("@ClassId", plans.Class);
            sqlParams[4] = new SqlParameter("@MonthId", plans.Month);
            sqlParams[5] = new SqlParameter("@SubjectId", plans.Subject);
            sqlParams[6] = new SqlParameter("@Syllabus", plans.Syllabus);
            sqlParams[7] = new SqlParameter("@Status", plans.Status);
            sqlParams[8] = new SqlParameter("@HostCode", plans.HostCode);
            sqlParams[9] = new SqlParameter("@RecordId", plans.Id);
            sqlParams[10] = new SqlParameter("@CreatedDate", DateTime.Now);
            sqlParams[11] = new SqlParameter("@ModifiedDate", DateTime.Now);
            sqlParams[12] = new SqlParameter("@CreatedBy", plans.UserId);
            sqlParams[13] = new SqlParameter("@ModifiedBy", plans.UserId);

            return cmnDA.ExecuteNonQuery("pr_TermPlans_AddOrUpdate", sqlParams);
        }

        public int DeleteTermPlan(int id)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@RecordId", id);

            return cmnDA.ExecuteNonQuery("pr_Gradings_Delete", sqlParams);
        }
    }
}
