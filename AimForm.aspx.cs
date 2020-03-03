using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace AimEmp_PWA
{
    public partial class AimForm : System.Web.UI.Page
    {
        List<admin> adminList = new List<admin>();

        public int nextIdea;
        public string IC1, IC2, IC3, IC4, IC5;
        public string SC1, SC2, SC3, SC4, SC5;
        public string AT1, AT2, AT3, AT4, AT5;
        public string procCode, costCode;
        public decimal drate;
        public int IntMinPerPiece;
        public int IntPiecesPerYear;
        public decimal DecMinPerPiece = 0;
        public decimal DecPiecesPerYear = 0;
        public decimal DecAnnualPieceSaving;
        public int IntSavingsPerDay;
        public int IntSavingsPerWeek;
        public decimal DecSavingsPerDay = 0;
        public decimal DecSavingsPerWeek = 0;
        public decimal DecAnnualTimeSavings;
        public decimal DecScrapDollars = 0;
        public int IntScrapPieceCnt;
        public decimal DecScrapPieceCnt = 0;
        public decimal DecAnnualScrapSavings;
        public decimal DecOtherYear = 0;
        public decimal DecOtherOne = 0;
        public decimal TotalSavings = 0;
        public string enteredSavings = "N";


        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState.Add("ListInViewState", adminList);


        }

        protected void locationDropList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (locationDropList.SelectedIndex > 0)
            {
                Location.Text = locationDropList.Text;
                SavedLocation.Value = Location.Text;

            }
        }

        protected void deptDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DeptDownList1.SelectedIndex > -1)
            {
                EffDept.Text = DeptDownList1.SelectedValue;


            }
        }


        public decimal costAmnt;

        protected void Page_Load(object sender, EventArgs e)
        {
            //string userLabelx = this.Context.Request.LogonUserIdentity.Name;
            //UserID.Text = userLabelx;

            if (!IsPostBack)
            {
                loadDept();
                //ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "HWA", "BCloadIframe();", true);
                // SavedLocation.Value = Location.Text;


            }
            if (ViewState["ListInViewState"] != null)
            {
                adminList = (List<admin>)ViewState["ListInViewState"];

            }


        }

        protected void SpanishButton_Click(object sender, EventArgs e)
        {
            if (SpanishButton.Text == "Spanish")
            {
                switchToSpanish();
                SpanishButton.Text = "English";
            }
            else

            {
                switchToEnglish();
                SpanishButton.Text = "Spanish";
            }
            if (WhichScreen.Value == "1")
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "Screen 1", "showscreen1();", true);

            }
            if (WhichScreen.Value == "2")
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "Screen 2", "showscreen2();", true);

            }


        }



        protected void switchToSpanish()
        {
            Location.Text = SavedLocation.Value;
            LocE.Visible = false;
            LocS.Visible = true;
            Head1E.Visible = false;
            Head1S.Visible = true;
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
            EnterButton.Text = "Grabar Idea";
            EXIT.Text = "SALIR";
            IdeaLabelE.Visible = false;
            IdeaLabelS.Visible = true;
            EstSaveLabelE.Visible = false;
            EstSaveLabelS.Visible = true;
            CalcButton.Text = "CALCULAR";
            NoteE.Visible = false;
            NoteS.Visible = true;
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
            AcceptButton.Text = "ACEPTAR";
            ExitButton2.Text = "SALIDA";
        }

        protected void switchToEnglish()
        {
            Location.Text = SavedLocation.Value;
            LocS.Visible = false;
            LocE.Visible = true;
            Head1E.Visible = true;
            Head1S.Visible = false;
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
            EnterButton.Text = "Enter Idea";
            EXIT.Text = "EXIT";
            IdeaLabelS.Visible = false;
            IdeaLabelE.Visible = true;
            EstSaveLabelS.Visible = false;
            EstSaveLabelE.Visible = true;
            CalcButton.Text = "COMPUTE";
            NoteS.Visible = false;
            NoteE.Visible = true;
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
            AcceptButton.Text = "ACCEPT";
            ExitButton2.Text = "EXIT";

        }
        protected void UnloadForm(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Close Window", "closingNow();", true);
        }



        protected void EXIT_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Close Window", "closingNow();", true);
        }
        protected void EXIT_Click2(object sender, EventArgs e)
        {

            int.TryParse(IdeaNumber.Text, out nextIdea);
            decimal.TryParse(RateBox.Text, out drate);
            writeZeroSavings();

            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            if (!showspanish)
            {
                ShowPopUpMsg("Your Idea has been submitted without Savings Information");
            }
            else
            {
                ShowPopUpMsg("Su idea ha sido enviada sin guardar información");
            }



            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Close Window", "closingNow2();", true);
        }
        protected void CalcButton_Click(object sender, EventArgs e)
        {
            bool dataok = true;
            validateSavings(ref dataok);
            locationDropList.Visible = false;

            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Screen 2", "showscreen2();", true);
        }
        protected void Accept_Click(object sender, EventArgs e)
        {

            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            bool dataok = true;
            validateSavings(ref dataok);
            locationDropList.Visible = false;
            //
            // if bad data - re-enable the button
            //
            if (!dataok)
            {
                AcceptButton.Enabled = true;
            }
            if (dataok)
            {
                int.TryParse(IdeaNumber.Text, out nextIdea);
                writeSavings();

                if (!showspanish)
                {
                    ShowPopUpMsg("Your Idea has been submitted with Savings Information");
                }
                else
                {
                    ShowPopUpMsg("Su idea ha sido enviada con información guardada");
                }



                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "Screen 2", "showscreen2();", true);
                //Response.Redirect("ImageUpload.aspx?returnlink=" + returnlink.Value);
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "Close Window", "closingNow2();", true);

            }
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "Screen 2", "showscreen2();", true);
        }

        protected void validateSavings(ref bool dataok)
        {
            enteredSavings = "N";
            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            // minutes and pieces must be integers - but inorder to compute decimal values for the dollars
            // computations must be done with decimal type numbers.  
            // Integer type is used to check validity, and then decimal type is created
            //
            dataok = true;

            decimal.TryParse(RateBox.Text, out drate);

            //
            // savings by MINUTES PER PIECE
            //
            int.TryParse(MinPerPiece.Text, out IntMinPerPiece);
            int.TryParse(PiecesPerYear.Text, out IntPiecesPerYear);

            if (MinPerPiece.Text != "" && IntMinPerPiece == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Minutes per piece must be whole minutes");
                }
                else
                {
                    ShowPopUpMsg("Los minutos por pieza deben ser minutos completos");
                }
                MinPerPiece.Focus();
                dataok = false;
                return;
            }
            else
            {
                decimal.TryParse(MinPerPiece.Text, out DecMinPerPiece);
            }
            if (PiecesPerYear.Text != "" && IntPiecesPerYear == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Pieces per year must be whole pieces");
                }
                else
                {
                    ShowPopUpMsg("Las piezas por año deben ser piezas enteras");
                }
                PiecesPerYear.Focus();
                dataok = false;
                return;

            }
            else
            {
                decimal.TryParse(PiecesPerYear.Text, out DecPiecesPerYear);
            }

            DecAnnualPieceSaving = (((DecMinPerPiece * DecPiecesPerYear) / 60) * drate);
            AnnualPieceSaving.Text = DecAnnualPieceSaving.ToString("n2");
            //
            // savings by minutes/labor
            //
            int.TryParse(SavingsPerDay.Text, out IntSavingsPerDay);
            int.TryParse(SavingPerWeek.Text, out IntSavingsPerWeek);

            if (SavingsPerDay.Text != "" && IntSavingsPerDay == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Minutes saved per day must be whole minutes");
                }
                else
                {
                    ShowPopUpMsg("Los minutos ahorrados por día deben ser minutos completos");
                }
                SavingsPerDay.Focus();
                dataok = false;
                return;

            }
            else
            {
                decimal.TryParse(SavingsPerDay.Text, out DecSavingsPerDay);
            }
            if (SavingPerWeek.Text != "" && IntSavingsPerWeek == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Minutes saved per week must be whole minutes");
                }
                else
                {
                    ShowPopUpMsg("Los minutos ahorrados por semana deben ser minutos completos");
                }
                SavingPerWeek.Focus();
                dataok = false;
                return;

            }
            else
            {
                decimal.TryParse(SavingPerWeek.Text, out DecSavingsPerWeek);
            }
            if (DecSavingsPerDay != 0 && DecSavingsPerWeek != 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Only one time/labor savings can be entered");
                }
                else
                {
                    ShowPopUpMsg("Solo se puede ingresar un ahorro de tiempo / mano de obra");
                }
                SavingsPerDay.Focus();
                dataok = false;
                return;

            }

            if (DecSavingsPerDay != 0)
                DecAnnualTimeSavings = (((DecSavingsPerDay * 260) / 60) * drate);
            else
                DecAnnualTimeSavings = (((DecSavingsPerWeek * 52) / 60) * drate);

            AnnualTimeSavings.Text = DecAnnualTimeSavings.ToString("n2");
            //
            // Savings by dollars by scrap
            //
            decimal.TryParse(ScrapDollars.Text, out DecScrapDollars);
            int.TryParse(ScrapPieceCnt.Text, out IntScrapPieceCnt);

            if (ScrapDollars.Text != "" && DecScrapDollars == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Amount of scrap dollars must be entered as dollars and cents");
                }
                else
                {
                    ShowPopUpMsg("La cantidad de dólares chatarra debe ingresarse como dólares y centavos");
                }
                ScrapDollars.Focus();
                dataok = false;
                return;

            }

            if (ScrapPieceCnt.Text != "" && IntScrapPieceCnt == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Scrap pieces must be whole pieces");
                }
                else
                {
                    ShowPopUpMsg("Las piezas de chatarra deben ser piezas enteras");
                }
                ScrapPieceCnt.Focus();
                dataok = false;
                return;

            }
            else
            {
                decimal.TryParse(ScrapPieceCnt.Text, out DecScrapPieceCnt);
            }
            DecAnnualScrapSavings = DecScrapDollars * DecScrapPieceCnt;
            AnnualScrapSavings.Text = DecAnnualScrapSavings.ToString("n2");

            // other savings

            decimal.TryParse(OtherYear.Text, out DecOtherYear);
            decimal.TryParse(OtherOne.Text, out DecOtherOne);

            if (OtherYear.Text != "" && DecOtherYear == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Other Savings per year must be entered as dollars and cents");
                }
                else
                {
                    ShowPopUpMsg("Otros ahorros por año deben ingresarse como dólares y centavos");
                }
                OtherYear.Focus();
                dataok = false;
                return;

            }
            if (OtherOne.Text != "" && DecOtherOne == 0)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Other one time savings must be entered as dollars and cents");
                }
                else
                {
                    ShowPopUpMsg("Otros ahorros únicos deben ingresarse en dólares y centavos");
                }
                OtherOne.Focus();
                dataok = false;
                return;

            }
            TotalSavings = DecAnnualPieceSaving + DecAnnualTimeSavings + DecAnnualScrapSavings + DecOtherYear + DecOtherOne;
            if (TotalSavings == 0)
            {
                enteredSavings = "N";
                TotalSavings = 250;
            }
            else
            {
                enteredSavings = "Y";
            }
            EstSaving.Text = TotalSavings.ToString("n2");
            SavingComments.Focus();


        }
        protected void AcceptButton_Click(object sender, EventArgs e)
        {

        }

        protected void EnterButton_Click(object sender, EventArgs e)
        {
            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            bool dataok = true;
            if (Location.Text == "")
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Select a Location");
                }
                else
                {
                    ShowPopUpMsg("Selecciona una ubicación");
                }
                dataok = false;
            }
            if (emp1.Text == "")
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Enter at least one Employee");
                }
                else
                {
                    ShowPopUpMsg("Ingrese al menos un empleado");
                }
                dataok = false;
            }
            if (cdNoCost500.Checked)
            {
                decimal.TryParse(EstCost.Text, out costAmnt);
                if (costAmnt == 0)
                {
                    if (!showspanish)
                    {
                        ShowPopUpMsg("You must enter a cost estimate");
                    }
                    else
                    {
                        ShowPopUpMsg("Debe ingresar una estimación de costos");
                    }
                    dataok = false;
                }
            }
            if (!cbYesprocess.Checked && !cbNoprocess.Checked)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Please select Yes or No for 'Will the Process Remain the Same' question");
                }
                else
                {
                    ShowPopUpMsg("Seleccione Sí o No para la pregunta '¿El proceso seguirá siendo el mismo ?'");
                }
                dataok = false;
            }
            if (!cdYesCost500.Checked && !cdNoCost500.Checked)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Please select Yes or No for 'Will it cost $500 or less to complete' question");
                }
                else
                {
                    ShowPopUpMsg("Seleccione Sí o No para la pregunta '¿Costará $ 500 o menos para completar?'");
                }
                dataok = false;
            }
            if (!cbProcess.Checked && !cbQuality.Checked && !cbSafety.Checked && !cbProductivity.Checked)
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Please select an 'Idea Improve' option");
                }
                else
                {
                    ShowPopUpMsg("Por favor, seleccione una opción 'La Idea Mejora'");
                }
                dataok = false;
            }

            if (IdeaText.Text.Trim() == "")
            {
                if (!showspanish)
                {
                    ShowPopUpMsg("Please Enter Your Idea");
                }
                else
                {
                    ShowPopUpMsg("Por favor, Ingrese su Idea");
                }
                dataok = false;
            }
            //
            // if data validation didn't pass - re-enable the enter button
            //
            if (!dataok)
            {
                EnterButton.Enabled = true;
            }
            if (dataok)
            {
                getNextNumber(ref nextIdea);
                //
                // code to set the flags
                //
                IC1 = "N";
                IC2 = "N";
                IC3 = "N";
                IC4 = "N";
                IC5 = "N";
                SC1 = "N";
                SC2 = "N";
                SC3 = "N";
                SC4 = "N";
                SC5 = "N";
                AT1 = "N";
                AT2 = "N";
                AT3 = "N";
                AT4 = "N";
                AT5 = "N";
                procCode = "N";
                costCode = "Y";
                costAmnt = 0;
                if (cbProductivity.Checked)
                {
                    IC1 = "Y";
                }
                if (cbQuality.Checked)
                {
                    IC2 = "Y";
                }
                if (cbSafety.Checked)
                {
                    IC3 = "Y";
                }
                if (cbProcess.Checked)
                {
                    IC4 = "Y";
                }
                if (cbPeopleTime.Checked)
                {
                    SC1 = "Y";
                }
                if (cbMaterials.Checked)
                {
                    SC2 = "Y";
                }
                if (cbSetupTime.Checked)
                {
                    SC3 = "Y";
                }
                if (cbSavesCode4.Checked)
                {
                    SC4 = "Y";
                }
                if (cbMultShifts.Checked)
                {
                    AT1 = "Y";
                }
                if (cbMultDept.Checked)
                {
                    AT2 = "Y";
                }
                if (cbShopOnly.Checked)
                {
                    AT3 = "Y";
                }
                if (cbOfficeOnly.Checked)
                {
                    AT4 = "Y";
                }
                if (cbShopOffice.Checked)
                {
                    AT5 = "Y";
                }
                if (cbYesprocess.Checked)
                {
                    procCode = "Y";
                }
                if (cdNoCost500.Checked)
                {
                    costCode = "N";
                    decimal.TryParse(EstCost.Text, out costAmnt);
                }
                //
                // insert the record into the idea tables
                //
                addNewIdea(ref nextIdea);
                //
                // get the number of points for entry
                //
                string code1 = "100";
                int points = 0;
                getPointAmount(ref code1, ref points);

                addEntryPoints(ref nextIdea, code1, points);
                addBonusRecord(ref nextIdea);
                // 
                // send the e-mail to the location admin that an idea was entered

                sendAdminEmail(ref nextIdea);
                //
                // setup the second screen for the savings data
                //
                IdeaNumber.Text = nextIdea.ToString();
                WhichScreen.Value = "2";
                locationDropList.Visible = false;

                drate = 0;
                getBaseRate(ref drate);
                RateBox.Text = drate.ToString("n2");
                MinPerPiece.Focus();

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "Screen 2", "showscreen2();", true);
            }
        }
        protected void sendAdminEmail(ref int nextIdea)
        {

            string emLocation = Location.Text;
            adminList.Clear();
            getAdmin(Location.Text);
            int idx = 0;
            int maxidx = adminList.Count();
            if (adminList.Count != 0)
            {
                for (idx = 0; idx < maxidx;)

                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient();
                    SmtpServer.Host = "192.168.5.8";
                    SmtpServer.Port = 25;
                    mail.From = new MailAddress("intranet@behlenmfg.com");
                    //mail.To.Add(adminList[idx].aUserEmail);
                    mail.To.Add("trenton.earley@behlenedge.com");
                    mail.Subject = "New AIM Idea Submitted: " + nextIdea.ToString() + " For Location: " + emLocation;
                    mail.Body = adminList[idx].aUser + "\n" + "A new AIM Idea has been submitted.  Please access through the AIM Admin system or this link" +
                        "\n" + "http://intranet.behlenmfg.com/aimmaint/mainIdea.aspx?Idea=" + nextIdea.ToString() + "&location=" + emLocation + "&returnlink=http://intranet.behlenmfg.com/intranet/aim-administration/";
                    SmtpServer.Send(mail);
                    idx = idx + 1;
                }
            }
        }

        protected void emp1_TextChanged(object sender, EventArgs e)
        {
            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            if (emp1.Text != "")
            {
                string employee = emp1.Text;
                string deptName = "";
                string deptNumber = "";
                string empName = "";
                getDept1(employee, ref deptName, ref deptNumber, ref empName);
                deptName1.Text = deptNumber + ": " + deptName;
                dept1.Value = deptNumber;
                empName1.Value = empName;
                if (deptName == " ")
                {
                    if (!showspanish)
                    {
                        ShowPopUpMsg("Employee #1 " + emp1.Text + " is Invalid");
                    }
                    else
                    {
                        ShowPopUpMsg("El empleado #1 " + emp1.Text + " no es válido");
                    }

                    emp1.Text = "";
                }
            }
            else
            {
                dept1.Value = "";
                deptName1.Text = "";
                empName1.Value = "";

            }
        }
        protected void emp4_TextChanged(object sender, EventArgs e)
        {
            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            if (emp4.Text != "")
            {
                string employee = emp4.Text;
                string deptNumber = "";
                string deptName = "";
                string empName = "";
                getDept1(employee, ref deptName, ref deptNumber, ref empName);
                deptName4.Text = deptNumber + ": " + deptName;
                dept4.Value = deptNumber;
                empName4.Value = empName;
                if (deptName == " ")
                {
                    if (!showspanish)
                    {
                        ShowPopUpMsg("Employee #4 " + emp4.Text + " is Invalid");
                    }
                    else
                    {
                        ShowPopUpMsg("El empleado #4 " + emp4.Text + " no es válido");
                    }
                    emp4.Text = "";
                }
            }
            else
            {
                dept4.Value = "";
                deptName4.Text = "";
                empName4.Value = "";

            }
        }
        protected void emp2_TextChanged(object sender, EventArgs e)
        {
            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            if (emp2.Text != "")
            {
                string employee = emp2.Text;
                string deptName = "";
                string deptNumber = "";
                string empName = "";
                getDept1(employee, ref deptName, ref deptNumber, ref empName);
                deptName2.Text = deptNumber + ": " + deptName;
                dept2.Value = deptNumber;
                empName2.Value = empName;
                if (deptName == " ")
                {
                    if (!showspanish)
                    {
                        ShowPopUpMsg("Employee #2 " + emp2.Text + " is Invalid");
                    }
                    else
                    {
                        ShowPopUpMsg("El empleado #2 " + emp2.Text + " no es válido");
                    }
                    emp2.Text = "";
                }
            }
            else
            {
                dept2.Value = "";
                deptName2.Text = "";
                empName2.Value = "";

            }
        }
        protected void emp3_TextChanged(object sender, EventArgs e)
        {
            bool showspanish = false;
            if (SpanishButton.Text == "English")
            {
                showspanish = true;
            }
            if (emp3.Text != "")
            {
                string employee = emp3.Text;
                string deptName = "";
                string deptNumber = "";
                string empName = "";
                getDept1(employee, ref deptName, ref deptNumber, ref empName);
                deptName3.Text = deptNumber + ": " + deptName;
                dept3.Value = deptNumber;
                empName3.Value = empName;
                if (deptName == " ")
                {
                    if (!showspanish)
                    {
                        ShowPopUpMsg("Employee #3 " + emp3.Text + " is Invalid");
                    }
                    else
                    {
                        ShowPopUpMsg("El empleado #3 " + emp3.Text + " no es válido");
                    }
                    emp3.Text = "";
                }
            }
            else
            {
                dept3.Value = "";
                deptName3.Text = "";
                empName3.Value = "";

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
    }
}