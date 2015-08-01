using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace knackedu
{
    public partial class ucSubject : System.Web.UI.UserControl
    {
        public ucSubject(string subjectName)
        {
            this.SubjectName = subjectName;
        }
        public string SubjectName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}