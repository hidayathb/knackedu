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
    public class DAGradeSystem
    {
        commonDA cmnDA = new commonDA();

        public DataTable LoadGradeSystem(int userid, string hostCode)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@HostCode", hostCode);
            sqlParams[1] = new SqlParameter("@UserId", userid);

            return cmnDA.ExecuteSQLDataTable("pr_Gradings_GetAll", sqlParams);
        }

        public int InsertGradeSystem(BOGradeSytem grade)
        {
            SqlParameter[] sqlParams = new SqlParameter[12];
            sqlParams[0] = new SqlParameter("@FirstMarks", grade.FirstMarks);
            sqlParams[1] = new SqlParameter("@SecondMarks", grade.SecondMarks);
            sqlParams[2] = new SqlParameter("@ExamType", grade.ExamTypeId);
            sqlParams[3] = new SqlParameter("@Grade", grade.GradeId);
            sqlParams[4] = new SqlParameter("@Marks", grade.Marks);
            sqlParams[5] = new SqlParameter("@Status", grade.Status);
            sqlParams[6] = new SqlParameter("@HostCode", grade.HostCode);
            sqlParams[7] = new SqlParameter("@RecordId", grade.Id);
            sqlParams[8] = new SqlParameter("@CreatedDate", DateTime.Now);
            sqlParams[9] = new SqlParameter("@ModifiedDate", DateTime.Now);
            sqlParams[10] = new SqlParameter("@CreatedBy", grade.UserId);
            sqlParams[11] = new SqlParameter("@ModifiedBy", grade.UserId);

            return cmnDA.ExecuteNonQuery("pr_Gradings_AddOrUpdate", sqlParams);
        }

        public int DeleteGradeSystem(int id)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@RecordId", id);

            return cmnDA.ExecuteNonQuery("pr_Gradings_Delete", sqlParams);
        }
    }
}
