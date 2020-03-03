using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;

namespace AimEmp_PWA
{
    public partial class ImageUpload : System.Web.UI.Page
    {
        public string IdeaNum;
        public string pathLocation;
        public string spanish;
        public bool showspanish;

        protected void Page_Load(object sender, EventArgs e)
        {

            // building behlen header
            //
            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "HWA", "BCloadIframe();", true);
            IdeaBox1.Text = Request.QueryString["idea"];
            IdeaNum = Request.QueryString["idea"];
            spanish = Request.QueryString["spanish"];
            if (spanish == "English")
            {
                showspanish = true;
            }
            else
            {
                showspanish = false;
            }
            if (showspanish)
            {
                Label1.Text = "Puede cargar un documento para esta idea:  ";
                Label2.Text = "Documento opcional para cargar:  ";
                Continue.Text = "Continuar";
            }
            else
            {
                Label1.Text = "You may upload a document for this idea:  ";
                Label2.Text = "Optional document to upload:  ";
                Continue.Text = "Continue";
            }


        }
        protected void Continue_Click(object sender, EventArgs e)
        {
            // set the location of the save
            string imagePath = "E:/External Data/AIM/";
            string tablePath = "/External Data/AIM/";

            if (FileUpload1.HasFile)
            {
                string fileName = FileUpload1.FileName;
                string pathToCheck = imagePath + IdeaNum + "-" + fileName;
                pathLocation = tablePath + IdeaNum + "-" + fileName;
                if (System.IO.File.Exists(pathToCheck))
                {
                    if (!showspanish)
                    {
                        Duplicate.Text = "File " + fileName + " Already Exists - Can Not Upload";
                        Continue.Enabled = true;
                    }
                    else
                    {
                        Duplicate.Text = "El archivo " + fileName + " ya existe no se puede cargar";
                        Continue.Enabled = true;
                    }

                }
                else
                {
                    int filesize = FileUpload1.PostedFile.ContentLength;
                    if (filesize > 2097152)
                    {
                        if (!showspanish)
                        {
                            Duplicate.Text = "File " + fileName + " Size Exceeds 2MB (2000KB) - Can Not Upload";
                            Continue.Enabled = true;
                        }
                        else
                        {
                            Duplicate.Text = "El tamaño del archivo  " + fileName + " supera los 2MB (2000KB) no se puede cargar";
                            Continue.Enabled = true;
                        }
                    }
                    else
                    {

                        FileUpload1.SaveAs(imagePath + IdeaNum + "-" + fileName);
                        addNewDocument();
                        if (!showspanish)
                        {
                            Duplicate.Text = "File " + fileName + " Uploaded";
                        }
                        else
                        {
                            Duplicate.Text = "Archivo " + fileName + " cargado";
                        }
                        Response.Redirect("http://intranet.behlenmfg.com/Behlen_PWA/Index.aspx");
                        //ScriptManager.RegisterStartupScript(Page, typeof(Page), "Close Window2", "closingNow2();", true);
                    }
                }
            }
            else
            {
                if (!showspanish)
                {
                    Duplicate.Text = "No File Selected to Upload";
                }
                else
                {
                    Duplicate.Text = "Ningún archivo seleccionado para cargar";
                }
                Response.Redirect("http://intranet.behlenmfg.com/Behlen_PWA/Index.aspx");
                //ScriptManager.RegisterStartupScript(Page, typeof(Page), "Close Window2", "closingNow2();", true);
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