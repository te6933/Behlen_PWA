<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="AimEmp_PWA.index" MaintainScrollPositionOnPostback="true" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31BF3856AD364E35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


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
            <div style="padding-top:50px;">
                <p>&nbsp;</p>
            </div>
            <div id="searchDiv" runat="server" visible="true">
            <div class="auto-style1" >
                   <h3 id="h1E"  runat="server" >AIM Idea Search</h3>
                   <h3 id="h1S" runat="server" visible="false">AIM Búsqueda de ideas</h3>
            </div>
            <div class="auto-style1">
                <div style="padding:5px 0;">
                    <div><asp:Button ID="SpanishButton" runat="server" Text="Spanish" BackColor="#FFFFCC" Height="35px" Width="110px" OnClick="spanishButton_Click" CssClass="button-style" /></div>
                </div>
            </div>
            <div class="aim-back" >
                  <asp:Table runat="server" Width="100%" BorderStyle="none" CssClass="auto-style5" >
                      <asp:TableRow>
                          <asp:TableCell>
                            <asp:Label ID="UserID" runat="server" />
                          </asp:TableCell>
                          </asp:TableRow>
                      <asp:TableRow HorizontalAlign="Center">
                          <asp:TableCell Width="95%">
                            <asp:TextBox Width="95%" ID="EmployeeSummaryBox" runat="server" placeholder="EMP#" CssClass="form-control text-box"></asp:TextBox>
                       </asp:TableCell>
                          </asp:TableRow>
                      <asp:TableRow HorizontalAlign="Center">
                          <asp:TableCell>
                         <asp:Button ID="SummaryButton" runat="server" OnClick="summaryButton_Click" Text="Summary" BackColor="#0066FF" ForeColor="White" Font-Bold="True" width="80%" CssClass="form-control button-style" />
                    </asp:TableCell>
                    </asp:TableRow>
                     </asp:Table>                   
                </div>
                    <h3 style="text-align:center;"><strong>- OR -</strong></h3>
             <div class="aim-back" >
                  <asp:Table runat="server" Width="100%" BorderStyle="none" CssClass="auto-style5" >
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell ID="LocE" ColumnSpan="4" CssClass=" aim-label label-primary" ><label class="control-label" ><strong>Location</strong></label></asp:TableCell>
                          </asp:TableHeaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell ID="LocS" Visible ="false" ColumnSpan="4" CssClass="aim-label label-primary"><label><strong>Ubicación:</strong></label></asp:TableCell>
                       </asp:TableHeaderRow>
                       
                     <asp:TableRow  HorizontalAlign="Center">
                         <asp:TableCell  ColumnSpan="4">
                        <asp:DropDownList ID="DropDownLocations" CssClass="form-control text-box" AutoPostBack="true" runat="server">
                            <asp:ListItem Value="ANY">ANY</asp:ListItem>
                            <asp:ListItem Value="BAK">BAK</asp:ListItem>
                            <asp:ListItem Value="COL">COL</asp:ListItem>
                            <asp:ListItem Value="MCG">MCG</asp:ListItem>
                            <asp:ListItem Value="BTM">BTM</asp:ListItem>
                        </asp:DropDownList>
                        </asp:TableCell>                       
                     </asp:TableRow>
                       <asp:TableHeaderRow  HorizontalAlign="Center">
                           <asp:TableCell  Visible ="true" ColumnSpan="4"  ID="StatusE" CssClass="aim-label label-primary"><strong><label runat="server">Status</label></strong></asp:TableCell>
                        </asp:TableHeaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell Visible ="false" ID="StatusS" ColumnSpan="4" CssClass="aim-label label-primary"><strong><label runat="server">Estado</label></strong></asp:TableCell>
                       </asp:TableHeaderRow>
                      <asp:TableRow  HorizontalAlign="Center">
                      <asp:TableCell  ColumnSpan="4">
                          <asp:DropDownList ID="DropDownStatus"  CssClass="form-control text-box" runat="server" Enabled="true" >
                                <asp:ListItem Value="ANY">ANY</asp:ListItem>
                                <asp:ListItem Value="NEW">Submitted</asp:ListItem>
                                <asp:ListItem Value="PIN">Preliminary Investigation</asp:ListItem>
                                <asp:ListItem Value="PIC">Preliminary Investigation Complete</asp:ListItem>
                                <asp:ListItem Value ="INV">Investigating</asp:ListItem>
                                <asp:ListItem Value ="WTI">Investigation Completed</asp:ListItem>
                                 <asp:ListItem Value="REJ">Not Accepted</asp:ListItem>
                                <asp:ListItem Value ="ACP">Accepted</asp:ListItem>
                                <asp:ListItem Value ="IMP">Implemented</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                      </asp:TableRow>
                      <asp:TableRow HorizontalAlign="Center">
                           <asp:TableCell Visible ="false" CssClass="auto-style1" ColumnSpan="4" ID="Note1S"><label runat="server">Si no se ingresan fechas, <br /> las ideas se seleccionarán en función del estado actual</label></asp:TableCell>
                       </asp:TableRow>
                      <asp:TableHeaderRow  HorizontalAlign="Center">
                           <asp:TableCell Visible ="true" CssClass="aim-label label-primary" ColumnSpan="4" ID="OtherE"><label runat="server">Other Affected Department</label>
                            </asp:TableCell>
                        </asp:TableHeaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell Visible ="false" CssClass="aim-label label-primary" ColumnSpan="4" ID="OtherS"><label runat="server">Otro Departamento Afectado</label></asp:TableCell>
                       </asp:TableHeaderRow>
                      <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell  ColumnSpan="4"><asp:TextBox Width="95%" ID="EffDept"  CssClass="form-control text-box" runat="server" ReadOnly="true"></asp:TextBox></asp:TableCell>
                       </asp:TableRow>
                       <asp:TableHeaderRow  HorizontalAlign="Center">
                           <asp:TableCell Visible ="true" CssClass="aim-label label-primary" ColumnSpan="4" ID="DeptE"><label runat="server">Select Department</label>
                            </asp:TableCell>
                        </asp:TableHeaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell Visible ="false" CssClass="aim-label label-primary" ColumnSpan="4" ID="DeptS"><label runat="server">Seleccionar Departamento</label></asp:TableCell>
                       </asp:TableHeaderRow>
                      <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell ColumnSpan="4"><asp:DropDownList ID="DeptDownList1" CssClass="form-control text-box" runat="server" TabIndex="4" AutoPostBack="true" OnSelectedIndexChanged ="deptDownList1_SelectedIndexChanged" ></asp:DropDownList></asp:TableCell>
                      </asp:TableRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell Visible ="true" CssClass="auto-style1" ColumnSpan="4" ID="Note2E"><label runat="server">Note: Only for Ideas submitted after 1/1/2020</label></asp:TableCell>
                       </asp:TableHeaderRow>
                       <asp:TableHeaderRow  HorizontalAlign="Center">
                           <asp:TableCell Visible ="false" CssClass="auto-style1" ColumnSpan="4" ID="Note2S"><label runat="server">Nota: Solo para ideas enviadas después del 1/1/2020</label>
                            </asp:TableCell>
                        </asp:TableHeaderRow>
                    
                         
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell Visible="true" CssClass="aim-label label-primary" ColumnSpan="4" ID="StartE"><label runat="server">Starting Date:</label></asp:TableCell>
                       </asp:TableHeaderRow>
                      <asp:TableheaderRow HorizontalAlign="Center">
                           <asp:TableCell Visible ="false" CssClass="aim-label label-primary" ColumnSpan="4" ID="StartS"><label runat="server">Fecha de inicio:</label></asp:TableCell>
                       </asp:TableheaderRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell  ColumnSpan="4"><asp:TextBox Width="95%" runat="server" CssClass="form-control text-box" type="date" id="StartTextBox" class="form-control"></asp:TextBox><asp:HiddenField runat="server" ID="startdate"></asp:HiddenField></asp:TableCell>
                           </asp:TableRow>
                      <asp:TableRow HorizontalAlign="Center">
                           <asp:TableCell Visible="true" CssClass="aim-label label-primary" ColumnSpan="4" ID="EndE"><label runat="server">Ending Date:</label></asp:TableCell>
                       </asp:TableRow>
                      <asp:TableRow HorizontalAlign="Center">
                           <asp:TableCell Visible ="false" CssClass="aim-label label-primary" ColumnSpan="4" ID="EndS"><label runat="server">Fecha de finalización:</label></asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell  ColumnSpan="4"><asp:TextBox Width="95%" runat="server" CssClass="form-control text-box" type="date" id="EndTextBox" class="form-control"></asp:TextBox><asp:HiddenField runat="server" ID="enddate"></asp:HiddenField></asp:TableCell>
                           </asp:TableRow>
                      <asp:TableheaderRow HorizontalAlign="Center">
                           <asp:TableCell  Visible="true" CssClass="aim-label label-primary" ColumnSpan="4" ID="NameE"><label runat="server">Name</label></asp:TableCell>
                       </asp:TableheaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell  Visible ="false" CssClass="aim-label label-primary" ColumnSpan="4" ID="NameS"><label runat="server">Nombre</label></asp:TableCell>
                       </asp:TableHeaderRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell  ColumnSpan="4"><asp:TextBox Width="95%" runat="server" CssClass="form-control text-box"  id="NameTextBox" class="form-control"></asp:TextBox></asp:TableCell>
                           </asp:TableRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell Visible="true" CssClass="aim-label label-primary" ColumnSpan="4" ID="EmpNumLbl"><label runat="server">Emp#</label></asp:TableCell>
                       </asp:TableHeaderRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell ColumnSpan="4"><asp:TextBox Width="95%" runat="server"  CssClass="form-control text-box" id="EmpIDText" class="form-control"></asp:TextBox></asp:TableCell>
                           </asp:TableRow>
                        <asp:TableRow  HorizontalAlign="Center">
                            <asp:TableCell ColumnSpan="4" ><asp:CheckBox ID="cbAuthor" text="Author" runat="server"  Cssclass="form-control" /></asp:TableCell>
                            </asp:TableRow>
                        <asp:TableRow  HorizontalAlign="Center">
                            <asp:TableCell ColumnSpan="4" ><asp:CheckBox ID="cbInvest" text="Investigator" runat="server" Cssclass="form-control" /></asp:TableCell>
                            </asp:TableRow>
                        <asp:TableRow  HorizontalAlign="Center">
                            <asp:TableCell ColumnSpan="4" ><asp:CheckBox ID="cbInstaller" text="Implementor" runat="server"  TabIndex="9" Cssclass="form-control" /></asp:TableCell>
                            </asp:TableRow>
                        <asp:TableRow HorizontalAlign="Center">
                            <asp:TableCell  Cssclass="auto-style1" ColumnSpan="4" ID="CheckBoxHint"><label runat="server" class="form-control">(For Name and/or EmpID# Searches)</label></asp:TableCell>
                       </asp:TableRow>
                      

                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell CssClass="aim-label label-primary" Visible="true" ColumnSpan="4" ID="IdeaE"><label runat="server">Idea Text</label></asp:TableCell>
                       </asp:TableHeaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell CssClass="aim-label label-primary" Visible ="false" ColumnSpan="4" ID="IdeaS"><label runat="server">Texto de Idea</label></asp:TableCell>
                       </asp:TableHeaderRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell ColumnSpan="4"><asp:TextBox Width="95%" runat="server" ID="TextText" CssClass="form-control text-box" TextMode="MultiLine"></asp:TextBox></asp:TableCell>
                           </asp:TableRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell CssClass="aim-label label-primary" Visible="true" ColumnSpan="4" ID="IdeaNumE"><label runat="server">Idea Number</label></asp:TableCell>
                       </asp:TableHeaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell CssClass="aim-label label-primary" Visible ="false" ColumnSpan="4" ID="IdeaNumS"><label runat="server">Numero de Idea</label></asp:TableCell>
                       </asp:TableHeaderRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell  ColumnSpan="4"><asp:TextBox Width="95%" runat="server" ID="IdeaTextBox" CssClass="form-control text-box"></asp:TextBox></asp:TableCell>
                           </asp:TableRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell CssClass="aim-label label-primary" Visible="true" ColumnSpan="4" ID="BonusE"><label runat="server">Bonus Idea</label></asp:TableCell>
                       </asp:TableHeaderRow>
                      <asp:TableHeaderRow HorizontalAlign="Center">
                           <asp:TableCell CssClass="aim-label label-primary" Visible ="false" ColumnSpan="4" ID="BonusS"><label runat="server">Idea de bonificación</label></asp:TableCell>
                       </asp:TableHeaderRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell  ColumnSpan="4"><asp:TextBox Width="95%" runat="server" ID="BonusTextBox" CssClass="form-control text-box"></asp:TextBox></asp:TableCell>
                       </asp:TableRow>

                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell  ColumnSpan="4"><asp:Button runat="server" ID="SubmitButton" OnClick="submitButton_Click" BackColor="#0066FF" ForeColor="White" Font-Bold="True" Text="Search" width="80%" class="form-control"></asp:Button></asp:TableCell>
                       </asp:TableRow>
                       <asp:TableRow  HorizontalAlign="Center">
                           <asp:TableCell  ColumnSpan="2">
                      <asp:HiddenField ID="savedCriteria" runat="server" />
                            </asp:TableCell>
                           <asp:TableCell  ColumnSpan="2">
                        <asp:HiddenField ID="goingBack" runat="server" />
                     </asp:TableCell>
                           </asp:TableRow>
                  </asp:Table>
                 </div>
           </div>
            
           <asp:Table id="topDiv"  runat="server" visible="false" BorderStyle="none" >
               <asp:TableRow  HorizontalAlign="Center">
                   <asp:TableCell  ColumnSpan="4">
                <asp:Button ID="topReturnButton" runat="server" Text="Return to Search" BackColor="#0066FF" ForeColor="White" Font-Bold="True" CssClass="form-control" OnClick="ReturnButton_Click" />
                    </asp:TableCell>
                </asp:TableRow>
               <asp:TableRow  HorizontalAlign="Center">
                   <asp:TableCell ColumnSpan="4">
                <asp:Label ID="noRecs" runat="server" Text="<br /><br />No Records Match Search Criteria<br /><br />" BackColor="#990033" ForeColor="White" Font-Size="Larger"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
               <asp:TableRow HorizontalAlign="Center">
                   <asp:TableCell ColumnSpan="3">
                <asp:Label ID="searchCountLabel" runat="server" Text="Returned Ideas:"></asp:Label> &nbsp
                   </asp:TableCell>
                   <asp:TableCell ColumnSpan="1">
                <asp:TextBox ID="searchCount" Width="95%" runat="server" ReadOnly="true" CssClass="form-control text-box" BorderStyle="None"></asp:TextBox>
                   </asp:TableCell>
                 </asp:TableRow>
               </asp:Table>
        <div style="width:100%; font-family:Arial; font-size:small; height:475px; overflow:auto" id="gridDiv" runat="server" visible="false">
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
        <asp:Table id="bottomDiv" runat="server" visible="false" BorderStyle="none" >
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell  ColumnSpan="4">
                    <asp:Button ID="ReturnButton" runat="server" Text="Return to Search" OnClick="ReturnButton_Click" BackColor="#0066FF" ForeColor="White" Font-Bold="True" CssClass="form-control button-style" />
                    </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
        <asp:Table id="returnDiv" runat="server" visible="false" BorderStyle="none" >
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell  ColumnSpan="2">
                    <asp:Button ID="ReturnListButton" runat ="server" Text="Return to Search Results" OnClick="ReturnListButton_Click" BackColor="#0066FF" ForeColor="White" Font-Bold="True" CssClass="form-control button-style"/>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
            <asp:Button ID="ReturntoSearch2" runat="server" Text="Return to Search" OnClick="ReturnButton_Click" BackColor="#0066FF" ForeColor="White" Font-Bold="True" CssClass="form-control button-style"/>
                    </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
        <asp:HiddenField ID="returnlink" runat="server"></asp:HiddenField>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
