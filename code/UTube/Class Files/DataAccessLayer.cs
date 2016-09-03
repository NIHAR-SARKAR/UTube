using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.IO;
using System.Web;

namespace UTube
{
    public class DataAccessLayer
    {
        string connect;
        static string _ID;
        
        public static string Id
        {
            get { return _ID; }
            set { _ID = value; }
        }

        public DataAccessLayer(string connectionName)
        {
            connect = connectionName;
        }

        public DataSet GetBulkRecords(string cmd)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[connect].ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter(cmd, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public bool Insert(SqlCommand insertCmd)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[connect].ConnectionString);
            insertCmd.Connection = con;
            bool added = false;
            //try
            {
                con.Open();
                insertCmd.ExecuteNonQuery();
                added = true;
            }
            //catch { added = false; }
            { con.Close(); }

            return added;
        }

        public string Insert(string tblName, string colname, string prefix, string replaceString, SqlCommand insertCmd)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[connect].ConnectionString);

            //Getting last ID
            string ID = (string)GetValue(new SqlCommand("SELECT TOP 1 " + colname + " FROM " + tblName + " ORDER BY " + colname + " DESC"));

            ID = (ID != null) ? prefix + (Int32.Parse(ID.Substring(2)) + 1).ToString() : prefix + 100;

            //replacing 'newID' with generated ID and adjusting connection
            insertCmd.CommandText = insertCmd.CommandText.Replace(replaceString, ID);
            insertCmd.Connection = con;

            //Inserting in DB
            try
            {
                con.Open();
                insertCmd.ExecuteNonQuery();
            }
            catch { }
            finally { con.Close(); }

            return ID;
        }

        public bool Update(SqlCommand updateCommand)
        {
            bool updated = false;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[connect].ConnectionString);
            updateCommand.Connection = con;
            //try
            {
                con.Open();
                updateCommand.ExecuteNonQuery();
                updated = true;
            }
            //catch   { updated = false; }
            //finally { con.Close(); }

            return updated;
        }

        public object GetValue(SqlCommand selectCmd)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[connect].ConnectionString);
            selectCmd.Connection = con;
            object result = null;
            try
            {
                con.Open();
                result = selectCmd.ExecuteScalar();
            }
            catch { }
            finally { con.Close(); }
            return result;
        }   
    }
}