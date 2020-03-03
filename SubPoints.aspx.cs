using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AimEmp_PWA
{
    public partial class SubPoints : System.Web.UI.Page
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
            // }
            loadPoints();

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
        protected void loadPoints()
        {
            checkLocation = Request.QueryString["location"];
            stringidea = Request.QueryString["Idea"];
            int.TryParse(stringidea, out checkIdea);
            IndPoints.Clear();
            read_outPoints();
            if (IndPoints.Count != 0)
            {
                PointsIdeaTextBox.Text = stringidea;
                PointsLocationTextBox.Text = checkLocation;
            }
            else
            {
                PointsIdeaTextBox.Text = stringidea;
                PointsLocationTextBox.Text = checkLocation;
            }
            PointsGrid.DataSource = IndPoints;
            PointsGrid.DataBind();
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
                Response.Redirect("EmpChart.aspx?employee=" + empvalue + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
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
            PointsGrid.Columns[0].HeaderText = "Empleado";
            PointsGrid.Columns[1].HeaderText = "Nombre";
            PointsGrid.Columns[2].HeaderText = "el Motivo";
            PointsGrid.Columns[3].HeaderText = "Puntos";
            PointsGrid.Columns[4].HeaderText = "Fecha";
            /* PointsGrid.Columns[5].HeaderText = "Otorgado por";
             PointsGrid.Columns[6].HeaderText = "Motivo de ajuste";
             PointsGrid.Columns[0].FooterText = "Empleado";
             PointsGrid.Columns[1].FooterText = "Nombre";
             PointsGrid.Columns[2].FooterText = "el Motivo";
             PointsGrid.Columns[3].FooterText = "Puntos";
             PointsGrid.Columns[4].FooterText = "Fecha";
             PointsGrid.Columns[5].FooterText = "Otorgado por";
             PointsGrid.Columns[6].FooterText = "Motivo de ajuste"; */

            ReturnListButton.Text = "Volver a los resultados detallados";
            BackToSummary.Text = "Volver al resumen";
            Button4.Text = "Volver a la idea";
            Button5.Text = "Ahorros";
            Button6.Text = "Primo";
            Button7.Text = "Documentos";
            PreInvest.Text = "Investigación preliminar";
            h1E.Visible = false;
            h1S.Visible = true;
            Label3.Visible = false;
            Label4.Visible = true;
            hs3E.Visible = false;
            hs3S.Visible = true;
            Label5.Visible = false;
            Label6.Visible = true;

        }
        private void switchtoenglish()
        {
            PointsGrid.Columns[0].HeaderText = "Employee";
            PointsGrid.Columns[1].HeaderText = "Name";
            PointsGrid.Columns[2].HeaderText = "Reason";
            PointsGrid.Columns[3].HeaderText = "Points";
            PointsGrid.Columns[4].HeaderText = "Date";
            /* PointsGrid.Columns[5].HeaderText = "Awarded By";
             PointsGrid.Columns[6].HeaderText = "Adjustment Reason";
             PointsGrid.Columns[0].FooterText = "Employee";
             PointsGrid.Columns[1].FooterText = "Name";
             PointsGrid.Columns[2].FooterText = "Reason";
             PointsGrid.Columns[3].FooterText = "Points";
             PointsGrid.Columns[4].FooterText = "Date";
             PointsGrid.Columns[5].FooterText = "Awarded By";
             PointsGrid.Columns[6].FooterText = "Adjustment Reason"; */

            ReturnListButton.Text = "Return to Detail Results";
            BackToSummary.Text = "Back to Summary";
            Button4.Text = "Back to Idea";
            Button5.Text = "Savings";
            Button6.Text = "Bonus";
            Button7.Text = "Documents";
            PreInvest.Text = "Preliminary Investigation";
            h1S.Visible = false;
            h1E.Visible = true;
            Label5.Visible = true;
            Label6.Visible = false;
            Label3.Visible = true;
            Label4.Visible = false;
            hs3E.Visible = true;
            hs3S.Visible = false;
        }
    }
}