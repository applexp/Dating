<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>注册新账号</title>
<link rel="stylesheet" type="text/css" href="./../static/css/xin/xinaiju.css">
<link rel="stylesheet" href="./../static/css/public/jq-ui.css">
<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>
#xin-login-panel h1{
	color: #D93F31;
}
.login-small-text{
	width: auto;
}
.highlight1{
	border-color: red;
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
	.padding-right{
		padding-right: 55px;
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
	}
	.xin-table-td-size-input{
		padding: 15px;
		width: 90%;
		font-size: 1.3em;
	}
	input[type=checkbox] {
	  /* All browsers except webkit*/
	  transform: scale(2);
	  /* Webkit browsers*/
	  -webkit-transform: scale(2);
	}
	input[type=radio] {
	  /* All browsers except webkit*/
	  transform: scale(2);
	
	  /* Webkit browsers*/
	  -webkit-transform: scale(2);
	}
	.check-box-name{
		padding-left: 10px;
		padding-right: 20px;
		margin-top: 20px;
	}
	.type-activity{
		padding-top: 0.2em;
	}
	.xin-register-panel-2{
		display:none;
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
	.padding-right{
		padding-right: 5px;
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
	input[type=checkbox] {
	  /* All browsers except webkit*/
	  transform: scale(1);
	
	  /* Webkit browsers*/
	  -webkit-transform: scale(1);
	}
	input[type=radio] {
	  /* All browsers except webkit*/
	  transform: scale(1);
	
	  /* Webkit browsers*/
	  -webkit-transform: scale(1);
	}
	.check-box-name{
		padding-left: 0px;
		padding-right: 0px;
		margin-top: 0px;
	}
	.type-activity{
		padding-top: 1em;
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
	String isValidEmail = (String) request.getAttribute("register_email_warning");
	String isEmailExist = (String) request.getAttribute("register_warning");
	String isPassMatch = (String) request.getAttribute("register_pass_warning");

	if(isEmailExist.equals("1")){
%>
<div class="notify"><p class="notify-red">此电子邮件地址已被使用 <span class="x-mark x-login-page">&#x2717;</span></p></div>
<%  }
	
	if(isPassMatch.equals("1")){
%>
<div class="notify"><p class="notify-red">密码与确认密码不搭配 <span class="x-mark x-login-page">&#x2717;</span></p></div>
<%  }
	
	if(isValidEmail.equals("1")){
%>
<div class="notify"><p class="notify-red">邮件不对<span class="x-mark x-login-page">&#x2717;</span></p></div>
<%  } %>

<form id="xin-register-submit-btn" action="register" method="post" >
<h1>注册</h1>
<table id="xin-table-login">
	<tr class="xin-register-panel-1">
		<td class="xin-table-td-size" >你是</td> 
		<td ><div style="padding-bottom: 20px;padding-top: 20px;"><input id="r1" type="radio" name="type" value="1" checked="checked" ><span class="check-box-name" >用户</span><span class="padding-right"></span><input id="r2" type="radio" name="type" value="2"><span class="check-box-name" >合作方 </span></div></td>
	</tr>
	<tr class="xin-register-panel-1">
		<td class="xin-table-td-size" >名字</td> 
		<td > <input class="xin-table-td-size-input required" id="name" type="text" name="name" size="32" value="" required> </td>
	</tr>
	<tr class="xin-register-panel-1">
		<td class="xin-table-td-size" >性别</td> 
		<td > <div id="radio-2" style="padding-left: 5px;"> <input type="radio" id="radio3" name="sex" checked="checked"><label for="radio3" >男 ♂</label> <input type="radio" id="radio4" name="sex" ><label for="radio4">女 ♀</label></div> </td>
	</tr>
	<tr class="xin-register-panel-1">
		<td class="xin-table-td-size" >电子邮件</td> 
		<td > <input class="xin-table-td-size-input required" id="email" type="email" name="email" size="32" value=""  oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,6}$" required> </td>
	</tr>
	<tr class="xin-register-panel-1">
		<td>密码</td> 
		<td> <input id="pass1" class="xin-table-td-size-input required" type="password" name="password" size="32" required> </td> 
	</tr>
	<tr class="xin-register-panel-1">
		<td>确认密码</td> 
		<td> <input id="pass2" class="xin-table-td-size-input required" type="password" name="cpassword" size="32" required> </td> 
	</tr>
	<tr class="xin-register-panel-1">
		<td class="xin-table-td-size" ><span class="organization-text">学校/公司</span></td> 
		<td > <input class="xin-table-td-size-input required" id="organization" type="text" name="organization" size="32" value="" required> </td>
	</tr>
	<tr class="xin-register-panel-1">
		<td class="xin-table-td-size" >电邮订阅</td> 
		<td><input type="checkbox" name="subscribe" value="1" checked></td>
	</tr>
	<tr class="xin-register-panel-1">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="xin-register-panel-1">
		<td>&nbsp;</td>
		<td><input id="xin-register-next-btn" class="xin-table-td-size-input" type="button" value="继续" style="width: auto; font-size: 1em;"></td>
	</tr>
	<tr class="xin-register-panel-2">
		<td class="xin-table-td-size" style="vertical-align:top;"><span class="type-activity">活动类型</span></td> 
		<td style=""> 
		<table style=""><tr><td><input type="checkbox" name="interests" value="0" ><span class="check-box-name">求职培训</span></td><td><input type="checkbox" name="interests" value="1" ><span class="check-box-name">行业交流</span></td></tr>
		<tr><td><input type="checkbox" name="interests" value="2" ><span class="check-box-name">艺术人文</span></td><td><input type="checkbox" name="interests" value="3" ><span class="check-box-name">餐饮休闲</span></td></tr>
		<tr><td><input type="checkbox" name="interests" value="4" ><span class="check-box-name">派对游戏</span></td><td>&nbsp;</td></tr>
		</table> 
		</td>
	</tr>
	<tr class="xin-register-panel-2">
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr class="xin-register-panel-2">
		<td>&nbsp;</td>
		<td><input id="xin-register-back-btn" class="xin-table-td-size-input" type="button" value="返回" style="width: auto; font-size: 1em;"><input class="xin-table-td-size-input" type="submit" value="注册" style="width: auto; font-size: 1em;"></td>
	</tr>
	<tr><td class="xin-space-in-table">&nbsp;</td><td>&nbsp;<input id="sexes" type="hidden" name="sexes" value="male" ></td></tr>
	<tr>
		<td>&nbsp;</td>
		<td style="text-align: right;"><a href="login"><small>登录</small></a></td>
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
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>	
<script type="text/javascript" src="./../static/javascript/xin/xin.js"></script>
<script>
$("#xin-register-next-btn").click(function(){    
	var isFormValid = true;

	
	
	$(".required").each(function(){
	    if ($.trim($(this).val()).length == 0){
	        $(this).addClass("highlight1");
	        isFormValid = false;
	    }
	    else{
	        $(this).removeClass("highlight1");
	    }
	});
	
	var email = $('#email').val();
	var emailReg = new RegExp('[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,6}$');
	var valid = emailReg.test(email);

	if(!valid) {
		isFormValid = false;
		$("#email").addClass("highlight1");
    } else {
    	$("#email").removeClass("highlight1");
    }
	
	var p1 = $('#pass1').val();
	var p2 = $('#pass2').val();
	if((p1 != p2) || p1.length == 0){
		isFormValid = false;
		$("#pass1, #pass2").addClass("highlight1");
	}else{
		$("#pass1, #pass2").removeClass("highlight1");
	}
	
	if(isFormValid){
		$(".xin-register-panel-1").hide();
		$(".xin-register-panel-2").show(250);
	}
});

$("#xin-register-back-btn").click(function(){    
	$(".xin-register-panel-2").hide();
	$(".xin-register-panel-1").show(250);
});

</script>
<script>
$(function(){$("#radio-2").buttonset()}),$("#radio3").click(function(){$("#sexes").val("male")}),$("#radio4").click(function(){$("#sexes").val("female")}),$("#r1").click(function(){$(".organization-text").html("学校/公司")}),$("#r2").click(function(){$(".organization-text").html("学校/公司")});  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');

</script>
</html>