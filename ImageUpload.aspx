<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImageUpload.aspx.cs" Inherits="AimEmp_PWA.ImageUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
      
      
   <title>AIM Idea Entry Screen</title>
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
           text-align:center;
        }
        .auto-style3 {
            
            font-family:Arial;
            font-size: medium;
            width: 100%;
            text-align:center;
        }
    .auto-style4 {
        font-family: Arial;
        font-size: medium;
        text-align: right;
    }
    .auto-style5 {
            
            font-family:Arial;
            font-size:medium;
            width: 100%;
            margin:10px 0;
        }
            .auto-style6 {
            
            font-family:Arial;
            font-size:medium;
            width: 100%;
            text-align:left;
        }
            .auto-style7 {
            width: 39px;
            height: 36px;  
        }
         .nodispl2 {
            font-family:Arial;
            font-size:larger;
           
            visibility: hidden;
        }
       
        .narrowcell {
            width:75px;
        }
        input {
             background-color: #EDF2F8;
         }
         select{
             max-width:50%;
         }
         .text-box{
             border-radius:5px;
             padding-left:5px;
             margin:5px;
             width:90%;
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
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="blank" />
    <meta name="apple-mobile-web-app-title" content="Behlen" />
    <link rel="apple-touch-icon" href="/images/AimLogo-192x192.png" />

</head>
<body class="container-fluid">
      
<form id="form1" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div id="wrapper">
                <div class="nav white-back">
                        <ul class="list-inline">
                            <li class="pull-left" style="margin-left:-2px;"><image style="height:80px; width:100px;" src="Images/Behlen_Logo_WBG.png" style="textalign:Left; vertical-align:Middle" /></li>
                            <li class="text-center" style="display:block; float:left"><h4 class="aim-label"></h4></li>
                            <li class="pull-right"  style="padding-right:40px;"><image style="height:80px; width:80px;" src="Images/AimLogo-192x192.png"/></li>
                        </ul> 
                </div>
            </div> 
   <div class="auto-style1" style="padding-top:100px;">
            <h4><asp:Label ID="Label1" runat="server" Text="Upload Image"></asp:Label></h4>
            <asp:TextBox ID="IdeaBox1" runat="server" ReadOnly="true" CssClass="text-box" ></asp:TextBox>
    </div>
            <div class="aim-back">
            <asp:Table runat="server" Width="100%" CssClass="auto-style5" borderstyle="none">
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell CssClass=" aim-label label-primary" ColumnSpan="3">
                        <strong><asp:Label ID="Label2" runat="server" Text="Optional Document To Upload:  "></asp:Label> </strong>
                    </asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3"><asp:FileUpload ID="FileUpload1" runat="server" CssClass="button-style" />
                    </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3">
                        <asp:Button ID="Continue" runat="server" Text="Continue" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" OnClick="Continue_Click"  CssClass="button-style"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3">
                        <asp:TextBox CssClass="text-box" ID="Duplicate" runat="server"  ReadOnly="true" Font-Bold="True" ForeColor="#CC3300"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                </div>
            <asp:HiddenField ID="returnlink" runat="server"/>
            </ContentTemplate>

        </asp:UpdatePanel>
</form>
</body>
</html>
