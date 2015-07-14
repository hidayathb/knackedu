using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace knackedu
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var studentsInfo = new studentinfo();
            studentsInfo.studentinfo1 = new studentinfoStudentinfo[1];
            studentinfoStudentinfo stuInfo = new studentinfoStudentinfo();

            stuInfo.AdmissionId = string.Empty;
            stuInfo.AdmissionYear = string.Empty;
            stuInfo.StudentClass = string.Empty;
            stuInfo.StudentSection = string.Empty;
            stuInfo.FirstName = string.Empty;
            stuInfo.LastName = string.Empty;
            stuInfo.Gender = string.Empty;
            stuInfo.DateOfAdmission = string.Empty;
            stuInfo.PoB = string.Empty;
            stuInfo.DOB = string.Empty;
            stuInfo.Age = 0;
            stuInfo.MotherTongue = string.Empty;
            stuInfo.IdentityMark1 = string.Empty;
            stuInfo.IdentityMark2 = string.Empty;
            stuInfo.Caste = string.Empty;
            stuInfo.PhysicallyChallenged = string.Empty;
            stuInfo.PreviousClasasYear = string.Empty;
            stuInfo.Photo = string.Empty;
            stuInfo.BusFacility = 0;
            stuInfo.PreviousSchool = string.Empty;
            stuInfo.PrevSchoolAddr = string.Empty;
            stuInfo.FatherName = string.Empty;
            stuInfo.MotherName = string.Empty;
            stuInfo.Email = string.Empty;
            stuInfo.FatherOccupation = string.Empty;
            stuInfo.MotherOccupation = string.Empty;
            stuInfo.Nationality = string.Empty;
            stuInfo.Religion = string.Empty;
            stuInfo.FatherIncome = string.Empty;
            stuInfo.Address = string.Empty;
            stuInfo.State = string.Empty;
            stuInfo.City = string.Empty;
            stuInfo.Distict = string.Empty;
            stuInfo.PinCode = string.Empty;
            stuInfo.ContactNo = string.Empty;
            stuInfo.HostCode = string.Empty;
            stuInfo.Status = string.Empty;
            stuInfo.SortSeq = 0;
            stuInfo.CreatedDate = string.Empty;
            stuInfo.CreatedBy = 1;
            stuInfo.ModifiedDate = string.Empty;
            stuInfo.ModifiedBy = 1;

            studentsInfo.studentinfo1[0] = stuInfo;
            string studentsInfoXMLString = GetXMLString(studentsInfo);
            //return studentsInfoXMLString;
        }

        public string GetXMLString(Object xmlObject)
        {
            String constructedString;
            using (MemoryStream ms = new MemoryStream())
            {
                StreamWriter textWriter = new StreamWriter(ms);
                // Convert the XML object with the information to string using XML Serialization
                XmlSerializer palletInfoSerializer = new XmlSerializer(xmlObject.GetType());
                palletInfoSerializer.Serialize(textWriter, xmlObject);

                using (StreamReader sr = new StreamReader(ms))
                {
                    ms.Position = 0;
                    constructedString = sr.ReadToEnd();
                    constructedString.Trim();
                    sr.Close();
                }
                textWriter.Close();

            }
            return constructedString;
        }
    }
}