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
    public partial class Utilisateur : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur order by(id)", tab_utilisateur);
            }
        }

        protected void bt_enregistrer_Click(object sender, EventArgs e)
        {
            if (txt_nom.Text == "" || txt_prenom.Text == "" || txt_login.Text == "" || txt_password.Text == "" || txt_cni.Text == "")
            {
                Response.Write("<script>alert('Les informations ne sont pas suffisantes complete tous les champs')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string request = "insert into utilisateur (Nom,Prenom,CNI,Login,Password,etat,Grade,Telephone)values('" + txt_nom.Text + "','" + txt_prenom.Text + "','" + txt_cni.Text + "','" + txt_login.Text + "','" + txt_password.Text + "','" + list_etat.Text + "','" + list_grade.Text + "',"+Int32.Parse(txt_telephone.Text )+ ")";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(request, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec de l enregistrement')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('L enregistrement est reussi')</script>");
                    txt_nom.Text = "";
                    txt_prenom.Text = "";
                    txt_login.Text = "";
                    txt_password.Text = "";
                    txt_cni.Text = "";
                    txt_telephone.Text = "";
                    list_etat.Text = "";
                    list_grade.Text = "";
                    Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur order by(id)", tab_utilisateur); 
                    
                }
                c.Close();
                
            }
        }

        protected void bt_Effacer_Click(object sender, EventArgs e)
        {
            txt_nom.Text = "";
            txt_prenom.Text = "";
            txt_login.Text = "";
            txt_password.Text = "";
            txt_cni.Text = "";
            txt_telephone.Text = "";
            list_etat.Text = "";
            list_grade.Text = "";
            Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur", tab_utilisateur); 

        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur", tab_utilisateur);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
            
        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez le CNI de l'utisateur à chercher')</script>");
                return;
            }
            else{
            
                bt_enregistrer.Enabled = false;
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string request = "select * from utilisateur where CNI = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(request, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_utilisateur.DataSource = m;
                tab_utilisateur.DataBind();
                c.Close();
            }
        }

        protected void bt_desactive_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher utisateur à desactive')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string action = "desactive";
                string request = "update utilisateur set etat = '"+action+"' where CNI = '"+txt_chercher.Text+"'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(request, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('La desactivation est echoue')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('La desactivation est reussie')</script>");
                    txt_chercher.Text = "";
                    Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur", tab_utilisateur);
                    bt_enregistrer.Enabled = true;
                    return;
                }
                c.Close();
            }
            
        }

        protected void bt_active_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher utisateur à active')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string request = "update utilisateur set etat = 'active' where CNI = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(request, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('L activation est echoue')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('L activation est reussie')</script>");
                    txt_chercher.Text = "";
                    Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur", tab_utilisateur);
                    bt_enregistrer.Enabled = true;
                    return;
                }
                c.Close();
            }

        }

        protected void bt_supprimer_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher utisateur à supprimer')</script>");
                return;
            }
            else
            {
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string request = "delete from utilisateur where CNI = '"+txt_chercher.Text+"'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(request, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('La suppresion  est echoue')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('La suppression est reussie')</script>");
                    txt_chercher.Text = "";
                    Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur", tab_utilisateur);
                    bt_enregistrer.Enabled = true;
                    return;
                }
                c.Close();

            }
        }

        protected void bt_editer_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher d abord l utilisateur à modifier')</script>");
                return;
            }
            else
            {
                if (txt_nom.Text == "" || txt_prenom.Text == "" || txt_login.Text == "" || txt_password.Text == "")
                {
                    Response.Write("<script>alert('Saisissez d abord les informations pour le modification ')</script>");
                    return;
                }
                else
                {
                    string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                    NpgsqlConnection c = new NpgsqlConnection(con);
                    string requeste = "update utilisateur set Nom ='" + txt_nom.Text + "',Prenom ='" + txt_prenom.Text + "',CNI ='" + txt_cni.Text + "',Login ='" + txt_login.Text + "',Password ='" + txt_password.Text + "',etat ='" + list_etat.Text + "', Grade ='" + list_grade.Text + "',Telephone =" + Int32.Parse(txt_telephone.Text) + " where CNI='" + txt_chercher.Text + "'";
                    c.Open();
                    NpgsqlCommand data = new NpgsqlCommand(requeste, c);
                    if (data.ExecuteNonQuery() != 1)
                    {
                        Response.Write("<script>alert('Echec de la modification')</script>");
                        return;
                    }
                    else
                    {
                        Response.Write("<script>alert('Modification reussie')</script>");
                        Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur", tab_utilisateur);
                        txt_chercher.Text = "";
                        bt_enregistrer.Enabled = true;
                    }
                    c.Close();
                }

            }
        }

        protected void bt_gmail_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin");
        }

        protected void bt_shutdown_Click(object sender, ImageClickEventArgs e)
        {
            
            Response.Redirect("Authentification.aspx");
        }

        protected void tab_utilisateur_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_utilisateur.EditIndex = -1;
            Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur order by(id)", tab_utilisateur);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_utilisateur_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.
            tab_utilisateur.EditIndex = e.NewEditIndex;
            Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur order by(id)", tab_utilisateur);
        }

        protected void tab_utilisateur_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update 
            Label id = tab_utilisateur.Rows[e.RowIndex].FindControl("lbl_Name") as Label;
            TextBox nom = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_nom") as TextBox;
            TextBox prenom = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_prenom") as TextBox;
            TextBox cni = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_cni") as TextBox;
            TextBox login = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_login") as TextBox;
            TextBox password = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_password") as TextBox;
            TextBox etat = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_etat") as TextBox;
            TextBox grade = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_grade") as TextBox;
            TextBox phone = tab_utilisateur.Rows[e.RowIndex].FindControl("txt_phone") as TextBox;

            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requeste = "update utilisateur set Nom ='" + nom.Text + "',Prenom ='" + prenom.Text + "',CNI ='" + cni.Text + "',Login ='" + login.Text + "',Password ='" + password.Text + "',etat ='" + etat.Text + "', Grade ='" + grade.Text + "',Telephone =" + Int32.Parse(phone.Text) + " where id=" + Int32.Parse(id.Text )+ "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requeste, c);
            data.ExecuteNonQuery();
            c.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_utilisateur.EditIndex = -1;

            Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur order by(id)", tab_utilisateur);
            tab_utilisateur.EditIndex = -1;
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }

        protected void tab_utilisateur_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_utilisateur.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from utilisateur where id =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select *from utilisateur order by(id)", tab_utilisateur);
            txt_chercher.Text = "";
            bt_enregistrer.Enabled = true;
        }


    }
}