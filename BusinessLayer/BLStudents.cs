using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLayer
{
    public class BLStudents
    {
        public DataTable RetrieveAll(int userid, string hostCode)
        {
            DAStudents pDAL = new DAStudents();
            try
            {
                return pDAL.RetrieveAll(userid, hostCode);
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

        public int InsertStudent(int? id, string studentData, int userid, string hostCode)
        {
            DAStudents pDAL = new DAStudents();
            try
            {
                return pDAL.InsertStudent(id, studentData, userid, hostCode);
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

        public string GetAdmissionNumber(string hostCode)
        {
            DAStudents pDAL = new DAStudents();
            try
            {
                return pDAL.GetAdmissionNumber(hostCode);
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
