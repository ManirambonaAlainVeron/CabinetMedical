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
    public partial class Authentification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_connection_Click(object sender, ImageClickEventArgs e)
        {
            string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "select grade from utilisateur where login ='" + txt_login.Text + "' and password ='" + txt_password.Text + "' and etat = 'active'";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete,c);
            NpgsqlDataReader m = data.ExecuteReader();
            string grade = "";
            if (m.Read())
            {
                grade = m.GetString(0);
                if (grade == "medecin")
                {
                    Response.Redirect("traitement.aspx");
                }
                else if (grade == "administrateur")
                {
                    Response.Redirect("Utilisateur.aspx");
                }
                else if (grade == "pharmacien")
                {
                    Response.Redirect("Paiement.aspx");
                }
                else
                {
                    Response.Redirect("Patient.aspx");
                }
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('Erreur, identifiant ou mot de passe incorrecte')</script>");
            }

            c.Close();
        }
    }
}