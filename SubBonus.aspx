<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubBonus.aspx.cs" Inherits="AimEmp_PWA.SubBonus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <script type="text/javascript">
      function BCloadIframe() {
  
        var result = 'XYZ';
        var tmp = [];
        var items = location.search.substr(1).split("&");
        for (var index = 0; index < items.length; index++) {
            tmp = items[index].split("=");
            if (tmp[0] === 'returnlink') result = decodeURIComponent(tmp[1]);
         }
        document.getElementById("returnlink").value = result;

        var ifrm = document.createElement('iframe');
        ifrm.width = "100%";
        ifrm.height = "122px";
        ifrm.id = "ramdonid";
        var link = 'http://intranet.behlenmfg.com/includefiles/intraheader.asp?imagefile=http://intranet.behlenmfg.com/images/corpBehlenmannamebluergb.png&returnlink=' + result;
        // assign url
          ifrm.setAttribute('src', link);
          const main = document.getElementById("strt");
          while (main.firstChild) main.firstChild.remove();
        document.getElementById("strt").appendChild(ifrm);
        //  document.getElementById("strt").innerHTML = document.getElementById("ramdonid").innerHTML;
        }
        </script>
    <style type="text/css">
        html { height:auto; width:auto; padding: 0; margin:0; }

        table {width:100%;
               border-style:solid;
        }
       .auto-style1{
            padding:5px 0;
            background-color: #D9E9FE;
            font-family:Arial;
           text-align:center;
        }
        .auto-style2 {
            background-color: #D9E9FE;
            font-family:Arial;
            font-size:medium;
 
            
        }
         .auto-style7 {
            width: 39px;
            height: 36px;
           
            
        }
         .nodispl2 {
            font-family:Arial;
            font-size:larger;
            background-color: #ff0000;
            visibility: hidden;
        }
         input {
             background-color: #EDF2F8;
         }
         .text-box{
             border-radius:5px;
             padding-left:5px;
             margin:5px;
         }
         .button-style{
             border-radius:5px;
             margin:5px 0;
             padding:5px;
         }
         .aim-back{
             background-color:rgb(0,94,184)
         }
         .white-back{
             background-color:white;
         }
         .aim-label{
            padding: .5em .6em;
            color: #fff;
            text-align: center;
            vertical-align: baseline;
            border-radius: .25em
         }
         #wrapper{
             width:100%;
         }
         .nav{
             position:fixed;
            display:inline-block;
            z-index:10;
            float:left;
            width:inherit;
         }
         .rowStyle{
             align-content:center;
             padding:5px;
         }
       
        </style>
   <link rel="manifest" href="./manifest1.webmanifest" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>


    <title>AIM Idea Search / Inquiry</title>
    </head>
<body class="container-fluid">
    
    <form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div class="nav white-back">
                    <a href="http://intranet.behlenmfg.com/Behlen_PWA/index.aspx">
                        <ul class="list-inline">
                            <li class="pull-left" style="margin-left:-2px;"><image style="height:80px; width:100px;" src="Images/Behlen_Logo_WBG.png" style="textalign:Left; vertical-align:Middle" /></li>
                            <li class="text-center" style="display:block; float:left"><h4 class="aim-label"></h4></li>
                            <li class="pull-right"  style="padding-right:40px;"><image style="height:80px; width:80px;" src="Images/AimLogo-192x192.png"/></li>
                        </ul> 
                    </a>
                </div>
            </div> 
            <div class="auto-style1" style="padding-top:90px;">
                   <h3 id="h1E"  runat="server" >AIM Idea Search / Inquiry<br /> Active Partner in Progress Data Only</h3>
                   <h3 id="h1S" runat="server" visible="false">AIM Búsqueda de ideas /<br /> inquriy - Datos de socio activo en curso solamente</h3>
                </div>
        <div id="returnDiv" runat="server" >
            <asp:Button ID="ReturnListButton" runat ="server" Text="Return to Detail Results" OnClick="ReturnListButton_Click"  class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="BackToSummary" runat="server" Text="Back To Summary" OnClick="BackToSummary_Click"  class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
        </div>
        <asp:HiddenField ID="returnlink" runat="server" ></asp:HiddenField>
        <asp:HiddenField ID="savedCriteria" runat="server" ></asp:HiddenField>
 
        <div id="Screen3" style="font-family:Arial;font-size:small;" runat="server">
                <div class="auto-style1">
                   <h3 id="hs3E"  runat="server" >Bonus Information</h3>
                   <h3 id="hs3S" runat="server" visible="false">Información de bonificación</h3>
                </div>
            <div class="auto-style1">
                <asp:Table runat="server" BorderStyle="Solid" Width="100%" >
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="Label1" Text="AIM Idea Number:"  runat="server"></asp:Label>
                            <asp:Label ID="Label2" Text="AIM Numero de Idea:" Visible="false" runat="server"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="IdeaNumberBonus" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="Label3" Text="Location:" runat="server"></asp:Label>
                             <asp:Label runat="server" ID="Label4" Text="Ubicación: " Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="LocationBonus" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="L1E" Text="Idea of the Month" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L1S" Text="Idea del Mes" Visible="false"></asp:Label>
                        </asp:TableCell >
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="IdeaOfTheMonthBox" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" MaxLength="1"></asp:TextBox>

                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="L2E" Text="Month" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L2S" Text="Mes" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="IdeaOfTheMonthMonth" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" MaxLength="4"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="L3E" Text="Year" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L3S" Text="Año" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="IdeaOfTheMonthYear" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" MaxLength="4" ></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Left">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="L4E" Text="Company Idea of the Month" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L4S" Text="Idea de empresa del mes" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="CoIdeaOfTheMonthBox" runat="server" ReadOnly="true" MaxLength="1" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="L5E" Text="Month" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L5S" Text="Mes" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="CoIdeaOfTheMonthMonth" runat="server" ReadOnly="true" MaxLength="4" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell >
                            <asp:Label runat="server" ID="L6E" Text="Year" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L6S" Text="Año" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="CoIdeaOfTheMonthYear" runat="server" ReadOnly="true" MaxLength="4" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="L7E" Text="Company Idea of the Year" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L7S" Text="Idea de empresa del año" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="CoIdeaOfTheYearBox" runat="server" ReadOnly="true" MaxLength="1" CssClass="form-control text-box" Width="95%"></asp:TextBox></asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell  ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="L8E" Text="Year" Visible="true"></asp:Label>
                            <asp:Label runat="server" ID="L8S" Text="Año" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="CoIdeaOfTheYearYear" runat="server" ReadOnly="true" MaxLength="4" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
        <p style="text-align:right" id="screen3bottom" runat="server" >
            <asp:Button ID="Button1" runat="server" Text="Back To Idea" OnClick="BackToIdeaButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="PreInvest" runat="server" Text="Preliminary Investigation" OnClick="PreInvest_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="Button2" runat="server" Text="Savings" OnClick="SavingsButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="Button3" runat="server" Text="Points" OnClick="PointsButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="Button4" runat="server" Text="Documents" OnClick="DocumentButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
        </p>


    </ContentTemplate>

    </asp:UpdatePanel>
    
    </form>
</body>
</html>
<script type="text/javascript">   
    function showPrint() {
        window.open('Print.aspx');
        docuemnt.getElementById('Print').style.display = 'none';
       
    }

 
</script>
