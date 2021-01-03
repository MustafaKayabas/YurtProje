using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Proje
{
    public partial class deneme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Button btndeneme = new Button();
            btndeneme.CssClass = "deneme";
            btndeneme.Text = "deneme";
            btndeneme.Click += new EventHandler(btnDeneme_Click);
            genel.Controls.Add(btndeneme);
        }
        protected void btnDeneme_Click(object sender, EventArgs e)
        {
            Response.Redirect("Anasayfa.aspx");
        }
    }
}