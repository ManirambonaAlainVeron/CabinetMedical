<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maladie.aspx.cs" Inherits="CabinetMedical.Cabinet.Maladie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cabinet Medical</title>
    <link rel="stylesheet" href="Style.css">
    <style type="text/css">
      
    </style>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body style="background-color:lightblue ">
    <div id="logo_bar" style="height:100px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Cabinet/images/logo.jpg" Height="84px" Width="88px" />
        <h1 style="position:absolute;display:inline-block;margin-left:32%;font-size:3em;">Gestion des maladies</h1>
    </div>
    <div id='cssmenu' style="background-color: #04267E">
        <ul>
            <li><a href='Authentification.aspx'><span>Home</span></a></li>
           <li ><a href='Utilisateur.aspx'><span>Utilisateur</span></a></li>
           <li><a href='Medecin.aspx'><span>Medecin</span></a></li>
           <li><a href='Medicament.aspx'><span>Medicament</span></a></li>
           
        </ul>
    </div>
    <form id="form1" runat="server">
    <div>
        <div id="chercher" style="height:99px;right:6px;width: auto;margin-top:20px;">
            <fieldset style="height: 87px;border:solid 1px white">
                <legend style="font-size:1.5em">Chercher un maladie</legend>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Nom du maladie :</strong>
                <asp:TextBox ID="txt_chercher" runat="server" BorderColor="White" BorderWidth="1px" Height="30px" Width="254px" placeholder="Quel est le nom de  la maladie ?" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_chercher" runat="server" ImageUrl="~/Cabinet/images/search.png" OnClick="bt_chercher_Click" ToolTip="Chercher une maladie" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:ImageButton ID="bt_actualiser" runat="server" ImageUrl="~/Cabinet/images/refresh.png" OnClick="bt_actualiser_Click" ToolTip="Afficher tous" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Cabinet/images/gmail.png" OnClick="ImageButton1_Click" ToolTip="Aller sur gmail" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Cabinet/images/shutdown.png" OnClick="ImageButton2_Click" ToolTip="Fermer l'application" />
                <br />
                <br />

            </fieldset>
        </div>
        <div id="information" style="height: 430px; width: 507px; position:absolute; display:inline-block;  margin-top: 120px;right:7px; top: 171px;">
            <fieldset style="height: 465px;border:solid 1px white">
                <legend style="font-size:1.5em">Information sur maladie</legend>

                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:1.3em"><strong> Cordonnes sur la maladie </strong></span> <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Nom d&#39;une maladie :</strong>
                <asp:TextBox ID="txt_nom" runat="server" Height="22px" Width="234px" BorderColor="White" BorderWidth="1px" Font-Size="Medium" placeholder="Quel est le nom ?" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Prix de consultation :</strong>
                <asp:TextBox ID="txt_prix" runat="server" Height="20px" Width="228px" BorderColor="White" BorderWidth="1px" Font-Size="Medium" placeholder="Quel est le prix ?" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_enregistrer" runat="server" Height="41px" OnClick="bt_enregistrer_Click" Text="Enregistrer" ToolTip="Enregistrer une maladie" Width="137px" Font-Size="Medium" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_effacer" runat="server" Height="41px" OnClick="bt_effacer_Click" Text="Effacer" ToolTip="Nettoyer les champs" Width="137px" Font-Size="Medium" />

            </fieldset>
        </div>
        <div id="section" style="height: 440px; width: 60%; position:absolute; margin-top: 129px; left: 9px; top: 171px; margin-right: 0px;">
            <fieldset style="border:solid 1px white">
            <div id="table" style="width:98%" >
                <fieldset style="height: 270px;border:solid 1px white">
                    <legend style="font-size:1.5em">Liste des Maladies</legend>

                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div style="width:571px; height:200px; overflow:scroll">
                    <asp:GridView ID="tab_maladie" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" Width="553px" ShowHeaderWhenEmpty="True"
                        AutoGenerateColumns="False" OnRowCancelingEdit="tab_maladie_RowCancelingEdit" OnRowEditing="tab_maladie_RowEditing" OnRowUpdating="tab_maladie_RowUpdating"
                        OnRowDeleting="tab_maladie_RowDeleting" DataKeyNames="id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />


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
                                                    <asp:TextBox id="txt_nom" runat="server" Text='<%#Eval("nom") %>' Width="90px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prenom">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("prix_consultation") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_prix" runat="server" Text='<%#Eval("prix_consultation") %>' Width="90px" ></asp:TextBox>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:ImageButton ID="bt_modifier" runat="server" ImageUrl="~/Cabinet/images/edit.png" OnClick="bt_modifier_Click" ToolTip="Modifier une maladie" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:ImageButton ID="bt_supprimer" runat="server" ImageUrl="~/Cabinet/images/delete.png" OnClick="bt_supprimer_Click" ToolTip="supprimer une maladie" />

                </fieldset>
            </div>
            </fieldset>
        </div>
    </div>
    </form>
</body>
</html>
