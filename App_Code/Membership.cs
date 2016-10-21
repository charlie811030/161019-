using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Membership 的摘要描述
/// </summary>
public class pubsMembership
{
   public static bool CreateUser(string username, string password, out string errMessage)
    {
        bool result = false;
        errMessage = string.Empty;

        //加入會員
        Member member = new Member();
        member.UserName = username;
        member.PassWord = password;

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
}