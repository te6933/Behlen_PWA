<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AimEmp_PWA.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

    <script src="./index.js" type="module"></script>

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
<script type="text/javascript">
        function UnCheckOtherCheckBox(chkbox1, chkbox2) {
            if (document.getElementById(chkbox1).checked) {
                //Uncheck the other checkbox
                document.getElementById(chkbox2).checked = false;
            }
    }

    function closingNow2() {
        var spanish = document.getElementById('SpanishButton').value;      
        // if the value of the button is English - Spanish will be displayed on the upload screen
        location.href = "ImageUpload.aspx?idea=" + document.getElementById('IdeaNumber').value + "&spanish=" + spanish + "&returnlink=" + document.getElementById('returnlink').value;
    }
    
    function showscreen2a() {
        document.getElementById('Screen1').style.display = 'none';
        document.getElementById('Screen2').style.display = 'none';
        document.getElementById('UploadImageDiv').style.display = 'block';
    }

    
    window.addEventListener('appinstalled', (e) => {
        console.log('Behlen mobile app installed');
    });

    
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/ServiceWorker.js').then((reg) => {
                console.log('service worker registered.', reg);
            });
        });
    }
    
    </script>
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
            background-color: rgb(0,94,184);
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
         }
         .button-style{
             border-radius:5px;
             margin:5px 0;
         }
         .add-button{
             position:absolute;
             top:100px;
             left:1px;
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

    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="blank" />
    <meta name="apple-mobile-web-app-title" content="Behlen" />
    <link rel="apple-touch-icon" href="/images/AimLogo-192x192.png" />
</head>
<body class="container-fluid">
    
    <form id="form1" runat="server">
<div id="strt" > </div>
    

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
            <button class="add-button">Add to Home Screen</button>
                    
            <div class="auto-style1" style="padding-top:90px;">
           <h3 id="Head1E"  runat="server" >AIM</h3>
                </div>
            <div class="auto-style2">
                <div class="row" style="padding:5px 0;">
                    <div class="form-group"><asp:Button ID="EnterAim" runat="server" Text="Aim Idea" BackColor="#E0E0E0" Font-Size="X-Large" Height="35px" Width="80%" OnClick="aimEntry_OnClick" TabIndex="-1" CssClass="button-style" /></div>
                     <div class="form-group"><asp:Button ID="AimEmp" runat="server" Text="Aim Lookup" BackColor="#E0E0E0" Font-Size="X-Large" Height="35px" Width="80%" OnClick="aimEmp_OnClick" TabIndex="-1" CssClass="button-style" /></div>
                    
                    <asp:Label ID="UserID" runat="server" />
                </div>
           </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
