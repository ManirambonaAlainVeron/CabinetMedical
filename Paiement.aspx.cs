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
    public partial class Paiement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bt_payer.Enabled = false;
            if (!IsPostBack)
            {
                list_utilsateur.Items.Clear();
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select id,nom,prenom,cni from utilisateur where etat = 'active' and grade = 'pharmacien' ";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete,c);
                NpgsqlDataReader m = data.ExecuteReader();
                list_utilsateur.Items.Add(" ");
                while (m.Read())
                {
                    list_utilsateur.Items.Add(m.GetInt32(0)+" "+m.GetString(1)+" "+m.GetString(2)+" "+m.GetString(3));
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
                while (m.Read())
                {
                    list_maladie.Items.Add(m.GetInt32(0) + " " + m.GetString(1));
                }
                c.Close();
            }

            if (!IsPostBack)
            {
                list_traitement.Items.Clear();
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select traitement.id_tr,patient.nom_pat,patient.prenom_pat from traitement"
                                   + " inner join rendez_vous on traitement.id_rv=rendez_vous.id_rv"
                                   + " inner join patient on rendez_vous.patient=patient.id_pat";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete,c);
                NpgsqlDataReader m = data.ExecuteReader();
                list_traitement.Items.Add(" ");
                while (m.Read())
                {
                    list_traitement.Items.Add(m.GetInt32(0) + " " + m.GetString(1) + " " + m.GetString(2));
                }
                c.Close();
            }

            if (!IsPostBack)
            {
                list_medicament.Items.Clear();
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string blok = "NON";
                string requete = "select id,nom from medicament where bloque ='"+blok+"'";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                list_medicament.Items.Add(" ");
                while (m.Read())
                {
                    list_medicament.Items.Add(m.GetInt32(0) + " " + m.GetString(1));
                }
                c.Close();

            }
        }

        protected void bt_payer_Click(object sender, EventArgs e)
        {  
            //enlever sur la quantite stocker
            string[] x = list_medicament.SelectedItem.ToString().Split(' ');
            int id_medic = Int32.Parse(x[0]);
            string conect = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection coa = new NpgsqlConnection(conect);
            string reque = "select quantite_stock from medicament where id = " + id_medic + "";
            coa.Open();
            NpgsqlCommand daa = new NpgsqlCommand(reque, coa);
            NpgsqlDataReader mee = daa.ExecuteReader();
            mee.Read();
            string quantitee = mee.GetString(0);
            int quantit_stock = Int32.Parse(quantitee);
            int qua =Int32.Parse(txt_quantite.Text);
            int reste = quantit_stock - qua;
            string restee = reste.ToString();
            coa.Close();
            if (quantit_stock >= qua)
            {
                string conecte = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection coe = new NpgsqlConnection(conecte);
                string requee = "update medicament set quantite_stock ='" + restee + "' where id = " + id_medic + "";
                coe.Open();
                NpgsqlCommand dae = new NpgsqlCommand(requee, coe);
                dae.ExecuteNonQuery();
                coe.Close();
                //Enregistrer dans la data base
                string cone = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection ce = new NpgsqlConnection(cone);
                string req = "insert into paiement (utilisateur,patient,maladie,prix_consultation,medicament,prix_medicament,quantite,dates)values"
                            + "('" + list_utilsateur.Text + "','" + list_traitement.Text + "','" + list_maladie.Text + "','" + txt_prix.Text + "','" + list_medicament.Text + "','" + txt_prix_medi.Text + "','" + txt_quantite.Text + "','" + txt_data.Text + "')";
                ce.Open();
                NpgsqlCommand dat = new NpgsqlCommand(req, ce);
                dat.ExecuteNonQuery();
                ce.Close();

                // faire payer
                string[] a = list_traitement.SelectedItem.ToString().Split(' ');
                int id = Int32.Parse(a[0]);
                string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                NpgsqlConnection c = new NpgsqlConnection(con);
                string requete = "select mutuelle from patient inner join rendez_vous on rendez_vous.patient = patient.id_pat"
                                    + " inner join traitement on traitement.id_rv = rendez_vous.id_rv where traitement.id_tr=" + id + "";
                c.Open();
                NpgsqlCommand data = new NpgsqlCommand(requete, c);
                NpgsqlDataReader m = data.ExecuteReader();
                m.Read();
                string mutuelle = m.GetString(0);
                c.Close();

                if (mutuelle == "OUI")
                {
                    string[] medi = list_medicament.SelectedItem.ToString().Split(' ');
                    int id_med = Int32.Parse(medi[0]);
                    string conn = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
                    NpgsqlConnection co = new NpgsqlConnection(conn);
                    string request = "select mutuelle from medicament where id = " + id_med + "";
                    co.Open();
                    NpgsqlCommand da = new NpgsqlCommand(request, co);
                    NpgsqlDataReader me = da.ExecuteReader();
                    me.Read();
                    string mut = me.GetString(0);
                    co.Close();
                    int prix_consultation = Int32.Parse(txt_prix.Text);
                    int quantite = Int32.Parse(txt_quantite.Text);
                    int prix_medicament = Int32.Parse(txt_prix_medi.Text);
                    if (mut == "OUI") //medicament qu'on peut acheter par mutuelle
                    {
                        if (txt_total.Text == " ") // si le champ total est vide
                        {
                            int prix_mut = (prix_medicament * 80) / 100;
                            int somme = prix_consultation + (prix_mut * quantite);
                            txt_total.Text = somme.ToString();
                        }
                        else
                        {
                            int prix_mut = (prix_medicament * 80) / 100;
                            int somme = prix_consultation + (prix_mut * quantite);
                            int total = somme + Int32.Parse(txt_total.Text);
                            txt_total.Text = total.ToString();
                        }
                    }
                    else
                    {
                        int somme = prix_consultation + (prix_medicament * quantite);
                        if (txt_total.Text == " ")
                        {

                            txt_total.Text = somme.ToString();
                        }
                        else
                        {
                            int total = somme + Int32.Parse(txt_total.Text);
                            txt_total.Text = total.ToString();
                        }
                    }
                }
                else
                {
                    int prix_consultation = Int32.Parse(txt_prix.Text);
                    int quantite = Int32.Parse(txt_quantite.Text);
                    int prix_medicament = Int32.Parse(txt_prix_medi.Text);
                    int somme = prix_consultation + (prix_medicament * quantite);
                    if (txt_total.Text == " ")
                    {
                        txt_total.Text = somme.ToString();
                    }
                    else
                    {
                        int total = somme + Int32.Parse(txt_total.Text);
                        txt_total.Text = total.ToString();
                    }
                }
               
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript'>alert('Il ne reste plus de medicament dans le stock,recharge !!')</script>");
                bt_payer.Enabled = true;
                return;
            }

            
        }

        protected void list_utilsateur_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_data.Text = DateTime.Now.ToShortDateString();
            bt_payer.Enabled = true;
        }

        protected void list_maladie_SelectedIndexChanged(object sender, EventArgs e)
        {
            string []a = list_maladie.SelectedItem.ToString().Split(' ');
            int id = Int32.Parse(a[0]);
            string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "select prix_consultation from maladie where id = " + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            NpgsqlDataReader m = data.ExecuteReader();
            m.Read();
            txt_prix.Text = m.GetInt32(0).ToString();
            c.Close();
            bt_payer.Enabled = true;

        }

        protected void list_medicament_SelectedIndexChanged(object sender, EventArgs e)
        {
            string []b = list_medicament.SelectedItem.ToString().Split(' ');
            int id = Int32.Parse(b[0]);
            string con = "server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requete = "select prix from medicament where id = " + id + "";
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requete, c);
            NpgsqlDataReader m = data.ExecuteReader();
            m.Read();
            txt_prix_medi.Text = m.GetInt32(0).ToString();
            c.Close();
            bt_payer.Enabled = true;
        }

        protected void list_traitement_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_total.Text = " ";
            bt_payer.Enabled = true;
        }

        protected void bt_imprimer_Click(object sender, ImageClickEventArgs e)
        {
            Document doc = new Document(PageSize.A4,50,50,50,50);
            FileStream file = new FileStream("C:/Users/VERON/Desktop/paiement.pdf", FileMode.Create);
            PdfWriter.GetInstance(doc,file);
            doc.Open();
            doc.Add(new Paragraph("Recu de paiement"));
            doc.Add(new Paragraph("#################"));
            doc.Add(new Paragraph("Pharmacien ----> "+list_utilsateur.Text));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("Patient    ----> "+list_traitement.Text));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("Date       ----> "+txt_data.Text));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("Somme payée ---> "+txt_total.Text));
            doc.Close();
        }

        protected void bt_clean_Click(object sender, ImageClickEventArgs e)
        {
            
            list_traitement.Text = " ";
            list_maladie.Text = " ";
            list_medicament.Text = " ";
            txt_quantite.Text = " ";
            txt_total.Text = " ";
            txt_prix.Text = " ";
            
        }
    }
}