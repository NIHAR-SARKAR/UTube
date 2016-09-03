using System;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using Newtonsoft.Json;

namespace UTube
{
    public static class Operations
    {
        static Random rand = new Random();

        public static string GenerateVerificationCode()
        {
            string dec = "";
            return Encrypt(CipherKeys.Codes[rand.Next(0, CipherKeys.Codes.Length)], out dec).Substring(0, 5);
        }

        private static string EditEmail(string code, string link, string name = "")
        {
            string html = "";
            if (name != "")
            {
                html = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Templates/Email.html"));
                html = html.Replace("[Name]", name);
                html = html.Replace("[Verify]", code);
                html = html.Replace("[Here]", link);
            }
            else
            {
                html = File.ReadAllText(HttpContext.Current.Server.MapPath("~/Templates/PasswordEmail.html"));
                html = html.Replace("[Pass]", code);
                html = html.Replace("[Here]", link);
            }
            
            return html;
        }

        public static void SendMail(string sendTo, string code, string link, string name = "")
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("jyoti.nps93@gmail.com", "Team TestTube");

            if (name != "")
            {
                msg.Subject = "Account Verification";
                msg.Body = EditEmail(code, link, name);
            }
            else
            {
                msg.Subject = "Password Recovery";
                msg.Body = EditEmail(code, link);
            }
            msg.IsBodyHtml = true;
            msg.To.Add(sendTo);
            
            SmtpClient client = new SmtpClient();
            client.Credentials = new NetworkCredential("jyoti.nps93@gmail.com", "1234512345#");
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            
            try 
            { 
                client.Send(msg);
            }
            catch { return; }
        }

        private static string Key
        {
            get
            {
                return CipherKeys.Keys[rand.Next(0, CipherKeys.Keys.Length)];
            }
        }

        private static TripleDESCryptoServiceProvider CreateDES(out string key, string decrypKey = "")
        {
            key = (decrypKey == "") ? Key : decrypKey;
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            UTF8Encoding utf8 = new UTF8Encoding();
            TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
            des.Key = md5.ComputeHash(utf8.GetBytes(key));
            des.Mode = CipherMode.ECB;
            des.Padding = PaddingMode.PKCS7;
            return des;
        }

        public static string Encrypt(string PlainText, out string key)
        {
            TripleDESCryptoServiceProvider des = CreateDES(out key);
            ICryptoTransform ct = des.CreateEncryptor();
            byte[] input = Encoding.Unicode.GetBytes(PlainText);
            return Convert.ToBase64String(ct.TransformFinalBlock(input, 0, input.Length));
        }

        public static string Decrypt(string CipherText, string key)
        {
            byte[] b = Convert.FromBase64String(CipherText);
            TripleDES des = CreateDES(out key, key);
            ICryptoTransform ct = des.CreateDecryptor();
            byte[] output = ct.TransformFinalBlock(b, 0, b.Length);
            return Encoding.Unicode.GetString(output);
        }

        public static void AddJavaScript(Page page, string script, bool AddToHead)
        {
            Literal l = new Literal();
            l.Text = "<script> " + script + " </script>";

            if (AddToHead)
                page.Header.Controls.Add(l);
            else
                page.Controls.Add(l);
        }

        public static string ConvertToJSON(object obj)
        {
            return JsonConvert.SerializeObject(obj);
        }

        public static string GetDateDiff(string date)
        {
            DateTime dt = Convert.ToDateTime(date);
            TimeSpan diffResult = DateTime.Now - dt;
            string result = "";

            if (diffResult.Days == 0)
            {
                if (diffResult.Hours == 0)
                {
                    if (diffResult.Minutes == 0)
                        result = diffResult.Seconds.ToString() + " second(s) ago";
                    else
                        result = diffResult.Minutes.ToString() + " minute(s) ago";
                }
                else if (diffResult.Hours == 1)
                    result = "about an hour ago";
                else
                    result = diffResult.Hours.ToString() + " hour(s) ago";
            }
            else if (diffResult.Days == 1)
                result = "Yesterday";
            else
            {
                if (dt.Year == DateTime.Now.Year)
                    result = GetMonth(dt.Month) + " " + dt.Day + " at " + dt.ToString("hh:mm tt");
                else
                    result = GetMonth(dt.Month) + " " + dt.Day + ", " + dt.Year;
            }

            return result;
        }

        public static string GetMonth(int i)
        {
            string month = "";
            switch (i)
            {
                case 1:  month = "Jan"; break;
                case 2:  month = "Feb"; break;
                case 3:  month = "Mar"; break;
                case 4:  month = "Apr"; break;
                case 5:  month = "May"; break;
                case 6:  month = "Jun"; break;
                case 7:  month = "Jul"; break;
                case 8:  month = "Aug"; break;
                case 9:  month = "Sept"; break;
                case 10: month = "Oct"; break;
                case 11: month = "Nov"; break;
                case 12: month = "Dec"; break;
            }
            return month;
        }
    }
}