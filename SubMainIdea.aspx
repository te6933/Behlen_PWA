<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubMainIdea.aspx.cs" Inherits="AimEmp_PWA.SubMainIdea" %>

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
    <title>AIM Idea Search / Inquiry</title>
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
            font-family: Arial;
            font-size: medium;
            width: 100%;
            margin: 10px 0;
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
     
        <div id="returnDiv" runat="server" visible="false">
            <div class="auto-style1">
                <div style="padding:5px 0;">
                    <asp:Button ID="ReturnListButton" runat ="server" Text="Return to Detail Results" OnClick="ReturnListButton_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
                    <asp:Button ID="BackToSummary" runat="server" Text="Back To Summary" OnClick="BackToSummary_Click" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
                </div>
            </div>
        </div>
        <div id="Screen1" runat="server" visible = "false">
            <div class="aim-back" >
            <asp:Table runat="server" Width="100%" BorderStyle="none" CssClass="auto-style1" >
                <asp:TableHeaderRow HorizontalAlign="Center">
                         <asp:TableCell ColumnSpan="3" CssClass=" aim-label label-primary" ><label class="control-label" ><strong>Emp</strong></label></asp:TableCell>
                         <asp:TableCell ID="R1T2E" ColumnSpan="1" CssClass=" aim-label label-primary"><label class="control-label" ><strong>Department</strong></label></asp:TableCell>
                         <asp:TableCell ID="R1T2S" Visible="false" ColumnSpan="1"  CssClass=" aim-label label-primary"><label class="control-label" ><strong>Departamento</strong></label></asp:TableCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow  HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="3"><asp:TextBox CssClass="form-control text-box" ID="emp1" runat="server"  Width="85%" ReadOnly="True" ColumnSpan="4"></asp:TextBox><asp:HiddenField ID="empName1" runat="server"></asp:HiddenField></asp:TableCell>
                        <asp:TableCell ColumnSpan="1"><asp:TextBox CssClass="form-control text-box" ID="deptName1" runat="server" Width="85%" ReadOnly="true" ColumnSpan="4"></asp:TextBox>
                        <asp:HiddenField ID="dept1" runat="server" /> 
                    </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableHeaderRow HorizontalAlign="Center">
                    </asp:TableHeaderRow>
                <asp:TableRow  HorizontalAlign="Center">
                    
                </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3"><asp:TextBox CssClass="form-control text-box" ID="emp2" runat="server"  Width="85%"  ReadOnly="true" ColumnSpan="4"></asp:TextBox><asp:HiddenField ID="empName2" runat="server"></asp:HiddenField></asp:TableCell>
                    <asp:TableCell  ColumnSpan="1"><asp:TextBox CssClass="form-control text-box" ID="deptName2" runat="server"  Width="85%"  ReadOnly="true" ColumnSpan="4"></asp:TextBox>
                        <asp:HiddenField ID="dept2" runat="server" /> 
                    </asp:TableCell>
                    </asp:TableRow>
                 <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3"><asp:TextBox CssClass="form-control text-box" ID="emp3" runat="server"  Width="85%"  ReadOnly="true" ></asp:TextBox><asp:HiddenField ID="empName3" runat="server"></asp:HiddenField></asp:TableCell>
                    <asp:TableCell ColumnSpan="1"><asp:TextBox CssClass="form-control text-box" ID="deptName3" runat="server" Width="85%" ReadOnly="true"></asp:TextBox>
                        <asp:HiddenField ID="dept3" runat="server" />
                        
                    </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="3"><asp:TextBox CssClass="form-control text-box" ID="emp4" runat="server"  Width="85%"  ReadOnly="true"  ></asp:TextBox><asp:HiddenField ID="empName4" runat="server"></asp:HiddenField></asp:TableCell>
                    <asp:TableCell ColumnSpan="1"><asp:TextBox CssClass="form-control text-box" ID="deptName4" runat="server" Width="85%" ReadOnly="true"></asp:TextBox>
                        <asp:HiddenField ID="dept4" runat="server" />
                    </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableHeaderRow HorizontalAlign="Center">
                        <asp:TableCell ID="R1T3E" ColumnSpan="4"  CssClass=" aim-label label-primary"><strong>Idea Improves<br /> (Required: choose one or more)</strong></asp:TableCell>
                    </asp:TableHeaderRow>
                    <asp:TableHeaderRow HorizontalAlign="Center">
                        <asp:TableCell ID="R1T3S" Visible ="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><strong>La idea mejora (Requerido: elija uno o más)</strong></asp:TableCell>     
                </asp:TableHeaderRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox  ID="cbProductivity" text="Productivity" runat="server" ReadOnly="true" Enabled="False" ColumnSpan="4"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" ><asp:CheckBox ID="cbQuality" text="Quality" runat="server" ReadOnly="true" Enabled="False" ColumnSpan="4"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbSafety" text="Safety" runat="server" ReadOnly="true" Enabled="False" ColumnSpan="4"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbProcess" text="Process" runat="server" ReadOnly="true"  Enabled="False" ColumnSpan="4"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R2T8E" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>Will the Process Remain the Same?</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R2T8S" Visible="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>Permanecera el proceso igual?</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbYesprocess" text="Yes" runat="server" ReadOnly="true" Enabled="False" ColumnSpan="4"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbNoprocess" text="No" runat="server" ReadOnly="true"  Enabled="False" ColumnSpan="4"/></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R3T3E" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>Idea Saves/Reduces (Optional: choose up to four)</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R3T3S" Visible="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>La idea ahorra/reduce (Opcional: elija hasta cuatro)</strong></label></asp:TableCell>
                </asp:TableRow>
               
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbPeopleTime" text="People Time" runat="server" ReadOnly="true" Enabled="False" /></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbMaterials" text="Materials" runat="server" ReadOnly="true"  Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbSetupTime" text="Setup Time" runat="server" ReadOnly="true" Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                     <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbSavesCode4" text="Scrap" runat="server" ReadOnly="true" Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R4T7E" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>Will it cost $500 or less to complete?</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R4T7S" Visible="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>Costara $500 o menos para implementarse?</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cdYesCost500" text="Yes" runat="server" ReadOnly="true" Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cdNoCost500" text="No" runat="server" ReadOnly="true" Enabled="False" /></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R5T3E" Visible="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>Idea Applies to</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R5T3S" Visible="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>La idea aplica a</strong></label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbMultShifts"  Visible="false" text="Multiple Shifts" runat="server" ReadOnly="true" Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbMultDept" Visible="false" text="Multiple Depts." runat="server" ReadOnly="true" Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbShopOnly" Visible="false" text="Shop Only" runat="server" ReadOnly="true" Enabled="False" /></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbOfficeOnly" Visible="false" Text="Office Only" runat="server" ReadOnly="true" Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:CheckBox ID="cbShopOffice" Visible="false" text="Shop/Office" runat="server" ReadOnly="true" Enabled="False"/></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R5T7E" ColumnSpan="4" CssClass=" aim-label label-primary"><label class="control-label" ><strong>Estimated Cost (if over $500.00)</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R5T7S" Visible="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>(Si es mas de $500) Costa Estimado</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="EstCost" runat="server"  Width="85%"  ReadOnly="true"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ID="R8T1E" ColumnSpan="4" CssClass=" aim-label label-primary"><label class="control-label"><strong>Other Affected Department:</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ID="R8T1S" Visible="false" ColumnSpan="4"  CssClass=" aim-label label-primary"><label class="control-label"><strong>Otro Departamento Afectado:</strong></label></asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="EffDept" runat="server"  Width="85%"   ReadOnly="true" TabIndex="-1" ></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <asp:Table runat="server" Width="100%" BorderStyle="none" CssClass="auto-style1" >
            <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L1E" Visible ="true" ><strong>AIM Idea Number:</strong></asp:Label>
                        <asp:Label runat="server" ID="L1S" Visible ="true" ><strong>AIM Numero de Idea:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="IdeaBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
             </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L2E" Visible ="true" ><strong>Location:</strong></asp:Label>
                        <asp:Label runat="server" ID="L2S" Visible="false"><strong>Ubicación:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="LocationBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L3E" Visible="true"><strong>Submitted:</strong></asp:Label>
                        <asp:Label runat="server" ID="L3S" Visible="false"><strong>Presentado:</strong></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="EnteredBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
               <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L4E" Visible="true"><strong>Status:</strong></asp:Label>
                        <asp:Label runat="server" ID="L4S" Visible="false"><strong>Estado:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="StatusBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L5E" Visible="true"><strong>Date Accepted/Not Accepted:</strong></asp:Label>
                        <asp:Label runat="server" ID="L5S" Visible="false"><strong>Fecha de aceptación / no aceptación:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="RecommendBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L6E" Visible="true"><strong>Date Implemented:</strong></asp:Label>
                        <asp:Label runat="server" ID="L6S" Visible="false"><strong>Fecha de Implementación:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="ImplementedBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L7E" Visible="true"><strong>Implemented by:</strong></asp:Label>
                        <asp:Label ColumnSpan="4" runat="server" ID="L7S" Visible="false"><strong>Implementado por:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="ImplementedByBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L8E" Visible="true"><strong>Implemented by Dept:</strong></asp:Label>
                        <asp:Label runat="server" ID="L8S" Visible="false"><strong>Implementado por departamento:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="ImplementByDeptBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L9E" Visible="true"><strong>Direct Implementation:</strong></asp:Label>
                        <asp:Label runat="server" ID="L9S" Visible="false"><srong>Direct Implementation:</srong></asp:Label>
                        </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="DirectImplementationBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L10E" Visible="true"><strong>Theme Idea:</strong></asp:Label>
                        <asp:Label runat="server" ID="L10S" Visible="false"><strong>Idea del tema:</strong></asp:Label>
                   </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="ThemeBox" runat="server" Width="85%" ReadOnly="true"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L11E" Visible="true"><strong>Duplicate Idea:</strong></asp:Label>
                        <asp:Label runat="server" ID="L11S" Visible="false"><strong>Idea duplicada:</strong></asp:Label>
                        </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="DuplicateBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L12E" Visible="true"><strong>Archived:</strong></asp:Label>
                        <asp:Label runat="server" ID="L12S" Visible="false"><strong>Archivado:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="ArchivedBox" runat="server" ReadOnly="true" Width="85%" ></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="2" runat="server" Visible="true" CssClass="aim-label label-primary">
                        <asp:Label runat="server" ID="L13E" Visible="true"><strong>Last Changed By:</strong></asp:Label>
                        <asp:Label runat="server" ID="L13S" Visible="false"><strong>Última modificación por:</strong></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2"><asp:TextBox CssClass="form-control text-box" ID="LastChangedUserBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                 <asp:Table runat="server" Width="100%" BorderStyle="none" CssClass="auto-style1" >
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="L14E" Visible="true" CssClass="aim-label label-primary">Last Changed Date:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="L14S" Visible="false" CssClass="aim-label label-primary">Fecha de último cambio</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="LastChangedDateBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="headtextE" Visible="true" CssClass="aim-label label-primary">My/Our Idea is:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="headtextS" Visible="false" CssClass="aim-label label-primary">Mi/Nuestra Idea es:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="IdeaText" runat="server" TextMode="MultiLine" Height="150px" Width="85%" ReadOnly="true" style="background-color: #EDF2F8;"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
     
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="L15E" Visible="true" CssClass="aim-label label-primary">Reviewer Comments:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="L15S" Visible="false" CssClass="aim-label label-primary">Comentarios de los revisores:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="ReviewerCommentsBox" runat="server" Height="150px" TextMode="MultiLine" Width="85%" ReadOnly="true" style="background-color: #EDF2F8;" ></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="L16E" Visible="true" CssClass="aim-label label-primary">Investigator and Comments:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="L16S" Visible="false" CssClass="aim-label label-primary">Investigador y Comentar:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="InvestigatorBox" runat="server" ReadOnly="true" Width="85%"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="InvestigatorCommentsBox" runat="server" Height="150px" TextMode="MultiLine" Width="85%" ReadOnly="true" style="background-color: #EDF2F8;"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="RRE" Visible="true" CssClass="aim-label label-primary">Reason for Non-Acceptance:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4" runat="server" ID="RRS" Visible="false" CssClass="aim-label label-primary">Motivo de no aceptación:</asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow  HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4"><asp:TextBox CssClass="form-control text-box" ID="RejectionBox" runat="server" Height="150px" TextMode="MultiLine" Width="85%" ReadOnly="true" style="background-color: #EDF2F8;"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
</asp:Table>
                   
</div>
            <asp:Button ID="PreInvest" runat="server" OnClick="PreAssignButton_Click" Text="Preliminary Investigation" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
                <asp:Button ID="SavingsButton" runat="server" OnClick="SavingsButton_Click" Text="Savings"  class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
                <asp:Button ID="BonusButton" runat="server" OnClick="BonusButton_Click" Text="Bonus" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
                <asp:Button ID="PointsButton" runat="server" OnClick="PointsButton_Click" Text="Points" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
                <asp:Button ID="DocumentButton" runat="server" OnClick="DocumentButton_Click" Text="Documents" class="form-control button-style" BackColor="#0066FF" ForeColor="White" Font-Bold="True" />
        </div>
        
        <asp:HiddenField ID="returnlink" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="savedCriteria" runat="server"></asp:HiddenField>
        
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
