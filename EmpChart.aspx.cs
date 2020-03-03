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
using System.Web.UI.DataVisualization.Charting;
using static AimEmp_PWA.MySqlConnections;

namespace AimEmp_PWA
{
    public partial class EmpChart : System.Web.UI.Page
    {
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
        List<points> SortedPoints = new List<points>();

        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("ListInViewState", ideasList);
            ViewState.Add("ListInViewState2", IndIdea);
            ViewState.Add("ListInViewState3", IndBonus);
            ViewState.Add("ListInViewState4", IndSavings);
            ViewState.Add("ListInViewState5", IndPoints);
            ViewState.Add("ListInViewState6", SortedPoints);

            loadCharts();
        }
        private void loadCharts()
        {
            string employee = Request.QueryString["employee"];
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
            string deptName = "";
            string deptNumber = "";
            string empName = "";
            if (employee != "0" && employee != "")
            {
                double redeemedpoints = 0;
                double availablepoints = 0;
                getDept(employee, ref deptName, ref deptNumber, ref empName);
                SummaryEmpBox.Text = employee;
                SummaryNameBox.Text = empName;
                IndPoints.Clear();
                read_outSummaryPoints(employee, ref totalpoints, ref redeemedpoints, ref availablepoints);

                if (SortHidden.Value == " ")
                {
                    PointsGrid.DataSource = IndPoints;
                    PointsGrid.DataBind();
                }
                else
                {
                    trySorting();
                }
                //TotalPointsBox.Text = totalpoints.ToString();
                //RedeemedPointsBox.Text = (redeemedpoints * -1).ToString();
                //AvailablePointsBox.Text = availablepoints.ToString();
                string[] x = { " ", " " };
                double[] y = { 0, 0 };
                if (!showspanish)
                {
                    x[0] = "Redeemed" + "\n" + (redeemedpoints * -1).ToString();
                    x[1] = "Available" + "\n" + availablepoints.ToString();
                }
                if (showspanish)
                {
                    x[0] = "Redimido" + "\n" + (redeemedpoints * -1).ToString();
                    x[1] = "Disponible" + "\n" + availablepoints.ToString();
                }

                y[0] = redeemedpoints * -1;
                y[1] = availablepoints;

                PointsChart.Series[0].Points.DataBindXY(x, y);
                PointsChart.Series[0].Points[0].Color = System.Drawing.ColorTranslator.FromHtml("#FFA64D");
                PointsChart.Series[0].Points[1].Color = System.Drawing.ColorTranslator.FromHtml("#2E6399");
                PointsChart.Series[0].Points[1].LabelForeColor = System.Drawing.Color.White;
                PointsChart.Series[0].Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);
                PointsChart.BackColor = System.Drawing.ColorTranslator.FromHtml("#D9E9FE");
                PointsChart.ChartAreas["ChartArea1"].BackColor = System.Drawing.ColorTranslator.FromHtml("#D9E9FE");
                PointsChart.Series[0]["PieLabelStyle"] = "Inside";
                string criteria = " WHERE ";
                criteria = criteria + " (Emp1 = '" + employee.Trim() + "' OR Emp2 = '"
                                       + employee.Trim() + "' OR Emp3 ='"
                                       + employee.Trim() + "' OR Emp4 = '"
                                       + employee.Trim() + "') and archived <> 'Y'";
                int newidea = 0;
                int accepted = 0;
                int rejected = 0;
                int invest = 0;
                int waiting = 0;
                int implemented = 0;
                int prelinv = 0;
                int prelcomp = 0;
                ideasList.Clear();
                summaryideasInit(ref criteria, ref newidea, ref accepted, ref rejected, ref invest, ref waiting,
                    ref implemented, ref prelinv, ref prelcomp);
                int totalideas = newidea + accepted + rejected + invest + waiting + implemented + prelinv + prelcomp;
                string[] x2 = { " ", " ", " ", " ", " ", " ", " ", " ", " " };
                double[] y2 = { 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                if (!showspanish)
                {
                    x2[0] = "Total: " + (totalideas).ToString();
                    x2[1] = "New: " + newidea.ToString();
                    x2[2] = "Pre. Invest: " + prelinv.ToString();
                    x2[3] = "Pre. Invest Cmp: " + prelcomp.ToString();
                    x2[4] = "Accepted: " + accepted.ToString();
                    x2[5] = "Not Accepted: " + rejected.ToString();
                    x2[6] = "Investigating: " + invest.ToString();
                    x2[7] = "Investigation Completed: " + waiting.ToString();
                    x2[8] = "Implemented: " + implemented.ToString();
                }
                if (showspanish)
                {
                    x2[0] = "Total: " + (totalideas).ToString();
                    x2[1] = "Nuevo: " + newidea.ToString();
                    x2[2] = "Pre. Invest: " + prelinv.ToString();
                    x2[3] = "Pre. Invest Cmp: " + prelcomp.ToString();
                    x2[4] = "Aceptado: " + accepted.ToString();
                    x2[5] = "No Aceptada: " + rejected.ToString();
                    x2[6] = "Investigando: " + invest.ToString();
                    x2[7] = "Investigación completada: " + waiting.ToString();
                    x2[8] = "Implementado: " + implemented.ToString();
                }
                y2[0] = totalideas;
                y2[1] = newidea;
                y2[2] = prelinv;
                y2[3] = prelcomp;
                y2[4] = accepted;
                y2[5] = rejected;
                y2[6] = invest;
                y2[7] = waiting;
                y2[8] = implemented;
                IdeaChart.Series[0].Points.DataBindXY(x2, y2);
                if (!showspanish)
                {
                    IdeaChart.ChartAreas["ChartArea1"].AxisX.Title = "Idea Status";
                    IdeaChart.ChartAreas["ChartArea1"].AxisY.Title = "Number of Ideas";
                }
                if (showspanish)
                {
                    IdeaChart.ChartAreas["ChartArea1"].AxisX.Title = "Estado de la Idea";
                    IdeaChart.ChartAreas["ChartArea1"].AxisY.Title = "Numero de Ideas";
                }
                IdeaChart.BackColor = System.Drawing.ColorTranslator.FromHtml("#D9E9FE");
                IdeaChart.ChartAreas["ChartArea1"].BackColor = System.Drawing.ColorTranslator.FromHtml("#D9E9FE");
                IdeaChart.Series[0].Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);
                IdeaChart.ChartAreas["ChartArea1"].AxisX.LabelStyle.Font = new System.Drawing.Font("Arial", 10);
                IdeaChart.ChartAreas["ChartArea1"].AxisX.LabelStyle.Angle = -45;
                IdeaChart.ChartAreas["ChartArea1"].AxisX.LabelStyle.Interval = 1;
                IdeaChart.ChartAreas["ChartArea1"].AxisY.LabelStyle.Font = new System.Drawing.Font("Arial", 10);
                IdeaChart.ChartAreas["ChartArea1"].AxisX.TitleFont = new System.Drawing.Font("Arial", 10);
                IdeaChart.ChartAreas["ChartArea1"].AxisY.TitleFont = new System.Drawing.Font("Arial", 10);
                IdeaChart.Series["Series1"]["PixelPointWidth"] = "15";

                IdeaChart.Series[0].Points[0].Color = System.Drawing.ColorTranslator.FromHtml("#2E6399");
                IdeaChart.Series[0].Points[1].Color = System.Drawing.ColorTranslator.FromHtml("#E6C023");
                IdeaChart.Series[0].Points[2].Color = System.Drawing.ColorTranslator.FromHtml("#42CA86");
                IdeaChart.Series[0].Points[3].Color = System.Drawing.ColorTranslator.FromHtml("#CA6742");
                IdeaChart.Series[0].Points[4].Color = System.Drawing.ColorTranslator.FromHtml("#08D7F0");
                IdeaChart.Series[0].Points[5].Color = System.Drawing.ColorTranslator.FromHtml("#B242CA");
                IdeaChart.Series[0].Points[6].Color = System.Drawing.ColorTranslator.FromHtml("#82CA42");
                IdeaChart.Series[0].Points[7].Color = System.Drawing.ColorTranslator.FromHtml("#A2729A");
                IdeaChart.Series[0].Points[8].Color = System.Drawing.ColorTranslator.FromHtml("#0F1D83");

                IdeaChart.Series[0].Points[8].Url = "SubIdeas.aspx?employee=" + employee + "&type=IMP&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[7].Url = "SubIdeas.aspx?employee=" + employee + "&type=WTI&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[6].Url = "SubIdeas.aspx?employee=" + employee + "&type=INV&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[5].Url = "SubIdeas.aspx?employee=" + employee + "&type=REJ&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[4].Url = "SubIdeas.aspx?employee=" + employee + "&type=ACP&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[3].Url = "SubIdeas.aspx?employee=" + employee + "&type=PIC&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[2].Url = "SubIdeas.aspx?employee=" + employee + "&type=PIN&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[1].Url = "SubIdeas.aspx?employee=" + employee + "&type=NEW&returnlink=" + returnlink.Value + "&notlang=" + notlang;
                IdeaChart.Series[0].Points[0].Url = "SubIdeas.aspx?employee=" + employee + "&type=ALL&returnlink=" + returnlink.Value + "&notlang=" + notlang;

                
                Screen5.Visible = true;
                screen5bottom.Visible = true;
                if (GridHidden.Value == "N")
                {
                    PointsGrid.Visible = true;
                }
                else
                {
                    PointsGrid.Visible = false;
                }
                SortHidden.Value = " ";
            }


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "HWA", "BCloadIframe();", true);
                // SavedLocation.Value = Location.Text;
            }
            returnlink.Value = Request.QueryString["returnlink"];
            if (ViewState["ListInViewState"] != null)
            {
                ideasList = (List<IdeaList>)ViewState["ListInViewState"];
                IndIdea = (List<ideas>)ViewState["ListInViewState2"];
                IndBonus = (List<bonus>)ViewState["ListInViewState3"];
                IndSavings = (List<savings>)ViewState["ListInViewState4"];
                IndPoints = (List<points>)ViewState["ListInViewState5"];
                notlang = Request.QueryString["notlang"];
            }
            // loadCharts();
        }
        protected void PointsChart_PrePaint(object sender, ChartPaintEventArgs e)
        {
            if (e.ChartElement is ChartArea)
            {
                var ann = new TextAnnotation();
                ann.Text = "Total: " + totalpoints.ToString();
                ann.Width = e.Position.Width;
                ann.Height = e.Position.Height;
                ann.X = e.Position.X;
                ann.Y = e.Position.Y;
                ann.Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold);
                PointsChart.Annotations.Add(ann);
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
        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx?returnlink=" + returnlink.Value + "&notlang=" + notlang);


        }

        private void switchtospanish()
        {

            PointsGrid.Columns[0].HeaderText = "Número de idea";
            PointsGrid.Columns[1].HeaderText = "el Motivo";
            PointsGrid.Columns[2].HeaderText = "Puntos";
            PointsGrid.Columns[3].HeaderText = "Fecha";
            PointsGrid.Columns[4].HeaderText = "Otorgado por";
           // PointsGrid.Columns[5].HeaderText = "Motivo de ajuste";
            PointsGrid.Columns[0].FooterText = "Número de idea";
            PointsGrid.Columns[1].FooterText = "el Motivo";
            PointsGrid.Columns[2].FooterText = "Puntos";
            PointsGrid.Columns[3].FooterText = "Fecha";
            PointsGrid.Columns[4].FooterText = "Otorgado por";
            //PointsGrid.Columns[5].FooterText = "Motivo de ajuste";
            h1E.Visible = false;
            h1S.Visible = true;
            //div1E.Visible = false;
            //div1S.Visible = true;
            Label5.Visible = false;
            Label6.Visible = true;
            Label7.Visible = false;
            Label8.Visible = true;
            ReturnButton5.Text = "Volver a Buscar";
            PointsChart.Titles["Points"].Text = "Resumen de Puntos";
            ShowHide.Text = "Mostrar / Ocultar detalle de Punto";
        }
        private void switchtoenglish()
        {

            PointsGrid.Columns[0].HeaderText = "Idea Number";
            PointsGrid.Columns[1].HeaderText = "Reason";
            PointsGrid.Columns[2].HeaderText = "Points";
            PointsGrid.Columns[3].HeaderText = "Date";
            PointsGrid.Columns[4].HeaderText = "Awarded By";
           // PointsGrid.Columns[5].HeaderText = "Adjustment Reason";
            PointsGrid.Columns[0].FooterText = "Idea Number";
            PointsGrid.Columns[1].FooterText = "Reason";
            PointsGrid.Columns[2].FooterText = "Points";
            PointsGrid.Columns[3].FooterText = "Date";
            PointsGrid.Columns[4].FooterText = "Awarded By";
            //PointsGrid.Columns[5].FooterText = "Adjustment Reason";
            h1E.Visible = true;
            h1S.Visible = false;
            //div1E.Visible = true;
            //div1S.Visible = false;
            Label5.Visible = true;
            Label6.Visible = false;
            Label7.Visible = true;
            Label8.Visible = false;
            ReturnButton5.Text = "Back to Search";
            PointsChart.Titles["Points"].Text = "Points Summary";
            ShowHide.Text = "Show/Hide Point Detail";
        }
        protected void ShowHide_Click(object sender, EventArgs e)
        {
            if (PointsGrid.Visible)
            {
                PointsGrid.Visible = false;
                GridHidden.Value = "Y";
            }
            else
            {
                PointsGrid.Visible = true;
                GridHidden.Value = "N";
            }
        }
        protected void trySorting()
        {


            SortedPoints.Clear();
            if (SortHidden.Value == "pIdeaNum")
            {
                if (SortDirectionHidden.Value == "DESC")
                {
                    SortedPoints = IndPoints.OrderByDescending(p => p.pIdeaNum).ToList();

                }
                else
                {
                    SortedPoints = IndPoints.OrderBy(p => p.pIdeaNum).ToList();

                }
            }
            if (SortHidden.Value == "pReasonCode")
            {
                if (SortDirectionHidden.Value == "DESC")
                {
                    SortedPoints = IndPoints.OrderByDescending(p => p.pReasonCode).ThenByDescending(p => p.pSortDate).ThenByDescending(p => p.pIdeaNum).ToList();
                }
                else
                {
                    SortedPoints = IndPoints.OrderBy(p => p.pReasonCode).ThenBy(p => p.pSortDate).ThenBy(p => p.pIdeaNum).ToList();
                }
            }
            if (SortHidden.Value == "pActivityDate")
            {
                if (SortDirectionHidden.Value == "DESC")
                {
                    SortedPoints = IndPoints.OrderByDescending(p => p.pSortDate).ThenByDescending(p => p.pIdeaNum).ThenByDescending(p => p.pReasonCode).ToList();
                }
                else
                {
                    SortedPoints = IndPoints.OrderBy(p => p.pSortDate).ThenBy(p => p.pIdeaNum).ThenBy(p => p.pReasonCode).ToList();
                }
            }
            PointsGrid.DataSource = SortedPoints;
            PointsGrid.DataBind();

        }
        protected void SortRecords(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            string direction = string.Empty;

            if (SortDirection == SortDirection.Ascending)
            {
                SortDirection = SortDirection.Descending;
                direction = "DESC";
            }
            else
            {
                SortDirection = SortDirection.Ascending;
                direction = "ASC";
            }
            SortHidden.Value = sortExpression;
            SortDirectionHidden.Value = direction;
        }

        public SortDirection SortDirection
        {
            get
            {
                if (ViewState["SortDirection"] == null)
                {
                    ViewState["SortDirection"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["SortDirection"];
            }
            set
            {
                ViewState["SortDirection"] = value;

            }

        }
    }
}