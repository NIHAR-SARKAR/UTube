using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTube
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = "";
                if (Request.Cookies["User"] == null) id = (string)Session["User"];
                else id = Request.Cookies["User"].Value;

                tbFavourites.Text = Operations.ConvertToJSON((new DataAccessLayer("DBCON").GetBulkRecords("SELECT A.Type, A.Path as Url, A.Description, A.Name, B.Liked as [Time], U.Name as Uploader FROM Uploads A, ULikes B, Users U WHERE A.upID=B.upID AND B.usID='" + id + "' AND U.usID=A.usID ORDER BY B.Liked")).Tables[0]);
            }
        }
    }
}