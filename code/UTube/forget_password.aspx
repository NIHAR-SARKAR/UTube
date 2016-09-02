<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget_password.aspx.cs" Inherits="UTube.forget_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=BenchNine' rel='stylesheet' type='text/css'>
<title>Home</title>

<link rel="shortcut icon" href="img/favicon.png" />

<script type="text/javascript" src="js/jquery.js"> </script>
<%--<script type="text/javascript" src="js/script.js"> </script>--%>

<script type="text/javascript">

	
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="outer">
	
	<div id="head">
		
		<div class="left-float">
			<a href="#" ><img src="img/testtube.png" /></a>
		</div>
		<div class="right-float">
			<a href="#" class="no-underline white-font mid-font">Instruction</a>
		</div>
		
	</div><!--head-->
	
	<div id="main-frame">
		
        <center>
		<div class="center-float half-width">
			<h2 class="white-font">Forgotten Your Password ?</h2>
            <h3 class="white-font" style="font-weight:200;">Enter your registered email</h3><br />
            <asp:TextBox ID="ForgetMail" runat="server" CssClass="bottomround upround textbox" placeholder="Enter Email"></asp:TextBox><br/>
            
            <asp:Button ID="btnSendPass" runat="server" CssClass="btn1 insidebutton" Text="" OnClick="btnSendPass_Click" />
            
            <br/>
            <h2><asp:Label ID="SendMessage" runat="server" CssClass="red-text bold" Text="default text message (change visibility when necessary)" ForeColor="White" Visible="False"></asp:Label></h2>
		</div>
		</center>

	</div><!--main frame-->
	
	<div id="footer">
		
		<div class="left-float">
			<img src="img/logo-img.png" class="small-ico left-fix" style="margin-left:-1%;box-shadow:2px 2px 10px #888;border-radius:20px;" alt="logo"/>
		</div>
		<div class="right-float white-font">
			<a href="#" class="no-underline white-font mid-font">Instruction</a>
			<span class="seperator"></span>
			<a href="#" class="no-underline white-font mid-font">Google</a>
			<span class="seperator"></span>
			<a href="#" class="no-underline white-font mid-font">Yahoo</a>
            <span class="seperator"></span>
			<a href="#" class="no-underline white-font mid-font">Bing</a>
            <span class="seperator"></span>
			<a href="#" class="no-underline white-font mid-font">KAT</a>
			
		</div>
		
	</div><!--footer-->
	
</div>
    </form>
</body>
</html>
