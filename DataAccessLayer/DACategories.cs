using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using CommonObject;

namespace DataAccessLayer
{
    public class DACategories
    {
        commonDA cmnDA = new commonDA();

        public DataTable LoadStudents(int userid, string hostCode)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@HostCode", hostCode);
            sqlParams[1] = new SqlParameter("@UserId", userid);

            return cmnDA.ExecuteSQLDataTable("pr_Students_GetAll", sqlParams);
        }

        public DataTable LoadCategories(int userid, string hostCode)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@HostCode", hostCode);
            sqlParams[1] = new SqlParameter("@UserId", userid);

            return cmnDA.ExecuteSQLDataTable("pr_Categories_GetAll", sqlParams);
        }

        public DataTable LoadSubCategories(int userid, string hostCode)
        {
            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = new SqlParameter("@HostCode", hostCode);
            sqlParams[1] = new SqlParameter("@UserId", userid);

            return cmnDA.ExecuteSQLDataTable("pr_SubCategories_GetAll", sqlParams);
        }

        public int InsertCategory(BOCategories categories)
        {
            SqlParameter[] sqlParams = new SqlParameter[9];
            sqlParams[0] = new SqlParameter("@CategoryCode", categories.CategoryCode);
            sqlParams[1] = new SqlParameter("@CategoryName", categories.CategoryName);
            sqlParams[2] = new SqlParameter("@Status", 'A');
            sqlParams[3] = new SqlParameter("@HostCode", categories.HostCode);
            sqlParams[4] = new SqlParameter("@RecordId", categories.Id);
            sqlParams[5] = new SqlParameter("@CreatedDate", DateTime.Now);
            sqlParams[6] = new SqlParameter("@ModifiedDate", DateTime.Now);
            sqlParams[7] = new SqlParameter("@CreatedBy", categories.UserId);
            sqlParams[8] = new SqlParameter("@ModifiedBy", categories.UserId);

            return cmnDA.ExecuteNonQuery("pr_Categories_AddOrUpdate", sqlParams);
        }

        public int InsertStudent(string data, string id, out string admissionId)
        {
            admissionId = string.Empty;
            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = new SqlParameter("@StudentData", data);
            sqlParams[1] = new SqlParameter("@RecordId", id);
            sqlParams[2] = new SqlParameter("@AdmissionId", admissionId);

            return cmnDA.ExecuteNonQuery("pr_Stundents_AddOrUpdate", sqlParams);
        }

        public int InsertSubCategory(BOCategories categories)
        {
            SqlParameter[] sqlParams = new SqlParameter[11];
            sqlParams[0] = new SqlParameter("@CategoryId", categories.Id);
            if (categories.ParentSubCategoryId > 0)
                sqlParams[1] = new SqlParameter("@SubCategoryId", categories.ParentSubCategoryId);
            else
                sqlParams[1] = new SqlParameter("@SubCategoryId", DBNull.Value);

            sqlParams[2] = new SqlParameter("@SubCategoryCode", categories.SubCategoryCode);
            sqlParams[3] = new SqlParameter("@SubCategoryName", categories.SubCategoryName);
            sqlParams[4] = new SqlParameter("@Status", 'A');
            sqlParams[5] = new SqlParameter("@HostCode", categories.HostCode);
            sqlParams[6] = new SqlParameter("@RecordId", categories.SubCategoryId);
            sqlParams[7] = new SqlParameter("@CreatedDate", DateTime.Now);
            sqlParams[8] = new SqlParameter("@ModifiedDate", DateTime.Now);
            sqlParams[9] = new SqlParameter("@CreatedBy", categories.UserId);
            sqlParams[10] = new SqlParameter("@ModifiedBy", categories.UserId);

            return cmnDA.ExecuteNonQuery("pr_SubCategories_AddOrUpdate", sqlParams);
        }

        public int DeleteCategories(int id)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@RecordId", id);

            return cmnDA.ExecuteNonQuery("pr_Categories_Delete", sqlParams);
        }

        public int DeleteSubCategories(int id)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@RecordId", id);

            return cmnDA.ExecuteNonQuery("pr_SubCategories_Delete", sqlParams);
        }
    }
}