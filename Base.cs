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
    public class Base
    {

        public static void affiche_donne(object sender, EventArgs e, string requete, GridView table)
        {
            string con = "Server = localhost; Database = CabinetMedicalDB; Port = 5432; User Id=postgres; Password = ndahiriwe";
            NpgsqlConnection c = new NpgsqlConnection(con);
            string requeste = requete;
            c.Open();
            NpgsqlCommand data = new NpgsqlCommand(requeste, c);
            NpgsqlDataReader r = data.ExecuteReader();
            table.DataSource = r;
            table.DataBind();
            c.Close();
        }
    }
}