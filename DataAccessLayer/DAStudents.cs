using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DAStudents
    {
        public DataTable RetrieveAll(int userid, string hostCode)
        {
            try
            {
                using (var conn = commonDA.SqlConnection)
                {
                    using (var dCmd = new SqlCommand("pr_Students_GetAll", conn))
                    {
                        conn.Open();
                        dCmd.CommandType = CommandType.StoredProcedure;
                        dCmd.CommandTimeout = commonDA.SqlConnection_TimeOut;
                        dCmd.Parameters.AddWithValue("@HostCode", hostCode);
                        dCmd.Parameters.AddWithValue("@UserId", userid);

                        DataTable dt = new DataTable();
                        dt.Load(dCmd.ExecuteReader());

                        if (dt != null && dt.Rows.Count > 0)
                            return dt;
                    }
                }

                return null;
            }
            catch
            {
                throw;
            }
        }

        public int InsertStudent(int? id, string studentData, int userid, string hostCode)
        {
            try
            {
                using (var conn = commonDA.SqlConnection)
                {
                    using (var dCmd = new SqlCommand("pr_Student_AddOrUpdate", conn))
                    {
                        conn.Open();
                        dCmd.CommandType = CommandType.StoredProcedure;
                        dCmd.Parameters.AddWithValue("@StudentData", studentData);
                        dCmd.Parameters.AddWithValue("@Status", 'A');
                        dCmd.Parameters.AddWithValue("@HostCode", hostCode);
                        dCmd.Parameters.AddWithValue("@RecordId", id);
                        dCmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                        dCmd.Parameters.AddWithValue("@ModifiedDate", DateTime.Now);
                        dCmd.Parameters.AddWithValue("@CreatedBy", userid);
                        dCmd.Parameters.AddWithValue("@ModifiedBy", userid);

                        return dCmd.ExecuteNonQuery();
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        public string GetAdmissionNumber(string hostCode)
        {
            try
            {
                using (var conn = commonDA.SqlConnection)
                {
                    using (var dCmd = new SqlCommand("pr_GetAdmissionNumber", conn))
                    {
                        conn.Open();
                        dCmd.CommandType = CommandType.StoredProcedure;
                        dCmd.CommandTimeout = commonDA.SqlConnection_TimeOut;
                        dCmd.Parameters.AddWithValue("@HostCode", hostCode);

                        DataTable dt = new DataTable();
                        return dCmd.ExecuteScalar().ToString();
                    }
                }
            }
            catch
            {
                throw;
            }
        }
    }
}
