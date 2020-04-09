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
    public partial class Medicament : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select *from medicament order by(id)", tab_medicament);
            }
        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez le nom du medicament à chercher')</script>");
                return;
            }
            else
            {
                bt_enregistrer.Enabled = false;
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select *from medicament where nom = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_medicament.DataSource = m;
                tab_medicament.DataBind();
                c.Close();
            }
        }

        protected void bt_enregistrer_Click(object sender, EventArgs e)
        {
            if (txt_nom.Text == "" || txt_prix.Text == "" || txt_quantite.Text == "")
            {
                Response.Write("<script>alert('Les informations ne sont pas suffisantes completez tous les champs')</script>");
                
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "insert into medicament (nom,mutuelle,prix,quantite_stock,unite_dosage,bloque)values('"+txt_nom.Text+"','"+list_mutuelle.Text+"',"+Int32.Parse(txt_prix.Text)+",'"+txt_quantite.Text+"','"+txt_unite.Text+"','"+list_bloque.Text+"')";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec d enregistrement')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('L'enregistrement est reussi')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select *from medicament", tab_medicament);
                    txt_nom.Text = "";
                    txt_prix.Text = "";
                    txt_quantite.Text = "";
                    txt_unite.Text = "";

                }
                c.Close();
            }
        }

        protected void bt_nettoyer_Click(object sender, EventArgs e)
        {
            txt_nom.Text = "";
            txt_prix.Text = "";
            txt_quantite.Text = "";
            txt_unite.Text = "";
        }

        protected void bt_supprimer_Click(object sender, ImageClickEventArgs e)
        {
           
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher le medicament à supprimer')</script>");
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
               
                string requete = "delete from medicament where nom ='"+ txt_chercher.Text +"'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('La suppresion du medicament est echoue')</script>");
                }
                else
                {
                    Response.Write("<script>alert('La suppression est reussie')</script>");
                    txt_chercher.Text = "";
                    Cabinet.Base.affiche_donne(sender, e, "select *from medicament", tab_medicament);
                    bt_enregistrer.Enabled = true;
                }
                c.Close();
            }
        }

        protected void bt_modifier_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher  le medicament à supprimer')</script>");
            }
            else
            {
                if (txt_nom.Text == "" || txt_prix.Text == "" || txt_quantite.Text == "")
                {
                    Response.Write("<script>alert('Saisissez d'abord les informations pour le modification ')</script>");
                }
                else
                {
                    string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                    NpgsqlConnection c = new NpgsqlConnection(con);
                    string requete = "update medicament set nom = '" + txt_nom.Text + "',mutuelle = '"+list_mutuelle.Text+"',prix = "+Int32.Parse(txt_prix.Text)+",quantite_stock = '"+txt_quantite.Text+"',unite_dosage = '"+txt_unite.Text+"',bloque = '"+list_bloque.Text+"' where nom = '"+txt_chercher.Text+"'";
                    c.Open();
                    NpgsqlCommand data = new NpgsqlCommand(requete, c);
                    if (data.ExecuteNonQuery() != 1)
                    {
                        Response.Write("<script>alert('La modification du medicament est echoue')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('La modification est reussie')</script>");
                        Cabinet.Base.affiche_donne(sender, e, "select *from medicament", tab_medicament);
                        bt_enregistrer.Enabled = true;
                    }
                    c.Close();
                }
            }
        }

        protected void bt_debloque_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher  le medicament à debloqué')</script>");
            }
            else
            {
              
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string etat = "NON";
                string requete = "update medicament set bloque = '"+etat+"' where nom = '"+txt_chercher.Text+"'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete,c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec dans le debloquage')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Debloquage reussie')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select *from medicament", tab_medicament);
                    bt_enregistrer.Enabled = true;
                }
                c.Close();
            }
        }

        protected void bt_bloque_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher  le medicament à bloqué')</script>");
            }
            else
            {
             
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string etat = "OUI";
                string requete = "update medicament set bloque = '" + etat + "' where nom = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec dans le bloquage')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Bloquage reussie')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select *from medicament", tab_medicament);
                    bt_enregistrer.Enabled = true;
                }
                c.Close();
            }
        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            Cabinet.Base.affiche_donne(sender, e, "select *from medicament", tab_medicament);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Authentification.aspx");
        }

        protected void tab_medicament_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_medicament.EditIndex = -1;
            Cabinet.Base.affiche_donne(sender, e, "select *from medicament order by(id)", tab_medicament);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_medicament_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.
            tab_medicament.EditIndex = e.NewEditIndex;
            Cabinet.Base.affiche_donne(sender, e, "select *from medicament order by(id)", tab_medicament);
        }

        protected void tab_medicament_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update 
            Label id = tab_medicament.Rows[e.RowIndex].FindControl("lbl_Name") as Label;
            TextBox nom = tab_medicament.Rows[e.RowIndex].FindControl("txt_name") as TextBox;
            TextBox mutuelle = tab_medicament.Rows[e.RowIndex].FindControl("txt_mutuelle") as TextBox;
            TextBox prix = tab_medicament.Rows[e.RowIndex].FindControl("txt_prix") as TextBox;
            TextBox quantite = tab_medicament.Rows[e.RowIndex].FindControl("txt_quantite") as TextBox;
            TextBox unite = tab_medicament.Rows[e.RowIndex].FindControl("txt_unite") as TextBox;
            TextBox bloque = tab_medicament.Rows[e.RowIndex].FindControl("txt_bloque") as TextBox;
           

            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "update medicament set nom = '" + nom.Text + "',mutuelle = '" + mutuelle.Text + "',prix = " +Int32.Parse( prix.Text )+ ",quantite_stock = '" + quantite.Text + "',unite_dosage = '" + unite.Text + "',bloque = '" + bloque.Text + "' where id = " +Int32.Parse(id.Text) + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_medicament.EditIndex = -1;

            Cabinet.Base.affiche_donne(sender, e, "select *from medicament order by(id)", tab_medicament);
            tab_medicament.EditIndex = -1;
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_medicament_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_medicament.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from medicament where id =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select *from medicament order by(id)", tab_medicament);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

    }
}