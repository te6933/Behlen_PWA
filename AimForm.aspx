<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AimForm.aspx.cs" Inherits="AimEmp_PWA.AimForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

    <script src="./index.js" type="module"></script>

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
        var link = 'http://intranet.behlenmfg.com/includefiles/intraheader.asp?imagefile=http://intranet.behlenmfg.com/images/AIM Logo.jpg&returnlink=' + result;
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
</head>
<body class="container-fluid">
    
    <form id="form1" runat="server">
<div id="strt" > </div>
    

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="wrapper">
                <div class="nav white-back">
                    <a href="http://intranet.behlenmfg.com/Behlen_PWA/index.aspx">
                        <ul class="list-inline">
                            <li class="pull-left" style="margin-left:-2px;"><image style="height:80px; width:100px;" src="Images/Behlen_Logo_WBG.png" style="textalign:Left; vertical-align:Middle" /></li>
                            <li class="text-center" style="display:block; float:left; color:blue;"><h4 class="aim-label" style="height:80px; width:100px;">&nbsp;</h4></li>
                            <li class="pull-right"  style="padding-right:40px;"><image style="height:80px; width:80px;" src="Images/AimLogo-192x192.png"/></li>
                        </ul>
                    </a>
                </div>
            </div> 

            <div class="auto-style1" style="padding-top:100px;">
               <h3 id="Head1E"  runat="server" >AIM Idea Entry Screen</h3>
               <h3 id="Head1S" runat="server" visible="false">Panyata de Ideas AIM</h3>
            </div>
       <div class="auto-style2">
            <div class="row" style="padding:5px 0;">
                <div class="form-group"><asp:Button ID="SpanishButton" runat="server" Text="Spanish" BackColor="#FFFFCC" Height="35px" Width="110px" OnClick="SpanishButton_Click" TabIndex="-1" CssClass="button-style" /></div>
           <asp:Label ID="UserID" runat="server" />
           <asp:HiddenField ID="SavedLocation" runat="server" />
           <asp:Label ID="LocE" Text="Location: " runat="server"></asp:Label>
           <asp:Label ID="LocS" Text ="Ubicación: " runat="server" Visible ="false"></asp:Label>
         <div class="form-group">
             <asp:DropDownList ID="locationDropList"  style="background-color: #EDF2F8; margin-left:25%;" class="form-control" AutoPostBack="true" runat="server"  OnSelectedIndexChanged="locationDropList_SelectedIndexChanged" TabIndex="1">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>BAK</asp:ListItem>
                    <asp:ListItem>COL</asp:ListItem>
                    <asp:ListItem>MCG</asp:ListItem>
                    <asp:ListItem>BTM</asp:ListItem>
                </asp:DropDownList>
             </div> 
        
         <div class="form-group">   <asp:TextBox ID="Location" visible="false" runat="server" ReadOnly="true" TabIndex="-1"></asp:TextBox></div>
    </div>
    </div>
        <div id="Screen1" display:"block" class="aim-back">
            <asp:Table runat="server" Width="100%" CssClass="auto-style5" borderstyle="none">
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3" Width="50%" CssClass=" aim-label label-primary"><strong><label>Emp #</label></strong></asp:TableCell>
                    <asp:TableCell ColumnSpan="5" ID="R1T2E" Width="90%" CssClass=" aim-label label-primary"><strong><label class="control-label" >Department</label></strong></asp:TableCell>
                    <asp:TableCell ColumnSpan="5" ID="R1T2S" Width="90%" Wrap ="False"  Visible="false" CssClass=" aim-label label-primary"><strong><label class="control-label" >Departamento</label></strong></asp:TableCell>
                    </asp:TableHeaderRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3">
                      1)    <asp:TextBox ID="emp1" runat="server" Width="50%" OnTextChanged="emp1_TextChanged" AutoPostBack="true" TabIndex="1" CssClass="text-box"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="5">
                        <asp:TextBox ID="deptName1" runat="server" Width="90%" ReadOnly="true" TabIndex="-1" CssClass="form-control"></asp:TextBox>
                        <asp:HiddenField ID="dept1" runat="server" />
                        <asp:HiddenField ID="empName1" runat="server"></asp:HiddenField>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                     <asp:TableCell ColumnSpan="3">
                      2)   <asp:TextBox ID="emp2" runat="server" Width="50%" OnTextChanged="emp2_TextChanged" AutoPostBack="true" TabIndex="2" CssClass="text-box"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="5">
                          <asp:TextBox ID="deptName2" runat="server" Width="90%" ReadOnly="true" TabIndex="-1" CssClass="form-control"></asp:TextBox>
                         <asp:HiddenField ID="dept2" runat="server" />
                         <asp:HiddenField ID="empName2" runat="server"></asp:HiddenField>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3">
                      3)   <asp:TextBox ID="emp3" runat="server" Width="50%" OnTextChanged="emp3_TextChanged" AutoPostBack="true" TabIndex="3" CssClass="text-box"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="5">
                        <asp:TextBox ID="deptName3" runat="server" Width="90%" ReadOnly="true" TabIndex="-1" CssClass="form-control"></asp:TextBox>
                        <asp:HiddenField ID="dept3" runat="server" />
                        <asp:HiddenField ID="empName3" runat="server"></asp:HiddenField>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3">
                      4)   <asp:TextBox ID="emp4" runat="server" Width="50%" OnTextChanged="emp4_TextChanged" AutoPostBack="true" TabIndex="4" CssClass="text-box"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="5">
                        <asp:TextBox ID="deptName4" runat="server" Width="90%" ReadOnly="true" TabIndex="-1" CssClass="form-control"></asp:TextBox>
                         <asp:HiddenField ID="dept4" runat="server" />
                         <asp:HiddenField ID="empName4" runat="server"></asp:HiddenField>
                    </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
      <asp:Table runat="server" Width="100%" BorderStyle="none" CssClass="auto-style5" >
          <asp:TableHeaderRow HorizontalAlign="Center">
               <asp:TableCell ID="R1T3E" ColumnSpan="4" CssClass=" aim-label label-primary" ><label class="control-label" ><strong>Idea Improves<br /> (Required: choose one or more)</strong></label></asp:TableCell>
              </asp:TableHeaderRow>
          <asp:TableHeaderRow HorizontalAlign="Center">
               <asp:TableCell ID="R1T3S"   Visible ="false" ColumnSpan="4" CssClass="aim-label label-primary"><strong>La idea mejora (Requerido: elija uno o más)</strong></asp:TableCell>
           </asp:TableHeaderRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cbProductivity" text="Productivity" runat="server" TabIndex="5" Cssclass="form-control" /></asp:TableCell>
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cbQuality" text="Quality" runat="server" TabIndex="6" Cssclass="form-control" /></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
               <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cbSafety" text="Safety" runat="server" TabIndex="7" Cssclass="form-control"/></asp:TableCell>
               <asp:TableCell  ColumnSpan="2"><asp:CheckBox ID="cbProcess" text="Process" runat="server" TabIndex="8" Cssclass="form-control" /></asp:TableCell>
           </asp:TableRow>
          <asp:TableRow  HorizontalAlign="Center">
          <asp:TableCell  ColumnSpan="4"><p>&nbsp;</p></asp:TableCell>
          </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
               </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
               <asp:TableCell ID="R2T8E" ColumnSpan="4" CssClass=" aim-label label-primary"><strong>Will the Process Remain the Same?</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow HorizontalAlign="Center">
               <asp:TableCell ID="R2T8S" Visible="false" ColumnSpan="4" CssClass=" aim-label label-primary"><strong>Permanecera el proceso igual?</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
               <asp:TableCell ColumnSpan="2" ><asp:CheckBox ID="cbYesprocess" text="Yes" runat="server" onclick="javascript:UnCheckOtherCheckBox('cbYesprocess', 'cbNoprocess');" TabIndex="9" Cssclass="form-control" /></asp:TableCell>
               <asp:TableCell ColumnSpan="2" ><asp:CheckBox ID="cbNoprocess" text="No" runat="server"  onclick="javascript:UnCheckOtherCheckBox('cbNoprocess', 'cbYesprocess');" TabIndex="10" Cssclass="form-control" /></asp:TableCell>
           </asp:TableRow>
          <asp:TableRow  HorizontalAlign="Center">
          <asp:TableCell  ColumnSpan="4"><p>&nbsp;</p></asp:TableCell>
          </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">              
               <asp:TableCell ID="R3T3E" ColumnSpan="4" CssClass=" aim-label label-primary" ><strong>Idea Saves/Reduces<br /> (Optional: choose up to four)</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow HorizontalAlign="Center">
               <asp:TableCell ID="R3T3S" Visible="false" ColumnSpan="4" CssClass=" aim-label label-primary" ><strong>La idea ahorra/reduce (Opcional: elija hasta cuatro)</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cbPeopleTime" text="People Time" runat="server" TabIndex="11" Cssclass="form-control" /></asp:TableCell>
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cbMaterials" text="Materials" runat="server" TabIndex="12" Cssclass="form-control" /></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cbSetupTime" text="Setup Time" runat="server" TabIndex="13" Cssclass="form-control" /></asp:TableCell>
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cbSavesCode4" Text="Scrap" runat="server" TabIndex="14" Cssclass="form-control" /></asp:TableCell>
           </asp:TableRow>
          <asp:TableRow  HorizontalAlign="Center">
          <asp:TableCell  ColumnSpan="4"><p>&nbsp;</p></asp:TableCell>
          </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ID="R4T7E" columnspan="4" CssClass=" aim-label label-primary"><strong>Will it cost $500 or less to complete?</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ID="R4T7S" Visible="false" columnspan="4" CssClass=" aim-label label-primary"><strong>Costara $500 o menos para implementarse?</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cdYesCost500" text="Yes" runat="server" onclick="javascript:UnCheckOtherCheckBox('cdYesCost500', 'cdNoCost500');" TabIndex="15" Cssclass="form-control" /></asp:TableCell>
                <asp:TableCell ColumnSpan="2"><asp:CheckBox ID="cdNoCost500" text="No" runat="server" onclick="javascript:UnCheckOtherCheckBox('cdNoCost500', 'cdYesCost500');" TabIndex="16" Cssclass="form-control" /></asp:TableCell>
           </asp:TableRow>

           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ID="R5T3E" ColumnSpan="4" Visible="false" CssClass=" aim-label label-primary"><strong>Idea Applies to</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ID="R5T3S" ColumnSpan="4" Visible="false" CssClass=" aim-label label-primary" ><strong>La idea aplica a</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell></asp:TableCell>
                <asp:TableCell ColumnSpan="3"></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ><asp:CheckBox ID="cbMultShifts" text="Multiple Shifts" runat="server" TabIndex="16" Visible="false" Cssclass="form-control" /></asp:TableCell>
                <asp:TableCell ><asp:CheckBox ID="cbMultDept" text="Multiple Depts." runat="server" TabIndex="17" Visible="false" Cssclass="form-control" /></asp:TableCell>
                <asp:TableCell ColumnSpan="2" ><asp:CheckBox ID="cbShopOnly" text="Shop Only" runat="server" TabIndex="18" Visible="false" Cssclass="form-control" /></asp:TableCell>
               </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="2" ><asp:CheckBox ID="cbOfficeOnly" Text="Office Only" runat="server" TabIndex="19" Visible="false"/></asp:TableCell>
                <asp:TableCell ColumnSpan="2" ><asp:CheckBox ID="cbShopOffice" text="Shop/Office" runat="server" TabIndex="20" Visible="false"/></asp:TableCell>
           </asp:TableRow>
          <asp:TableRow  HorizontalAlign="Center">
          <asp:TableCell  ColumnSpan="4"><p>&nbsp;</p></asp:TableCell>
          </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ID="R5T7E"   ColumnSpan="4" CssClass=" aim-label label-primary"><strong>Estimated Cost (if over $500.00)</strong></asp:TableCell>
               </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell ID="R5T7S" Visible="false" ColumnSpan="4" CssClass=" aim-label label-primary"><strong>(Si es mas de $500) Costa Estimado</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow  HorizontalAlign="Center">
                <asp:TableCell  ColumnSpan="4"><asp:TextBox ID="EstCost" runat="server" TabIndex="21" Cssclass="form-control" ></asp:TextBox></asp:TableCell>
           </asp:TableRow>
          <asp:TableRow  HorizontalAlign="Center">
          <asp:TableCell  ColumnSpan="4"><p>&nbsp;</p></asp:TableCell>
          </asp:TableRow>
           <asp:TableRow HorizontalAlign="Center">
               <asp:TableCell ID="R8T1E" ColumnSpan="4" CssClass=" aim-label label-primary"><strong>Other Affected Department:</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow HorizontalAlign="Center">
               <asp:TableCell ID="R8T1S" Visible="false" ColumnSpan="4" CssClass=" aim-label label-primary"><strong>Otro Departamento Afectado:</strong></asp:TableCell>
           </asp:TableRow>
           <asp:TableRow HorizontalAlign="Center">
               <asp:TableCell  ColumnSpan="4"><asp:TextBox ID="EffDept" runat="server" ReadOnly="true" TabIndex="-1" Cssclass="form-control" Visible="false" ></asp:TextBox></asp:TableCell>
           </asp:TableRow>   
           <asp:TableRow HorizontalAlign="Center">
               <asp:TableCell ColumnSpan="4"><asp:DropDownList ID="DeptDownList1" style="background-color: #EDF2F8;" runat="server" AutoPostBack="true" OnSelectedIndexChanged ="deptDownList1_SelectedIndexChanged" Cssclass="form-control"></asp:DropDownList></asp:TableCell>
           </asp:TableRow>
        </asp:Table>
    <p id="headtextE" runat="server" class=" aim-label label-primary"><strong>My/Our Idea is:</strong></p>
    <p id="headtextS" runat="server" Visible="false" class=" aim-label label-primary">Mi/Nuestra Idea es:</p>
    <asp:TextBox ID="IdeaText" runat="server" Height="151px" TextMode="MultiLine" style="background-color: #EDF2F8;" Width="100%" TabIndex="23" Cssclass="form-control"></asp:TextBox>
    <table class="table" style="width:100%; border:none">
            <tr>
                <td style="width:20%;">&nbsp;</td>
                <td style="width:20%; font-weight:bold"><asp:Button ID="EnterButton" runat="server" Text="Enter Idea" BackColor="#66FF66" Height="35px" Width="110px" AutoPostBack="true" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" OnClick="EnterButton_Click" TabIndex="24" Cssclass="button-style" /></td>
                <td style="width:20%;">&nbsp;</td>
                <td style="width:20%; font-weight:bold"><asp:Button ID="EXIT" runat="server" Text="Clear Form" BackColor="Silver" Height="35px" Width="110px" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" OnClick="EXIT_Click"  TabIndex="25" Cssclass="button-style" /></td>
                <td style="width:20%;">&nbsp;</td>
            </tr>
    </table>
</div>   
      
<!--   The Calculations Page  -->
<div id="Screen2" style="display:none;" class="aim-back">
   <div class="auto-style1">
           <h3><strong>Cost Savings Entry</strong></h3>
    </div>
    <div class="auto-style6">
    <asp:Table runat="server" Width="100%" BorderStyle="none" CssClass="auto-style5">
        <asp:TableRow  HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4"><strong><asp:Label ID="IdeaLabelE" Text="AIM Idea Number:" CssClass="aim-label" runat="server"></asp:Label></strong></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow  HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4"><strong><asp:Label ID="IdeaLabelS" Text="AIM Numero de Idea:" CssClass=" aim-label" Visible="false" runat="server"></asp:Label></strong></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow  HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4"><asp:TextBox ID="IdeaNumber" runat="server" ReadOnly="true" TabIndex="-1"  Cssclass="form-control text-box"></asp:TextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow  HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4"><strong><asp:Label ID="EstSaveLabelE" Text="Estimated Savings:" CssClass=" aim-label" runat ="server"></asp:Label></strong></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow  HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4"><strong><asp:Label ID="EstSaveLabelS" Text="Ahorros Estimados:" CssClass=" aim-label" Visible="false" runat ="server"></asp:Label></strong></asp:TableCell>
            </asp:TableRow>
        <asp:TableRow  HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4"><asp:TextBox ID="EstSaving" runat="server" ReadOnly="true" TabIndex="-1" Cssclass="form-control text-box"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
          <asp:TableRow  HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4"><asp:Button ID="CalcButton" Text="COMPUTE" AutoPostBack="true" runat="server" OnClick="CalcButton_Click" Cssclass="button-style" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell  ColumnSpan="4" Font-Size="Medium" CssClass=" aim-label"><strong><asp:Label ID="NoteE"  runat="server" Text="You MUST complete this section to be eligible for bonus points"></asp:Label></strong></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
             <asp:TableCell  ColumnSpan="4" Font-Size="Medium">
                 <strong><asp:Label ID="NoteS" Visible="false" runat="server" Text="DEBES completar esta seccion para ser elegible para puntos de bonos"  CssClass=" aim-label"></asp:Label></strong></strong></asp:TableCell>
            </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="RateLabelE"  runat="server" Text="Hourly Rate:" CssClass=" aim-label"></asp:Label></strong>
                </asp:TableCell>
                </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="RateLabelS" Visible="false" runat="server" Text="Tarifa por hora:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
            </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="RateBox" runat="server" ReadOnly="true" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow> 
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><h3><asp:Label ID="PieceHdrE" runat="server" Text="Savings BY PIECE:" CssClass="label label-default"></asp:Label></h3></strong>
           </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="PieceHdrS" Visible="false" runat="server" Text="Ahorros POR PIEZA:" CssClass="label"></asp:Label></strong>
            </asp:TableCell>
                </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="PieceMinE"  runat="server" Text="Minutes per Piece:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
       </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="PieceMinS" Visible="false" runat="server" Text="Minutos por pieza:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
                </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="MinPerPiece" runat="server" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="PieceYRE"  runat="server" Text="Pieces per year:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="PieceYRS" Visible="false" runat="server" Text="Piezas Anuales:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="PiecesPerYear" runat="server" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="PieceSavingE" runat="server" Text="Annual Savings:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="PieceSavingS" runat="server" Visible="false" Text="Ahorros Anuales:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="AnnualPieceSaving" runat="server" ReadOnly="true" TabIndex="-1" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
                </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><h3><asp:Label ID="TimeHdrE" runat="server" Text="Savings by TIME or LABOR:" CssClass="label label-default"></asp:Label></h3></strong>
            </asp:TableCell>
       </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="TimeHdrS" Visible="false" runat="server" Text="Ahorros por TIEMPO o MANO DE OBRA:" CssClass="label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
            <strong><asp:Label ID="TimeMinDayE"  runat="server" Text="Minutes saved per day:" CssClass=" aim-label"></asp:Label></strong></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="TimeMinDayS" Visible="false" runat="server" Text="Minutos ahorrado por dia:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="SavingsPerDay" runat="server" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="center">
                <strong><asp:Label ID="TimeMinWeekE"  runat="server" Text="Minutes saved per week:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="TimeMinWeekS" Visible="false" runat="server" Text="Minutos ahorrado por semana:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
                </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="SavingPerWeek" runat="server" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="TimeSavingsE" runat="server" Text="Annual Savings:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="TimeSavingsS" runat="server" Visible="false" Text="Ahorros Anuales:"  CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
                </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="AnnualTimeSavings" runat="server" ReadOnly="true" TabIndex="-1" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><h3><asp:Label ID="ScrapHdrE" runat="server" Text="Savings by SCRAP REDUCTION:" CssClass="label label-default"></asp:Label></h3></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="ScrapHdrS" Visible="false" runat="server" Text="Ahorros poro medio de REDUCCION de CHATARRA:" CssClass="label"></asp:Label></strong>
         </asp:TableCell>
         </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="ScrapDollE"  runat="server" Text="$ saved per piece scrap:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="ScrapDollS" Visible="false" runat="server" Text="$ ahorro por pieza de chatarra:"  CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="ScrapDollars" runat="server" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="ScrapPieceE"  runat="server" Text="Pieces per year:" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="ScrapPieceS" Visible="false" runat="server" Text="Piezas por año:"  CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="ScrapPieceCnt" runat="server" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="ScrapSavingsE" runat="server" Text="Annual Savings:" CssClass=" aim-label"></asp:Label></strong>
                </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="ScrapSavingsS" runat="server" Visible="false" Text="Ahorros Anuales:"  CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="AnnualScrapSavings" runat="server" ReadOnly="true" TabIndex="-1" Cssclass="form-control text-box"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><h3><asp:Label ID="OtherE" runat="server" Text="Other Savings" CssClass="label label-default"></asp:Label></h3></strong>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="OtherS" runat="server" Text="Otros ahorros" Visible="false" CssClass="label label-default" ></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="OtherYearE" runat="server" Text="Other savings per year:" CssClass=" aim-label"></asp:Label></strong>
                </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="OtherYearS" runat="server" Text="Otros ahorros por año:" Visible="false" CssClass=" aim-label" ></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="OtherYear" runat="server" Cssclass="form-control text-box"> </asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="OtherOneE" runat="server" Text="Other one time savings:" CssClass=" aim-label"></asp:Label></strong>
                </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <strong><asp:Label ID="OtherOneS" runat="server" Text="Otros ahorros únicos:" Visible="false" CssClass=" aim-label"></asp:Label></strong>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="4" HorizontalAlign="Center">
                <asp:TextBox ID="OtherOne" runat="server" Cssclass="form-control text-box"> </asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
        <hr />
        <p class=" aim-label"><strong><asp:Label ID="CommentE" Text="Comments:" runat="server" ></asp:Label></strong></p>
       <strong><asp:Label ID="CommentS" Text="Comentarios:" runat="server" Visible="false" CssClass=" aim-label" ></asp:Label></strong>
        <asp:TextBox ID="SavingComments" runat="server" Height="73px" TextMode="MultiLine" style="background-color: #EDF2F8;" Width="100%" Cssclass="form-control text-box"></asp:TextBox>
     <div class="auto-style4">
     <table class="table" style="width:100%; border:none">
        <tr>
            <td style="width:20%;">&nbsp;</td>
            <td style="width:20%;"><asp:Button ID="AcceptButton" runat="server" Text="ACCEPT" BackColor="#66FF66" Height="35px" Width="110px" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" OnClick="Accept_Click" CssClass="button-style" /></td>
            <td style="width:20%;">&nbsp;</td>
            <td style="width:20%;"><asp:Button ID="ExitButton2" runat="server" Text="EXIT" BackColor="Silver" Height="35px" Width="110px" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" OnClick="EXIT_Click2" CssClass="button-style" /></td>
            <td style="width:20%;">&nbsp;</td>
        </tr>
      </table>
      </div>   
    </div>

</div>
            <asp:HiddenField ID="WhichScreen" value="1" runat="server"/>
            <asp:HiddenField ID="SavingsDone" runat="server"  />
            <asp:HiddenField ID="NextIdeaStr" runat="server" />
            <asp:HiddenField ID="AlreadyDone" runat="server"  />
            <asp:HiddenField ID="returnlink" runat="server"/>
        </ContentTemplate>

        </asp:UpdatePanel>
    </form>
</body>
</html>
<script type="text/javascript">
    function closingNow() {
        location.href = document.getElementById("returnlink").value;  
    }

    function showscreen2() {
        document.getElementById('Screen1').style.display = 'none';
        document.getElementById('Screen2').style.display = 'block';
     
    }

    function showscreen1() {
        document.getElementById('Screen1').style.display = 'block';
        document.getElementById('Screen2').style.display = 'none';
    }
</script>
