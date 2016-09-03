using System;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Configuration;

namespace UTube
{
    public class DBWorks : System.Web.UI.Page
    {
        public static string GetSubscribers(string userID, bool allSubscribers = false)
        {
            string query = "";
            if (allSubscribers)
                query = "SELECT A.subID as ID, B.Name FROM Subscriptions A, Users B WHERE A.subID = B.usID AND A.usID='" + userID + "' ORDER BY B.Name";
            else
                query = "SELECT TOP 3 A.subID as ID, B.Name FROM Subscriptions A, Users B WHERE A.subID = B.usID AND A.usID='" + userID + "' ORDER BY B.Name";

            DataTable dt = (new DataAccessLayer("DBCON")).GetBulkRecords(query).Tables[0];
            List<Subscribers> list = new List<Subscribers>();
            
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string imgpath = @"\Data\Account\" + dt.Rows[i]["ID"].ToString() + @"\DP\";
                FileInfo[] fi = new DirectoryInfo(HttpContext.Current.Server.MapPath(imgpath)).GetFiles();
                imgpath += fi[0].Name;
                list.Add(new Subscribers(dt.Rows[i]["ID"].ToString(), dt.Rows[i]["Name"].ToString(), imgpath));
            }
            return Operations.ConvertToJSON(list);
        }

        public static void AddToHistory(string usID, string upID)
        {
            SqlCommand cmd = new SqlCommand("sp_history");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@usID", SqlDbType.VarChar).Value = usID;
            cmd.Parameters.Add("@upID", SqlDbType.VarChar).Value = upID;
            new DataAccessLayer("DBCON").Insert(cmd);
        }

        public static string Search(string searchStr)
        {
            string[] words = searchStr.Replace(' ', '+').Split('+');
            string cmd = "SELECT A.upID, A.Name as upname, A.Type, A.Path, A.Views, A.Description, A.Uploaded, B.usID ,B.Name as uname FROM Uploads A, Users B WHERE (";
            for (int i = 0; i < words.Length; i++)
            {
                cmd += "A.Tags LIKE '%" + words[i] + "%'";
                if (i + 1 != words.Length)
                    cmd += " OR ";
            }
            cmd += ") AND (Access = 'Public') AND (A.usID=B.usID) ORDER BY case when (";
            for (int i = 0; i < words.Length; i++)
            {
                cmd += "SOUNDEX(A.Name) = SOUNDEX('" + words[i] + "')";
                if (i + 1 != words.Length)
                    cmd += " OR ";
            }
            cmd += ")  THEN '1' ELSE SOUNDEX(A.Name) END";
            DataTable dt = new DataAccessLayer("DBCON").GetBulkRecords(cmd).Tables[0];
            List<Search> search = new List<Search>();
            foreach (DataRow dr in dt.Rows)
            {
                string url = dr["Path"].ToString().Substring(dr["Path"].ToString().LastIndexOf('/') + 1);
                string path = url.Substring(0, url.LastIndexOf('.'));
                search.Add(new Search(dr["usID"].ToString(), dr["uname"].ToString(), dr["upname"].ToString(), dr["Type"].ToString(), path, dr["Views"].ToString(), dr["Description"].ToString(), dr["Uploaded"].ToString()));
            }

            return Operations.ConvertToJSON(search);
        }

        public static string GetFeeds(string userID, string type = "")
        {
            string query = "";
            switch (type)
            {
                case "audio":
                    query = "SELECT A.Name as upname, A.Path, A.Views, A.Uploaded, B.usID, B.Name as uname FROM Uploads A, Users B WHERE upID in (SELECT TOP 5 upID FROM Uploads WHERE Type='audio' ORDER BY NEWID()) AND (Access = 'Public') AND (A.usID=B.usID)";
                    break;

                case "video":
                    query = "SELECT A.Name as upname, A.Path, A.Views, A.Uploaded, B.usID, B.Name as uname FROM Uploads A, Users B WHERE upID in (SELECT TOP 5 upID FROM Uploads WHERE Type='video' ORDER BY NEWID()) AND (Access = 'Public') AND (A.usID=B.usID)";
                    break;

                default:
                    query = "SELECT A.subID, B.Name, C.Name as upName, C.Type, C.Path, C.Views, C.Uploaded FROM Subscriptions A, Users B, Uploads C WHERE A.subID = B.usID AND A.usID='" + userID + "' AND A.subID=C.usID ORDER BY C.Uploaded DESC";
                    break;
            }

            DataTable dt = new DataAccessLayer("DBCON").GetBulkRecords(query).Tables[0];
            List<Feed> feed = new List<Feed>();
            List<Search> src = new List<Search>();

            if (type == "")
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string url = dr["Path"].ToString().Substring(dr["Path"].ToString().LastIndexOf('/') + 1);
                    string path = url.Substring(0, url.LastIndexOf('.'));
                    feed.Add(new Feed(dr["subID"].ToString(), dr["Name"].ToString(), dr["upName"].ToString(), dr["Type"].ToString(), path, dr["Views"].ToString(), dr["Uploaded"].ToString()));
                }
                return Operations.ConvertToJSON(feed);
            }
            else
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string url = dr["Path"].ToString().Substring(dr["Path"].ToString().LastIndexOf('/') + 1);
                    string path = url.Substring(0, url.LastIndexOf('.'));
                    src.Add(new Search(dr["usID"].ToString(), dr["uname"].ToString(), dr["upname"].ToString(), type, path, dr["Views"].ToString(), "null", dr["Uploaded"].ToString())); 
                }
                return Operations.ConvertToJSON(src);
            }
        }

        public static bool AddSubscriber(string usID, string subID)
        {
            SqlCommand cmd = new SqlCommand("Insert into Subscriptions values (@usID, @subID, GETDATE())");
            cmd.Parameters.Add("@usID", SqlDbType.VarChar).Value = usID;
            cmd.Parameters.Add("@subID", SqlDbType.VarChar).Value = subID;
            return new DataAccessLayer("DBCON").Insert(cmd);
        }
    }

    public class Subscribers
    {
        public Subscribers(string id, string name, string path)
        {
            ID = id; Name = name; ImgPath = path;
        }
        public string ID      { get; set; }
        public string Name    { get; set; }
        public string ImgPath { get; set; }
    }

    public class Feed
    {
        public Feed(string id, string nm, string un, string tp, string ph, string vw, string tt)
        {
            ID = id; Name = nm; upName = un; Type = tp; Path = ph; Views = vw; Time = Operations.GetDateDiff(tt);
        }

        public string ID     { get; set; }
        public string Name   { get; set; }
        public string upName { get; set; }
        public string Type   { get; set; }
        public string Path   { get; set; }
        public string Views  { get; set; }
        public string Time   { get; set; }
    }

    public class Search
    {
        public Search(string id, string nm, string un, string tp, string ph, string vw, string dc, string tt)
        {
            usID = id; Name = nm; upName = un; Type = tp; Path = ph; Views = vw; Description = dc; Time = Operations.GetDateDiff(tt);
        }
        public string upID        { get; set; }
        public string upName      { get; set; }
        public string Type        { get; set; }
        public string Path        { get; set; }
        public string Views       { get; set; }
        public string Time        { get; set; }
        public string Description { get; set; }
        public string usID        { get; set; }
        public string Name        { get; set; }
    }
}