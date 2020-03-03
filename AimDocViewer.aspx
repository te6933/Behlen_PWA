<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AimDocViewer.aspx.cs" Inherits="AimEmp_PWA.AimDocViewer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <script type="text/javascript">
  
      
      function BCloadIframe() {
  
        var result = 'http://intranet.behlenmfg.com/intranet/';
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
   <script type="text/javascript">  
    function GetLocation() {

            var result = 'COL';
            var tmp = [];
            var items = location.search.substr(1).split("?");
            for (var index = 0; index < items.length; index++) {
                tmp = items[index].split("=");
                if (tmp[0] === 'location') result = decodeURIComponent(tmp[1]);
            }
            document.getElementById("Location").value = result;
            document.getElementById("SavedLocation").value = result;
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

    <title>AIM Document Viewer</title>
</head>
<body class="container-fluid" >
    
    <form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager2" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
                            
            
                <div id="NoDocs" runat="server" class="auto-style1" style="padding-top:90px;">
                    <h3 id="NodE" runat="server" Visible="true">There are no documents to display for this Idea</h3>
                    <h3 id="NodS" runat="server" Visible ="false">No hay documentos para mostrar para esta idea</h3>
                </div>
            </div>
        <div style="width:100%; font-family:Arial; font-size:small; height:275px; overflow:auto" id="gridDiv" runat="server" >
        
          <asp:GridView   ID="DocumentGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="dIdea,dDocument,dType,dLink" CellPadding="5" BorderStle="Double"  BorderWidth="2px" ShowFooter="True" BackColor="#E7F1FE">
            <Columns>
                <asp:BoundField DataField="dIdea" HeaderText="Idea " FooterText="Idea " ReadOnly="True" >
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
            
                <ItemStyle Width="10%" Font-Size="Small" />
            
                </asp:BoundField>
                <asp:BoundField DataField ="dDocument" HeaderText="Document" FooterText="Document" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
             
                <ItemStyle Font-Size="Small" />
             
                </asp:BoundField>
                <asp:BoundField DataField ="dType" HeaderText="Type" FooterText="Type" ReadOnly="True">
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
               
                <ItemStyle Width="10%" Font-Size="Small" />
               
                </asp:BoundField>
                <asp:BoundField DataField="dLink" FooterText="Link" HeaderText="Link" HtmlEncode="False" HtmlEncodeFormatString="False">
                <FooterStyle HorizontalAlign="Center" Font-Bold="True" />
                </asp:BoundField>
            </Columns>

          </asp:GridView>
          </div>
        <div id="ButtonDiv" runat="server">
            <asp:Button ID="ReturnToCall" runat="server" Text="Back To Idea" OnClick="ReturnToCall_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
        </div>
        <asp:HiddenField ID="returnlink" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="savedCriteria" runat="server"></asp:HiddenField>
      
            </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
