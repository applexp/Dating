<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>密码恢复</title>
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
<h4>密码恢复</h4>

<div id="lost-and-verify-panel">
<form action="#" method="post">
<table>
	<tr>
		<td>电子邮件 </td> 
		<td> <input id="user_email" type="email" name="email" size="32" placeholder="your@email.com"  oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,6}$" required> </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" value="提交"></td>
	</tr>
</table>
</form>
</div>
</section>

<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->
</body>
</html>