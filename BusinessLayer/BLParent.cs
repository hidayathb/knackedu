using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class BLParent
    {
        public DataTable LoadParentTimeTable(int studentId)
        {
            DAParent pDAL = new DAParent();
             try
             {
                 return pDAL.LoadParentTimeTable(studentId);
             }
             catch
             {
                 throw;
             }
        }

        public DataTable LoadAnnouncements()
        {
            DAParent pDAL = new DAParent();
            try
            {
                return pDAL.LoadAnnouncements();
            }
            catch
            {
                throw;
            }
        }
    }
}
