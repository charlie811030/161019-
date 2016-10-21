<%@ WebHandler Language="C#" Class="MyLike" %>

using System;
using System.Web;

public class MyLike : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        if (context.Request.Cookies["MyLike"] == null)
        {
               context.Response.Redirect("Default2.aspx");
        }
        else
        {
            string id = context.Request.Cookies["MyLike"].Value;
              //  context.Response.Write(id);
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