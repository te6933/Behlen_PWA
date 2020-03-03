<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubSavings.aspx.cs" Inherits="AimEmp_PWA.SubSavings" %>

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
        .auto-style5 {
            
            font-family:Arial;
            font-size:medium;
            width: 100%;
            margin:10px 0;
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
            <asp:Button ID="ReturnListButton" runat ="server" Text="Return to Detail Results" OnClick="ReturnListButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
            <asp:Button ID="BackToSummary" runat="server" Text="Back To Summary" OnClick="BackToSummary_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
        </div>
        <div id="Screen2" runat="server" >
            <div class="auto-style1">
                   <h3 id="h2E"  runat="server" >Cost Savings</h3>
                   <h3 id="h2S" runat="server" visible="false">Ahorro de costes</h3>
            </div>
            <div class="auto-style1">
                <asp:Table runat="server" BorderStyle="Solid" Width="100%">
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="IdeaLabelE" Text="AIM Idea Number:"  runat="server" ></asp:Label>
                            <asp:Label ID="IdeaLabelS" Text="AIM Numero de Idea:" Visible="false" runat="server"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="IdeaNumber" runat="server" ReadOnly="true" Width="95%" CssClass="form-control text-box"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="LocE" Text="Location:" runat="server" ></asp:Label>
                            <asp:Label ID="LocS" Text="Ubicación:" runat="server" Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="SavingLocationBox" runat="server" ReadOnly="true" Width="95%" CssClass="form-control text-box"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="EstSaveLabelE" Text="Estimated Savings:"  runat ="server"></asp:Label>
                            <asp:Label ID="EstSaveLabelS" Text="Ahorros Estimados:" Visible="false" runat ="server" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="EstSaving" runat="server" ReadOnly="true" Width="95%" CssClass="form-control text-box"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="RateLabelE"  runat="server" Text="Hourly Rate:" ></asp:Label>
                            <asp:Label ID="RateLabelS" Visible="false" runat="server" Text="Tarifa por hora:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="RateBox" runat="server" ReadOnly="true"  Width="95%" CssClass="form-control text-box" ></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" auto-style1">
                            <asp:Label ID="PieceHdrE" runat="server" Text="Savings BY PIECE:"></asp:Label>
                            <asp:Label ID="PieceHdrS" Visible="false" runat="server" Text="Ahorros POR PIEZA:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="PieceMinE"  runat="server" Text="Minutes per Piece:" ></asp:Label>
                            <asp:Label ID="PieceMinS" Visible="false" runat="server" Text="Minutos por pieza:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="MinPerPiece" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" ></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="PieceYRE"  runat="server" Text="Pieces per year:" ></asp:Label>
                            <asp:Label ID="PieceYRS" Visible="false" runat="server" Text="Piezas Anuales:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="PiecesPerYear" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="PieceSavingE" runat="server" Text="Annual Savings:" ></asp:Label>
                            <asp:Label ID="PieceSavingS" runat="server" Visible="false" Text="Ahorros Anuales:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="AnnualPieceSaving" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" ></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" auto-style1">
                            <asp:Label ID="TimeHdrE" runat="server" Text="Savings by TIME or LABOR:" ></asp:Label>
                            <asp:Label ID="TimeHdrS" Visible="false" runat="server" Text="Ahorros por TIEMPO o MANO DE OBRA:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="TimeMinDayE"  runat="server" Text="Minutes saved per day:" ></asp:Label>
                            <asp:Label ID="TimeMinDayS" Visible="false" runat="server" Text="Minutos ahorrado por dia:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="SavingsPerDay" runat="server" ReadOnly="true" CssClass="form-control text-box"  Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="TimeMinWeekE"  runat="server" Text="Minutes saved per week:" ></asp:Label>
                            <asp:Label ID="TimeMinWeekS" Visible="false" runat="server" Text="Minutos ahorrado por semana:" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="SavingPerWeek" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" ></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="TimeSavingsE" runat="server" Text="Annual Savings:" ></asp:Label>
                            <asp:Label ID="TimeSavingsS" runat="server" Visible="false" Text="Ahorros Anuales:"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="AnnualTimeSavings" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" ></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="4" CssClass=" auto-style1">
                            <asp:Label ID="ScrapHdrE" runat="server" Text="Savings by SCRAP REDUCTION:" ></asp:Label>
                            <asp:Label ID="ScrapHdrS" Visible="false" runat="server" Text="Ahorros poro medio de REDUCCION de CHATARRA:"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="ScrapDollE"  runat="server" Text="$ saved per piece scrap:" ></asp:Label>
                            <asp:Label ID="ScrapDollS" Visible="false" runat="server" Text="$ ahorro por pieza de chatarra:" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="ScrapDollars" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" ></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="ScrapPieceE"  runat="server" Text="Pieces per year:" ></asp:Label>
                            <asp:Label ID="ScrapPieceS" Visible="false" runat="server" Text="Piezas por año:" ></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="ScrapPieceCnt" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="ScrapSavingsE" runat="server" Text="Annual Savings:" ></asp:Label>
                            <asp:Label ID="ScrapSavingsS" runat="server" Visible="false" Text="Ahorros Anuales:"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="AnnualScrapSavings" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" auto-style1">
                            <asp:Label ID="OtherE" runat="server" Text="Other Savings" ></asp:Label>
                            <asp:Label ID="OtherS" runat="server" Text="Otros ahorros" Visible="false"  ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="OtherYearE" runat="server" Text="Other savings per year:" ></asp:Label>
                            <asp:Label ID="OtherYearS" runat="server" Text="Otros ahorros por año:" Visible="false" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="OtherYear" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"> </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="HoursE" Text="Hours Estimate:"></asp:Label>
                            <asp:Label runat="server" ID="HoursS" Text="Horario estimado:" Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="HoursEst" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label ID="OtherOneE" runat="server" Text="Other one time savings"></asp:Label>
                            <asp:Label ID="OtherOneS" runat="server" Text="Otros ahorros únicos"  Visible="false" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="OtherOne" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%" > </asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="MatE" Text="Materials Estimate"></asp:Label>
                            <asp:Label runat="server" ID="MatS" Text="Estimación de materiales" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="MaterialEst" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="VerE" Text="Verified By"></asp:Label>
                            <asp:Label runat="server" ID="VerS" Text="Verificada por" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="VerifiedBox" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="CompE" Text="Computed at time of entry"></asp:Label>
                            <asp:Label runat="server" ID="CompS" Text="Calculado al momento de la entrada" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="InitialEntryBox" runat="server" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="CommentE" Text="Comments"></asp:Label>
                            <asp:Label runat="server" ID="CommentS" Text="Comentarios" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="SavingComments" runat="server" ReadOnly="true" TextMode="MultiLine" CssClass="form-control text-box" Width="95%" Height="85px"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4" CssClass=" aim-label label-primary">
                            <asp:Label runat="server" ID="RevE" Text="Reviewer Comments"></asp:Label>
                            <asp:Label runat="server" ID="RevS" Text="Comentarios de los revisores" Visible="false"></asp:Label>
                        </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="4">
                            <asp:TextBox ID="ReviewCommentsBox" runat="server" Height="85px" TextMode="MultiLine" ReadOnly="true" CssClass="form-control text-box" Width="95%"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
        
        <asp:HiddenField ID="returnlink" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="savedCriteria" runat="server"></asp:HiddenField>

        <p style="text-align:right" id="scree2bottom" runat="server" >
            
        
            <asp:Button ID="BackToIdea" runat="server" Text="Back To Idea" OnClick="BackToIdeaButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="PreInvest" runat="server" Text="Preliminary Investigation" OnClick="PreInvest_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="BonusButton2" runat="server" Text="Bonus" OnClick="BonusButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="PointsButton3" runat="server" Text="Points" OnClick="PointsButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            <asp:Button ID="DocuButton3" runat="server" Text="Documents" OnClick="DocumentButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
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