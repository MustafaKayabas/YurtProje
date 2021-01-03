﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows;

namespace Web_Proje
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        public string kAdi = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            IsLogin.adminmi = false;
           

            if (IsLogin.Login==true)
            {
                DbOperation db = new DbOperation();
                temizle.Style.Add("display", "none;");
                getir.Style.Add("display", "inline");
                DataTable isimGetir = db.Listele("select personName,personLastName from tbl_User where nickName='" + IsLogin.KAdi + "'");
                lbl_loginGiris.Text = isimGetir.Rows[0]["personName"].ToString() + " " + isimGetir.Rows[0]["personLastName"].ToString();
            }
        }



        protected void btn_GirisYap_Click(object sender, EventArgs e)
        {
            DbOperation db = new DbOperation();

            DataTable girisYap = db.Listele("select dbo.fn_login('" + txt_KAdi.Text + "','" + txt_Parola.Text + "') as result");
            DataTable adminmi = db.Listele("select * from tbl_User where userType='A' and nickName='"+ txt_KAdi.Text + "' and password='"+ txt_Parola.Text + "'");
            if (Convert.ToChar(girisYap.Rows[0]["result"]) == 'E')
            {
                if (adminmi.Rows.Count>0)
                {
                    IsLogin.KAdi = txt_KAdi.Text;
                    IsLogin.Login = true;
                    IsLogin.adminmi = true;
                    Response.Redirect("Adminler.aspx");
                }
                else
                {

              
                temizle.Style.Add("display", "none;");
                getir.Style.Add("display", "inline");
                DataTable isimGetir = db.Listele("select personName,personLastName from tbl_User where nickName='" + txt_KAdi.Text + "'");

                lbl_loginGiris.Text = isimGetir.Rows[0]["personName"].ToString() + " " + isimGetir.Rows[0]["personLastName"].ToString();
                IsLogin.KAdi = txt_KAdi.Text;
                IsLogin.Login = true;
                    Response.Redirect("Anasayfa.aspx");
                }

            }
        }

        protected void btn_CikisYap_Click(object sender, EventArgs e)
        {
            temizle.Style.Add("display", "inline;");
            getir.Style.Add("display", "none");
          
            uyeOL.Style.Add("float", "right");
            IsLogin.Login = false;
            Response.Redirect("Anasayfa.aspx");
        }
    }
}