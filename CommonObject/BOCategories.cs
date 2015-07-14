using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonObject
{
    [Serializable]
    public class BOCategories
    {
        public int Id { get; set; }
        public string CategoryCode { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryCode { get; set; }
        public string SubCategoryName { get; set; }
        public int SubCategoryId { get; set; }
        public int UserId { get; set; }
        public string HostCode { get; set; }
    }
}
