<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Patient.aspx.cs" Inherits="CabinetMedical.Cabinet.Patient" %>

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
        <h1 style="position:absolute;display:inline-block;margin-left:32%;font-size:3em;">Gestion des Patients</h1>
    </div>
    <div id='cssmenu' style="background-color:#04267E">
        <ul>
           <li><a href='Authentification.aspx'><span>Home</span></a></li>
           <li ><a href='Rendez_vous.aspx'><span>Rendez-vous</span></a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
 
    <div >
       <div id="chercher" style="height:99px;right:6px;width: auto;margin-top:20px;">
       <fieldset style="height: 87px;border:solid 1px white">
        <legend style="font-size:1.5em">Chercher un patient </legend><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Code du Patient :</strong>
        <asp:TextBox ID="txt_chercher" runat="server" Height="29px" BorderColor="White" BorderWidth="1px" style="margin-left: 3px" Width="229px" placeholder="Quel est le code ?" AutoCompleteType="Disabled" Font-Size="Medium"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="bt_chercher" runat="server" ImageUrl="~/Cabinet/images/search.png" ToolTip="Chercher un patient" OnClick="bt_chercher_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="bt_actualiser" runat="server" ImageUrl="~/Cabinet/images/refresh.png" ToolTip="Afficher tous" OnClick="bt_actualiser_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:ImageButton ID="bt_gmail" runat="server" ImageUrl="~/Cabinet/images/gmail.png" OnClick="bt_gmail_Click" ToolTip="Aller sur gmail" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:ImageButton ID="bt_fermer" runat="server" ImageUrl="~/Cabinet/images/shutdown.png" OnClick="bt_fermer_Click" ToolTip="Fermer l'application" />
           <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    </fieldset>
         </div>
        <div id="information" style="height: 430px; width: 507px; position:absolute; display:inline-block;  margin-top: 120px;right:7px; top: 171px;">
            <fieldset style="height: 465px;border:solid 1px white">
                <legend style="font-size:1.5em">Cordonnes des patients</legend>
            &nbsp; <strong>
                <br />
                Nom :</strong>&nbsp;&nbsp;
            <asp:TextBox ID="txt_nom" runat="server" Height="20px" Width="157px" placeholder="Quel est le nom ?" BorderColor="White" BorderWidth="1px" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;<strong>Prenom :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_prenom" runat="server" Height="20px" Width="141px" Font-Size="Medium" placeholder="le prenom ?" BorderColor="White" BorderWidth="1px" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
                <br />
            <br />
            <br />
            &nbsp;<strong>Sexe :</strong>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="list_sexe" runat="server" Height="26px" Width="134px" BorderColor="White" BorderWidth="1px" Font-Size="Medium">
                    <asp:ListItem Value="M">Masculin</asp:ListItem>
                    <asp:ListItem Value="F">Feminin</asp:ListItem>
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Age :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_age" runat="server" Height="20px" Width="140px" Font-Size="Medium" BorderColor="White" placeholder="Quel est l'age ?" BorderWidth="1px" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
            <br />
            <br />
            <br />
            &nbsp;<strong>Mutuelle :&nbsp; </strong>&nbsp;<asp:DropDownList ID="list_mutuelle" BorderColor="White" BorderWidth="1px" runat="server" Height="26px" Width="135px" Font-Size="Medium">
                    <asp:ListItem>OUI</asp:ListItem>
                    <asp:ListItem>NON</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>CNI_mutuelle :&nbsp;&nbsp; </strong>
            &nbsp;<asp:TextBox ID="txt_mutuelle" runat="server" Height="20px" BorderColor="White" BorderWidth="1px"  Width="99px" Font-Size="Medium" placeholder="le CNI ?" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
            <br />
            <br />
            <br />
            &nbsp;<strong>Telephone : </strong><asp:TextBox ID="txt_telephone" runat="server" Height="20px" BorderColor="White" placeholder="le telephone ?" BorderWidth="1px" Width="129px" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;<strong>Code patient :</strong>&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_code" runat="server" Height="20px" Width="110px" BorderColor="White" placeholder="le code ?" BorderWidth="1px" Font-Size="Medium" AutoCompleteType="Disabled"></asp:TextBox>
                <br />
                <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="bt_valider" runat="server" Height="41px" Text="Enregistrer" Width="137px" OnClick="bt_valider_Click" ToolTip="Enregistrer un patient" Font-Size="Medium" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="bt_annuler" runat="server" Height="41px" Text="Nettoyer" Width="137px" OnClick="bt_annuler_Click" ToolTip="Effacer les informations dans les champs" Font-Size="Medium" />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </fieldset>
             </div>
            <div id="section" style="height: 440px; width: 60%; position:absolute; margin-top: 129px; left: 9px; top: 171px; margin-right: 0px;">
                <fieldset style="border:solid 1px white">
                    <div id="table" style="width:98%"  >
                       <fieldset style="height: 270px;border:solid 1px white">
                           <legend style="font-size:1.5em">Liste des patients</legend>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
                        &nbsp;
                           <div style="width:850px; height:200px; overflow:scroll">
                                    <asp:GridView ID="tab_patient" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="833px" ShowHeaderWhenEmpty="true"
                                        AutoGenerateColumns="false" OnRowCancelingEdit="tab_patient_RowCancelingEdit" OnRowEditing="tab_patient_RowEditing" OnRowUpdating="tab_patient_RowUpdating"
                                        OnRowDeleting="tab_patient_RowDeleting" DataKeyNames="id_pat">
                                        <AlternatingRowStyle BackColor="White" />
                                        <EditRowStyle BackColor="#2461BF" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
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
                                                    <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("id_pat") %>'></asp:Label>
                                                </ItemTemplate>
             
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("nom_pat") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_name" runat="server" Text='<%#Eval("nom_pat") %>' Width="90px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prenom">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("prenom_pat") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_prenom" runat="server" Text='<%#Eval("prenom_pat") %>' Width="90px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sexe">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("sexe") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_sexe" runat="server" Text='<%#Eval("sexe") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Telephone">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("telephone") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_phone" runat="server" Text='<%#Eval("telephone") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Age">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("age") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_age" runat="server" Text='<%#Eval("age") %>' Width="30px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mutuelle">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%#Eval("mutuelle") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_mutuelle" runat="server" Text='<%#Eval("mutuelle") %>' Width="40px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="cni_mutuelle">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("cni_mutuelle") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_cni" runat="server" Text='<%#Eval("cni_mutuelle") %>' Width="50px" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%#Eval("code") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_code" runat="server" Text='<%#Eval("code") %>' Width="50px" ></asp:TextBox>
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
                                    <br />
                        </fieldset>
                    </div>
                
            
                    <div id="manipule" style="height: 131px; width: 98%; margin-top: 25px;margin-bottom: 10px;" >
                        <fieldset style="height: 100px;border:solid 1px white" >
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_modifier" runat="server" ImageUrl="~/Cabinet/images/edit.png" ToolTip="Modifier" OnClick="bt_modifier_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="bt_supprimer" runat="server" ImageUrl="~/Cabinet/images/delete.png" ToolTip="supprimer" OnClick="bt_supprimer_Click" />
                        </fieldset>
                    </div>
                </fieldset>
            </div>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>
     
    </form>
</body>
</html>
