<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DPCover.aspx.cs" Inherits="UTube.DPCover" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>Choose DP</td>
                <td><asp:FileUpload ID="fuDP" runat="server" /></td>
            </tr>
            <tr>
                <td>Choose Cover</td>
                <td><asp:FileUpload ID="fuCover" runat="server" /></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnSubmit" runat="server" Text="GO" OnClick="btnSubmit_Click" /></td>
                <td><a href="#">Skip</a></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
