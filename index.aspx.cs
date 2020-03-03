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
    public partial class index : System.Web.UI.Page
    {
        public double totalpoints = 0;
        public int checkIdea;
        public string checkLocation;
        public string checkStatus;
        public string saveCriteria;
        public string notlang;
        public bool showspanish;
        public string criteria;

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
            cbAuthor.Checked = true;
            cbInstaller.Checked = true;
            cbInvest.Checked = true;

            EmployeeSummaryBox.Focus();
            if (Request.QueryString.AllKeys.Contains("notlang"))
            {
                notlang = Request.QueryString["notlang"];
                setLanguage();
                SpanishButton.Text = notlang;
            }


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDept();

                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "HWA", "BCloadIframe();", true);
                // SavedLocation.Value = Location.Text;
                if (Request.QueryString.AllKeys.Contains("returning"))
                {

                    string returningnow = Request.QueryString["returning"];
                    ideasList.Clear();
                    criteria = Session["newsavedCriteria"].ToString();
                    if (criteria != "")
                    {
                        ideasInit(ref criteria);

                        //
                        // if more than 1 idea is returned, fill the grid
                        //
                        ideaGrid.DataSource = ideasList;
                        ideaGrid.DataBind();
                        searchDiv.Visible = false;
                        gridDiv.Visible = true;
                        bottomDiv.Visible = true;
                        topDiv.Visible = true;
                        searchCount.Text = ideasList.Count.ToString();
                        if (ideasList.Count != 0)
                        {
                            noRecs.Visible = false;
                        }
                        else
                        {
                            noRecs.Visible = true;
                        }
                        //Session["savedCriteria"] = "";
                    }
                }
            }
            returnlink.Value = Request.QueryString["returnlink"];

            if (ViewState["ListInViewState"] != null)
            {
                ideasList = (List<IdeaList>)ViewState["ListInViewState"];
                IndIdea = (List<ideas>)ViewState["ListInViewState2"];
                IndBonus = (List<bonus>)ViewState["ListInViewState3"];
                IndSavings = (List<savings>)ViewState["ListInViewState4"];
                IndPoints = (List<points>)ViewState["ListInViewState5"];


            }
        }
        protected void deptDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DeptDownList1.SelectedIndex > -1)
            {
                EffDept.Text = DeptDownList1.SelectedValue;


            }
        }

      /*  protected void StartCalendar_SelectionChanged(object sender, EventArgs e)
        {
            StartTextBox.Text = StartCalendar.SelectedDate.ToShortDateString();
            startdate.Value = StartCalendar.SelectedDate.ToString("yyyy-MM-dd");

        }
        protected void EndCalendar_SelectionChanged(object sender, EventArgs e)
        {
            EndTextBox.Text = EndCalendar.SelectedDate.ToShortDateString();
            enddate.Value = EndCalendar.SelectedDate.ToString("yyyy-MM-dd");
        }*/

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (StartTextBox.Text != "")
            {
                DateTime sDate;
                DateTime.TryParse(StartTextBox.Text, out sDate);
                if (sDate.ToShortDateString() == "01/01/0001" || sDate.ToShortDateString() == "")
                {
                    ShowPopUpMsg("Starting Date Entered is Invalid");
                    return;
                }
                else
                {
                    startdate.Value = sDate.ToString("yyyy-MM-dd");
                }
            }
            if (EndTextBox.Text != "")
            {
                DateTime eDate;
                DateTime.TryParse(EndTextBox.Text, out eDate);
                if (eDate.ToShortDateString() == "01/01/0001" || eDate.ToShortDateString() == "")
                {
                    ShowPopUpMsg("Ending Date Entered is Invalid");
                    return;
                }
                else
                {
                    enddate.Value = eDate.ToString("yyyy-MM-dd");
                }
            }
            if (StartTextBox.Text == "")
            {
                startdate.Value = "";
            }
            if (EndTextBox.Text == "")
            {
                enddate.Value = "";
            }

            {
                if (startdate.Value == "" && enddate.Value == "")
                {
                }
                else
                {
                    if (startdate.Value == "" || enddate.Value == "")
                    {
                        ShowPopUpMsg("You must select BOTH a Starting and Ending Date");
                        return;
                    }
                }
                Int32 sdate;
                Int32 edate;
                Int32.TryParse(startdate.Value, out sdate);
                Int32.TryParse(enddate.Value, out edate);
                if (edate < sdate)
                {
                    ShowPopUpMsg("Ending Date can not be BEFORE Starting Date");
                    return;
                }
            }
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            else
            {
                showspanish = false;
            }

            string criteria = "";
            buildCritera(ref criteria);
            savedCriteria.Value = criteria;
            Session["newsavedCriteria"] = criteria;
            ideasList.Clear();
            ideasInit(ref criteria);

            if (ideasList.Count == 1)
            {
                checkIdea = ideasList[0].plIdea;
                string stringIdea = checkIdea.ToString();
                checkLocation = ideasList[0].plLocation;
                checkStatus = ideasList[0].plStatus;
                string empvalue = "";
                Response.Redirect("SubMainIdea.aspx?Idea=" + stringIdea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + checkStatus + "&returnlink=" + returnlink.Value + "&notlang=" + SpanishButton.Text);

                //Response.Redirect("SubMainIdea.aspx?Idea=" + stringIdea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + checkStatus + "&returnlink=" + returnlink.Value + "&criteria=" + savedCriteria.Value + "&notlang=" + SpanishButton.Text);
            }
            else
            {
                ideaGrid.DataSource = ideasList;
                ideaGrid.DataBind();
                searchDiv.Visible = false;
                gridDiv.Visible = true;
                bottomDiv.Visible = true;
                topDiv.Visible = true;
                searchCount.Text = ideasList.Count.ToString();
                if (ideasList.Count != 0)
                {
                    noRecs.Visible = false;
                }
                else
                {
                    noRecs.Visible = true;
                }
            }
                
        }
        private void resetGridNow()
        {
            if (Session["newsavedCriteria"] != null)
            {
                string criteria = Session["newsavedCriteria"].ToString();
            }
            ideasList.Clear();
            ideasInit(ref criteria);
            ideaGrid.DataSource = ideasList;
            ideaGrid.DataBind();
            searchDiv.Visible = false;
            gridDiv.Visible = true;
            bottomDiv.Visible = true;
            topDiv.Visible = true;
            searchCount.Text = ideasList.Count.ToString();
            if (ideasList.Count != 0)
            {
                noRecs.Visible = false;
            }
            else
            {
                noRecs.Visible = true;
            }
        }


        private void buildCritera(ref string criteria)
        {
            criteria = " WHERE Archived <> 'Y' ";
            if (DropDownLocations.SelectedIndex != -1)
            {
                if (DropDownLocations.SelectedValue != "ANY")
                {
                    criteria = criteria + " and Location = '" + DropDownLocations.SelectedValue + "'";
                }
            }
            if (DropDownStatus.SelectedIndex != -1)
            {
                if (DropDownStatus.SelectedValue != "ANY")
                {
                    criteria = criteria + " and CurrStatus = '" + DropDownStatus.SelectedValue + "'";
                }
            }
            if (EffDept.Text != "")
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria = " WHERE ";
                }
                criteria = criteria + " (EffectedDept = '" + EffDept.Text + "' OR Dept1 = '" + EffDept.Text +
                    "' OR Dept2 = '" + EffDept.Text + "' OR Dept3 = '" + EffDept.Text + "' OR Dept4 = '" +
                    EffDept.Text + "')";

            }

            if (startdate.Value != "")
            {
                if (DropDownStatus.SelectedIndex != -1)
                {
                    if (DropDownStatus.SelectedValue == "ANY" || DropDownStatus.SelectedValue == "NEW")
                    {

                    }
                    else
                    {
                        if (DropDownStatus.SelectedValue == "ACP")
                        {
                            if (criteria != "")
                            {
                                criteria = criteria + " AND ";
                            }
                            else
                            {
                                criteria = criteria + " WHERE ";
                            }

                            criteria = criteria + " CurrStatus in ('ACP','IMP')";
                        }
                        else
                        {
                            if (criteria != "")
                            {
                                criteria = criteria + " AND ";
                            }
                            else
                            {
                                criteria = criteria = " WHERE ";
                            }
                            criteria = criteria + " CurrStatus = '" + DropDownStatus.SelectedValue + "'";
                        }
                    }
                }
            }
            else
            {
                if (DropDownStatus.SelectedValue == "ANY")
                {

                }
                else
                {
                    if (criteria != "")
                    {
                        criteria = criteria + " AND ";
                    }
                    else
                    {
                        criteria = criteria = " WHERE ";
                    }
                    criteria = criteria + " CurrStatus = '" + DropDownStatus.SelectedValue + "'";

                }
            }

            if (startdate.Value != "")
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria = " WHERE ";
                }
                if (DropDownStatus.SelectedValue == "ANY" || DropDownStatus.SelectedValue == "NEW" || DropDownStatus.SelectedValue == "PIN" || DropDownStatus.SelectedValue == "PIC" || DropDownStatus.SelectedValue == "INV"
                    || DropDownStatus.SelectedValue == "WTI")
                {
                    criteria = criteria + " date(entered) between '" + startdate.Value + "' and '" + enddate.Value + "'";
                }
                else
                {
                    if (DropDownStatus.SelectedValue == "IMP")
                    {
                        criteria = criteria + " date(ImplementedDate) between '" + startdate.Value + "' and '" + enddate.Value + "'";

                    }
                    else
                    {
                        criteria = criteria + " date(RecommendDate) between '" + startdate.Value + "' and '" + enddate.Value + "'";
                    }
                }
            }
            if (NameTextBox.Text != "" && cbAuthor.Checked && !cbInvest.Checked && !cbInstaller.Checked)
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria = " WHERE ";
                }


                criteria = criteria + " (Emp1Name like '%" + NameTextBox.Text.Trim() + "%' OR Emp2Name like '%"
                                   + NameTextBox.Text.Trim() + "%' OR Emp3Name like '%"
                                   + NameTextBox.Text.Trim() + "%' OR Emp4Name like '%"
                                   + NameTextBox.Text.Trim() + "%')";

            }
            if (NameTextBox.Text != "" && cbInvest.Checked && !cbAuthor.Checked && !cbInstaller.Checked)
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria = " WHERE ";
                }


                criteria = criteria + " (Investigator like '%" + NameTextBox.Text.Trim() + "%' )";
            }

            if (NameTextBox.Text != "" && cbInstaller.Checked && !cbAuthor.Checked && !cbInvest.Checked)
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria = " WHERE ";
                }


                criteria = criteria + " (Implementor like '%" + NameTextBox.Text.Trim() + "%' )";

            }
            if (NameTextBox.Text != "")
            {
                if ((cbAuthor.Checked && (cbInstaller.Checked || cbInvest.Checked))
                    || (cbInstaller.Checked && (cbAuthor.Checked || cbInvest.Checked))
                    || (cbInvest.Checked && (cbAuthor.Checked || cbInstaller.Checked)))
                {
                    if (criteria != "")
                    {
                        criteria = criteria + " AND ( ";
                    }
                    else
                    {
                        criteria = criteria = " WHERE ( ";
                    }
                    if (cbAuthor.Checked)
                    {
                        criteria = criteria + " (Emp1Name like '%" + NameTextBox.Text.Trim() + "%' OR Emp2Name like '%"
                                       + NameTextBox.Text.Trim() + "%' OR Emp3Name like '%"
                                       + NameTextBox.Text.Trim() + "%' OR Emp4Name like '%"
                                       + NameTextBox.Text.Trim() + "%') ";

                        if (cbInstaller.Checked)
                        {
                            criteria = criteria + " OR (Implementor like '%" + NameTextBox.Text.Trim() + "%' )";
                        }
                        if (cbInvest.Checked)
                        {
                            criteria = criteria + " OR (Investigator like '%" + NameTextBox.Text.Trim() + "%' )";
                        }
                        criteria = criteria + ")";
                        cbAuthor.Checked = false;
                        cbInstaller.Checked = false;
                        cbInvest.Checked = false;
                    }
                    if (cbInstaller.Checked)
                    {
                        {
                            criteria = criteria + " (Implementor like '%" + NameTextBox.Text.Trim() + "%' )";
                        }
                        if (cbInvest.Checked)
                        {
                            criteria = criteria + " OR (Investigator like '%" + NameTextBox.Text.Trim() + "%' )";
                        }
                        criteria = criteria + ")";
                        cbAuthor.Checked = false;
                        cbInstaller.Checked = false;
                        cbInvest.Checked = false;

                    }
                    if (cbInvest.Checked)
                    {
                        if (cbInvest.Checked)
                        {
                            criteria = criteria + " (Investigator like '%" + NameTextBox.Text.Trim() + "%' )";
                        }
                        criteria = criteria + ")";
                        cbAuthor.Checked = false;
                        cbInstaller.Checked = false;
                        cbInvest.Checked = false;
                    }
                }
            }
            //if (NameTextBox.Text != "")
            //{
            //    if (criteria != "")
            //    {
            //        criteria = criteria + " AND ";
            //    }
            //    else
            //    {
            //        criteria = criteria = " WHERE ";
            //    }
            //    criteria = criteria + " (Emp1Name like '%" + NameTextBox.Text.Trim() + "%' OR Emp2Name like '%"
            //                       + NameTextBox.Text.Trim() + "%' OR Emp3Name like '%"
            //                       + NameTextBox.Text.Trim() + "%' OR Emp4Name like '%"
            //                       + NameTextBox.Text.Trim() + "%')";
            //}
            //if (EmpIDText.Text != "")
            //{
            //    if (criteria != "")
            //    {
            //        criteria = criteria + " AND ";
            //    }
            //    else
            //    {
            //        criteria = criteria = " WHERE ";
            //    }
            //    criteria = criteria + " (Emp1 = '" + EmpIDText.Text.Trim() + "' OR Emp2 = '"
            //                       + EmpIDText.Text.Trim() + "' OR Emp3 ='"
            //                      + EmpIDText.Text.Trim() + "' OR Emp4 = '"
            //                       + EmpIDText.Text.Trim() + "')";
            // }
            if (EmpIDText.Text != "" && cbAuthor.Checked && !cbInvest.Checked && !cbInstaller.Checked)
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria + " WHERE ";
                }
                criteria = criteria + " (Emp1 = '" + EmpIDText.Text.Trim() + "' OR Emp2 = '"
                                   + EmpIDText.Text.Trim() + "' OR Emp3 ='"
                                   + EmpIDText.Text.Trim() + "' OR Emp4 = '"
                                   + EmpIDText.Text.Trim() + "')";
            }

            if (EmpIDText.Text != "" & cbInvest.Checked && !cbAuthor.Checked && !cbInstaller.Checked)
            {
                if (criteria != "")
                {
                    criteria = criteria = " AND ";
                }
                else
                {
                    criteria = criteria + " WHERE ";
                }
                criteria = criteria + "(InvestEmp = '" + EmpIDText.Text.Trim() + "')";
            }

            if (EmpIDText.Text != "" & cbInstaller.Checked && !cbAuthor.Checked && !cbInvest.Checked)
            {
                if (criteria != "")
                {
                    criteria = criteria = " AND ";
                }
                else
                {
                    criteria = criteria + " WHERE ";
                }
                criteria = criteria + "(ImplemEmp = '" + EmpIDText.Text.Trim() + "')";
            }

            if (EmpIDText.Text != "")
            {
                if ((cbAuthor.Checked && (cbInstaller.Checked || cbInvest.Checked))
                    || (cbInstaller.Checked && (cbAuthor.Checked || cbInvest.Checked))
                    || (cbInvest.Checked && (cbAuthor.Checked || cbInstaller.Checked)))
                {
                    if (criteria != "")
                    {
                        criteria = criteria + " AND ( ";
                    }
                    else
                    {
                        criteria = criteria + " WHERE ( ";
                    }
                    if (cbAuthor.Checked)
                    {
                        criteria = criteria + " (Emp1 = '" + EmpIDText.Text.Trim() + "' OR Emp2 = '"
                                    + EmpIDText.Text.Trim() + "' OR Emp3 ='"
                                    + EmpIDText.Text.Trim() + "' OR Emp4 = '"
                                    + EmpIDText.Text.Trim() + "')";

                        if (cbInstaller.Checked)
                        {
                            criteria = criteria + " OR (ImplemEmp = '" + EmpIDText.Text.Trim() + "' )";
                        }
                        if (cbInvest.Checked)
                        {
                            criteria = criteria + " OR (InvestEmp = '" + EmpIDText.Text.Trim() + "' )";
                        }
                        criteria = criteria + ")";
                        cbAuthor.Checked = false;
                        cbInstaller.Checked = false;
                        cbInvest.Checked = false;
                    }
                    if (cbInstaller.Checked)
                    {
                        {
                            criteria = criteria + " (ImplemEmp = '" + EmpIDText.Text.Trim() + "' )";
                        }
                        if (cbInvest.Checked)
                        {
                            criteria = criteria + " OR (InvestEmp = '" + EmpIDText.Text.Trim() + "' )";
                        }
                        criteria = criteria + ")";
                        cbAuthor.Checked = false;
                        cbInstaller.Checked = false;
                        cbInvest.Checked = false;

                    }
                    if (cbInvest.Checked)
                    {
                        if (cbInvest.Checked)
                        {
                            criteria = criteria + " (InvestEmp = '" + EmpIDText.Text.Trim() + "' )";
                        }
                        criteria = criteria + ")";
                        cbAuthor.Checked = false;
                        cbInstaller.Checked = false;
                        cbInvest.Checked = false;
                    }
                }
            }
            if (TextText.Text != "")
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria = " WHERE ";
                }
                criteria = criteria + " IdeaText like '%" + TextText.Text.Trim() + "%'";
                //criteria = criteria + " IdeaText like '" + TextText.Text.Trim() + "'";
            }
            if (IdeaTextBox.Text != "")
            {
                int.TryParse(IdeaTextBox.Text, out checkIdea);
                if (checkIdea != 0)
                {
                    if (criteria != "")
                    {
                        criteria = criteria + " AND ";
                    }
                    else
                    {
                        criteria = criteria = " WHERE ";
                    }
                    criteria = criteria + " A.IdeaNum = " + IdeaTextBox.Text.Trim();
                }
            }
            if (BonusTextBox.Text == "Y" || BonusTextBox.Text == "y")
            {
                if (criteria != "")
                {
                    criteria = criteria + " AND ";
                }
                else
                {
                    criteria = criteria = " WHERE ";
                }
                criteria = criteria + " (IdeaOfMOnth = 'Y' or CoIdeaOfMonth = 'Y' or CoIdeaOfYear = 'Y')";
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
            searchDiv.Visible = true;
            EmployeeSummaryBox.Focus();
            gridDiv.Visible = false;
            bottomDiv.Visible = false;
            topDiv.Visible = false;
            returnDiv.Visible = false;
            goingBack.Value = "YES";
        }
      /*  protected void StartCalButton_Click(object sender, EventArgs e)
        {
            if (!StartCalendar.Visible)
            {
                StartCalendar.Visible = true;
            }
            else
            {
                StartCalendar.Visible = false;
            }

        }
        protected void EndCalButton_Click(object sender, EventArgs e)
        {
            if (!EndCalendar.Visible)
            {
                EndCalendar.Visible = true;
            }
            else
            {
                EndCalendar.Visible = false;
            }

        }*/

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            checkIdea = 0;
            checkLocation = "";
            checkStatus = "";

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
                    cb.Checked = false;
                    string empvalue = "";
                    Response.Redirect("SubMainIdea.aspx?Idea=" + stringIdea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + checkStatus + "&returnlink=" + returnlink.Value + "&notlang=" + SpanishButton.Text);

                    //Response.Redirect("SubMainIdea.aspx?Idea=" + stringIdea + "&location=" + checkLocation + "&employee=" + empvalue + "&type=" + checkStatus + "&returnlink=" + returnlink.Value + "&criteria=" + savedCriteria.Value + "&notlang=" + SpanishButton.Text);

                }
            }
        }
        
        protected void ReturnListButton_Click(object sender, EventArgs e)
        {
            searchDiv.Visible = false;
            gridDiv.Visible = true;
            bottomDiv.Visible = true;
            topDiv.Visible = true;
            returnDiv.Visible = false;
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

            }
        }

        protected void summaryButton_Click(object sender, EventArgs e)
        {
            if (EmployeeSummaryBox.Text != "") {
                string employee = EmployeeSummaryBox.Text;
                Response.Redirect("EmpChart.aspx?employee=" + employee + "&notlang=" + SpanishButton.Text + "&returnlink=" + returnlink.Value);
            }
            else
            {
                ShowPopUpMsg("Emp # Required");
            }

        }
        protected void spanishButton_Click(object sender, EventArgs e)
        {


            if (SpanishButton.Text == "Spanish")
            {
                notlang = "English";
                SpanishButton.Text = "English";
                var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
                nameValues.Set("notlang", "English");
                string url = Request.Url.AbsolutePath;
                string updatedQueryString = "?" + nameValues.ToString();
                Response.Redirect(url + updatedQueryString);
            }
            else
            {
                notlang = "Spanish";
                SpanishButton.Text = "Spanish";
                var nameValues = HttpUtility.ParseQueryString(Request.QueryString.ToString());
                nameValues.Set("notlang", "Spanish");
                string url = Request.Url.AbsolutePath;
                string updatedQueryString = "?" + nameValues.ToString();
                Response.Redirect(url + updatedQueryString);
            }
            setLanguage();
        }
        private void setLanguage()
        {
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
                switchToSpanish();
            }
            else

            {
                switchToEnglish();
            }
        }

        private void switchToSpanish()
        {
            ideaGrid.Columns[3].HeaderText = "Estado";
            ideaGrid.Columns[4].HeaderText = "Fecha Enviado";
            ideaGrid.Columns[5].HeaderText = "Aceptado / Fecha no Acetada";
            ideaGrid.Columns[6].HeaderText = "Fecha de implementación";
            ideaGrid.Columns[7].HeaderText = "Autor 1";
            ideaGrid.Columns[8].HeaderText = "Autor 2";
            ideaGrid.Columns[9].HeaderText = "Autor 3";
            ideaGrid.Columns[10].HeaderText = "Autor 4"; 
            ideaGrid.Columns[5].HeaderText = "Texto de Idea";
            ideaGrid.Columns[3].FooterText = "Estado";
            ideaGrid.Columns[4].FooterText = "Fecha Enviado";
            ideaGrid.Columns[5].FooterText = "Aceptado / Fecha no Acetada";
            ideaGrid.Columns[6].FooterText = "Fecha de implementación";
            ideaGrid.Columns[7].FooterText = "Autor 1";
            ideaGrid.Columns[8].FooterText = "Autor 2";
            ideaGrid.Columns[9].FooterText = "Autor 3";
            ideaGrid.Columns[10].FooterText = "Autor 4"; 
            ideaGrid.Columns[5].FooterText = "Texto de Idea";
            SummaryButton.Text = "Resumen";
            SubmitButton.Text = "Buscar";
            topReturnButton.Text = "Regresar a la búsqueda";
            noRecs.Text = "<br /><br />Ningún registro coincide con los criterios de búsqueda<br /><br />";
            searchCountLabel.Text = "Número de ideas en el conjunto de resultados:";
            ReturnButton.Text = "Regresar a la búsqueda";
            ReturnListButton.Text = "Regresar a los resultados de búsqueda";
            ReturntoSearch2.Text = "Regresar a la búsqueda";
            cbAuthor.Text = "Autor";
            cbInvest.Text = "Investigador y Comentar";
            cbInstaller.Text = "Implementador";
            CheckBoxHint.Text = "(Para búsquedas de nombre y / o ID de emp)";
            h1E.Visible = false;
            h1S.Visible = true;
            LocE.Visible = false;
            LocS.Visible = true;
            StatusE.Visible = false;
            StatusS.Visible = true;
            //Note1E.Visible = false;
            Note1S.Visible = true;
            OtherE.Visible = false;
            OtherS.Visible = true;
            Note2E.Visible = false;
            Note2S.Visible = true;
          /*  Note3E.Visible = false;
            Note3S.Visible = true;
            SelStatusE.Visible = false;
            SelStatusS.Visible = true;
            DateCompE.Visible = false;
            DateCompS.Visible = true;
            Stat1E.Visible = false;
            Stat1S.Visible = true;
            Date1E.Visible = false;
            Date1S.Visible = true;
            Stat2E.Visible = false;
            Stat2S.Visible = true;
            Date2E.Visible = false;
            Date2S.Visible = true;
            Stat3E.Visible = false;
            Stat3S.Visible = true;
            Date3E.Visible = false;
            Date3S.Visible = true; */
            DeptE.Visible = false;
            DeptS.Visible = true;
            StartE.Visible = false;
            StartS.Visible = true;
            EndE.Visible = false;
            EndS.Visible = true;
            NameE.Visible = false;
            NameS.Visible = true;
            IdeaE.Visible = false;
            IdeaS.Visible = true;
            IdeaNumE.Visible = false;
            IdeaNumS.Visible = true;
            BonusE.Visible = false;
            BonusS.Visible = true;
            //Note4E.Visible = false;
            //Note4S.Visible = true;
        }
        private void switchToEnglish()
        {
            ideaGrid.Columns[3].HeaderText = "Status";
            ideaGrid.Columns[4].HeaderText = "Date Submitted";
             ideaGrid.Columns[5].HeaderText = "Accepted / Not Accepted Date";
             ideaGrid.Columns[6].HeaderText = "Date Implemented";
             ideaGrid.Columns[7].HeaderText = "Author 1";
             ideaGrid.Columns[8].HeaderText = "Author 2";
             ideaGrid.Columns[9].HeaderText = "Author 3";
             ideaGrid.Columns[10].HeaderText = "Author 4"; 
             ideaGrid.Columns[5].HeaderText = "Idea Text";
             ideaGrid.Columns[3].FooterText = "Status";
             ideaGrid.Columns[4].FooterText = "Date Submitted";
             ideaGrid.Columns[5].FooterText = "Accepted / Not Accepted Date";
             ideaGrid.Columns[6].FooterText = "Date Implemented";
             ideaGrid.Columns[7].FooterText = "Author 1";
             ideaGrid.Columns[8].FooterText = "Author 2";
             ideaGrid.Columns[9].FooterText = "Author 3";
             ideaGrid.Columns[10].FooterText = "Author 4";
            ideaGrid.Columns[5].FooterText = "Idea Text";
            SummaryButton.Text = "Summary";
            SubmitButton.Text = "Search";
            topReturnButton.Text = "Return to Search";
            noRecs.Text = "<br /><br />No Records Match Search Criteria<br /><br />";
            searchCountLabel.Text = "Number of Ideas in result set:";
            ReturnButton.Text = "Return to Search";
            ReturnListButton.Text = "Return to Search Results";
            ReturntoSearch2.Text = "Return to Search";
            cbAuthor.Text = "Author";
            cbInvest.Text = "Investigator and Comments";
            cbInstaller.Text = "Implementor";
            CheckBoxHint.Text = "(For Name and/or Emp ID# Searches)";
            h1S.Visible = false;
            h1E.Visible = true;
            LocS.Visible = false;
            LocE.Visible = true;
            StatusS.Visible = false;
            StatusE.Visible = true;
            Note1S.Visible = false;
            //Note1E.Visible = true;
            OtherS.Visible = false;
            OtherE.Visible = true;
            Note2S.Visible = false;
            Note2E.Visible = true;
            /*Note3S.Visible = false;
            Note3E.Visible = true;
            SelStatusS.Visible = false;
            SelStatusE.Visible = true;
            DateCompS.Visible = false;
            DateCompE.Visible = true;
            Stat1S.Visible = false;
            Stat1E.Visible = true;
            Date1S.Visible = false;
            Date1E.Visible = true;
            Stat2S.Visible = false;
            Stat2E.Visible = true;
            Date2S.Visible = false;
            Date2E.Visible = true;
            Stat3S.Visible = false;
            Stat3E.Visible = true;
            Date3S.Visible = false;
            Date3E.Visible = true; */
            DeptS.Visible = false;
            DeptE.Visible = true;
            StartS.Visible = false;
            StartE.Visible = true;
            EndS.Visible = false;
            EndE.Visible = true;
            NameS.Visible = false;
            NameE.Visible = true;
            IdeaS.Visible = false;
            IdeaE.Visible = true;
            IdeaNumS.Visible = false;
            IdeaNumE.Visible = true;
            BonusS.Visible = false;
            BonusE.Visible = true;
            //Note4S.Visible = false;
           // Note4E.Visible = true;
        }
    }
}
