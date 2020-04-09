<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medicament.aspx.cs" Inherits="CabinetMedical.Cabinet.Medicament" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cabinet Medical</title>
    <link rel="stylesheet" href="Style.css">
   <script type="text/javascript">
       function preventBack() { window.history.forward(); }
       setTimeout("preventBack()", 0);
       window.onunload = function () { null };
    </script>
</head>
<body style="background-color:lightblue">
    <div id="logo_bar" style="height:100px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Cabinet/images/logo.jpg" Height="84px" Width="88px" />
        <h1 style="position:absolute;display:inline-block;margin-left:32%;font-size:3em;">Gestion des Medicaments</h1>
    </div>
    <div id='cssmenu' style="background-color:#04267E">
        <ul>
           <li><a href='Authentification.aspx'><span>Home</span></a></li>
           <li ><a href='Utilisateur.aspx'><span>Utilisateur</span></a></li>
           <li><a href='Maladie.aspx'><span>Maladie</span></a></li>
           <li><a href='Medecin.aspx'><span>Medecin</span></a></li>
           
        </ul>
    </div>
    <form id="form1" runat="server">
    <div>
        <div id="chercher" style="height:99px;right:6px;width: auto;margin-top:20px;">
            <fieldset style="height: 87px;border:solid 1px white">
                <legend style="font-size:1.5em">Chercher un medicament</legend>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Nom du medicament :</strong>
                <asp:TextBox ID="txt_chercher" runat="server" Height="30px" Width="205px" BorderColor="White" BorderWidth="1px" Font-Size="Medium" placeholder=" le nom du medicament ?" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_chercher" runat="server" ImageUrl="~/Cabinet/images/search.png" OnClick="bt_chercher_Click" ToolTip="Chercher un medicament" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:ImageButton ID="bt_actualiser" runat="server" ImageUrl="~/Cabinet/images/refresh.png" ToolTip="Afficher tous" OnClick="bt_actualiser_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Cabinet/images/gmail.png" OnClick="ImageButton1_Click" ToolTip="Aller sur gmail" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Cabinet/images/shutdown.png" OnClick="ImageButton2_Click" ToolTip="Fermer l'application" />
                <br />

            </fieldset>
        </div>
        <div id="information" style="height: 430px; width: 507px; position:absolute; display:inline-block;  margin-top: 120px;right:7px; top: 171px;">
            <fieldset style="height: 465px;border:solid 1px white">
                <legend style="font-size:1.5em">Information sur medicament</legend>

            &nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Nom du medicament :</strong>
                <asp:TextBox ID="txt_nom" runat="server" Height="19px" Width="203px" BorderColor="White" BorderWidth="1px" Font-Size="Medium" AutoCompleteType="Disabled" ></asp:TextBox>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;<strong>Prix :</strong> <asp:TextBox ID="txt_prix" runat="server" BorderColor="White" BorderWidth="1px" Height="21px" Width="152px" AutoCompleteType="Disabled"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;<strong>Mutuelle :</strong>
                <asp:DropDownList ID="list_mutuelle" runat="server" BorderColor="White" BorderWidth="1px" Height="27px" Width="165px" Font-Size="Medium">
                    <asp:ListItem>NON</asp:ListItem>
                    <asp:ListItem>OUI</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;<strong>Quantite Stockée :</strong> <asp:TextBox ID="txt_quantite" runat="server" Height="21px" Width="75px" Font-Size="Medium" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<strong>Unité :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:TextBox ID="txt_unite" runat="server" Width="81px" Font-Size="Medium" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Bloqué :</strong>&nbsp;
                <asp:DropDownList ID="list_bloque" BorderColor="White" BorderWidth="1px" runat="server" Height="26px" Width="208px" Font-Size="Medium">
                    <asp:ListItem>NON</asp:ListItem>
                    <asp:ListItem>OUI</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_enregistrer" runat="server" Height="41px" OnClick="bt_enregistrer_Click" Text="Enregistrer" Width="137px" Font-Size="Medium" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_nettoyer" runat="server" Height="41px" OnClick="bt_nettoyer_Click" Text="Effacer" ToolTip="Nettoyer les champs" Width="137px" Font-Size="Medium" />

            </fieldset>
        </div>
        <div id="section" style="height: 440px; width: 60%; position:absolute; margin-top: 129px; left: 9px; top: 171px; margin-right: 0px;">
            <fieldset style="border:solid 1px white">
                <div id="table" style="width:98%" > 
                    <fieldset style="height: 270px;border:solid 1px white">
                        <legend style="font-size:1.5em">Liste des medicaments</legend>

                    &nbsp;&nbsp;&nbsp;
                        <br />
&nbsp;&nbsp;&nbsp;
                        <div style="width:630px;height:200px;overflow:scroll">
                        <asp:GridView ID="tab_medicament" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="613px" ShowHeaderWhenEmpty="True"
                            AutoGenerateColumns="False" OnRowCancelingEdit="tab_medicament_RowCancelingEdit" OnRowEditing="tab_medicament_RowEditing" OnRowUpdating="tab_medicament_RowUpdating"
                                        OnRowDeleting="tab_medicament_RowDeleting" DataKeyNames="id">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />

                            <columns>
                                            
                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                                </ItemTemplate>
             
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nom">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("nom") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_name" runat="server" Text='<%#Eval("nom") %>' Width="90px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mutuelle">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("mutuelle") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_mutuelle" runat="server" Text='<%#Eval("mutuelle") %>' Width="90px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prix">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("prix") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_prix" runat="server" Text='<%#Eval("prix") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Quantite Stock">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("quantite_stock") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_quantite" runat="server" Text='<%#Eval("quantite_stock") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unite dosage">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("unite_dosage") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_unite" runat="server" Text='<%#Eval("unite_dosage") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bloque">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("bloque") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_bloque" runat="server" Text='<%#Eval("bloque") %>' Width="40px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                           
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                     <asp:ImageButton ID="btn_Edit" runat="server" ImageUrl="~/Cabinet/images/pt_edit.png" CommandName="Edit" />
                                                     <asp:ImageButton ID="btn_delete" runat="server" ImageUrl="~/Cabinet/images/pt_del.png" CommandName="Delete" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                     <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                                                     <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                                                </EditItemTemplate>
                                            </asp:TemplateField>
             
                                        </columns>
                        </asp:GridView>
                        </div>
                    </fieldset>
                </div>
                <div id="manipule" style="height: 131px; width: 98%; margin-top: 25px;margin-bottom: 10px;">
                    <fieldset style="height: 100px;border:solid 1px white">

                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_modifier" runat="server" ImageUrl="~/Cabinet/images/edit.png" OnClick="bt_modifier_Click" ToolTip="Modifier un medicament" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_supprimer" runat="server" ImageUrl="~/Cabinet/images/delete.png" OnClick="bt_supprimer_Click" ToolTip="Supprimer un medicament" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_bloque" runat="server" ImageUrl="~/Cabinet/images/block.png" OnClick="bt_bloque_Click" ToolTip="Bloqué un medicament" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_debloque" runat="server" ImageUrl="~/Cabinet/images/deblock.png" OnClick="bt_debloque_Click" ToolTip="Debloqué un medicament" />

                    </fieldset>
                </div>
            </fieldset>
        </div>
    </div>
    </form>
</body>
</html>
