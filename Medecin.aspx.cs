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
    public partial class Medecin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select *from medecin", tab_medecin);
            }
        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            if(txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez le CNI de l'utisateur à chercher')</script>");
                return;
            }
            else{
                bt_enregistrer.Enabled = false;
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe"; 
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select *from medecin where cni = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_medecin.DataSource = m;
                tab_medecin.DataBind();
                c.Close();
            }
        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            bt_enregistrer.Enabled = true;
            Cabinet.Base.affiche_donne(sender, e, "select *from medecin", tab_medecin);
            txt_chercher.Text = "";
        }

        protected void bt_enregistrer_Click(object sender, EventArgs e)
        {
            if (txt_nom.Text == "" || txt_prenom.Text == "" || txt_cni.Text == "" || txt_telephone.Text == "" || txt_telephone.Text == "")
            {
                Response.Write("<script>alert('Les informations ne sont pas suffisantes completez tous les champs')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = " insert into medecin(Nom,Prenom,Telephone,CNI,titre)values('" + txt_nom.Text + "','" + txt_prenom.Text + "'," + txt_telephone.Text + ",'" + txt_cni.Text + "','" + list_titre.Text + "')";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec de l'enregistrement')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('L'enregistrement est reussi')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select *from medecin", tab_medecin);
                    txt_nom.Text = "";
                    txt_prenom.Text = "";
                    txt_cni.Text = "";
                    txt_telephone.Text = "";

                }
                c.Close();
            }
        }

        protected void bt_effacer_Click(object sender, EventArgs e)
        {
            txt_nom.Text = "";
            txt_prenom.Text = "";
            txt_cni.Text = "";
            txt_telephone.Text = "";
        }

        protected void bt_modifier_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher d'abord le medecin à modifier')</script>");
                return;
            }
            else
            {
                if (txt_nom.Text == "" || txt_prenom.Text == "" || txt_cni.Text == "" || txt_telephone.Text == "")
                {
                    Response.Write("<script>alert('Saisissez d'abord les informations pour le modification ')</script>");
                    return;
                }
                else
                {
                    string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                    NpgsqlConnection c = new NpgsqlConnection(con);
                    string requete = "update medecin set nom = '" + txt_nom.Text + "', prenom = '" + txt_prenom.Text + "', telephone = " + txt_telephone.Text + ", cni = '" + txt_cni.Text + "', titre = '"+list_titre.Text+"' where cni = '"+txt_chercher.Text+"'";
                    c.Open();
                    NpgsqlCommand data = new NpgsqlCommand(requete, c);
                    if (data.ExecuteNonQuery() != 1)
                    {
                        Response.Write("<script>alert('Echec de la modification')</script>");
                        return;
                    }
                    else
                    {
                        Response.Write("<script>alert('Modification reussie')</script>");
                        Cabinet.Base.affiche_donne(sender, e, "select *from medecin", tab_medecin);
                        txt_chercher.Text = "";
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
                Response.Write("<script>alert('Chercher d'abord le medecin à supprimer')</script>");
                return;
            }
            else
            {
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string request = "delete from medecin where CNI = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(request, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('La suppresion d'un medecin est echoue')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('La suppression est reussie')</script>");
                    txt_chercher.Text = "";
                    Cabinet.Base.affiche_donne(sender, e, "select *from medecin", tab_medecin);
                    bt_enregistrer.Enabled = true;
                    return;
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

        protected void tab_medecin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_medecin.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from medecin where id =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select *from medecin order by(id)", tab_medecin);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_medecin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_medecin.EditIndex = -1;
            Cabinet.Base.affiche_donne(sender, e, "select *from medecin order by(id)", tab_medecin);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_medecin_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.
            tab_medecin.EditIndex = e.NewEditIndex;
            Cabinet.Base.affiche_donne(sender, e, "select *from medecin order by(id)", tab_medecin);
        }

        protected void tab_medecin_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = tab_medecin.Rows[e.RowIndex].FindControl("lbl_Name") as Label;
            TextBox nom = tab_medecin.Rows[e.RowIndex].FindControl("txt_nom") as TextBox;
            TextBox prenom = tab_medecin.Rows[e.RowIndex].FindControl("txt_prenom") as TextBox;
            TextBox phone= tab_medecin.Rows[e.RowIndex].FindControl("txt_phone") as TextBox;
            TextBox cni = tab_medecin.Rows[e.RowIndex].FindControl("txt_cni") as TextBox;
            TextBox titre = tab_medecin.Rows[e.RowIndex].FindControl("txt_titre") as TextBox;
            

            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "update medecin set nom = '" + nom.Text + "', prenom = '" + prenom.Text + "', telephone = " + phone.Text + ", cni = '" + cni.Text + "', titre = '" + titre.Text + "' where id = " +Int32.Parse( id.Text )+ "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_medecin.EditIndex = -1;

            Cabinet.Base.affiche_donne(sender, e, "select *from medecin order by(id)", tab_medecin);
            tab_medecin.EditIndex = -1;
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }
    }
}