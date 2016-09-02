using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTube
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tbPictures.Text = Operations.ConvertToJSON((new DataAccessLayer("DBCON")).GetBulkRecords("SELECT TOP 4 [Path] from Uploads WHERE usID='" + Session["User"].ToString() + "' AND Type='Image' ORDER BY Uploaded DESC").Tables[0]);
        }
    }
}