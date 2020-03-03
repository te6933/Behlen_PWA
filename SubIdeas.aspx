<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubIdeas.aspx.cs" Inherits="AimEmp_PWA.SubIdeas" %>

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
        </style>
   
    <link rel="manifest" href="./manifest1.webmanifest" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>

    <title>AIM Idea Search / Update</title>
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
                   <h3 runat="server" id="h1E" Visible ="true">AIM Idea Search / Inquiry - Active Partner in Progress Data Only</h3>
                   <h3 runat="server" id="h1S"  Visible ="false">AIM Búsqueda de ideas / inquriy - Datos de socio activo en curso solamente</h3>
            </div>
      <asp:Panel ID="Panel1" runat="server">
        <div class="auto-style2" id="searchDiv" runat="server">
                <asp:HiddenField ID="returnlink" runat="server"></asp:HiddenField>
             <asp:HiddenField ID="passemployee" runat="server"></asp:HiddenField>
             <asp:HiddenField ID="passtype" runat="server"></asp:HiddenField>
            <asp:Button ID="Button1" runat="server" Text="Return" OnClick="Button1_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True"/>
            </div>
            <div style="width:100%; font-family:Arial; font-size:small; height:475px; overflow:auto" id="gridDiv" runat="server" >
        
          <asp:GridView   ID="ideaGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="plIdea,plLocation,plStatus" CellPadding="5" BorderStle="Double"  BorderWidth="2px" ShowFooter="True" BackColor="#E7F1FE" OnRowDataBound = "OnRowDataBound" CssClass="table table-bordered table-condensed">
            <Columns>
                <asp:TemplateField HeaderText="Sel" FooterText="Sel">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Enabled="true" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
                    </ItemTemplate>
                    <FooterStyle Font-Bold="True" />
                    <ItemStyle Width="3%" />
                </asp:TemplateField>
                <asp:BoundField DataField="plIdea" HeaderText="Idea " FooterText="Idea " ReadOnly="True" >
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
            
                <ItemStyle Width="5%" Font-Size="X-Small" />
            
                </asp:BoundField>
                <asp:BoundField DataField ="plLocation" HeaderText="Loc" FooterText="Loc" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
             
                <ItemStyle Width="7%" Font-Size="X-Small" />
             
                </asp:BoundField>
                <asp:BoundField DataField ="plStatus" HeaderText="Status" FooterText="Status" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
               
                <ItemStyle Width="10%" Font-Size="X-Small" />
               
                </asp:BoundField>
                <asp:BoundField DataField="plDateEntered" HeaderText="Date Submitted" FooterText="Date Submitted" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle Font-Size="X-Small" Width="6%" />
                </asp:BoundField>
                <asp:BoundField DataField="plRecommendDate" FooterText="Accepted / Not Accepted Date" HeaderText="Accepted / Not Accepted Date">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle Font-Size="X-Small" />
                </asp:BoundField>
                <asp:BoundField DataField="plImplementDate" FooterText="Implemented Date" HeaderText="Implemented Date">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle Font-Size="X-Small" />
                </asp:BoundField>
                <asp:BoundField DataField="plName1" HeaderText ="Author 1" FooterText="Author 1" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle  Font-Names="Arial" Font-Size="X-Small" Width="11%" />
                </asp:BoundField>
                <asp:BoundField DataField ="plName2" HeaderText="Author 2" FooterText="Author 2" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle  Font-Names="Arial" Font-Size="X-Small" Width="11%"/>
                </asp:BoundField>
                <asp:BoundField DataField ="plName3" HeaderText="Author 3" FooterText="Author 3" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center"  />
                <ItemStyle  Font-Names="Arial" Font-Size="X-Small" Width="11%" />
                </asp:BoundField>
                <asp:BoundField DataField ="plName4" HeaderText ="Author 4" FooterText ="Author 4" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle  Font-Names="Arial" Font-Size="X-Small" Width="11%" />
                </asp:BoundField>
                <asp:BoundField DataField ="plText" HeaderText ="Text of Idea" FooterText ="Text of Idea" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <ItemStyle  Font-Names="Arial" Font-Size="X-Small" Width="25%" />
                </asp:BoundField>
            </Columns>

          </asp:GridView>
          </div>
            </asp:Panel>
      </ContentTemplate>
   
    </asp:UpdatePanel>
    </form>
</body>
</html>
<script type="text/javascript">
     
     function closingNow() {
         location.href="EmpChart.aspx";
    }

   
</script>
