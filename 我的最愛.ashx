<%@ WebHandler Language="C#" Class="我的最愛" %>

using System;
using System.Web;

public class 我的最愛 : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        if (context.Request.Cookies["我的最愛"] == null)
        {
            context.Response.Redirect("Default2.aspx");
        }
        else
        {
            string id = context.Request.Cookies["我的最愛"].Value;
            string url = string.Format("訊息.aspx?qid={0}", id);
            context.Response.Redirect(url);
        }

        //context.Response.ContentType = "text/plain";
        //context.Response.Write(id);



    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}