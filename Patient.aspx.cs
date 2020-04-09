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
    public partial class Patient : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient);
            }
        }
        protected void bt_valider_Click(object sender, EventArgs e)
        {
            if(txt_nom.Text == "" || txt_prenom.Text == "" || txt_code.Text == "")
            {
                Response.Write("<script>alert('Les informations ne sont pas suffisantes')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requeste = "insert into patient(nom_pat,prenom_pat,sexe,telephone,age,mutuelle,cni_mutuelle,code)values('" + txt_nom.Text+ "','" + txt_prenom.Text + "','" + list_sexe.Text + "'," + Int32.Parse(txt_telephone.Text) + "," + Int32.Parse(txt_age.Text) + ",'" + list_mutuelle.Text + "','" + txt_mutuelle.Text + "','" + txt_code.Text + "')";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requeste,c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec de l enregistrement')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Enregistrement reussi')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient);
                    txt_nom.Text = "";
                    txt_prenom.Text = "";
                    txt_age.Text = "";
                    txt_telephone.Text = "";
                    list_sexe.Text = "";
                    list_mutuelle.Text = "";
                    txt_mutuelle.Text = "";
                    txt_code.Text = "";
                }
                c.Close();
            }
                            
        }

        protected void bt_annuler_Click(object sender, EventArgs e)
        {
            txt_nom.Text = "";
            txt_prenom.Text = "";
            txt_age.Text = "";
            txt_telephone.Text = "";
            list_sexe.Text = "";
            list_mutuelle.Text = "";
            txt_mutuelle.Text = "";
            txt_code.Text = "";

        }

        protected void bt_chercher_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez le code du patient aa chercher')</script>");
                return;
            }
            else
            {
                bt_valider.Enabled = false;
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string request = "select *from patient where code = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(request, c);
                NpgsqlDataReader m = data.ExecuteReader();
                tab_patient.DataSource = m;
                tab_patient.DataBind();
                c.Close();
            }
        }

        protected void bt_actualiser_Click(object sender, ImageClickEventArgs e)
        {
            Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient); 
            txt_chercher.Text = "";
            bt_valider.Enabled = true;
        }

        protected void bt_supprimer_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Saisissez le code du patient à supprimer')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requeste = "delete from patient where code = '" + txt_chercher.Text + "'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requeste, c);
                if (data.ExecuteNonQuery() != 1)
                {
                    Response.Write("<script>alert('Echec de la suppression')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Suppression reussie')</script>");
                    Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient); 
                    txt_chercher.Text = "";
                    bt_valider.Enabled = true;
                }
                c.Close();
            }
        }

        protected void bt_modifier_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_chercher.Text == "")
            {
                Response.Write("<script>alert('Chercher d'abord le patient aa modifier')</script>");
                return;
            }
            else
            {
                string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requeste = "update patient set nom_pat='" + txt_nom.Text + "',prenom_pat='" + txt_prenom.Text + "',sexe='" + list_sexe.Text + "',telephone=" + Int32.Parse(txt_telephone.Text) + ",age=" + Int32.Parse(txt_age.Text) + ",mutuelle='" + list_mutuelle.Text + "',cni_mutuelle='" + txt_mutuelle.Text + "',code='" + txt_code.Text + "' where code='" + txt_chercher.Text + "'";
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
                    Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient); 
                    txt_chercher.Text = "";
                    bt_valider.Enabled = true;
                }
                c.Close();
                
            }
        }

        protected void bt_fermer_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Authentification.aspx");
        }

        protected void bt_gmail_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin");
        }

        protected void tab_patient_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_patient.EditIndex = -1;
            Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient);
            txt_chercher.Text = "";
            bt_valider.Enabled = true;
        }

        protected void tab_patient_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.
            tab_patient.EditIndex = e.NewEditIndex;
            Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient);
        }

        protected void tab_patient_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update 
            Label id = tab_patient.Rows[e.RowIndex].FindControl("lbl_Name") as Label;
            TextBox nom = tab_patient.Rows[e.RowIndex].FindControl("txt_name") as TextBox;
            TextBox prenom = tab_patient.Rows[e.RowIndex].FindControl("txt_prenom") as TextBox;
            TextBox sexe = tab_patient.Rows[e.RowIndex].FindControl("txt_sexe") as TextBox;
            TextBox tel = tab_patient.Rows[e.RowIndex].FindControl("txt_phone") as TextBox;
            TextBox age = tab_patient.Rows[e.RowIndex].FindControl("txt_age") as TextBox;
            TextBox mut = tab_patient.Rows[e.RowIndex].FindControl("txt_mutuelle") as TextBox;
            TextBox cni = tab_patient.Rows[e.RowIndex].FindControl("txt_cni") as TextBox;
            TextBox code = tab_patient.Rows[e.RowIndex].FindControl("txt_code") as TextBox;

            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "update public.patient set nom_pat='" + nom.Text + "',prenom_pat='" + prenom.Text + "',sexe='" + sexe.Text + "',telephone=" + Int32.Parse(tel.Text) + ",age=" + Int32.Parse(age.Text) + ",mutuelle='" + mut.Text + "',cni_mutuelle='" + cni.Text + "',code='" + code.Text + "' where id_pat =" + Int32.Parse(id.Text) + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            tab_patient.EditIndex = -1;

            Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient);
            tab_patient.EditIndex = -1;
            txt_chercher.Text = "";
            bt_valider.Enabled = true;
        }

        protected void tab_patient_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(tab_patient.DataKeys[e.RowIndex].Value.ToString());
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "delete from patient where id_pat =" + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            data.ExecuteNonQuery();
            c.Close();

            Cabinet.Base.affiche_donne(sender, e, "select *from patient order by(id_pat)", tab_patient);
            txt_chercher.Text = "";
            bt_valider.Enabled = true;
        }

       
    }
}