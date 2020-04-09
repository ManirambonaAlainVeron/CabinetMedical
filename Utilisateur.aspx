<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Utilisateur.aspx.cs" Inherits="CabinetMedical.Cabinet.Utilisateur" %>

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
        <h1 style="position:absolute;display:inline-block;margin-left:32%;font-size:3em;">Gestion des utilisateurs</h1>
    </div>
    <div id='cssmenu' style="background-color:#04267E">
        <ul>
            <li><a href='Authentification.aspx'><span>Home</span></a></li>
           <li ><a href='Medicament.aspx'><span>Medicament</span></a></li>
           <li><a href='Maladie.aspx'><span>Maladie</span></a></li>
           <li><a href='Medecin.aspx'><span>Medecin</span></a></li>
           
        </ul>
    </div>
    <form id="form1" runat="server" >
    <div >
        <div id="chercher" style="height:99px;right:6px;width: auto;margin-top:20px;">
            <fieldset style="height: 87px;border:solid 1px white">
                <legend style="font-size:1.5em">Chercher un utilisateur</legend>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>CNI de l&#39;utilisateur :</strong>
                <asp:TextBox ID="txt_chercher" runat="server" Height="30px" BorderColor="White" BorderWidth="1px" Width="179px" placeholder="Quel est le CNI ?" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_chercher" runat="server" ImageUrl="~/Cabinet/images/search.png" ToolTip="Chercher" OnClick="bt_chercher_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_actualiser" runat="server" ImageUrl="~/Cabinet/images/refresh.png" ToolTip="Actualiser" OnClick="bt_actualiser_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_gmail" runat="server" ImageUrl="~/Cabinet/images/gmail.png" OnClick="bt_gmail_Click" ToolTip="Aller sur gmail" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_shutdown" runat="server" ImageUrl="~/Cabinet/images/shutdown.png" OnClick="bt_shutdown_Click" ToolTip="Fermer l'application" />

            </fieldset>
        </div>
        <div id="information" style="height: 430px; width: 507px; position:absolute; display:inline-block;  margin-top: 120px;right:7px; top: 171px; ">
            <fieldset style="height: 465px;border:solid 1px white">
                <legend style="font-size:1.5em">Information des utilisateur</legend>

            &nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;<strong>Nom :</strong>
                <asp:TextBox ID="txt_nom" runat="server" Height="21px" Width="163px" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Prenom :</strong>&nbsp;
                <asp:TextBox ID="txt_prenom" runat="server" Height="21px" Width="145px" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
&nbsp;<br />
                <br />
                <br />
&nbsp;&nbsp;<strong>CNI :</strong>&nbsp;&nbsp;
                <asp:TextBox ID="txt_cni" runat="server" Height="19px" Width="159px" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Login :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txt_login" runat="server" Height="23px" style="margin-bottom: 0px" Width="138px" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;&nbsp;<strong>Password :</strong>
                <asp:TextBox ID="txt_password" runat="server" Height="22px" Width="136px" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>etat :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="list_etat" runat="server" Height="30px" BorderColor="White" BorderWidth="1px" Width="143px" Font-Size="Medium">
                    <asp:ListItem Value="active">Active</asp:ListItem>
                    <asp:ListItem Value="desactive">Desactive</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
&nbsp;&nbsp;<strong>Grade :</strong>
                <asp:DropDownList ID="list_grade" runat="server" Height="22px" Width="165px" BorderColor="White" BorderWidth="1px" Font-Size="Medium">
                    <asp:ListItem Value="pharmacien">Pharmacien</asp:ListItem>
                    <asp:ListItem Value="medecin">Medecin</asp:ListItem>
                    <asp:ListItem Value="administrateur">Administrateur</asp:ListItem>
                    <asp:ListItem Value="receptioniste">Receptioniste</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Telephone :</strong>
                <asp:TextBox ID="txt_telephone" runat="server" Height="18px" Width="128px" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_enregistrer" runat="server" Height="41px" Text="Enregistrer" ToolTip="Enregistrer un utilisateur" Width="137px" Font-Size="Medium" OnClick="bt_enregistrer_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_Effacer" runat="server" Height="41px" Text="Effacer" ToolTip="Effacer les inforamtions dans les champs" Width="137px" Font-Size="Medium" OnClick="bt_Effacer_Click" />

            </fieldset>
        </div>
        <div id="section" style="height: 440px; width: 60%; position:absolute; margin-top: 129px; left: 9px; top: 171px; margin-right: 0px;">
            <fieldset style="border:solid 1px white" >
                <div id="table" style="width:98%" >
                    <fieldset style="height: 270px;border:solid 1px white">
                        <legend style="font-size:1.5em">Liste des utilisateurs</legend>
                        <div style="width:823px; height:200px;overflow:scroll">
                        <asp:GridView ID="tab_utilisateur" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="806px" ShowHeaderWhenEmpty="True"
                            AutoGenerateColumns="False" OnRowCancelingEdit="tab_utilisateur_RowCancelingEdit" OnRowEditing="tab_utilisateur_RowEditing" OnRowUpdating="tab_utilisateur_RowUpdating"
                            OnRowDeleting="tab_utilisateur_RowDeleting" DataKeyNames="id">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />

                              <AlternatingRowStyle BackColor="White" />

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
                                            <asp:TemplateField HeaderText="CNI">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("cni") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_cni" runat="server" Text='<%#Eval("cni") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Login">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("login") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_login" runat="server" Text='<%#Eval("login") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Password">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("password") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_password" runat="server" Text='<%#Eval("password") %>' Width="30px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="etat">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("etat") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_etat" runat="server" Text='<%#Eval("etat") %>' Width="40px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Grade">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("grade") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_grade" runat="server" Text='<%#Eval("grade") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Telephone">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%#Eval("telephone") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_phone" runat="server" Text='<%#Eval("telephone") %>' Width="50px" ></asp:TextBox>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_editer" runat="server" ImageUrl="~/Cabinet/images/edit.png" ToolTip="Modifier un utilisateur" OnClick="bt_editer_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:ImageButton ID="bt_supprimer" runat="server" ImageUrl="~/Cabinet/images/delete.png" ToolTip="Supprimer un utilisateur" OnClick="bt_supprimer_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_active" runat="server" ImageUrl="~/Cabinet/images/active.png" ToolTip="Active l'utilisateur" OnClick="bt_active_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_desactive" runat="server" ImageUrl="~/Cabinet/images/desactive.png" ToolTip="Desactive un utilisateur" OnClick="bt_desactive_Click" />
                        
                    </fieldset>
                </div>
            </fieldset>
        </div>
    </div>
    </form>
</body>
</html>
