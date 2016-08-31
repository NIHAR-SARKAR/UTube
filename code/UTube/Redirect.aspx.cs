using System;

namespace UTube
{
    public partial class Redirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            if (Request.Cookies["User"] != null)
                Response.Cookies["User"].Expires = DateTime.Now.AddDays(-3650);
            Response.Redirect("~/login.aspx");
        }
    }
}