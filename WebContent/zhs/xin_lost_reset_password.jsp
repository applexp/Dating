<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>更新密码</title>
<link rel="stylesheet" type="text/css" href="./../static/css/xin/xinaiju.css">

<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>
#xin-login-panel h1{
	color: #D93F31;
}
.login-small-text{
	width: auto;
}


/* Small devices (tablets, 768px and up) */
@media (min-width: 768px) {

	/** login panel **/
	#xin-login-panel{
		font-size: 1.5em;
		height: 100%;
		width:780px;
		margin: 0 auto;
		margin-top: 80px;
		margin-bottom: 80px;
		background-color: #fefefe;
		color:#555;
		padding: 20px;
		border-radius: 15px;
		border: 1px solid #eee;
		
	}
	#xin-table-login{
		max-width: 700px;
		margin: 0 auto;
	}
	#xin-login-panel h1{
		text-align: center;
	}
	.xin-table-td-size{
		width: 30%;
	}
	.xin-space-in-table{
		padding-bottom: 80px;
	}
	/** end login panel **/
	
	#xin-table-login input{
		font-size: 1.3em;
		padding: 15px;
		width: 90%;
	}
}


/* Medium devices (desktops, 992px and up) */
@media (min-width: 992px) {

	/** login panel **/
	#xin-login-panel{
		font-size: 1.0em;
		height: 100%;
		width:660px;
		margin: 10% auto;
		margin-top: 20px;
		background-color: #fefefe;
		color:#555;
		padding: 20px;
	}
	
	#xin-login-panel h1{
		text-align: center;
	}
	.xin-table-td-size{
		width: 26%;
	}
	.xin-space-in-table{
		padding-bottom: 20px;
	}
	
	/** end login panel **/
	#xin-table-login input{
		padding: 10px;
		width: 90%;
		font-size: 1.1em;
	}
}

/* Medium devices (desktops, 992px and up) */
@media (min-width: 1200px) {

	/** login panel **/
	#xin-login-panel{
		font-size: 1.0em;
		height: 100%;
		width:460px;
		margin: 10% auto;
		margin-top: 60px;
		background-color: #fefefe;
		color:#555;
		padding: 20px;
	}
	
	#xin-login-panel h1{
		text-align: center;
	}
	.xin-space-in-table{
		padding-bottom: 20px;
	}
	.xin-table-td-size{
		width: 25%;
	}
	/** end login panel **/
	#xin-table-login input{
		padding: 10px;
		width: auto;
		font-size: 1em;
	}

}
</style>
</head>
<body id="dingbu">
<div id="xin-body"> <!-- Frame starts -->

<div id="xin-header">
<div id="xin-header-body">
<a href="index"><img id="xin-aiju-logo" src="./../media/aijulogo.jpg" /></a>  
</div>
</div>

<div id="xin-frame" >
<div id="xin-login-panel">


<%
	String isPassMatch = (String) request.getAttribute("not_match_warning");
	String isSuccessUpdate = (String) request.getAttribute("success");

	if(isPassMatch.equals("1")){
%>
<div class="notify"><p class="notify-red">密码与确认密码不搭配。请重新输入<span class="x-mark x-login-page">&#x2717;</span></p></div>
<%  } 
	
	if(isSuccessUpdate.equals("1")){
%>
<div class="notify"><p class="notify-green">密码成功更新。请点击此 <a href="login">链接</a> 登录</p></div>
<%  } %>
	
<form action="lost-reset-password" method="post" >
<h1>更新密码</h1>
<table id="xin-table-login">
	<tr>
		<td class="xin-table-td-size" >密码</td> 
		<td> <input id="password" type="password" name="password" size="32" oninvalid="this.setCustomValidity('无效')"  required> </td>
	</tr>
	<tr>
		<td class="xin-table-td-size" >确认密码</td> 
		<td> <input id="password1" type="password" name="password1" size="32" oninvalid="this.setCustomValidity('无效')" required> </td>
	</tr>
	<tr>
		<td><input name="userid" type="hidden" value="<%= request.getAttribute("userid") %>"></td>
		<td><input type="submit" value="应用" style="width: auto; font-size: 1em;"></td>
	</tr>
</table>
</form>

</div>
</div>

<div id="xin-borderimage"></div>
<footer id="xin-footer">
<p>爱聚纽约 &middot; 版权所有  © 2014-2015</p>
</footer>


</div> <!-- xin body ends -->
</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="./../static/javascript/xin/xin.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');

</script>
</html>