<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="UTube.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=BenchNine' rel='stylesheet' type='text/css'>
<title>TestTube</title>

<link rel="shortcut icon" href="img/favicon.png" />

<script type="text/javascript" src="js/jquery.js"> </script>
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
			<img src="img/sign-logo.png" /><br />
            <asp:TextBox ID="UserId" runat="server" CssClass="upround textbox" placeholder="Enter Email ID"></asp:TextBox><br />
            <asp:TextBox ID="UserPass" runat="server" CssClass="bottomround textbox" placeholder="Enter Password" TextMode="Password"></asp:TextBox><br/>
            <asp:Button ID="LogIn" runat="server" Text="" CssClass="btn1 insidebutton" OnClick="LogIn_Click"/><br />
            &nbsp;<span class="bold"> <asp:CheckBox ID="chkrem" runat="server" ForeColor="White" Text="Keep me sign in"></asp:CheckBox></span><br /><br />
            <span class="bold"><a href="forget_password.aspx?rel=forgot" style="color:white" class="standerd-links-white" >Forgot password?</a></span><br />
            <span class="bold" style="color:white">Don't have an Account ? <a href="register.aspx" style="color:blue" class="standerd-links-white">Sign Up here</a></span><br />
		</div>
		</center>

	</div><!--main frame-->
	
	<div id="footer">
		
		<div class="left-float">
			<img src="img/logo-img.png" class="small-ico left-fix" style="margin-left:-1%;box-shadow:2px 2px 10px #888;border-radius:20px;" alt="logo"/>
		</div>
		<div class="right-float white-font">
			<a href="#" class="no-underline white-font mid-font">Support</a>
			<span class="seperator"></span>
			<a href="#" class="no-underline white-font mid-font">About Us</a>
			<span class="seperator"></span>
			<a href="#" class="no-underline white-font mid-font">Report</a>
            <span class="seperator"></span>
			<a href="#" class="no-underline white-font mid-font">Developers</a>
		</div>
		
	</div><!--footer-->
	
</div>
    </form>
</body>
</html>
