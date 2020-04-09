using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Npgsql;
using NpgsqlTypes;


namespace CabinetMedical.Cabinet
{
    public partial class Affiche_traitement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select traitement.id_tr as id,medecin.nom as nom_medecin,medecin.prenom as prenom_medecin,patient.nom_pat as nom_patient,"
                                                       + "patient.prenom_pat as prenom_patient,maladie.nom as maladie,traitement.dat as date,traitement.medicament from traitement"
                                                       + " inner join medecin on traitement.id_med=medecin.id "
                                                       + " inner join rendez_vous on traitement.id_rv = rendez_vous.id_rv"
                                                        + " inner join patient on patient.id_pat = rendez_vous.patient"
                                                       + " inner join maladie on traitement.id_mal=maladie.id", tab_traitement);
            }
        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez la date ')</script>");
                return;
            }
            else
            {
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select traitement.id_tr as id,medecin.nom as nom_medecin,medecin.prenom as prenom_medecin,patient.nom_pat as nom_patient,"
                                                   + "patient.prenom_pat as prenom_patient,maladie.nom as maladie,traitement.dat as date,traitement.medicament from traitement"
                                                   + " inner join medecin on traitement.id_med=medecin.id "
                                                   + " inner join rendez_vous on traitement.id_rv = rendez_vous.id_rv"
                                                    + " inner join patient on patient.id_pat = rendez_vous.patient"
                                                   + " inner join maladie on traitement.id_mal=maladie.id where dat = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_traitement.DataSource = m;
                tab_traitement.DataBind();
                c.Close();
            }
        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            txt_chercher.Text = "";
            Cabinet.Base.affiche_donne(sender, e, "select traitement.id_tr as id,medecin.nom as nom_medecin,medecin.prenom as prenom_medecin,patient.nom_pat as nom_patient,"
                                                   + " patient.prenom_pat as prenom_patient,maladie.nom as maladie,traitement.dat as date,traitement.medicament from traitement"
                                                   + " inner join medecin on traitement.id_med=medecin.id "
                                                   + " inner join rendez_vous on traitement.id_rv = rendez_vous.id_rv"
                                                    + " inner join patient on patient.id_pat = rendez_vous.patient"
                                                   + " inner join maladie on traitement.id_mal=maladie.id", tab_traitement);
        }

        protected void bt_supprimer_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez la date ')</script>");
                return;
            }
            else
            {
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "delete from traitement where dat = '"+txt_chercher.Text+"'";
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
                    Cabinet.Base.affiche_donne(sender, e, "select traitement.id_tr as id,medecin.nom as nom_medecin,medecin.prenom as prenom_medecin,patient.nom_pat as nom_patient,"
                                                   + " patient.prenom_pat as prenom_patient,maladie.nom as maladie,traitement.dat as date,traitement.medicament from traitement"
                                                   + " inner join medecin on traitement.id_med=medecin.id "
                                                   + " inner join rendez_vous on traitement.id_rv = rendez_vous.id_rv"
                                                    + " inner join patient on patient.id_pat = rendez_vous.patient"
                                                   + " inner join maladie on traitement.id_mal=maladie.id", tab_traitement);
                }
                c.Close();
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

        protected void tab_traitement_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_traitement.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from traitement where id_tr =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select traitement.id_tr as id,medecin.nom as nom_medecin,medecin.prenom as prenom_medecin,patient.nom_pat as nom_patient,"
                                                  + " patient.prenom_pat as prenom_patient,maladie.nom as maladie,traitement.dat as date,traitement.medicament from traitement"
                                                  + " inner join medecin on traitement.id_med=medecin.id "
                                                  + " inner join rendez_vous on traitement.id_rv = rendez_vous.id_rv"
                                                   + " inner join patient on patient.id_pat = rendez_vous.patient"
                                                  + " inner join maladie on traitement.id_mal=maladie.id", tab_traitement);
            txt_chercher.Text = "";
            
        }
    }
}