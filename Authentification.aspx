<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authentification.aspx.cs" Inherits="CabinetMedical.Cabinet.Authentification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Cabinet Medical</title>

    <style>
        #authe {
          
            width: 396px;
            height: 450px;
            margin-left:25%;
            margin-top:10%;
            padding:10px;
            position:absolute;
            display:inline-block;
            background-color:white;
            border-bottom-left-radius:10px;
            border-top-left-radius:10px;
        }
        #txt_login {
            border-bottom:2px solid black;
            border-top:1px solid white;
            border-left:1px solid white;
            border-right:1px solid white;
        }
        #txt_password {
            border-bottom:2px solid black;
            border-top:1px solid white;
            border-left:1px solid white;
            border-right:1px solid white;
        }
        #image {
            position:absolute;
            display:inline-block;
            margin-left:51%;
            margin-top:10%;
           
           
           
        }
    </style>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body style="background-color:deepskyblue">
    <form id="form1" runat="server">
    <div style="height: 601px">
        <div id="authe" >
            <h1 style="text-align:center;color:#FD05DF">Log In</h1>
            <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_login" runat="server" Font-Size="Larger" Height="25px" Width="252px" placeholder =" Quel est votre identifiant ?" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_password" runat="server" Font-Size="Larger" TextMode="Password" Height="25px" Width="252px" placeholder ="Quel est votre mot de passe ?"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:ImageButton ID="bt_connection" runat="server" ImageUrl="~/Cabinet/images/connect.png" OnClick="bt_connection_Click" ToolTip="se connecter" />
            <br />
        </div>
          <div id="image">
              <image style="width: 470px;height: 470px; border-top-right-radius:10px; border-bottom-right-radius:10px;"  src="images/medecin.png"></image>
           </div>
        
    </div>
    </form>
</body>
</html>
