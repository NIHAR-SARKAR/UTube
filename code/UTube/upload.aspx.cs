using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace UTube
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null) Response.Redirect("~/login.aspx");
                else
                {
                    Response.ClearHeaders();
                    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                    Response.AddHeader("Pragma", "no-cache");
                }
            }
        }

        protected void tbUpload_Click(object sender, EventArgs e)
        {
            string query = "Insert into Uploads values('newID', '" + Session["User"].ToString() + "', @type, GETDATE(), @path, @tags, @desc, 0, @access, @name)";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = VideoType.SelectedValue;
            cmd.Parameters.Add("@tags", SqlDbType.VarChar).Value = tbTags.Text;
            cmd.Parameters.Add("@desc", SqlDbType.VarChar).Value = tbDescription.Text;
            cmd.Parameters.Add("@access", SqlDbType.VarChar).Value = ddlPermission.SelectedValue;
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = tbTitle.Text;

            if (FileUpload.HasFile)
            {
                FileInfo fi = new FileInfo(FileUpload.PostedFile.FileName);
                string path = "~/Data/Account/" + Session["User"].ToString() + "/[Type]/" + "[UploadName]" + fi.Extension;

                switch (VideoType.SelectedValue)
                {
                    case "Audio":
                        path = path.Replace("[Type]", "Audio");
                        break;
                    case "Video":
                        path = path.Replace("[Type]", "Video");
                        break;
                    case "Image":
                        path = path.Replace("[Type]", "Image");
                        break;
                }
                
                string decrp = "";
                string newName = Operations.Encrypt(fi.Name, out decrp).Substring(0, 10);
                newName = newName.Replace("=", "eq");
                newName = newName.Replace("+", "pp");
                newName = newName.Replace("/", "fs");
                newName = newName.Replace("\\", "bs");

                path = path.Replace("[UploadName]", newName);
                cmd.Parameters.Add("@path", SqlDbType.VarChar).Value = path;
                DataAccessLayer dal = new DataAccessLayer("DBCON");
                string upID = dal.Insert("Uploads", "upID", "UP", "newID", cmd);

                if (upID != null)
                {
                    FileUpload.PostedFile.SaveAs(Server.MapPath(path));
                    Response.Write("<script>alert('Upload Successful')</script>");
                }
            }
        }
    }
}