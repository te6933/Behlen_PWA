using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AimEmp_PWA
{
    public partial class SubMainIdea : System.Web.UI.Page
    {
        public string empvalue;
        public string type;
        public string ideachk;

        public double totalpoints = 0;
        public int checkIdea;
        public string checkLocation;
        public string checkStatus;
        public string notlang;
        public bool showspanish;

        List<IdeaList> ideasList = new List<IdeaList>();
        //List<SubIdeaList> ideasList = new List<SubIdeaList>();
        List<ideas> IndIdea = new List<ideas>();
        List<bonus> IndBonus = new List<bonus>();
        List<savings> IndSavings = new List<savings>();
        List<points> IndPoints = new List<points>();
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("ListInViewState", ideasList);
            ViewState.Add("ListInViewState2", IndIdea);
            ViewState.Add("ListInViewState3", IndBonus);
            ViewState.Add("ListInViewState4", IndSavings);
            ViewState.Add("ListInViewState5", IndPoints);

            //if (Request.QueryString.AllKeys.Contains("criteria"))
            //{
            //    if (Request.QueryString["criteria"].ToString() != "")
            //    {
            //        savedCriteria.Value = Request.QueryString["criteria"].ToString();
            //    }
            //}
            loadIdea();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "HWA", "BCloadIframe();", true);
                // SavedLocation.Value = Location.Text;
            }
            returnlink.Value = Request.QueryString["returnlink"];
            empvalue = Request.QueryString["employee"];
            type = Request.QueryString["type"];
            ideachk = Request.QueryString["Idea"];
            checkLocation = Request.QueryString["location"];
            notlang = Request.QueryString["notlang"];
            if (notlang == "English")
            {
                showspanish = true;
            }
            else
            {
                showspanish = false;
            }
            if (showspanish)
            {
                switchtospanish();
            }
            if (!showspanish)
            {
                switchtoenglish();
            }
            
            if (ViewState["ListInViewState"] != null)
            {
                ideasList = (List<IdeaList>)ViewState["ListInViewState"];
                IndIdea = (List<ideas>)ViewState["ListInViewState2"];
                IndBonus = (List<bonus>)ViewState["ListInViewState3"];
                IndSavings = (List<savings>)ViewState["ListInViewState4"];
                IndPoints = (List<points>)ViewState["ListInViewState5"];

            }

        }

        private void loadIdea()
        {
            checkLocation = Request.QueryString["location"];
            ideachk = Request.QueryString["Idea"];
            int.TryParse(ideachk, out checkIdea);
            empvalue = Request.QueryString["employee"];
            type = Request.QueryString["type"];


            IndIdea.Clear();
            read_outForm();
           build_outForm();  
            Screen1.Visible = true;
            returnDiv.Visible = true;

        }
        private void build_outForm()
        {
            emp1.Text = IndIdea[0].iEmp1Name;
            emp2.Text = IndIdea[0].iEmp2Name;
            emp3.Text = IndIdea[0].iEmp3Name;
            emp4.Text = IndIdea[0].iEmp4Name;
            deptName1.Text = IndIdea[0].iDept1;
            deptName2.Text = IndIdea[0].iDept2;
            deptName3.Text = IndIdea[0].iDept3;
            deptName4.Text = IndIdea[0].iDept4;
            cbProductivity.Checked = false;
            cbQuality.Checked = false;
            cbSafety.Checked = false;
            cbProcess.Checked = false;
            cbYesprocess.Checked = false;
            cbNoprocess.Checked = false;
            cbPeopleTime.Checked = false;
            cbMaterials.Checked = false;
            cbSetupTime.Checked = false;
            cbSavesCode4.Checked = false;
            cdYesCost500.Checked = false;
            cdNoCost500.Checked = false;
            cbMultShifts.Checked = false;
            cbMultDept.Checked = false;
            cbShopOnly.Checked = false;
            cbOfficeOnly.Checked = false;
            cbShopOffice.Checked = false;
            if (IndIdea[0].iImprovesProductivity == "Y")
            {
                cbProductivity.Checked = true;
            }
            if (IndIdea[0].iImprovesQuality == "Y")
            {
                cbQuality.Checked = true;
            }
            if (IndIdea[0].iImprovesSafety == "Y")
            {
                cbSafety.Checked = true;
            }
            if (IndIdea[0].iImprovesProcess == "Y")
            {
                cbProcess.Checked = true;
            }
            if (IndIdea[0].iProcessCode == "Y")
            {
                cbYesprocess.Checked = true;
            }
            else
            {
                cbNoprocess.Checked = true;
            }
            if (IndIdea[0].iSavesPeopleTime == "Y")
            {
                cbPeopleTime.Checked = true;
            }
            if (IndIdea[0].iSavesMaterials == "Y")
            {
                cbMaterials.Checked = true;
            }
            if (IndIdea[0].iSavesSetupTime == "Y")
            {
                cbSetupTime.Checked = true;
            }
            if (IndIdea[0].iSavesCode4 == "Y")
            {
                cbSavesCode4.Checked = true;
            }
            if (IndIdea[0].iCostCode == "Y")
            {
                cdYesCost500.Checked = true;
            }
            else
            {
                cdNoCost500.Checked = true;
            }
            if (IndIdea[0].iAppliesMultipleShifts == "Y")
            {
                cbMultShifts.Checked = true;
            }
            if (IndIdea[0].iAppliesMultipleDepts == "Y")
            {
                cbMultDept.Checked = true;
            }
            if (IndIdea[0].iAppliesShopOnly == "Y")
            {
                cbShopOnly.Checked = true;
            }
            if (IndIdea[0].iAppliesOfficeOnly == "Y")
            {
                cbOfficeOnly.Checked = true;
            }
            if (IndIdea[0].iAppliesShopOffice == "Y")
            {
                cbShopOffice.Checked = true;
            }
            EstCost.Text = IndIdea[0].iEstCost.ToString("n2");
            EffDept.Text = IndIdea[0].iEffectedDept;
            IdeaText.Text = IndIdea[0].iIdeaText;
            IdeaBox.Text = IndIdea[0].iIdeaNum.ToString();
            DateTime tDate;
            DateTime.TryParse(IndIdea[0].iEntered, out tDate);
            EnteredBox.Text = tDate.ToShortDateString();
            string rCurrStatus = IndIdea[0].iCurrStatus;
            //StatusBox.Text = IndIdea[0].iCurrStatus;
            if (!showspanish)
            {
                switch (rCurrStatus)
                {
                    case "ACP":
                        rCurrStatus = "ACCEPTED";
                        break;
                    case "REJ":
                        rCurrStatus = "NOT ACCEPTED";
                        break;
                    case "INV":
                        rCurrStatus = "INVESTIGATING";
                        break;
                    case "WTI":
                        rCurrStatus = "INVESTIGATION COMPLETED";
                        break;
                    case "IMP":
                        rCurrStatus = "IMPLEMENTED";
                        break;
                    case "PIN":
                        rCurrStatus = "PRELIMINARY INVESTIGATION";
                        break;
                    case "PIC":
                        rCurrStatus = "PRELIMINARY INVESTIGATION COMPLETED";
                        break;
                }
            }
            if (showspanish)
            {
                switch (rCurrStatus)
                {
                    case "ACP":
                        rCurrStatus = "ACEPTADO";
                        break;
                    case "REJ":
                        rCurrStatus = "NO ACEPTADA";
                        break;
                    case "INV":
                        rCurrStatus = "INVESTIGANDO";
                        break;
                    case "WTI":
                        rCurrStatus = "Investigación completada";
                        break;
                    case "IMP":
                        rCurrStatus = "IMPLEMENTADO";
                        break;
                    case "PIN":
                        rCurrStatus = "Investigación Preliminar";
                        break;
                    case "PIC":
                        rCurrStatus = "Investigación Preliminar Completada";
                        break;
                }
            }
            StatusBox.Text = rCurrStatus;

            DateTime.TryParse(IndIdea[0].iImplementedDate, out tDate);
            ImplementedBox.Text = tDate.ToShortDateString();
            if (ImplementedBox.Text == "1/1/0001")
            {
                ImplementedBox.Text = "";
            }
            DateTime.TryParse(IndIdea[0].iRecommendDate, out tDate);
            RecommendBox.Text = tDate.ToShortDateString();
            if (RecommendBox.Text == "1/1/0001")
            {
                RecommendBox.Text = "";
            }
            LocationBox.Text = IndIdea[0].iLocation;
            ThemeBox.Text = IndIdea[0].iThemeIdea;
            DuplicateBox.Text = IndIdea[0].iDuplicateIdea;
            InvestigatorBox.Text = IndIdea[0].iInvestigator;
            ImplementByDeptBox.Text = IndIdea[0].iImplementByDept;
            DirectImplementationBox.Text = IndIdea[0].iDirectImplementation;
            InvestigatorBox.Text = IndIdea[0].iInvestigator;
            InvestigatorCommentsBox.Text = IndIdea[0].iInvestigatorComments;

            if (IndIdea[0].iCurrStatus == "REJ")
            {
                RejectionBox.Text = IndIdea[0].iRejectionReason;
                //RejectionReason.Visible = true;
            }
            else
            {
                //RejectionReason.Visible = false;
            }
            ReviewerCommentsBox.Text = IndIdea[0].iReviewComments;
            ImplementedByBox.Text = IndIdea[0].iImplementor;
            ArchivedBox.Text = IndIdea[0].iArchived;
            LastChangedUserBox.Text = IndIdea[0].iLastChangeUser;
            if (IndIdea[0].iLastChangeDate != "1/1/0001 12:00:00 AM")
            {
                LastChangedDateBox.Text = IndIdea[0].iLastChangeDate;
            }
            else
            {
                LastChangedDateBox.Text = "";
            }
        }
        protected void ReturnListButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                // Response.Redirect("index.aspx?returnlink = " + returnlink.Value + "&criteria=" + criteria + "&notlang=" + notlang);
                Response.Redirect("index.aspx?returnlink=" + returnlink.Value + "&notlang=" + notlang + "&returning=Y");

            }
            else
            {
                // Response.Redirect("SubIdeas.aspx?employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
                Response.Redirect("SubIdeas.aspx?employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang + "&returning=Y");

            }

        }
        protected void SavingsButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                //Response.Redirect("SubSavings.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&criteria=" + criteria + "&notlang=" + notlang);
                Response.Redirect("SubSavings.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubSavings.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }
        protected void BonusButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("SubBonus.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubBonus.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }

        }

        protected void PointsButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("SubPoints.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubPoints.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }
        private void ShowPopUpMsg(string msg)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
            sb.Append("');");
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
        }

        protected void BackToSummary_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("index.aspx?returnlink=" + returnlink.Value + "&notlang=" + notlang + "&returning=Y");
            }
            else
            {
                Response.Redirect("EmpChart.aspx?employee=" + empvalue + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }

        protected void DocumentButton_Click(object sender, EventArgs e)
        {
            ideachk = Request.QueryString["Idea"].ToString();
            string locationString = Request.QueryString["location"].ToString();
            string employee = Request.QueryString["employee"].ToString();
            string type = Request.QueryString["type"].ToString();

            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("AimDocViewer.aspx?Idea=" + ideachk + "&location=" + locationString + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("AimDocViewer.aspx?Idea=" + ideachk + "&location=" + locationString + "&employee=" + employee + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }
        protected void PreAssignButton_Click(object sender, EventArgs e)
        {
            {
                if (empvalue == "" || empvalue == " ")
                {
                    //string criteria = savedCriteria.Value;
                    Response.Redirect("SubPreAssign.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

                }
                else
                {
                    Response.Redirect("SubPreAssign.aspx?Idea=" + ideachk + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
                }
            }
        }
        private void switchtospanish()
        {
            ReturnListButton.Text = "Volver a los resultados detallados";
            BackToSummary.Text = "Volver al resumen";
            h1E.Visible = false;
            h1S.Visible = true;
            R1T2E.Visible = false;
            R1T2S.Visible = true;
            R1T3E.Visible = false;
            R1T3S.Visible = true;
            cbProductivity.Text = "Productividad";
            cbQuality.Text = "Calidad";
            cbSafety.Text = "Seguridad";
            cbProcess.Text = "Proceso";
            R2T8S.Visible = true;
            R2T8E.Visible = false;
            cbYesprocess.Text = "Si";
            R3T3S.Visible = true;
            R3T3E.Visible = false;
            cbPeopleTime.Text = "Tiempo de la Gente";
            cbMaterials.Text = "Materiales";
            cbSetupTime.Text = "Tiempo de Ajuste";
            cbSavesCode4.Text = "Chatarra";
            R4T7E.Visible = false;
            R4T7S.Visible = true;
            cdYesCost500.Text = "Si";
            //R5T3S.Visible = true;
            //R5T3E.Visible = false;
            cbMultShifts.Text = "Turnos Multiples";
            cbMultDept.Text = "Departamentos Multiples";
            cbShopOnly.Text = "Solo Planta";
            cbOfficeOnly.Text = "Solo Oficina";
            cbShopOffice.Text = "Planta y Oficina";
            R5T7E.Visible = false;
            R5T7S.Visible = true;
            R8T1S.Visible = true;
            R8T1E.Visible = false;
            headtextE.Visible = false;
            headtextS.Visible = true;
            L1E.Visible = false;
            L1S.Visible = true;
            L2E.Visible = false;
            L2S.Visible = true;
            L3E.Visible = false;
            L3S.Visible = true;
            L4E.Visible = false;
            L4S.Visible = true;
            L5E.Visible = false;
            L5S.Visible = true;
            L6E.Visible = false;
            L6S.Visible = true;
            L7E.Visible = false;
            L7S.Visible = true;
            L8E.Visible = false;
            L8S.Visible = true;
            L9E.Visible = false;
            L9S.Visible = true;
            L10E.Visible = false;
            L10S.Visible = true;
            L11E.Visible = false;
            L11S.Visible = true;
            L12E.Visible = false;
            L12S.Visible = true;
            L13E.Visible = false;
            L13S.Visible = true;
            L14E.Visible = false;
            L14S.Visible = true;
            L15E.Visible = false;
            L15S.Visible = true;
            L16E.Visible = false;
            L16S.Visible = true;
            RRE.Visible = false;
            RRS.Visible = true;
            SavingsButton.Text = "Ahorros";
            BonusButton.Text = "Primo";
            PointsButton.Text = "Puntos";
            DocumentButton.Text = "Documentos";
            PreInvest.Text = "Investigación preliminar";


        }
        private void switchtoenglish()
        {
            ReturnListButton.Text = "Return to Detail Results";
            BackToSummary.Text = "Back to Summary";
            h1S.Visible = false;
            h1E.Visible = true;
            R1T2E.Visible = true;
            R1T2S.Visible = false;
            R1T3E.Visible = true;
            R1T3S.Visible = false;
            cbProductivity.Text = "Productivity";
            cbQuality.Text = "Quality";
            cbSafety.Text = "Safety";
            cbProcess.Text = "Process";
            R2T8E.Visible = true;
            R2T8S.Visible = false;
            cbYesprocess.Text = "Yes";
            R3T3E.Visible = true;
            R3T3S.Visible = false;
            cbPeopleTime.Text = "People Time";
            cbMaterials.Text = "Materials";
            cbSetupTime.Text = "Setup Time";
            cbSavesCode4.Text = "Scrap";
            R4T7E.Visible = true;
            R4T7S.Visible = false;
            cdYesCost500.Text = "Yes";
            //R5T3E.Visible = true;
            //R5T3S.Visible = false;
            cbMultShifts.Text = "Multiple Shifts";
            cbMultDept.Text = "Multiple Depts";
            cbShopOnly.Text = "Shop Only";
            cbOfficeOnly.Text = "Office Only";
            cbShopOffice.Text = "Shop/Office";
            R5T7E.Visible = true;
            R5T7S.Visible = false;
            R8T1E.Visible = true;
            R8T1S.Visible = false;
            headtextS.Visible = false;
            headtextE.Visible = true;
            L1S.Visible = false;
            L1E.Visible = true;
            L2S.Visible = false;
            L2E.Visible = true;
            L3S.Visible = false;
            L3E.Visible = true;
            L4S.Visible = false;
            L4E.Visible = true;
            L5S.Visible = false;
            L5E.Visible = true;
            L6S.Visible = false;
            L6E.Visible = true;
            L7S.Visible = false;
            L7E.Visible = true;
            L8S.Visible = false;
            L8E.Visible = true;
            L9S.Visible = false;
            L9E.Visible = true;
            L10S.Visible = false;
            L10E.Visible = true;
            L11S.Visible = false;
            L11E.Visible = true;
            L12S.Visible = false;
            L12E.Visible = true;
            L13S.Visible = false;
            L13E.Visible = true;
            L14S.Visible = false;
            L14E.Visible = true;
            L15S.Visible = false;
            L15E.Visible = true;
            L16S.Visible = false;
            L16E.Visible = true;
            RRS.Visible = false;
            RRE.Visible = true;
            SavingsButton.Text = "Savings";
            BonusButton.Text = "Bonus";
            PointsButton.Text = "Points";
            DocumentButton.Text = "Documents";
            PreInvest.Text = "Preliminary Investigation";

        }
    }
}