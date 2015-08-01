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
        public int ParentSubCategoryId { get; set; }
        public string ParentSubCategoryName { get; set; }
        public int SubCategoryId { get; set; }
        public int UserId { get; set; }
        public string HostCode { get; set; }
    }

    [Serializable]
    public class BOGradeSytem
    {
        public int Id { get; set; }
        public int FirstMarks { get; set; }
        public int SecondMarks { get; set; }
        public int ExamTypeId { get; set; }
        public string ExamType { get; set; }
        public string Grade { get; set; }
        public int GradeId { get; set; }
        public string Marks { get; set; }
        public int UserId { get; set; }
        public string HostCode { get; set; }
        public string Status { get; set; }
    }

    [Serializable]
    public class BOTermPlan
    {
        public int Id { get; set; }
        public int Plan { get; set; }
        public int From { get; set; }
        public int To { get; set; }
        public int Class { get; set; }
        public int Month { get; set; }
        public int Subject { get; set; }
        public string Syllabus { get; set; }
        public int UserId { get; set; }
        public string HostCode { get; set; }
        public string Status { get; set; }
    }

    [Serializable]
    public class BOStudentMarks
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int ExamTypeId { get; set; }
        public int Absent { get; set; }
        public string Subjects { get; set; }
        public string TotalMarks { get; set; }
        public int UserId { get; set; }
        public string HostCode { get; set; }
        public string Status { get; set; }
    }

    [Serializable]
    public class BOStudents
    {
        public int Id { get; set; }
        public string AdmissionId { get; set; }
        public int Class { get; set; }
        public int Section { get; set; }
        public string ClassName { get; set; }
        public string SectionName { get; set; }
        public string FirstName { get; set; }
        public string SurName { get; set; }
    }
}
