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
    public partial class Rendez_vous : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat order by(id_rv)", tab_rendez_vous);
            }
            if (!IsPostBack)
            {
                list_patient.Items.Clear();
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select *from patient";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                list_patient.Items.Add("");
                while(m.Read())
                {
                    list_patient.Items.Add(m.GetInt32(0)+" "+m.GetString(1)+" "+m.GetString(2));
                }
                c.Close();
                
            }
        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez la date d'abord')</script>");
                return;
            }
            else
            {
                bt_enregistrer.Enabled = false;
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat where date ='" + txt_chercher.Text + "' ";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_rendez_vous.DataSource = m;
                tab_rendez_vous.DataBind();
                c.Close();
            }
        }

        protected void bt_effacer_Click(object sender, EventArgs e)
        {
            list_patient.Text = "";
            txt_chercher.Text = "";
            txt_date.Text = "";
            txt_heure.Text = "";
            list_motif.Text = "";
        }

        protected void bt_enregistrer_Click(object sender, EventArgs e)
        {
            if (list_patient.Text == "" || txt_date.Text == "" || txt_heure.Text == "" || list_motif.Text == "")
            {
                Response.Write("<script>alert('Completez toute les champs')</script>");
                return;
            }
            else
            { 
                string conection = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection co = new NpgsqlConnection(conection);
                string req = "select *from rendez_vous where date ='" + DateTime.Parse(txt_date.Text).ToString("yyyy-MM-dd HH:mm:ss")+ "' and heure ='" + txt_heure.Text + "'";
                co.Open();
                NpgsqlCommand d = new NpgsqlCommand(req,co);
                NpgsqlDataReader r = d.ExecuteReader();
                if (r.Read())
                {
                    Response.Write("<script>alert('Non,ce rendez-vous est deja pris.Donne lui un autre !')</script>");
                    return;

                }
                else
                {
                    string[] a = list_patient.SelectedItem.ToString().Split(' ');
                    string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                    NpgsqlConnection c = new NpgsqlConnection(con);
                    String requete = "insert into rendez_vous(patient,date,heure,motif)values(" + Int32.Parse(a[0]) + ",'" + txt_date.Text + "','" + txt_heure.Text + "','" + list_motif.Text + "')";
                    c.Open();
                    NpgsqlCommand data = new NpgsqlCommand(requete, c);
                    if (data.ExecuteNonQuery() != 1)
                    {
                        Response.Write("<script>alert('Echec de l'enregistrement')</script>");
                        return;
                    }
                    else
                    {
                        Response.Write("<script>alert('Enregistrement est reussie')</script>");
                        Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat", tab_rendez_vous);
                    }
                    c.Close();
                }
                co.Close();
            }
        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat", tab_rendez_vous);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void bt_supprimer_Click(object sender, ImageClickEventArgs e)
        {
            if (String.Equals(txt_chercher.Text,""))
            {
                Response.Write("<script>alert('Saisissez la date ')</script>");
                return;
            }
            else
            {
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "delete from rendez_vous where date = '" + DateTime.Parse(txt_chercher.Text).ToString("yyyy-MM-dd HH:mm:ss") + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec de la suppression')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('La suppression est reussie')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat", tab_rendez_vous);
                    bt_enregistrer.Enabled = true;

                }
                bt_enregistrer.Enabled = true;
                c.Close();
            }
        }

        protected void bt_imprimer_Click(object sender, ImageClickEventArgs e)
        {
            if (list_patient.Text == "" || txt_date.Text == "" || txt_heure.Text == "" || list_motif.Text == "")
            {
                Response.Write("<script>alert('Completez tous les champs')</script>");
                return;
            }
            else
            {
                //creer un fichier pdf
                Document doc = new Document(PageSize.A4,100,10,50,25);
                FileStream file = new FileStream("C:/Users/VERON/Desktop/recu.pdf", FileMode.Create);
                PdfWriter.GetInstance(doc,file);
                doc.Open();
                doc.Add(new Paragraph("Recu d'un rendez-vous"));
                doc.Add(new Paragraph("~~~~~~~~~~~~~~~~~~~~~~~~~"));
                doc.Add(new Paragraph("Patient --------->"+list_patient.Text));
                doc.Add(new Paragraph(" "));
                doc.Add(new Paragraph("Date    --------->"+txt_date.Text));
                doc.Add(new Paragraph(" "));
                doc.Add(new Paragraph("Heure   --------->"+txt_heure.Text));
                doc.Add(new Paragraph(" "));
                doc.Add(new Paragraph("Motif   --------->"+list_motif.Text));
                doc.Close();

            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Authentification.aspx");
        }

        protected void tab_rendez_vous_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_rendez_vous.EditIndex = -1;
            Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat order by(id_rv)", tab_rendez_vous);

            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_rendez_vous_RowEditing(object sender, GridViewEditEventArgs e)
        {
            tab_rendez_vous.EditIndex = e.NewEditIndex;
            Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat order by(id_rv)", tab_rendez_vous);

        }

        protected void tab_rendez_vous_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update 
            Label id = tab_rendez_vous.Rows[e.RowIndex].FindControl("lbl_Name") as Label;
           // TextBox nom = tab_rendez_vous.Rows[e.RowIndex].FindControl("txt_nom") as TextBox;
            //TextBox heure = tab_rendez_vous.Rows[e.RowIndex].FindControl("txt_prenom") as TextBox;
            TextBox date = tab_rendez_vous.Rows[e.RowIndex].FindControl("txt_date") as TextBox;
            TextBox heure = tab_rendez_vous.Rows[e.RowIndex].FindControl("txt_heure") as TextBox;
            TextBox motif = tab_rendez_vous.Rows[e.RowIndex].FindControl("txt_motif") as TextBox;
           
            

            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "update rendez_vous set date='" +DateTime.Parse (date.Text)+ "',heure='" + heure.Text + "',motif='" + motif.Text + "' where id_rv =" + Int32.Parse(id.Text) + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_rendez_vous.EditIndex = -1;

            Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat order by(id_rv)", tab_rendez_vous);

            tab_rendez_vous.EditIndex = -1;
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_rendez_vous_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_rendez_vous.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from rendez_vous where id_rv =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select rendez_vous.id_rv,patient.nom_pat as nom,patient.prenom_pat as prenom,rendez_vous.date,rendez_vous.heure,rendez_vous.motif from rendez_vous inner join patient on rendez_vous.patient = patient.id_pat order by(id_rv)", tab_rendez_vous);

            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }
    }
}