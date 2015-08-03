using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommonObject
{
    [Serializable]
    public class BOUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Age { get; set; }
        public string Gender { get; set; }
        public string DOB { get; set; }
        public string ContactNo { get; set; }
        public int Qualification { get; set; }
        public string Address { get; set; }
        public string Basic { get; set; }
        public string DA { get; set; }
        public string HRA { get; set; }
        public string ProfTax { get; set; }
        public string ConvAllowance { get; set; }
        public string CapitalCostAllow { get; set; }
        public string EnterAllowance { get; set; }
        public string NetSalary { get; set; }
        public int Department { get; set; }
        public string empid { get; set; }
        public string userid { get; set; }
        public string password { get; set; }
        public int SeqQuestion { get; set; }
        public string Answer { get; set; }
        public string DateOfJoin { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int ModifiedBy { get; set; }
        public string ModifiedDate { get; set; }
        public string DepartmentName { get; set; }
        public string Id { get; set; }
    }

    [Serializable]
    public class BOAllMarks
    {
        public string AdmissionId { get; set; }
        public string ExamType { get; set; }
        public string FirstName { get; set; }
        public string ClassName { get; set; }
        public string SectionName { get; set; }
        public string Hindi { get; set; }
        public string English { get; set; }
        public string Mathematics { get; set; }
        public string Science { get; set; }
        public string Social { get; set; }
        public string Telugu { get; set; }
    }
}
