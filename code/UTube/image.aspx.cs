﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTube
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = "";
                if (Session["User"] == null && Request.Cookies["User"] == null) Response.Redirect("~/login.aspx");
                else if (Session["User"] != null)
                {
                    id = (string)Session["User"];
                    Response.ClearHeaders();
                    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                    Response.AddHeader("Pragma", "no-cache");
                }
                else
                    id = Request.Cookies["User"].Value;

                    FileInfo[] fi = new DirectoryInfo(Server.MapPath(@"\Data\Account\" + id + @"\DP\")).GetFiles();
                    string img = "/Data/Account/" + id + "/DP/" + fi[0].Name;

                    string watch = (string)Request.QueryString["see"];
                    if (watch == null)
                        Response.Redirect("~/account.aspx");

                    DataAccessLayer dal = new DataAccessLayer("DBCON");
                    string upID = (string)dal.GetValue(new SqlCommand("Select upID from Uploads where Path like '%" + watch + "%'"));
                    if (upID == null) Response.Redirect("~/account.aspx");

                    //Updating view count
                    dal.Update(new SqlCommand("UPDATE Uploads SET Views+=1 WHERE upID='" + upID + "'"));

                    //Fetching upload data
                    DataSet path = dal.GetBulkRecords("Select U.upID, U.Name, U.Uploaded, U.Path, U.Views, U.Description from Uploads U, ULikes L where U.upID='" + upID + "'");
                    bool liked = (int)new DataAccessLayer("DBCON").GetValue(new SqlCommand("Select COUNT(*) from ULikes where usID='" + id + "' and upID='" + (string)path.Tables[0].Rows[0]["upID"] + "'")) == 1;

                    //Setting video data on page
                    tbPath.Text = (string)path.Tables[0].Rows[0]["Path"];
                    lblName.Text = (string)path.Tables[0].Rows[0]["Name"];
                    lblTime.Text = Operations.GetDateDiff(path.Tables[0].Rows[0]["Uploaded"].ToString());
                    lblViews.Text = path.Tables[0].Rows[0]["Views"].ToString() + " View(s)";
                    lblLikes.Text = lblLikes.Text = new DataAccessLayer("DBCON").GetValue(new SqlCommand("Select COUNT(*) From ULikes where upID='" + (string)path.Tables[0].Rows[0]["upID"] + "'")).ToString();
                    lblDescription.Text = (string)path.Tables[0].Rows[0]["Description"];

                    //Adding to history
                    DBWorks.AddToHistory(id, upID);

                    string script = "Name=\"" + (new DataAccessLayer("DBCON").GetValue(new SqlCommand("Select Name from Users Where usID='" + id + "'"))) + "\"; uID=\"" + id + "\"; Img=\"" + img + "\"; upID = \"" + path.Tables[0].Rows[0]["upID"].ToString() + "\"; Liked=\"" + liked + "\"";
                    Operations.AddJavaScript((Page)HttpContext.Current.Handler, script, true);
                }
            }
        }
    }