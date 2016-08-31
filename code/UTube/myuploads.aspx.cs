using System;

namespace UTube
{
    public partial class myuploads : System.Web.UI.Page
    {
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["User"] == null) id = (string)Session["User"];
            else id = Request.Cookies["User"].Value;

            string query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID ORDER BY A.Name";
            tbUploads.Text = Operations.ConvertToJSON(new DataAccessLayer("DBCON").GetBulkRecords(query).Tables[0]);
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "";
            switch (ddlType.SelectedValue)
            {
                case "Name: A-Z":
                    query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID ORDER BY A.Name";
                    break;
                case "Name: Z-A":
                    query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID ORDER BY A.Name DESC";
                    break;
                case "Latest First": 
                    query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID ORDER BY A.Uploaded DESC";
                    break;
                case "Audio":
                    query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID AND A.Type='Audio' ORDER BY A.Uploaded DESC";
                    break;
                case "Video":
                    query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID AND A.Type='Video' ORDER BY A.Uploaded DESC";
                    break;
                case "Image":
                    query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID AND A.Type='Image' ORDER BY A.Uploaded DESC";
                    break;
                case "Oldest First":
                    query = "SELECT A.Type, A.Path as Url, A.Name, A.Description, A.Views FROM Uploads A, Users U WHERE A.usID=U.usID AND A.usID='" + id + "' AND U.usID=A.usID ORDER BY A.Uploaded";
                    break;
            }
            tbUploads.Text = Operations.ConvertToJSON(new DataAccessLayer("DBCON").GetBulkRecords(query).Tables[0]);
        }
    }
}