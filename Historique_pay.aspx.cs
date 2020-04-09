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
    public partial class Historique_pay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select * from paiement", tab_pay);
            }
        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == " ")
            {
                Response.Write("<script>alert('Saisissez la date')</script>");
                return;
            }
            else
            {
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select *from paiement where dates = '"+txt_chercher.Text+"'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_pay.DataSource = m;
                tab_pay.DataBind();
                c.Close();
            }
        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            txt_chercher.Text = " ";
            Cabinet.Base.affiche_donne(sender, e, "select * from paiement", tab_pay);
        }

        protected void bt_supprimer_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher la date')</script>");
                return;
            }
            else
            {
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "delete from paiement where dates = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec de la suppression')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('La suppression est reussie ')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select * from paiement", tab_pay);
                    txt_chercher.Text = " ";
                }
                c.Close();
            }
        }

        protected void bt_email_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin");
            
        }

        protected void shutdown_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Authentification.aspx");
        }

        protected void tab_pay_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_pay.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from paiement where id_pay =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select *from paiement order by(id_pay)", tab_pay);
            txt_chercher.Text = " ";
            
        }
    }
}