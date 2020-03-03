using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AimEmp_PWA
{
    public partial class SubSavings : System.Web.UI.Page
    {
        public string empvalue;
        public string type;
        public string stringidea;

        public double totalpoints = 0;
        public int checkIdea;
        public string checkLocation;
        public string checkStatus;
        public string notlang;
        public bool showspanish;

        List<IdeaList> ideasList = new List<IdeaList>();
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
            loadSavings();

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
            stringidea = Request.QueryString["Idea"];
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
        private void loadSavings()
        {
            checkLocation = Request.QueryString["location"];
            stringidea = Request.QueryString["Idea"];
            IndIdea.Clear();
            read_outForm();
            IndSavings.Clear();
            int.TryParse(stringidea, out checkIdea);
            read_outSavings();
            if (IndSavings.Count != 0)
            {
                build_outSavings();


                Screen2.Visible = true;

                scree2bottom.Visible = true;


            }

        }
        private void build_outSavings()
        {
            IdeaNumber.Text = IndSavings[0].sIdeaNum.ToString();
            SavingLocationBox.Text = checkLocation;
            EstSaving.Text = IndSavings[0].sEstSavings.ToString("n2");
            RateBox.Text = IndSavings[0].sHourlyRate.ToString("n2");
            MinPerPiece.Text = IndSavings[0].sMinPerPiece.ToString("n0");
            PiecesPerYear.Text = IndSavings[0].sPiecesPerYear.ToString("n0");
            AnnualPieceSaving.Text = IndSavings[0].sAnnualSavingsByPiece.ToString("n2");
            SavingsPerDay.Text = IndSavings[0].sMinutesPerDay.ToString("n0");
            SavingPerWeek.Text = IndSavings[0].sMinutesPerWeek.ToString("n0");
            AnnualTimeSavings.Text = IndSavings[0].sAnnualSavingsByTime.ToString("n2");
            ScrapDollars.Text = IndSavings[0].sScrapDollarsPerPiece.ToString("n2");
            ScrapPieceCnt.Text = IndSavings[0].sPiecesScrapPerYear.ToString("n0");
            AnnualScrapSavings.Text = IndSavings[0].sSavingsByScrap.ToString("n2");
            OtherYear.Text = IndSavings[0].sOtherPerYear.ToString("n2");
            OtherOne.Text = IndSavings[0].sOtherTimeSavings.ToString("n2");
            SavingComments.Text = IndSavings[0].sComments;
            VerifiedBox.Text = IndSavings[0].sVerifiedBy;
            InitialEntryBox.Text = IndSavings[0].sInitialEntry;
            ReviewCommentsBox.Text = IndSavings[0].sReviewComments;
            HoursEst.Text = IndIdea[0].iHoursEst.ToString();
            MaterialEst.Text = IndIdea[0].iMaterialEst.ToString();

        }
        protected void BackToIdeaButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("SubMainIdea.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubMainIdea.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }

        protected void ReturnListButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("index.aspx?returnlink=" + returnlink.Value + "&notlang=" + notlang + "&returning=Y");

            }
            else
            {
                Response.Redirect("SubIdeas.aspx?employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang + "&returning=Y");
            }
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
                Response.Redirect("EmployeeCharts.aspx?employee=" + empvalue + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }

        protected void BonusButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("SubBonus.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubBonus.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }

        }

        protected void PreInvest_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("SubPreAssign.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubPreAssign.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }

        protected void PointsButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("SubPoints.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubPoints.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
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
        protected void DocumentButton_Click(object sender, EventArgs e)
        {
            string ideachk = Request.QueryString["Idea"].ToString();
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
        private void switchtospanish()
        {
            ReturnListButton.Text = "Volver a los resultados detallados";
            BackToSummary.Text = "Volver al resumen";
            BackToIdea.Text = "Volver a la idea";
            BonusButton2.Text = "Primo";
            PointsButton3.Text = "Puntos";
            DocuButton3.Text = "Documentos";
            PreInvest.Text = "Investigación preliminar";
            h1E.Visible = false;
            h1S.Visible = true;
            h2E.Visible = false;
            h2S.Visible = true;
            LocE.Visible = false;
            LocS.Visible = true;
            IdeaLabelE.Visible = false;
            IdeaLabelS.Visible = true;
            EstSaveLabelE.Visible = false;
            EstSaveLabelS.Visible = true;
            RateLabelE.Visible = false;
            RateLabelS.Visible = true;
            PieceHdrE.Visible = false;
            PieceHdrS.Visible = true;
            PieceMinE.Visible = false;
            PieceMinS.Visible = true;
            PieceYRE.Visible = false;
            PieceYRS.Visible = true;
            PieceSavingE.Visible = false;
            PieceSavingS.Visible = true;
            TimeHdrE.Visible = false;
            TimeHdrS.Visible = true;
            TimeMinDayE.Visible = false;
            TimeMinDayS.Visible = true;
            TimeMinWeekE.Visible = false;
            TimeMinWeekS.Visible = true;
            TimeSavingsE.Visible = false;
            TimeSavingsS.Visible = true;
            ScrapHdrE.Visible = false;
            ScrapHdrS.Visible = true;
            ScrapDollE.Visible = false;
            ScrapDollS.Visible = true;
            ScrapPieceE.Visible = false;
            ScrapPieceS.Visible = true;
            ScrapSavingsE.Visible = false;
            ScrapSavingsS.Visible = true;
            OtherE.Visible = false;
            OtherS.Visible = true;
            OtherYearE.Visible = false;
            OtherYearS.Visible = true;
            OtherOneE.Visible = false;
            OtherOneS.Visible = true;
            CommentE.Visible = false;
            CommentS.Visible = true;
            HoursE.Visible = false;
            HoursS.Visible = true;
            MatE.Visible = false;
            MatS.Visible = true;
            VerE.Visible = false;
            VerS.Visible = true;
            CompE.Visible = false;
            CompS.Visible = true;
            RevE.Visible = false;
            RevS.Visible = true;
        }
        private void switchtoenglish()
        {
            ReturnListButton.Text = "Return to Detail Results";
            BackToSummary.Text = "Back to Summary";
            BackToIdea.Text = "Back to Idea";
            BonusButton2.Text = "Bonus";
            PointsButton3.Text = "Points";
            DocuButton3.Text = "Documents";
            PreInvest.Text = "Preliminary Investigation";
            h1S.Visible = false;
            h1E.Visible = true;
            h2S.Visible = false;
            h2E.Visible = true;
            LocS.Visible = false;
            LocE.Visible = true;
            IdeaLabelS.Visible = false;
            IdeaLabelE.Visible = true;
            EstSaveLabelS.Visible = false;
            EstSaveLabelE.Visible = true;
            RateLabelS.Visible = false;
            RateLabelE.Visible = true;
            PieceHdrS.Visible = false;
            PieceHdrE.Visible = true;
            PieceMinS.Visible = false;
            PieceMinE.Visible = true;
            PieceYRS.Visible = false;
            PieceYRE.Visible = true;
            PieceSavingS.Visible = false;
            PieceSavingE.Visible = true;
            TimeHdrS.Visible = false;
            TimeHdrE.Visible = true;
            TimeMinDayS.Visible = false;
            TimeMinDayE.Visible = true;
            TimeMinWeekS.Visible = false;
            TimeMinWeekE.Visible = true;
            TimeSavingsS.Visible = false;
            TimeSavingsE.Visible = true;
            ScrapHdrS.Visible = false;
            ScrapHdrE.Visible = true;
            ScrapDollS.Visible = false;
            ScrapDollE.Visible = true;
            ScrapPieceS.Visible = false;
            ScrapPieceE.Visible = true;
            ScrapSavingsS.Visible = false;
            ScrapSavingsE.Visible = true;
            OtherS.Visible = false;
            OtherE.Visible = true;
            OtherYearS.Visible = false;
            OtherYearE.Visible = true;
            OtherOneS.Visible = false;
            OtherOneE.Visible = true;
            CommentS.Visible = false;
            CommentE.Visible = true;
            HoursS.Visible = false;
            HoursE.Visible = true;
            MatS.Visible = false;
            MatE.Visible = true;
            VerS.Visible = false;
            VerE.Visible = true;
            CompS.Visible = false;
            CompE.Visible = true;
            RevS.Visible = false;
            RevE.Visible = true;
        }
    }
}