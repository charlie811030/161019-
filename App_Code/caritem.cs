using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class caritem
{
    //取得產品採購資訊(編號,價格,數量,小計)
    public string Title_Id { get; set; }  //編號
    public string Calendar { get; set; }  //產品名稱
    public decimal price { get; set; }   //價格
    public int Quanty { get; set; } //數量
    public decimal SubTotal {
        get
        {
            return this.price * this.Quanty;
        }
    }  //小計




}