<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>验证电子信箱</title>
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
	#resendBtn{
		font-size: 1.3em;
		padding: 15px;
		width: auto;
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

	String isNotifyInvalid = (String) request.getAttribute("notify_invalid_code");
	String isNotify = (String) request.getAttribute("notify_email");
	if(isNotify.equals("true")){
%>
<div class="notify" ><p class="notify-green">新的验证码重新发送到您信箱里<span class="x-mark x-verification"> &#x2717;</span></p></div>
<%	} 
	
	if(isNotifyInvalid.equals("true")){
%>
<div class="notify" ><p class="notify-red">验证码不对 。请重新输入验证码<span class="x-mark x-verification"> &#x2717;</span></p></div>
<%  } %>

<form action="email-verification" method="post" >
<h1>验证电子信箱</h1>
<table id="xin-table-login">
	<tr>
		<td class="xin-table-td-size" >输入验证码</td> 
		<td> <input id="verifyemail" type="number" name="verifyemailcode" min="0" max="999999" size="32" oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')"  required> </td>
	</tr>
	<tr>
		<td><input name="email" type="hidden" value="<%= request.getAttribute("email") %>"><input id="name" name="name" type="hidden" value="<%= request.getAttribute("name") %>"><input id="g1" name="g1" type="hidden" value="<%= request.getAttribute("g1") %>"><input id="g2" name="g2" type="hidden" value="<%= request.getAttribute("g2") %>"></td>
		<td><input type="hidden" id="gshi" name="gshi" value="" ><input type="submit" value="出发"></td>
	</tr>
</table>
</form>
<div style="text-align: right; padding-top: 30px;"><a id="resendLink" href="#"><small>没收到验证码？</small></a><small><button id="resendBtn" type="button" style="display:none">重新发送</button></small></div>
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
$(document).ready(function(){
	if(localStorage.getItem('pObject') !== null) {
		var rData = localStorage.getItem('pObject');
		rData = $.parseJSON(rData);
		$("#gshi").val(rData.gs);
		//alert(rData.gs);
	}else{
		$("#gshi").val('-1');
		//alert("fail");
	}
});
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');

</script>
</html>