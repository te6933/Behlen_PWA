using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AimEmp_PWA
{
    public partial class SubIdeas : System.Web.UI.Page
    {
        public string empvalue;
        public string type;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "HWA", "BCloadIframe();", true);

                // SavedLocation.Value = Location.Text;


                returnlink.Value = Request.QueryString["returnlink"];

                empvalue = Request.QueryString["employee"];
                type = Request.QueryString["type"];
                notlang = Request.QueryString["notlang"];
                if (notlang == "English")
                {
                    showspanish = true;
                }
                else
                {
                    showspanish = false;
                }
                string criteria = " WHERE ";
                criteria = criteria + " (Emp1 = '" + empvalue.Trim() + "' OR Emp2 = '"
                            + empvalue.Trim() + "' OR Emp3 ='"
                            + empvalue.Trim() + "' OR Emp4 = '"
                            + empvalue.Trim() + "') and Archived <> 'Y'";

                if (type != "ALL")
                {
                    criteria = criteria + " and CurrStatus = '" + type + "'";
                }

                if (showspanish)
                {
                    switchtospanish();
                }
                else
                {
                    switchtoenglish();
                }


                ideasList.Clear();
                ideasInit(ref criteria);
                ideaGrid.DataSource = ideasList;
                ideaGrid.DataBind();
                searchDiv.Visible = true;
                gridDiv.Visible = true;
            }
            empvalue = Request.QueryString["employee"];
            type = Request.QueryString["type"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            notlang = Request.QueryString["notlang"];
            Response.Redirect("EmpChart.aspx?employee=" + empvalue + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);

            //ScriptManager.RegisterStartupScript(Page, typeof(Page), "Close Window", "closingNow();", true);


        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            checkIdea = 0;
            checkLocation = "";
            checkStatus = "";
            notlang = Request.QueryString["notlang"];

            foreach (GridViewRow row in ideaGrid.Rows)
            {
                // access the checkbox
                CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                if (cb != null && cb.Checked)
                {
                    string stringIdea = Convert.ToString(ideaGrid.DataKeys[row.RowIndex].Values[0]);
                    int.TryParse(stringIdea, out checkIdea);
                    checkLocation = Convert.ToString(ideaGrid.DataKeys[row.RowIndex].Values[1]);
                    checkStatus = Convert.ToString(ideaGrid.DataKeys[row.RowIndex].Values[2]);
                    Response.Redirect("SubMainIdea.aspx?Idea=" + stringIdea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);


                }
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

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

            }
        }

        private void switchtospanish()
        {
            ideaGrid.Columns[3].HeaderText = "Estado";
            ideaGrid.Columns[4].HeaderText = "Fecha Enviado";
            ideaGrid.Columns[5].HeaderText = "Aceptado / Fecha no Acetada";
            ideaGrid.Columns[6].HeaderText = "Fecha de implementación";
            ideaGrid.Columns[7].HeaderText = "Autor 1";
            ideaGrid.Columns[8].HeaderText = "Autor 2";
            ideaGrid.Columns[9].HeaderText = "Autor 3";
            ideaGrid.Columns[10].HeaderText = "Autor 4";
            ideaGrid.Columns[11].HeaderText = "Texto de Idea";
            ideaGrid.Columns[3].FooterText = "Estado";
            ideaGrid.Columns[4].FooterText = "Fecha Enviado";
            ideaGrid.Columns[5].FooterText = "Aceptado / Fecha no Acetada";
            ideaGrid.Columns[6].FooterText = "Fecha de implementación";
            ideaGrid.Columns[7].FooterText = "Autor 1";
            ideaGrid.Columns[8].FooterText = "Autor 2";
            ideaGrid.Columns[9].FooterText = "Autor 3";
            ideaGrid.Columns[10].FooterText = "Autor 4";
            ideaGrid.Columns[11].FooterText = "Texto de Idea";
            h1E.Visible = false;
            h1S.Visible = true;
            Button1.Text = "Regreso";
        }

        private void switchtoenglish()
        {
            ideaGrid.Columns[3].HeaderText = "Status";
            ideaGrid.Columns[4].HeaderText = "Date Submitted";
            ideaGrid.Columns[5].HeaderText = "Accepted / Not Accepted Date";
            ideaGrid.Columns[6].HeaderText = "Date Implemented";
            ideaGrid.Columns[7].HeaderText = "Author 1";
            ideaGrid.Columns[8].HeaderText = "Author 2";
            ideaGrid.Columns[9].HeaderText = "Author 3";
            ideaGrid.Columns[10].HeaderText = "Author 4";
            ideaGrid.Columns[11].HeaderText = "Idea Text";
            ideaGrid.Columns[3].FooterText = "Status";
            ideaGrid.Columns[4].FooterText = "Date Submitted";
            ideaGrid.Columns[5].FooterText = "Accepted / Not Accepted Date";
            ideaGrid.Columns[6].FooterText = "Date Implemented";
            ideaGrid.Columns[7].FooterText = "Author 1";
            ideaGrid.Columns[8].FooterText = "Author 2";
            ideaGrid.Columns[9].FooterText = "Author 3";
            ideaGrid.Columns[10].FooterText = "Author 4";
            ideaGrid.Columns[11].FooterText = "Idea Text";
            h1S.Visible = false;
            h1E.Visible = true;
            Button1.Text = "Return";
        }
    }
}