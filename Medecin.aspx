<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Medecin.aspx.cs" Inherits="CabinetMedical.Cabinet.Medecin" %>

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
<body style="background-color:lightblue ">
    <div id="logo_bar" style="height:100px;">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Cabinet/images/logo.jpg" Height="84px" Width="88px" />
        <h1 style="position:absolute;display:inline-block;margin-left:32%;font-size:3em;">Gestion des Medecins</h1>
    </div>
    <div id='cssmenu' style="background-color:#04267E ">
        <ul>
            <li><a href='Authentification.aspx'><span>Home</span></a></li>
           <li ><a href='Utilisateur.aspx'><span>Utilisateur</span></a></li>
           <li><a href='Maladie.aspx'><span>Maladie</span></a></li>
           <li><a href='Medicament.aspx'><span>Medicament</span></a></li>
          
        </ul>
    </div>
    <form id="form1" runat="server">
    <div>
        <div id="chercher" style="height:99px;right:6px;width: auto;margin-top:20px;">
            <fieldset style="height: 87px;">
                <legend style="font-size:1.5em">Chercher un medecin</legend><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CNI du medecin :</strong>&nbsp;
                <asp:TextBox ID="txt_chercher" runat="server" Height="29px" Width="162px" placeholder="Quel est le CNI ?" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_chercher" runat="server" ImageUrl="~/Cabinet/images/search.png" ToolTip="Chercher un medecin" OnClick="bt_chercher_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_actualiser" runat="server" ImageUrl="~/Cabinet/images/refresh.png" ToolTip="Actualiser" OnClick="bt_actualiser_Click" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Cabinet/images/gmail.png" OnClick="ImageButton1_Click" ToolTip="Aller sur gmail" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Cabinet/images/shutdown.png" OnClick="ImageButton2_Click" ToolTip="Fermer l'application" />

                <br />

            </fieldset>

        </div>
        <div id="information" style="height: 430px; width: 507px; position:absolute; display:inline-block;  margin-top: 120px;right:7px; top: 171px;">
            <fieldset style="height: 465px;">
                <legend style="font-size:1.5em">Information d'un medecin</legend>

            &nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Nom :</strong>
                <asp:TextBox ID="txt_nom" runat="server" Height="23px" Width="161px" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Prenom :</strong>
                <asp:TextBox ID="txt_prenom" runat="server" Height="21px" Width="137px" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> CNI :</strong>
                <asp:TextBox ID="txt_cni" runat="server" Height="21px" Width="165px" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;<strong>Telephone :</strong>
                <asp:TextBox ID="txt_telephone" runat="server" Height="21px" Width="124px" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Titre :</strong>
                <asp:DropDownList ID="list_titre" runat="server" Height="28px" Width="164px" Font-Size="Medium">
                    <asp:ListItem Value="genelaliste">Genelaliste</asp:ListItem>
                    <asp:ListItem Value="specialiste">Specialiste</asp:ListItem>
                    <asp:ListItem Value="infirmier">Infirmier</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_enregistrer" runat="server" Height="41px" OnClick="bt_enregistrer_Click" Text="Enregistrer" ToolTip="Enregistrer un medecin" Width="137px" Font-Size="Medium" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_effacer" runat="server" Height="41px" OnClick="bt_effacer_Click" Text="Effacer" ToolTip="Nettoyer les champs" Width="137px" Font-Size="Medium" />

            </fieldset>
        </div>
        <div id="section" style="height: 440px; width: 60%; position:absolute; margin-top: 129px; left: 9px; top: 171px; margin-right: 0px;">
            <fieldset>
                <div id="table" style="width:98%" >
                    <fieldset style="height: 270px">
                        <legend style="font-size:1.5em">Liste des medecins</legend>

                        <br />
&nbsp;&nbsp;&nbsp;
                        <div style="width:630px;height:200px;overflow:scroll;">
                        <asp:GridView ID="tab_medecin" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="613px" ShowHeaderWhenEmpty="true"
                             AutoGenerateColumns="false" OnRowCancelingEdit="tab_medecin_RowCancelingEdit" OnRowEditing="tab_medecin_RowEditing" OnRowUpdating="tab_medecin_RowUpdating"
                            OnRowDeleting="tab_medecin_RowDeleting" DataKeyNames="id">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />


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
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("prenom") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_prenom" runat="server" Text='<%#Eval("prenom") %>' Width="90px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Telephone">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("telephone") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_phone" runat="server" Text='<%#Eval("telephone") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CNI">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("cni") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_cni" runat="server" Text='<%#Eval("cni") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Titre">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("titre") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_titre" runat="server" Text='<%#Eval("titre") %>' Width="50px" ></asp:TextBox>
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
                    <fieldset style="height: 100px">

                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:ImageButton ID="bt_modifier" runat="server" ImageUrl="~/Cabinet/images/edit.png" ToolTip="Modifier un medecin" OnClick="bt_modifier_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:ImageButton ID="bt_supprimer" runat="server" ImageUrl="~/Cabinet/images/delete.png" ToolTip="Supprimer un medecin" OnClick="bt_supprimer_Click" />

                    </fieldset>
                </div>
            </fieldset>
        </div>
    </div>
    </form>
</body>
</html>
