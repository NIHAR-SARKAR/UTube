<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verify_password.aspx.cs" Inherits="UTube.verify_password" %>

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
			<h2 class="white-font">Type in the code sent to your Email</h2>
            <asp:Label ID="Label1" runat="server" CssClass="white-font" Text="Check your mail , and type the hash here to verify your Identity"></asp:Label><br />
            <asp:TextBox ID="VerifyCode" runat="server" CssClass="bottomround upround textbox" placeholder="Enter Secret Hash"></asp:TextBox><br/>
            <asp:Button ID="VerifyIt" runat="server" Text="" CssClass="btn1 insidebutton" OnClick="VerifyIt_Click" />
            <!--- if hash matche== true ( visiable these controls )-->
            <br/>
            <br/>
            <br/>
            <asp:Label ID="SendMessage" runat="server" CssClass="red-text bold" Text="default text message (chnage visibility when necessary)"></asp:Label>
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
