using CommonObject;
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    /// <summary>
    /// Static helper class for utility functions
    /// </summary>
    public static class Helper
    {
        /// <summary>
        /// Converts a DataTable to a list with generic objects
        /// </summary>
        /// <typeparam name="T">Generic object</typeparam>
        /// <param name="table">DataTable</param>
        /// <returns>List with generic objects</returns>
        public static List<T> DataTableToList<T>(this DataTable table) where T : class, new()
        {
            try
            {
                List<T> list = new List<T>();

                foreach (var row in table.AsEnumerable())
                {
                    T obj = new T();

                    foreach (var prop in obj.GetType().GetProperties())
                    {
                        try
                        {
                            PropertyInfo propertyInfo = obj.GetType().GetProperty(prop.Name);
                            propertyInfo.SetValue(obj, Convert.ChangeType(row[prop.Name], propertyInfo.PropertyType), null);
                        }
                        catch
                        {
                            continue;
                        }
                    }

                    list.Add(obj);
                }

                return list;
            }
            catch
            {
                return null;
            }
        }
    }

    public class BLCategories
    {
        public List<BOStudents> LoadStudents(int userid, string hostCode)
        {
            DACategories pDAL = new DACategories();
            try
            {
                var dtStudents = pDAL.LoadStudents(userid, hostCode);
                var students = new List<BOStudents>();
                BOStudents std = null;
                foreach (DataRow item in dtStudents.Rows)
                {
                    std = new BOStudents();
                    std.AdmissionId = item["AdmissionId"].ToString();
                    std.Class = Convert.ToInt32(item["StudentClass"].ToString());
                    std.Section = Convert.ToInt32(item["StudentSection"].ToString());
                    std.ClassName = item["StudentClassDesc"].ToString();
                    std.SectionName = item["StudentSectionDesc"].ToString();
                    std.Id = Convert.ToInt32(item["StudentId"]);
                    std.FirstName = item["FirstName"].ToString();
                    std.SurName = item["LastName"].ToString();

                    students.Add(std);
                }

                return students;
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

        public List<BOCategories> LoadCategories(int userid, string hostCode)
        {
            DACategories pDAL = new DACategories();
            try
            {
                var dtCategories = pDAL.LoadCategories(userid, hostCode);
                var categories = new List<BOCategories>();
                BOCategories cat = null;
                foreach (DataRow item in dtCategories.Rows)
                {
                    cat = new BOCategories();
                    cat.CategoryCode = item["Code"].ToString();
                    cat.CategoryName = item["Name"].ToString();
                    cat.Id = Convert.ToInt32(item["Id"]);

                    categories.Add(cat);
                }

                return categories;
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

        public List<BOCategories> LoadSubCategories(int userid, string hostCode)
        {
            DACategories pDAL = new DACategories();
            try
            {
                var dtSubCategories = pDAL.LoadSubCategories(userid, hostCode);

                var subCategories = new List<BOCategories>();
                BOCategories cat = null;
                foreach (DataRow item in dtSubCategories.Rows)
                {
                    cat = new BOCategories();
                    cat.CategoryCode = item["CategoryCode"].ToString();
                    cat.SubCategoryCode = item["SubCategoryCode"].ToString();
                    cat.SubCategoryName = item["SubCategoryName"].ToString();

                    if (item["ParentSubCategoryId"] != null && item["ParentSubCategoryId"] != DBNull.Value)
                        cat.ParentSubCategoryId = Convert.ToInt32(item["ParentSubCategoryId"].ToString());

                    cat.ParentSubCategoryName = item["ParentSubCategoryName"].ToString();
                    cat.SubCategoryId = Convert.ToInt32(item["Id"]);
                    cat.Id = Convert.ToInt32(item["CategoryId"]);
                    cat.CategoryName = item["CategoryName"].ToString();

                    subCategories.Add(cat);
                }

                return subCategories;
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

        public int InsertCategory(BOCategories categories)
        {
            DACategories pDAL = new DACategories();
            try
            {
                return pDAL.InsertCategory(categories);
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

        public int InsertStudent(string data, string id, out string admissionId)
        {
            DACategories pDAL = new DACategories();
            admissionId = "";
            try
            {
                return pDAL.InsertStudent(data, id, out admissionId);
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

        public int InsertSubCategory(BOCategories categories)
        {
            DACategories pDAL = new DACategories();
            try
            {
                return pDAL.InsertSubCategory(categories);
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
            DACategories pDAL = new DACategories();
            try
            {
                return pDAL.DeleteCategories(id);
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

        public int DeleteSubCategories(int id)
        {
            DACategories pDAL = new DACategories();
            try
            {
                return pDAL.DeleteSubCategories(id);
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
