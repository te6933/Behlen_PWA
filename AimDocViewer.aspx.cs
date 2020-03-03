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
using static AimEmp_PWA.MySqlConnections;

namespace AimEmp_PWA
{
    public partial class AimDocViewer : System.Web.UI.Page
    {
        public int checkIdeaD;
        public string notlang;
        public bool showspanish;

        List<Documents> DocumentsList = new List<Documents>();
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("ListInViewState", DocumentsList);

            //if (Request.QueryString.AllKeys.Contains("criteria"))
            //{
            //    if (Request.QueryString["criteria"].ToString() != "")
            //    {
            //        savedCriteria.Value = Request.QueryString["criteria"].ToString();
            //    }
            // }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "HWA", "BCloadIframe();", true);
            }
            if (ViewState["ListInViewState"] != null)
            {
                DocumentsList = (List<Documents>)ViewState["ListInViewState"];

            }
            string stringIdea = Request.QueryString["Idea"].ToString();
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

            int.TryParse(stringIdea, out checkIdeaD);
            DocumentsList.Clear();
            loadDocuments();
            if (DocumentsList.Count() < 1)
            {
                NoDocs.Visible = true;
            }
            else
            {

                DocumentGrid.DataSource = DocumentsList;
                DocumentGrid.DataBind();
                NoDocs.Visible = false;
                gridDiv.Visible = true;
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



        protected void ReturnToCall_Click(object sender, EventArgs e)
        {
            //string criteria = savedCriteria.Value;
            string ideachk = Request.QueryString["Idea"].ToString();
            string locationString = Request.QueryString["location"].ToString();
            string employee = Request.QueryString["employee"].ToString();
            string type = Request.QueryString["type"].ToString();

            if (employee == "" || employee == " ")
            {

                Response.Redirect("SubMainIdea.aspx?Idea=" + ideachk + "&location=" + locationString + "&employee=" + employee + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
            else
            {
                Response.Redirect("SubMainIdea.aspx?Idea=" + ideachk + "&location=" + locationString + "&employee=" + employee + "&type=" + type + "&returnlink=" + returnlink.Value + "&notlang=" + notlang);
            }
        }
        private void switchtospanish()
        {
            DocumentGrid.Columns[1].HeaderText = "Documento";
            DocumentGrid.Columns[2].HeaderText = "Tipo";
            DocumentGrid.Columns[3].HeaderText = "Conexión";
            DocumentGrid.Columns[1].FooterText = "Documento";
            DocumentGrid.Columns[2].FooterText = "Tipo";
            DocumentGrid.Columns[3].FooterText = "Conexión";
            ReturnToCall.Text = "Volver a la idea";
            NodE.Visible = false;
            NodS.Visible = true;
        }
        private void switchtoenglish()
        {
            DocumentGrid.Columns[1].HeaderText = "Document";
            DocumentGrid.Columns[2].HeaderText = "Type";
            DocumentGrid.Columns[3].HeaderText = "Link";
            DocumentGrid.Columns[1].FooterText = "Document";
            DocumentGrid.Columns[2].FooterText = "Type";
            DocumentGrid.Columns[3].FooterText = "Link";
            ReturnToCall.Text = "Back to Idea";
            NodS.Visible = false;
            NodE.Visible = true;
        }
    }
}