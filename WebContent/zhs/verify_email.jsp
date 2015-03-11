<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>电子邮件地址验证程序</title>
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
<%

	String isNotifyInvalid = (String) request.getAttribute("notify_invalid_code");
	String isNotify = (String) request.getAttribute("notify_email");
	if(isNotify.equals("true")){
%>
<div class="notify" ><p class="notify-green">验证码重新发送 <span class="x-mark x-verification">&#x2717;</span></p></div>
<%	} 
	
	if(isNotifyInvalid.equals("true")){
%>
<div class="notify" ><p class="notify-red">验证码不对 <span class="x-mark x-verification">&#x2717;</span></p></div>
<%  } %>

<section>
<h4>电子邮件地址验证程序</h4>

<div id="lost-and-verify-panel">
<form action="email_verification" method="post">
<p><span style="margin-left: -20px; font-size;">电子邮件验证码已发送到你电子邮件地址信箱里 <%= request.getAttribute("email") %></span></p>
<table>
	<tr>
		<td>输入验证码</td> 
		<td> <input id="verifyemail" type="number" name="verifyemailcode" min="0" max="999999" size="32" oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')"  required> </td>
	</tr>
	<tr>
		<td><input name="email" type="hidden" value="<%= request.getAttribute("email") %>"><input id="name" name="name" type="hidden" value="<%= request.getAttribute("name") %>"><input id="g1" name="g1" type="hidden" value="<%= request.getAttribute("g1") %>"><input id="g2" name="g2" type="hidden" value="<%= request.getAttribute("g2") %>"></td>
		<td><input type="submit" value="出发"></td>
	</tr>
</table>
</form>
</div>
<div style="text-align: center; margin-top: 100px;"><a id="resendLink" href="#"><small>没收到验证码？</small></a><small><button id="resendBtn" class="small-font"  type="button" style="display:none">重新发送</button></small></div>
</section>

<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014-2015</small></p>
</footer>

</div> <!-- Frame ends -->

<script type="text/javascript" src="./../static/javascript/jquery.min.js"></script>
<script  type="text/javascript" src="./../static/javascript/dating.js"></script>
</body>
</html>