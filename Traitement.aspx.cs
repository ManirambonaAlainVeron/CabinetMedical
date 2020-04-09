using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using NpgsqlTypes;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace CabinetMedical.Cabinet
{
    public partial class Traitement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                list_medecin.Items.Clear();
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select id,nom,prenom,cni from medecin";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                list_medecin.Items.Add(" ");
                while(m.Read())
                {
                    list_medecin.Items.Add(m.GetInt32(0)+" "+m.GetString(1)+" "+m.GetString(2)+" "+m.GetString(3));
                }
                c.Close();
            }
            if (!IsPostBack)
            {
                list_patient.Items.Clear();
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select rendez_vous.id_rv,patient.nom_pat,patient.prenom_pat,patient.code from patient inner join rendez_vous on patient.id_pat = rendez_vous.patient";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                list_patient.Items.Add(" ");
                while (m.Read())
                {
                    list_patient.Items.Add(m.GetInt32(0)+" "+m.GetString(1)+" "+m.GetString(2)+" "+m.GetString(3));
                }
                c.Close();
            }
            if (!IsPostBack)
            {
                list_maladie.Items.Clear();
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select id,nom from maladie";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                list_maladie.Items.Add(" ");
                while(m.Read())
                {
                    list_maladie.Items.Add(m.GetInt32(0)+" "+m.GetString(1));
                }
                c.Close();
            }

           
        }

        protected void bt_nettoyer_Click(object sender, ImageClickEventArgs e)
        {
            txt_medicament.Text = "";
        }

        protected void bt_imprimer_Click(object sender, ImageClickEventArgs e)
        {
            string[] a = list_medecin.SelectedItem.ToString().Split(' ');
            string[] b = list_patient.SelectedItem.ToString().Split(' ');
            string[] d = list_maladie.SelectedItem.ToString().Split(' ');

            string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "insert into traitement(id_med,id_rv,id_mal,dat,medicament)values("+Int32.Parse(a[0])+","+Int32.Parse(b[0])+","+Int32.Parse(d[0])+",'"+txt_date.Text+"','"+txt_medicament.Text+"')";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            if (data.ExecuteNonQuery() != 1)
            {
                Response.Write("<script>alert('Echec de l enregistrement')</script>");
                return;
            }
            else
            {
                Response.Write("<script>alert('L'enregistrement est reussie')</script>");
            }
            c.Close();


            //Creer un fichier pdf

            Document doc = new Document(PageSize.A4, 100, 50, 50, 50);
            FileStream file = new FileStream("C:/Users/VERON/Desktop/ordonnance.pdf", FileMode.Create);
            PdfWriter.GetInstance(doc,file);
            doc.Open();
            doc.Add(new Paragraph("Ordonnance medicale"));
            doc.Add(new Paragraph("~~~~~~~~~~~~~~~~~~~"));
            doc.Add(new Paragraph("Medecin --------> "+list_medecin.Text));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("Patient --------> "+list_patient.Text));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("Maladie --------> "+list_maladie.Text));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("Date   --------> "+txt_date.Text));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("++++++++ Medicament +++++++"));
            doc.Add(new Paragraph("+++++++++++++++++++++++++++"));
            doc.Add(new Paragraph(txt_medicament.Text));
            doc.Close();
        }

        protected void list_medecin_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_date.Text = DateTime.Now.ToShortDateString();
        }
      
    }
}