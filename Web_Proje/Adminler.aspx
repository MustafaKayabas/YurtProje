<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminler.aspx.cs" Inherits="Web_Proje.Adminler" %>


<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yurt Bul | Üniversitene en yakın yurtları bul!</title>
    <meta charset="UTF-8">

  <link href="img/favicon.ico" rel="shortcut icon" />

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900%7cRoboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">


    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/slicknav.min.css" />
    <link rel="stylesheet" href="css/login.css" />
    <link href="main.css" rel="stylesheet" />

    <!-- Main Stylesheets -->
    <link rel="stylesheet" href="css/style.css" />



    <!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

    <script type="text/javascript">
        // Prevent dropdown menu from closing when click inside the form
        $(document).on("click", ".navbar-right .dropdown-menu", function (e) {
            e.stopPropagation();
        });
        function btn_tikla_Click() {
            document.getElementById("Message").innerHTML = "fdsafdsafsadfsad";
        }
    </script>

</head>
<body>

          <form runat="server">
     
          <asp:Button ID="Button3" CssClass="btnGeriDon" runat="server" Text="Anasayfaya Dön" OnClick="btn_AnasayfaGeriDon_Click"/>
              <asp:Button ID="btnEkle" runat="server" Text="Ekle" OnClick="btn_Ekle_Click"/>

             <div id="ListeleEkle" runat="server" style="opacity:0.9; width: 80%; float: left; height: 750px; background-color: white;margin-top:5%; margin-left: 10%;display:none">
                    <div class="LeftList">
                        <asp:Label ID="Label8" CssClass="lbldetay" runat="server" Text="Yurt İsmi"></asp:Label><br />
                    <asp:TextBox ID="txtEkleAd" CssClass="txtdetay" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label9" CssClass="lbldetay" runat="server" Text="Cinsiyet"></asp:Label><br />
                    <asp:DropDownList ID="txtEkleCinsiyet" CssClass="txtdetay" runat="server"></asp:DropDownList><br />
                    <asp:Label ID="Label10" CssClass="lbldetay" runat="server" Text="Şehir"></asp:Label><br />
                    <asp:DropDownList ID="txtEkleSehir" CssClass="txtdetay" runat="server"></asp:DropDownList>    <br/>
                    <asp:Label ID="Label11" CssClass="lbldetay" runat="server" Text="Yurt Adresi"></asp:Label> <br/>
                        <asp:TextBox ID="txtEkleAdres" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                    <asp:Label ID="Label12" CssClass="lbldetay" runat="server" Text="Telefon Numarası"></asp:Label> <br/>
                        <asp:TextBox ID="txtEkleTelNo" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                    <asp:Label ID="Label13" CssClass="lbldetay" runat="server" Text="E-Mail Adresi"></asp:Label> <br/>
                        <asp:TextBox ID="txtEkleEmail" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                    <asp:Label ID="Label14" CssClass="lbldetay" runat="server" Text="Toplam Oda Sayısı"></asp:Label> <br/>
                        <asp:TextBox ID="txtEkleOdaSayisi" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                        </div>
                     <div class="RightList">
                              <div style="width:90%;height:25px;  font-weight:550">ORTAK ALANLAR</div>
                    <div >
                       <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Spor Salonu</th>
                            <th>Fitness Salonu</th>
                            <th>Havuz</th>
                            <th>Müzik Odası</th>

                        </tr>
                           
                        <tr>
                            <td>  <asp:DropDownList ID="EkleSporSalonu" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                            <td>  <asp:DropDownList ID="EkleFitnesSalonu" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                            <td>  <asp:DropDownList ID="EkleHavuz" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                             <td>  <asp:DropDownList ID="EkleMuzikOdasi" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                        </tr>
                       
                        </table>


                    </div>


                  <div style="width:90%;height:25px;  font-weight:550;margin-top:30px">HİZMETLER</div>
                    <div>
                        <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Oda Temizliği(Haftada)</th>
                            <th>Çamaşırhane</th>
                            <th>Akşam Yemeği(Her Gün)</th>
                            <th>Kahvaltı(Her Gün)</th>

                        </tr>
                           
                        <tr>
                            <td style="font-weight:550;font-size:18px;"> <asp:TextBox ID="EkleOdaTemizlik" runat="server"></asp:TextBox> Kez</td>
                            <td><asp:DropDownList ID="EkleCamasirhane" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                            <td><asp:DropDownList ID="EkleAksamYemegi" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                             <td><asp:DropDownList ID="EkleKahvalti" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                        </tr>
                       
                        </table>
                    </div>
                     <div style="width:90%;height:25px;  font-weight:550;margin-top:30px">FİYATLAR(YILLIK)</div>
                    <div>
                           <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Tek Kişilik Odalar</th>
                            <th>İki Kişilik Odalar</th>
                            <th>Üç Kişilik Odalar</th>
                            <th>Dört Kişilik Odalar</th>

                        </tr>
                           
                        <tr>
                            <td><asp:TextBox ID="EkletekKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                            <td><asp:TextBox ID="EkleikiKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                            <td><asp:TextBox ID="EkleucKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                             <td><asp:TextBox ID="EkledortKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                        </tr>
                       
                        </table>
                    </div>
                          <asp:Label ID="lblEkleUyari" runat="server" Text=""></asp:Label>
                   <asp:Button ID="Button2" CssClass="btnGeriDon" OnClick="btnEkleGeriDon_Click" runat="server" Text="Geri Dön" />  <asp:Button ID="btnYurtEkle" CssClass="btnDetayGuncelle" OnClick="btn_YurtEkle_Click" runat="server" Text="Ekle" />



                     </div>



             </div>
            <div id="ListeleAlan" runat="server" style="opacity:0.9; width: 80%; float: left; height: 750px; background-color: white; margin-left: 10%">
                 


            </div>
                  
            <div id="YurtListeleAlan" runat="server" style="float: left;opacity:0.9; width: 90%; height: 750px; background-color: white; margin-left: 10%; padding: 2%;display:none">
                <div class="LeftList">
                    <asp:Label ID="Label1" CssClass="lbldetay" runat="server" Text="Yurt İsmi"></asp:Label><br />
                    <asp:TextBox ID="txtYurtAd" CssClass="txtdetay" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label2" CssClass="lbldetay" runat="server" Text="Cinsiyet"></asp:Label><br />
                    <asp:DropDownList ID="YurtCinsiyet" CssClass="txtdetay" runat="server"></asp:DropDownList><br />
                    <asp:Label ID="Label3" CssClass="lbldetay" runat="server" Text="Şehir"></asp:Label><br />
                        <asp:TextBox ID="txtYurtSehir" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                    <asp:Label ID="Label4" CssClass="lbldetay" runat="server" Text="Yurt Adresi"></asp:Label> <br/>
                        <asp:TextBox ID="txtAdres" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                    <asp:Label ID="Label5" CssClass="lbldetay" runat="server" Text="Telefon Numarası"></asp:Label> <br/>
                        <asp:TextBox ID="txtTelNo" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                    <asp:Label ID="Label6" CssClass="lbldetay" runat="server" Text="E-Mail Adresi"></asp:Label> <br/>
                        <asp:TextBox ID="txtEmail" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                    <asp:Label ID="Label7" CssClass="lbldetay" runat="server" Text="Toplam Oda Sayısı"></asp:Label> <br/>
                        <asp:TextBox ID="txtOdaSayisi" CssClass="txtdetay" runat="server"></asp:TextBox>    <br/>
                </div>

                <div class="RightList">
                    <div style="width:90%;height:25px;  font-weight:550">ORTAK ALANLAR</div>
                    <div >
                       <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Spor Salonu</th>
                            <th>Fitness Salonu</th>
                            <th>Havuz</th>
                            <th>Müzik Odası</th>

                        </tr>
                           
                        <tr>
                            <td>  <asp:DropDownList ID="sporSalonu" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                            <td>  <asp:DropDownList ID="fitnesSalonu" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                            <td>  <asp:DropDownList ID="havuz" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                             <td>  <asp:DropDownList ID="muzikOdasi" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                        </tr>
                       
                        </table>


                    </div>


                  <div style="width:90%;height:25px;  font-weight:550;margin-top:30px">HİZMETLER</div>
                    <div>
                        <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Oda Temizliği(Haftada)</th>
                            <th>Çamaşırhane</th>
                            <th>Akşam Yemeği(Her Gün)</th>
                            <th>Kahvaltı(Her Gün)</th>

                        </tr>
                           
                        <tr>
                            <td style="font-weight:550;font-size:18px;"> <asp:TextBox ID="txtOdaTemizligi" runat="server"></asp:TextBox> Kez</td>
                            <td><asp:DropDownList ID="camasirhane" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                            <td><asp:DropDownList ID="aksamYemegi" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                             <td><asp:DropDownList ID="kahvalti" CssClass="dropdowndetay" runat="server"></asp:DropDownList></td>
                        </tr>
                       
                        </table>
                    </div>
                     <div style="width:90%;height:25px;  font-weight:550;margin-top:30px">FİYATLAR(YILLIK)</div>
                    <div>
                           <table cellpadding="15" cellspacing="25" border="2">
                        <tr>
                            <th>Tek Kişilik Odalar</th>
                            <th>İki Kişilik Odalar</th>
                            <th>Üç Kişilik Odalar</th>
                            <th>Dört Kişilik Odalar</th>

                        </tr>
                           
                        <tr>
                            <td><asp:TextBox ID="tekKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                            <td><asp:TextBox ID="ikiKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                            <td><asp:TextBox ID="ucKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                             <td><asp:TextBox ID="dortKisilik" CssClass="txtdetay" runat="server"></asp:TextBox> </td>
                        </tr>
                       
                        </table>
                    </div>
                    <asp:Label ID="lblUyari" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnDetayGeri" CssClass="btnGeriDon" OnClick="btnDetayGeriDon_Click" runat="server" Text="Geri Dön" />
                    <asp:Button ID="Button1" CssClass="btnDetayGuncelle" OnClick="btn_Guncelle_Click" runat="server" Text="GÜNCELLE" />
                </div>
               
            </div>
   
       

</form>
              

       
        
        

    
</body>
</html>
