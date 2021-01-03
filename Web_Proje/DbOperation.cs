using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Windows;

namespace Web_Proje
{
    public class DbOperation
    {

        public static string yurtname = "";
        private string yol;
        public SqlConnection baglanti; // Bağlantı
        public DataTable tablo; // Tablo 
        public SqlDataAdapter adaptor; // 
        public SqlDataReader okuyucu;
        public SqlCommand komut;
        public void baglantiYap()
        {
            yol = "server=.; Initial Catalog=YurtData;Integrated Security=SSPI";
            baglanti = new SqlConnection(yol);
            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
               
            }
        }
        public  DataTable Listele(string sorgu)
        {

           
            baglantiYap();
       
            komut = new System.Data.SqlClient.SqlCommand(sorgu, baglanti);
            komut.ExecuteNonQuery();
            tablo = new DataTable();
            adaptor = new System.Data.SqlClient.SqlDataAdapter(komut);
            adaptor.Fill(tablo);
            baglanti.Close();
            return tablo;
        
        }
        public void UIDSorgu(string sorgu)
        {
            baglantiYap();
            komut = new System.Data.SqlClient.SqlCommand(sorgu, baglanti);
            komut.ExecuteNonQuery();
            baglanti.Close();
            baglanti.Dispose();

        }


    }
}