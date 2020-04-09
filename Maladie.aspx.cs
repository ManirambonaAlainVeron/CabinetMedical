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
    public partial class Maladie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select *from maladie order by(id)", tab_maladie);
            }
        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez le nom du maladie à chercher')</script>");
                return;
            }
            else
            {
                bt_enregistrer.Enabled = false;
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select * from maladie where nom = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_maladie.DataSource = m;
                tab_maladie.DataBind();
                c.Close();
            }
        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            txt_chercher.Text = "";
            Cabinet.Base.affiche_donne(sender, e, "select *from maladie", tab_maladie);
            bt_enregistrer.Enabled = true;
        }

        protected void bt_modifier_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher  la maladie à modifier')</script>");
                return;
            }
            else
            {
                if (txt_nom.Text == "" || txt_prix.Text == "")
                {
                    Response.Write("<script>alert('Saisissez les informations de la maladie')</script>");
                    return;
                }
                else
                {
                    string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                    NpgsqlConnection c = new NpgsqlConnection(con);
                    string requete = "update maladie set nom = '" + txt_nom.Text + "', prix_consultation = " + txt_prix.Text + " where nom = '"+txt_chercher.Text+"'";
                    c.Open();
                    NpgsqlCommand data = new NpgsqlCommand(requete, c);
                    if (data.ExecuteNonQuery() != 1)
                    {
                        Response.Write("<script>alert('Echec de modification')</script>");
                        return;
                    }
                    else
                    {
                        Response.Write("<script>alert('Modifiaction reussie')</script>");
                        Cabinet.Base.affiche_donne(sender, e, "select *from maladie", tab_maladie);
                        bt_enregistrer.Enabled = true;
                    }
                    c.Close();
                }
            }
        }

        protected void bt_supprimer_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher  la maladie à supprimer')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "delete from maladie where nom = '" + txt_chercher.Text + "'";
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
                    Cabinet.Base.affiche_donne(sender, e, "select *from maladie", tab_maladie);
                    bt_enregistrer.Enabled = true;
                }
                c.Close();
            }
        }

        protected void bt_enregistrer_Click(object sender, EventArgs e)
        {
            if (txt_nom.Text == "" || txt_prix.Text == "")
            {
                Response.Write("<script>alert('Saisissez  le nom et le prix')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "insert into maladie (nom,prix_consultation)values('" + txt_nom.Text + "','" + txt_prix.Text + "')";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec de l enregistrement')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Enregistrement est reussie')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select *from maladie", tab_maladie);
                    txt_nom.Text = "";
                    txt_prix.Text = "";
                }
                c.Close();
            }
        }

        protected void bt_effacer_Click(object sender, EventArgs e)
        {
            txt_nom.Text = "";
            txt_prix.Text = "";
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Authentification.aspx");
        }

        protected void tab_maladie_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_maladie.EditIndex = -1;
            Cabinet.Base.affiche_donne(sender, e, "select *from maladie order by(id)", tab_maladie);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_maladie_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.
            tab_maladie.EditIndex = e.NewEditIndex;
            Cabinet.Base.affiche_donne(sender, e, "select *from maladie order by(id)", tab_maladie);
        }

        protected void tab_maladie_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update 
            Label id = tab_maladie.Rows[e.RowIndex].FindControl("lbl_Name") as Label;
            TextBox nom = tab_maladie.Rows[e.RowIndex].FindControl("txt_nom") as TextBox;
            TextBox prix= tab_maladie.Rows[e.RowIndex].FindControl("txt_prix") as TextBox;
            

            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "update maladie set nom = '" + nom.Text + "', prix_consultation = " + prix.Text + " where id = " +Int32.Parse( id.Text) + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_maladie.EditIndex = -1;

            Cabinet.Base.affiche_donne(sender, e, "select *from maladie order by(id)", tab_maladie);
            tab_maladie.EditIndex = -1;
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_maladie_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_maladie.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from maladie where id =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select *from maladie order by(id)", tab_maladie);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }
    }
}