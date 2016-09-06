using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace UTube.App_Code
{
    /// <summary>
    /// Summary description for StockService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]

    public class StockService : System.Web.Services.WebService
    {
        [WebMethod]
        public string AddComment(string usID, string upID, string comment)
        {
            string query = "Insert into Comments values('newID', @usID, @upID, @comment, GETDATE())";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.Add("@usID", SqlDbType.VarChar).Value = usID;
            cmd.Parameters.Add("@upID", SqlDbType.VarChar).Value = upID;
            cmd.Parameters.Add("@comment", SqlDbType.VarChar).Value = comment;

            return (new DataAccessLayer("DBCON")).Insert("Comments", "cID", "CM", "newID", cmd); ;
        }

        [WebMethod]
        public bool DelComment(string cmID)
        {
            SqlCommand cmd = new SqlCommand("Delete from Comments Where cID=@cmID");
            cmd.Parameters.Add("@cmID", SqlDbType.VarChar).Value = cmID;
            return (new DataAccessLayer("DBCON")).Insert(cmd);
        }

        [WebMethod]
        public List<Comments> GetComments(string upID)
        {
            string query = "Select A.cID, A.Comment, A.Commented, B.usID, B.Name from Comments A, Users B Where A.upID='" + upID + "' and A.usID=B.usID ORDER BY A.Commented DESC";
            DataTable dt = (new DataAccessLayer("DBCON")).GetBulkRecords(query).Tables[0];
            string img = "";
            List<Comments> list = new List<Comments>();
            foreach (DataRow dr in dt.Rows)
            {
                img = @"\Data\Account\" + dr["usID"].ToString() + @"\DP\";
                FileInfo[] fi = new DirectoryInfo(Server.MapPath(img)).GetFiles();
                img += dr["usID"].ToString() + fi[0].Extension;
                list.Add(new Comments(dr["cID"].ToString(), dr["Comment"].ToString(), Operations.GetDateDiff(dr["Commented"].ToString()), dr["usID"].ToString(), img, dr["Name"].ToString()));
            }
            return list;
        }

        [WebMethod]
        public bool AddLike(string usID, string upID)
        {
            SqlCommand cmd = new SqlCommand("sp_likes");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usID", SqlDbType.VarChar).Value = usID;
            cmd.Parameters.Add("@upID", SqlDbType.VarChar).Value = upID;
            return new DataAccessLayer("DBCON").Insert(cmd);
        }

        [WebMethod]
        public bool WatchLater(string usID, string upID)
        {
            SqlCommand cmd = new SqlCommand("sp_watchlater");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usID", SqlDbType.VarChar).Value = usID;
            cmd.Parameters.Add("@upID", SqlDbType.VarChar).Value = upID;
            return new DataAccessLayer("DBCON").Insert(cmd);
        }

        [WebMethod]
        public bool RemoveSubscriber(string usID, string subscriberID)
        {
            SqlCommand cmd = new SqlCommand("Delete from Subscriptions Where usID=@usID and subID=@subID");
            cmd.Parameters.Add("@usID", SqlDbType.VarChar).Value = usID;
            cmd.Parameters.Add("@subID", SqlDbType.VarChar).Value = subscriberID;
            return new DataAccessLayer("DBCON").Insert(cmd);
        }

        [WebMethod]
        public bool CheckUser(string email)
        {
            return new DataAccessLayer("DBCON").GetValue(new SqlCommand("Select COUNT(*) from Users where email='" + email + "'")).ToString() == "1";
        }
    }

    public class Comments
    {
        public Comments() { }

        public Comments(string id, string cm, string tt, string us, string im, string nm)
        {
            ID = id; Comment = cm; Time = tt; User = us; Img=im; Name = nm;
        }

        public string ID        { get; set; }
        public string Comment   { get; set; }
        public string Time      { get; set; }
        public string User      { get; set; }
        public string Img       { get; set; }
        public string Name      { get; set; }
    }  
}