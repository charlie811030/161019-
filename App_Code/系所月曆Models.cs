﻿//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Member
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Member()
    {
        this.Orders = new HashSet<Order>();
    }

    public string UserName { get; set; }
    public string HashPassWord { get; set; }
    public Nullable<int> phonenumber { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Order> Orders { get; set; }
}

public partial class Order
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Order()
    {
        this.Order_Details = new HashSet<Order_Details>();
    }

    public string Id { get; set; }
    public string Username { get; set; }
    public System.DateTime CreateDate { get; set; }
    public string OrderAddr { get; set; }
    public string OrderPhone { get; set; }
    public string ShipAddr { get; set; }
    public string ShipPhone { get; set; }

    public virtual Member Member { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Order_Details> Order_Details { get; set; }
}

public partial class Order_Details
{
    public string OrderId { get; set; }
    public string Title_Id { get; set; }
    public int Qty { get; set; }

    public virtual Order Order { get; set; }
}
