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
                    cat.SubCategoryCode = item["Code"].ToString();
                    cat.SubCategoryName = item["Name"].ToString();
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
