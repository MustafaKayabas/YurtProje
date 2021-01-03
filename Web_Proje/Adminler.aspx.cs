using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Proje
{
    public partial class Adminler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsLogin.adminmi == false) {
                Response.Redirect("Anasayfa.aspx");
            }


            if (YurtCinsiyet.Items.Count == 0 || YurtCinsiyet.Items.Count == 1)
            {
                YurtCinsiyet.Items.Add("Kız");
                YurtCinsiyet.Items.Add("Erkek");
            }

            if (txtEkleCinsiyet.Items.Count == 0 || txtEkleCinsiyet.Items.Count == 1)
            {
                txtEkleCinsiyet.Items.Add("Kız");
                txtEkleCinsiyet.Items.Add("Erkek");
            }



            DbOperation listdb = new DbOperation();

            DataTable yurtListele = listdb.Listele("select Dr.dormNo,Dr.dormName, "
               + "case gender when 'E' then 'Erkek' when 'K' then 'Kız' end as gender, "
               + "cityName, roomCount "
               + "from tbl_Dormitory Dr, tbl_DormitoryCharge DrCh, tbl_DormitoryContact DrCo, "
               + "tbl_DormitoryPublicPlaces DrPu, tbl_DormitoryServices DrSe, tbl_City Ci "
               + " where Dr.dormNo = DrCh.dormNo "
               + "and   Dr.dormNo = DrCo.dormNo "
               + "and   Dr.dormNo = DrPu.dormNo "
               + "and   Dr.dormNo = DrSe.dormNo "
               + "and   Dr.cityNo = Ci.cityNo ");
            for (int i = 0; i < yurtListele.Rows.Count; i++)
            {


                Panel pnlKutu = new Panel();
                pnlKutu.CssClass = "Obje";





                Panel pnlAd = new Panel();
                pnlAd.CssClass = "pnlyurt";
                Label lblyurtadi = new Label();
                lblyurtadi.Text = "YurtAdi:" + yurtListele.Rows[i]["dormName"].ToString();
                pnlAd.Controls.Add(lblyurtadi);
                pnlKutu.Controls.Add(pnlAd);



                Panel pnlCinsiyet = new Panel();
                pnlCinsiyet.CssClass = "pnlyurt";
                Label lblYurtCinsiyet = new Label();
                lblYurtCinsiyet.Text = yurtListele.Rows[i]["gender"].ToString() + " Yurdu";
                pnlCinsiyet.Controls.Add(lblYurtCinsiyet);
                pnlKutu.Controls.Add(pnlCinsiyet);




                Panel pnlSehir = new Panel();
                pnlSehir.CssClass = "pnlyurt";
                Label lblYurtSehir = new Label();
                lblYurtSehir.Text = yurtListele.Rows[i]["cityName"].ToString(); ;
                pnlSehir.Controls.Add(lblYurtSehir);
                pnlKutu.Controls.Add(pnlSehir);


                Panel pnlOdaSayisi = new Panel();
                pnlOdaSayisi.CssClass = "pnlyurt";
                Label lblOdaSayisi = new Label();
                lblOdaSayisi.Text = "Oda Sayisi:" + yurtListele.Rows[i]["roomCount"].ToString();
                pnlOdaSayisi.Controls.Add(lblOdaSayisi);
                pnlKutu.Controls.Add(pnlOdaSayisi);


                Button btnIncele = new Button();
                btnIncele.CssClass = "Box";
                btnIncele.Text = "incele";
                btnIncele.ID = yurtListele.Rows[i]["dormName"].ToString();
                btnIncele.Click += new EventHandler(YurtDetay_Click);


                Button btnSil = new Button();
                btnSil.CssClass = "DeleteBox";
                btnSil.Text = "Sil";
                btnSil.ID = yurtListele.Rows[i]["dormNo"].ToString();
                btnSil.Click += new EventHandler(YurtSil_Click);



                pnlKutu.Controls.Add(btnSil);
                pnlKutu.Controls.Add(btnIncele);
                ListeleAlan.Controls.Add(pnlKutu);
            }

        }

        protected void btn_AnasayfaGeriDon_Click(object sender, EventArgs e)
        {
            IsLogin.adminmi = false;
            IsLogin.Login = false;
            Response.Redirect("Anasayfa.aspx");
        }

            protected void YurtDetay_Click(object sender, EventArgs e)
        {
    
            Button clickedButton = (Button)sender;
            ListeleAlan.Style.Add("display", "none");
            YurtListeleAlan.Style.Add("display", "inline;");
            btnEkle.Style.Add("display", "none");
            YurtDetayGetir(clickedButton.ID);
            DbOperation.yurtname = clickedButton.ID;
            lblUyari.Text = "";
        }
        protected void btnDetayGeriDon_Click(object sender, EventArgs e)
        {
            ListeleAlan.Style.Add("display", "inline");
            YurtListeleAlan.Style.Add("display", "none;");
            btnEkle.Style.Add("display", "inline");
        }
        protected void btnEkleGeriDon_Click(object sender, EventArgs e)
        {
            ListeleAlan.Style.Add("display", "inline");
            ListeleEkle.Style.Add("display", "none;");
            btnEkle.Style.Add("display", "inline");
        }



        protected void YurtSil_Click(object sender, EventArgs e)
        {

            Button clickedButton = (Button)sender;
            DbOperation db = new DbOperation();

            string sorgu = ""
           +" delete from tbl_DormitoryContact where dormNo = "+ clickedButton.ID + ";"
           +" delete from tbl_DormitoryCharge where dormNo = "+ clickedButton.ID + ";"
          +"  delete from tbl_DormitoryPublicPlaces where dormNo = "+ clickedButton.ID + ";"
          +"  delete from tbl_DormitoryServices where dormNo = "+ clickedButton.ID + "; "
           + "delete from tbl_Dormitory where dormNo = " + clickedButton.ID + ";";
            db.UIDSorgu(sorgu);
        }

        protected void btn_Ekle_Click(object sender, EventArgs e)
        {
            ListeleAlan.Style.Add("display", "none");
            ListeleEkle.Style.Add("display", "inline;");
            btnEkle.Style.Add("display", "none");
            DbOperation listdb = new DbOperation();
            DataTable list = listdb.Listele("select * from tbl_City");

            for (int i = 0; i < list.Rows.Count; i++)
            {
                txtEkleSehir.Items.Add(list.Rows[i]["cityName"].ToString());
            }
            YurtEkleDetay();

        }


            protected void btn_Guncelle_Click(object sender, EventArgs e)
        {
            string gender = "";
            if (YurtCinsiyet.SelectedItem.Text == "Erkek")
            {
                gender = "E";
            }
            else
            {
                gender = "K";
            }
            
            string sehir = txtYurtSehir.Text;
            string adres = txtAdres.Text;
            string telNo = txtTelNo.Text;
            string EMail = txtEmail.Text;
            int odaSayisi = Convert.ToInt32(txtOdaSayisi.Text);
            int tekkisilik = Convert.ToInt32(tekKisilik.Text);
            int ikikisilik = Convert.ToInt32(ikiKisilik.Text);
            int uckisilik = Convert.ToInt32(ucKisilik.Text);
            int dortkisilik = Convert.ToInt32(dortKisilik.Text);
            int sporsalonu = 0;

            if (sporSalonu.SelectedItem.Text == "Var")
            {
                sporsalonu = 1;
            }
            else
            {
                sporsalonu = 0;
            }


            int fitnessalonu = 0;
            if (fitnesSalonu.SelectedItem.Text == "Var")
            {
                fitnessalonu = 1;
            }
            else
            {
                fitnessalonu = 0;
            }

            int havuzS = 0;
            if (havuz.SelectedItem.Text == "Var")
            {
                havuzS = 1;
            }
            else
            {
                havuzS = 0;
            }

            int muzikodasi = 0;
            if (muzikOdasi.SelectedItem.Text == "Var")
            {
                muzikodasi = 1;
            }
            else
            {
                muzikodasi = 0;
            }

            int odatemizligi = Convert.ToInt32(txtOdaTemizligi.Text);

            int camasirhaneS = 0;

            if (camasirhane.SelectedItem.Text == "Var")
            {
                camasirhaneS = 1;
            }
            else
            {
                camasirhaneS = 0;
            }

            int aksamyemegi = 0;


            if (aksamYemegi.SelectedItem.Text == "Var")
            {
                aksamyemegi = 1;
            }
            else
            {
                aksamyemegi = 0;
            }

            int kahvaltiS = 0;

            if (kahvalti.SelectedItem.Text == "Var")
            {
                kahvaltiS = 1;
            }
            else
            {
                kahvaltiS = 0;
            }


            DbOperation db = new DbOperation();
            DataTable yurtTable = db.Listele("select * from tbl_Dormitory where dormName='"+ DbOperation.yurtname + "'");
            int yurtId = Convert.ToInt32(yurtTable.Rows[0]["dormNo"]);

            string sorgu1 = "update tbl_Dormitory set gender='"+ gender + "' , roomCount="+odaSayisi+" where dormNo="+ yurtId + "";
            db.UIDSorgu(sorgu1);

            string sorgu2 = "update tbl_DormitoryContact set dormAddress='"+ adres + "', dormPhone='"+ telNo + "', dormEmailAddress='"+ EMail + "' where dormNo="+ yurtId + "";
            db.UIDSorgu(sorgu2);

            string sorgu3 = "update  tbl_DormitoryCharge set onePersonRoomCharge="+ tekkisilik + " , twoPersonRoomCharge="+ ikikisilik + " , threePersonRoomCharge="+ uckisilik + " , fourPersonRoomCharge="+ dortkisilik + " where dormNo="+ yurtId + "";
            db.UIDSorgu(sorgu3);

            string sorgu4 = "update tbl_DormitoryPublicPlaces set sportsArea="+ sporsalonu + ", gym="+ fitnessalonu + ", pool="+ havuzS + ",musicRoom="+ muzikodasi + " where dormNo="+ yurtId + "";
            db.UIDSorgu(sorgu4);

            string sorgu5 = "update tbl_DormitoryServices set roomCleaningDayWeekly="+ odatemizligi + ", laundryRoom="+ camasirhaneS + ", eveningDinner="+ aksamyemegi + ",breakfast="+ kahvaltiS+" where dormNo="+ yurtId + "";

            db.UIDSorgu(sorgu5);


            lblUyari.Text = "Yurt bilgileri başarılı bir şekilde güncellendi !";
            
;        }

        public void YurtEkleDetay()
        {
            EkleSporSalonu.Items.Add("Var");
            EkleSporSalonu.Items.Add("Yok");

            EkleFitnesSalonu.Items.Add("Var");
            EkleFitnesSalonu.Items.Add("Yok");

            EkleHavuz.Items.Add("Var");
            EkleHavuz.Items.Add("Yok");

            EkleMuzikOdasi.Items.Add("Var");
            EkleMuzikOdasi.Items.Add("Yok");

            EkleCamasirhane.Items.Add("Var");
            EkleCamasirhane.Items.Add("Yok");

            EkleAksamYemegi.Items.Add("Var");
            EkleAksamYemegi.Items.Add("Yok");

            EkleKahvalti.Items.Add("Var");
            EkleKahvalti.Items.Add("Yok");

        }
        public void YurtDetayGetir(string YurtName)
        {
            sporSalonu.Items.Add("Var");
            sporSalonu.Items.Add("Yok");

            fitnesSalonu.Items.Add("Var");
            fitnesSalonu.Items.Add("Yok");

            havuz.Items.Add("Var");
            havuz.Items.Add("Yok");

            muzikOdasi.Items.Add("Var");
            muzikOdasi.Items.Add("Yok");

            camasirhane.Items.Add("Var");
            camasirhane.Items.Add("Yok");

            aksamYemegi.Items.Add("Var");
            aksamYemegi.Items.Add("Yok");

            kahvalti.Items.Add("Var");
            kahvalti.Items.Add("Yok");

            DbOperation yurtdb = new DbOperation();
            DataTable yurtList = yurtdb.Listele("select * from dbo.fn_yurtGetir('" + YurtName + "')");
            txtYurtAd.Text = yurtList.Rows[0]["dormName"].ToString();
            YurtCinsiyet.Text = yurtList.Rows[0]["gender"].ToString();
            txtYurtSehir.Text = yurtList.Rows[0]["cityName"].ToString();
            txtAdres.Text = yurtList.Rows[0]["dormAddress"].ToString();
            txtTelNo.Text = yurtList.Rows[0]["dormPhone"].ToString();
            txtEmail.Text = yurtList.Rows[0]["dormEmailAddress"].ToString();
            txtOdaSayisi.Text = yurtList.Rows[0]["roomCount"].ToString();

            sporSalonu.Text=yurtList.Rows[0]["sportsArea"].ToString(); 
            fitnesSalonu.Text = yurtList.Rows[0]["gym"].ToString();
            havuz.Text = yurtList.Rows[0]["pool"].ToString();
            muzikOdasi.Text = yurtList.Rows[0]["musicRoom"].ToString();
            txtOdaTemizligi.Text = yurtList.Rows[0]["roomCleaningdayWeekly"].ToString();
            camasirhane.Text = yurtList.Rows[0]["laundryRom"].ToString();
            aksamYemegi.Text = yurtList.Rows[0]["eveningDinner"].ToString();
            kahvalti.Text = yurtList.Rows[0]["breakfast"].ToString();
            tekKisilik.Text = yurtList.Rows[0]["onePersonRoomCharge"].ToString();
            ikiKisilik.Text = yurtList.Rows[0]["twoPersonRoomCharge"].ToString() ;
            ucKisilik.Text = yurtList.Rows[0]["threePersonRoomCharge"].ToString() ;
            dortKisilik.Text = yurtList.Rows[0]["fourPersonRoomCharge"].ToString() ;

        }
        protected void btn_CikisYap_Click(object sender, EventArgs e)
        {
            /* temizle.Style.Add("display", "inline;");
             getir.Style.Add("display", "none");

             uyeOL.Style.Add("float", "right");*/
            IsLogin.Login = false;
        }
        protected void btn_YurtEkle_Click(object sender, EventArgs e)
        {
            DbOperation db = new DbOperation();

           
            string yurtAdi = txtEkleAd.Text;
            string yurtCinsiyet = "";
       
            if (txtEkleCinsiyet.SelectedItem.Text == "Erkek")
            {
                yurtCinsiyet = "E";
            }
            else
            {
                yurtCinsiyet = "K";
            }

            DataTable sehir= db.Listele("select * from tbl_City where cityName='"+ txtEkleSehir.SelectedItem.Text+ "'");
            int yurtSehir = Convert.ToInt32(sehir.Rows[0]["cityNo"]);
            string yurtAdres = txtEkleAdres.Text;
            string yurtTelNo = txtEkleTelNo.Text;
            string yurtMail = txtEkleEmail.Text;
            int  yurtOdaSayisi = Convert.ToInt32(txtEkleOdaSayisi.Text);
            int tekkisilik = Convert.ToInt32(EkletekKisilik.Text);
            int ikikisilik = Convert.ToInt32(EkleikiKisilik.Text);
            int uckisilik = Convert.ToInt32(EkleucKisilik.Text);
            int dortkisilik = Convert.ToInt32(EkledortKisilik.Text);

            int sporsalonu = 0;

            if (EkleSporSalonu.SelectedItem.Text == "Var")
            {
                sporsalonu = 1;
            }
            else
            {
                sporsalonu = 0;
            }


            int fitnessalonu = 0;
            if (EkleFitnesSalonu.SelectedItem.Text == "Var")
            {
                fitnessalonu = 1;
            }
            else
            {
                fitnessalonu = 0;
            }

            int havuzS = 0;
            if (EkleHavuz.SelectedItem.Text == "Var")
            {
                havuzS = 1;
            }
            else
            {
                havuzS = 0;
            }

            int muzikodasi = 0;
            if (EkleMuzikOdasi.SelectedItem.Text == "Var")
            {
                muzikodasi = 1;
            }
            else
            {
                muzikodasi = 0;
            }

            int odatemizligi = Convert.ToInt32(EkleOdaTemizlik.Text);

            int camasirhaneS = 0;

            if (EkleCamasirhane.SelectedItem.Text == "Var")
            {
                camasirhaneS = 1;
            }
            else
            {
                camasirhaneS = 0;
            }

            int aksamyemegi = 0;


            if (EkleAksamYemegi.SelectedItem.Text == "Var")
            {
                aksamyemegi = 1;
            }
            else
            {
                aksamyemegi = 0;
            }

            int kahvaltiS = 0;

            if (EkleKahvalti.SelectedItem.Text == "Var")
            {
                kahvaltiS = 1;
            }
            else
            {
                kahvaltiS = 0;
            }

            db.UIDSorgu("insert into tbl_Dormitory values('"+ yurtAdi + "', "+ yurtSehir + ", "+ yurtOdaSayisi + ", '"+ yurtCinsiyet + "');");

            DataTable yurtIdgetir = db.Listele("select dormNo from tbl_Dormitory where dormName='"+ yurtAdi + "'");
            int yurtId = Convert.ToInt32(yurtIdgetir.Rows[0]["dormNo"]);


            string insertsorgu= "insert into tbl_DormitoryServices values ("+ yurtId + ","+ odatemizligi + ","+ camasirhaneS + ","+ aksamyemegi + ","+ kahvaltiS + ");"
            +"insert into tbl_DormitoryPublicPlaces values("+ yurtId + ","+ sporsalonu + ","+ fitnessalonu + ","+havuzS+","+ muzikodasi + ");"
            +"insert into tbl_DormitoryCharge values("+ yurtId + ","+ tekkisilik + ","+ikikisilik+","+uckisilik+","+dortkisilik+");"
            +" insert into tbl_DormitoryContact values("+ yurtId + ",'"+ yurtAdres + "','"+ yurtTelNo + "','"+ yurtMail + "'); ";
            db.UIDSorgu(insertsorgu);
            lblEkleUyari.Text = "Yurt bilgileri başarılı bir şekilde eklendi !";

        }

        protected void btn_GirisYap_Click(object sender, EventArgs e)
        {
            /*DbOperation db = new DbOperation();

            DataTable girisYap = db.Listele("select dbo.fn_login('" + txt_KAdi.Text + "','" + txt_Parola.Text + "') as result");
            DataTable adminmi = db.Listele("select * from tbl_User where userType='A' and nickName='" + txt_KAdi.Text + "' and password='" + txt_Parola.Text + "'");
            if (Convert.ToChar(girisYap.Rows[0]["result"]) == 'E')
            {
                if (adminmi.Rows.Count > 0)
                {
                    IsLogin.KAdi = txt_KAdi.Text;
                    IsLogin.Login = true;
                    Response.Redirect("Panel.aspx");
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
            */
        }
    }
}