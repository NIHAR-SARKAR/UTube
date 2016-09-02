using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTube
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = "";
                if (Request.Cookies["User"] == null) id = (string)Session["User"];
                else id = Request.Cookies["User"].Value;

                tbHidden.Text = DBWorks.GetFeeds(id);
            }
        }
    }
}