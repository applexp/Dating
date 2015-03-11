<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="icon" type="image/png" href="#">
</head>
<body>
<div id="frame"> <!-- Frame starts -->

<div id="header">
	<nav id="language-bar"><ol><li><a href="#"><span class="highlight">简体</span></a></li><li><a href="../eng/index">English</a></li></ol></nav>
	<nav id="login-bar"><a href="index">首页</a></nav>
</div>

<div id="logo">
</div>

<section>
<h4>登录</h4>

<%
	String isDisplay = (String) request.getAttribute("display_login_message");
	String isCorrectUser = (String) request.getAttribute("login_warning");

	if(isDisplay.equals("true")){
%>
<div class="notify"><p class="notify-red">[<%= request.getAttribute("email") %>] 此电子邮件地址已被使用 <span class="x-mark x-login-page">&#x2717;</span></p></div>
<%	} 
	
	if(isCorrectUser.equals("true")){
%>
<div class="notify"><p class="notify-red">电子邮件地址与密码不搭配 <span class="x-mark x-login-page">&#x2717;</span></p></div>
<%  } %>

<div id="search-panel">
<form action="login" method="post">
<table>
	<tr>
		<td>电子邮件 </td> 
		<td> <input id="user_email" type="email" name="email" size="32" value="<%= request.getAttribute("email") %>"  oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,6}$" required> </td>
	</tr>
	<tr>
		<td>密码</td> 
		<td> <input type="password" name="password" size="32" required> </td> 
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" value="登录"></td>
	</tr>
</table>
</form>
<nav id="language-bar" style="float: right;"><ol><li><a href="lost_password"><small>忘了密码？</small></a></li><li><a href="index"><small>(注册新帐号)</small></a></li></ol></nav>
</div>
</section>

<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->

<script type="text/javascript" src="./../static/javascript/jquery.min.js"></script>
<script  type="text/javascript" src="./../static/javascript/dating.js"></script>
</body>
</html>