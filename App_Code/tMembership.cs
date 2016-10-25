using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Membership 的摘要描述
/// </summary>
public class tMembership
{
   public static bool CreateUser(string username, string password, int phonenumber, out string errMessage)
    {
        bool result = false;
        errMessage = string.Empty;

        //加入會員
        Member member = new Member();
        member.UserName = username;
        member.HashPassWord = GenHash(password);
        member.phonenumber = phonenumber;

        try
        {
            //加入至會員資料表
            系所月曆Entities db = new 系所月曆Entities();
            db.Members.Add(member);
            db.SaveChanges();
            result = true;

        }
     catch (Exception ex)
        {
            errMessage = ex.Message;
        }
        
        return result;
    }
   static string GenHash(string password)
    {
        string salt = BCrypt.Net.BCrypt.GenerateSalt(12);
        string hash = BCrypt.Net.BCrypt.HashPassword(password, salt);
        return hash;
    }
    public static bool VerifyUser(string username,string password)
      {
  
        //取得資料庫中使用者對應的HashPass
        string hashDb="";
        系所月曆Entities db = new 系所月曆Entities();
        Member user = db.Members.Find(username);
        if (user == null)
        {
            //會員不存在
            return false;

        }
        else
        {
            hashDb = user.HashPassWord;
        }
  

        //比對
        return  BCrypt.Net.BCrypt.Verify(password,hashDb);
    }
}