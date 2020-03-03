using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Text;
using System.Xml.Linq;
using System.Web.UI.DataVisualization.Charting;
using static AimEmp_PWA.MySqlConnections;

namespace AimEmp_PWA
{
    public partial class SubBonus : System.Web.UI.Page
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
            loadBonus();

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
        private void loadBonus()
        {
            checkLocation = Request.QueryString["location"];
            stringidea = Request.QueryString["Idea"];
            int.TryParse(stringidea, out checkIdea);
            IndBonus.Clear();
            read_outBonus();
            if (IndBonus.Count != 0)
            {
                build_outBonus();
                returnDiv.Visible = true;
                Screen3.Visible = true;
                screen3bottom.Visible = true;

            }

        }
        private void build_outBonus()
        {
            IdeaNumberBonus.Text = IndBonus[0].bIdeaNum.ToString();
            LocationBonus.Text = checkLocation;
            IdeaOfTheMonthBox.Text = IndBonus[0].bIdeaOfMonth;
            IdeaOfTheMonthMonth.Text = IndBonus[0].bIdeaOfMonthMonth.ToString("n0");
            IdeaOfTheMonthYear.Text = IndBonus[0].bIdeaOfMonthYear.ToString();
            CoIdeaOfTheMonthBox.Text = IndBonus[0].bCoIdeaOfMonth;
            CoIdeaOfTheMonthMonth.Text = IndBonus[0].bCoIdeaOfMonthMonth.ToString();
            CoIdeaOfTheMonthYear.Text = IndBonus[0].bCoIdeaOfMonthYear.ToString();
            CoIdeaOfTheYearBox.Text = IndBonus[0].bCoIdeaOfYear;
            CoIdeaOfTheYearYear.Text = IndBonus[0].bCoIdeaOfYearYear.ToString();

        }
        protected void BackToIdeaButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                //Response.Redirect("SubMainIdea.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&criteria=" + criteria + "&notlang=" + notlang);
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
                Response.Redirect("SubIdeas.aspx?employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
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
                Response.Redirect("EmpChart.aspx?employee=" + empvalue + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
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
        protected void SavingsButton_Click(object sender, EventArgs e)
        {
            if (empvalue == "" || empvalue == " ")
            {
                //string criteria = savedCriteria.Value;
                Response.Redirect("SubSavings.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("SubSavings.aspx?Idea=" + stringidea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
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
            Button1.Text = "Volver a la idea";
            Button2.Text = "Ahorros";
            Button3.Text = "Puntos";
            Button4.Text = "Documentos";
            PreInvest.Text = "Investigación preliminar";
            h1E.Visible = false;
            h1S.Visible = true;
            Label1.Visible = false;
            Label2.Visible = true;
            Label3.Visible = false;
            Label4.Visible = true;
            hs3E.Visible = false;
            hs3S.Visible = true;
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
        }
        private void switchtoenglish()
        {
            ReturnListButton.Text = "Return to Detail Results";
            BackToSummary.Text = "Back to Summary";
            Button1.Text = "Back to Idea";
            Button2.Text = "Savings";
            Button3.Text = "Points";
            Button4.Text = "Documents";
            PreInvest.Text = "Preliminary Investigation";
            h1S.Visible = false;
            h1E.Visible = true;
            Label1.Visible = true;
            Label2.Visible = false;
            Label3.Visible = true;
            Label4.Visible = false;
            hs3E.Visible = true;
            hs3S.Visible = false;
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
        }
    }
}