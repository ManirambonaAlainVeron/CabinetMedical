<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rendez_vous.aspx.cs" Inherits="CabinetMedical.Cabinet.Rendez_vous" %>

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
        <h1 style="position:absolute;display:inline-block;margin-left:32%;font-size:3em;">Gestion des Rendez-vous</h1>
    </div>
    <div id='cssmenu' style="background-color:#04267E">
        <ul>
           <li><a href='Authentification.aspx'><span>Home</span></a></li>
           <li ><a href='Patient.aspx'><span>Patient</span></a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
    <div>
        <div id="chercher" style="height:99px;right:6px;width: auto;margin-top:20px;">
            <fieldset style="height: 87px;border:solid 1px white">
                <legend style="font-size:1.5em">Chercher le rendez-vous par date</legend>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Chercher un rendez-vous par date :</strong>
                <asp:TextBox ID="txt_chercher" runat="server" Height="29px" TextMode="Date" BorderColor="White" BorderWidth="1px" Width="211px" Font-Size="Medium"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_chercher" runat="server" ImageUrl="~/Cabinet/images/search.png" OnClick="bt_chercher_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:ImageButton ID="bt_actualiser" runat="server" ImageUrl="~/Cabinet/images/refresh.png" ToolTip="Afficher tous" OnClick="bt_actualiser_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Cabinet/images/gmail.png" OnClick="ImageButton1_Click" ToolTip="Aller sur gmail" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Cabinet/images/shutdown.png" OnClick="ImageButton2_Click" ToolTip="Fermer l'application" />

            </fieldset>
        </div>
        <div id="information" style="height: 430px; width: 507px; position:absolute; display:inline-block;  margin-top: 120px;right:7px; top: 171px;">
            <fieldset style="height: 465px;border:solid 1px white">
                <legend style="font-size:1.5em">Informations sur le rendez-vous</legend>

                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:1.3em"><strong>Reservation des rendez-vous</strong></span> <br />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Patient :</strong>
                <asp:DropDownList ID="list_patient" runat="server" Height="26px" Width="317px" BorderColor="White" BorderWidth="1px" Font-Size="Medium">
                </asp:DropDownList>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Date :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txt_date" runat="server" Height="20px" BorderColor="White" BorderWidth="1px" TextMode="Date" Width="248px" Font-Size="Medium"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> Heure :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txt_heure" runat="server" Height="20px" BorderColor="White" BorderWidth="1px" TextMode="Time" Width="177px" Font-Size="Medium"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Motif :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="list_motif" runat="server" Height="26px" BorderColor="White" BorderWidth="1px" Width="156px" Font-Size="Medium">
                    <asp:ListItem Value="consultation">Consultation</asp:ListItem>
                    <asp:ListItem Value="controle">Controle</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_enregistrer" runat="server" Height="41px" Text="Enregistrer" ToolTip="Enregistrer un rendez-vous" Width="137px" OnClick="bt_enregistrer_Click" Font-Size="Medium" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="bt_imprimer" runat="server" ImageUrl="~/Cabinet/images/printer.png" ToolTip="Imprimer un recu" OnClick="bt_imprimer_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bt_effacer" runat="server" Height="41px" Text="Nettoyer" ToolTip="Nettoyer les champs" Width="137px" OnClick="bt_effacer_Click" Font-Size="Medium" />

            </fieldset>
        </div>
        <div id="section" style="height: 440px; width: 60%; position:absolute; margin-top: 129px; left: 9px; top: 171px; margin-right: 0px;">
            <fieldset style="border:solid 1px white">
                <div id="table" style="width:98%">
                    <fieldset style="height: 270px;border:solid 1px white">
                        <legend style="font-size:1.5em">Les rendez-vous enregistrés</legend>
                        <br />
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <div style="width:800px;height:200px;overflow:scroll">
                        <asp:GridView ID="tab_rendez_vous" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="783px"
                            AutoGenerateColumns="False" OnRowCancelingEdit="tab_rendez_vous_RowCancelingEdit" OnRowEditing="tab_rendez_vous_RowEditing" OnRowUpdating="tab_rendez_vous_RowUpdating"
                            OnRowDeleting="tab_rendez_vous_RowDeleting" DataKeyNames="id_rv">
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
                                                    <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("id_rv") %>'></asp:Label>
                                                </ItemTemplate>
             
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="nom">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("nom") %>'></asp:Label>
                                                </ItemTemplate>
                                               
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="prenom">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("prenom") %>'></asp:Label>
                                                </ItemTemplate>
                                                
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("date") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_date" runat="server" Text='<%#Eval("date") %>' Width="95px" TextMode="Date" ></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Heure">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("heure") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_heure" runat="server" Text='<%#Eval("heure") %>' Width="95px" TextMode="Time"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="motif">
                                                 <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("motif") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox id="txt_motif" runat="server" Text='<%#Eval("motif") %>' Width="60px" ></asp:TextBox>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:ImageButton ID="bt_supprimer" runat="server" ImageUrl="~/Cabinet/images/delete.png" ToolTip="Supprimer des rendez-vous" OnClick="bt_supprimer_Click" />

                    </fieldset>
                </div>
            </fieldset>
        </div>
    </div>
    </form>
</body>
</html>
