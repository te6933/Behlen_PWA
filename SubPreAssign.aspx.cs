using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AimEmp_PWA
{
    public partial class SubPreAssign : System.Web.UI.Page
    {

        public string empvalue;
        public string type;
        public string stringidea;
        public string investigateOnly;

        public double totalpoints = 0;
        public int checkIdea;
        public string checkLocation;
        public string checkStatus;
        public string preIDNum;
        public string notlang;
        public bool showspanish;

        List<IdeaList> ideasList = new List<IdeaList>();
        List<ideas> IndIdea = new List<ideas>();
        List<bonus> IndBonus = new List<bonus>();
        List<savings> IndSavings = new List<savings>();
        List<points> IndPoints = new List<points>();
        List<preliminary> IndPreliminary = new List<preliminary>();

        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("ListInViewState", ideasList);
            ViewState.Add("ListInViewState2", IndIdea);
            ViewState.Add("ListInViewState3", IndBonus);
            ViewState.Add("ListInViewState4", IndSavings);
            ViewState.Add("ListInViewState5", IndPoints);
            ViewState.Add("ListInViewState6", IndPreliminary);
            //if (Request.QueryString.AllKeys.Contains("criteria"))
            //{
            //   if (Request.QueryString["criteria"].ToString() != "")
            //  {
            //     savedCriteria.Value = Request.QueryString["criteria"].ToString();
            // }
            //}
            loadPreliminary();

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
                IndPreliminary = (List<preliminary>)ViewState["ListInViewState6"];

            }

        }
        protected void loadPreliminary()
        {
            checkLocation = Request.QueryString["location"];
            stringidea = Request.QueryString["Idea"];
            int.TryParse(stringidea, out checkIdea);
            IndPreliminary.Clear();
            read_outPreAssign();
            PrelimIdeaTextBox.Text = stringidea;
            PrelimLocationTextBox.Text = checkLocation;

            PreliminaryGrid.DataSource = IndPreliminary;
            PreliminaryGrid.DataBind();
            returnDiv.Visible = true;
            Screen4.Visible = true;
            screen4bottom.Visible = true;
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
                Response.Redirect("EmployeeCharts.aspx?employee=" + empvalue + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
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
                Response.Redirect("AIMDocumentViewerForm1.aspx?Idea=" + ideachk + "&location=" + locationString + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            }
            else
            {
                Response.Redirect("AIMDocumentViewerForm1.aspx?Idea=" + ideachk + "&location=" + locationString + "&employee=" + employee + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }
        private void switchtospanish()
        {
            ReturnListButton.Text = "Volver a los resultados detallados";
            BackToSummary.Text = "Volver al resumen";
            Button4.Text = "Volver a la idea";
            Button5.Text = "Ahorros";
            Button6.Text = "Primo";
            Button1.Text = "Puntos";
            Button7.Text = "Documentos";
            h1E.Visible = false;
            h1S.Visible = true;
            h2E.Visible = false;
            h2S.Visible = true;
            Label3.Visible = false;
            Label4.Visible = true;
            Label5.Visible = false;
            Label6.Visible = true;
        }
        private void switchtoenglish()
        {
            ReturnListButton.Text = "Return to Detail Results";
            BackToSummary.Text = "Back to Summary";
            Button4.Text = "Back to Idea";
            Button5.Text = "Savings";
            Button6.Text = "Bonus";
            Button1.Text = "Points";
            Button7.Text = "Documents";
            h1S.Visible = false;
            h1E.Visible = true;
            h2S.Visible = false;
            h2E.Visible = true;
            Label4.Visible = false;
            Label3.Visible = true;
            Label6.Visible = false;
            Label5.Visible = true;

        }
    }
}