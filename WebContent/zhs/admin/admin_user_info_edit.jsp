<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import = "roti.__User"%>
    <% String role = (String) request.getAttribute("role"); %>
<%
__User user = (__User) request.getAttribute("user");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>爱聚系统管理 v1.0</title>
<link rel="stylesheet" type="text/css" href="./../../static/css/xin/xinaiju.css">

<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>
#xin-login-panel h1{
	color: #D93F31;
	font-size: 1.4em;
}
.login-small-text{
	width: auto;
}
.xin-table-td-size{
	width: 30%;
}
	
/*** settings content ***/
#xin-frame-settings{
	overflow:hidden;
	background-color:#D93F31;
	padding-top: 0px;
}
#xin-frame-settings-center{
	width: 100%;
	border-top: 25px solid #444;
	margin: 0 auto;
}

/** left **/
#settings-left-panel{
	float: left;
	width: 75%;
	height: 100%;
	background-color: white;
	!padding-bottom:100%;
	!margin-bottom:-100%;
}
#settings-left-body{
	float: right;
	width: 100%;
	height: auto;
	padding-bottom: 300px;
}
#settings-left-content{
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}

/** right **/
#settings-right-panel{
	float: left;
	width: 25%;
	height: 100%; 
	color: white;
	padding-bottom:100%;
	margin-bottom:-100%; 
}
#settings-right-body{
	float: left;
	width: 100%;
}
#settings-right-content{
	padding-left: 20px;
}
#settings-right-content ul{
	list-style-type: none;
}
#settings-right-content ul li{
	font-size: 1.1em;
	margin-left: -35px;
	margin-bottom: 30px;
	cursor:pointer;
}

.xin-table-td-size{
	padding-bottom: 20px;
	vertical-align: top;
}
.xin-table-td-size input{
	margin-top: -20px;
}
.noedit-user-info{
	!vertical-align: top;
	!padding-bottom: 0px;
	!text-align: left;
}
/*** end settings content ***/

.cropit-image-preview {
	background-color: #f8f8f8;
    background-size: cover;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-top: 7px;
    width: 360px;
    height: 360px;
    cursor: move;
    margin-left: 5px;
}
.cropit-image-background {
    opacity: .2;
    cursor: auto;
}
.image-size-label {
	margin-top: 0.6rem;
}
    
/* Small devices (tablets, 768px and up) */
@media (min-width: 768px) {

	/*** settings content ***/
	#settings-left-body{
		!width: 740px;
	}
	/*** end settings content ***/
	#xin-table-login label{
		font-size: 1.2em;
	}
	#xin-table-login input{
		font-size: 1.3em;
		padding: 15px;
		width: 90%;
	}
	#xin-table-login select{
		font-size: 1.3em;
		padding: 15px;
		width: auto;
	}
}


/* Medium devices (desktops, 992px and up) */
@media (min-width: 992px) {

	
	/** end login panel **/
	#xin-table-login input{
		padding: 10px;
		width: 90%;
		font-size: 1.1em;
	}
	#xin-table-login select{
		font-size: 1.0em;
		padding: 5px;
		width: auto;
	}
	/*** settings content ***/
	#settings-left-body{
		!width: 840px;
	}
	#xin-frame-settings-center{
		border-top: 0px solid #fff;
	}
	#settings-left-panel{
		width: 70%;
	}
	#settings-left-content{
		padding-top: 20px;
	}
	#settings-right-panel{
		width: 30%;
	}
	#settings-right-content{
		padding-top: 20px;
	}
	/*** end settings content ***/
}

/* Medium devices (desktops, 992px and up) */
@media (min-width: 1200px) {

	.xin-table-td-size{
		width: 100px;
	}
	/** end login panel **/
	#xin-table-login label{
		font-size: 1.0em;
	}
	#xin-table-login input{
		padding: 10px;
		width: auto;
		font-size: 1em;
	}
	
	/*** settings content ***/
	#xin-frame-settings-center{
		width: 940px;
	}
	#settings-left-body{
		width: 100%;
		padding-bottom: 200px;
	}
	#settings-left-panel{
		width: 75%;
	}
	#settings-left-content{
		
	}
	#settings-right-panel{
		width: 25%;
	}
	#settings-right-content ul li{
		font-size: 1em;
		margin-left: 0px;
		margin-bottom: 15px;
	}
	/*** end settings content ***/

}
/* Medium devices (desktops, 1800px and up) */
@media (min-width: 1800px) {

	/*** settings content ***/
	#xin-frame-settings-center{
		width: 1160px;
	}
	#settings-left-panel{
		width: 75%;
	}
	#settings-right-panel{
		width: 25%;
	}
	#settings-left-body{
		padding-bottom: 440px;
	}
	/*** end settings content ***/

}
</style>
</head>
<body id="dingbu">
<div id="xin-body"> <!-- Frame starts -->
<div id="xin-body-cover">

<div id="xin-header">
<div id="xin-header-body">
<a href="../index"><img id="xin-aiju-logo" src="./../../media/aijulogo.jpg" /></a>  

<table id="xin-upper-nav-table">
<tr class="xin-upper-nav-vertical-top">
<td class="xin-upper-nav-row-gap">

</td>
<td class="xin-upper-nav-row-gap">
<%	if(role.equals("0")){ %>
亲, 你好
<%	}else if(role.equals("1")){ %>
管理员, <%= request.getAttribute("sname") %>
<%	}else if(role.equals("2")){ %>
你好, <%= request.getAttribute("sname") %>
<%	} %>
</td>
</tr>

<tr>
<td colspan="2" style="text-align: right;">
<%	if(!role.equals("0")){ %>
<a id="xin-setting-btn" href="#"><img  class="space-in-upper-icon show-upper-link-icon" src="./../../media/buttonimg/settings.png"  /></a>
<%	}else{ %>
<a href="login"><img  class="space-in-upper-icon show-upper-link-icon" src="./../../media/buttonimg/login.png"  /></a>
<%	} %>
</td>
</tr>
</table>

</div>
</div>
<div style="clear: both;"></div>
<div id="xin-setting-frame">
<div id="xin-setting-menu"><ol><%= (role.equals("1"))? "<li><a href=\"../admin/index\">系统管理</a></li>":"" %><li><a href="../yonghu/shangchuan">活动推文</a></li><li><a href="shezhi">账户设置</a></li><li><a href="../logout">退出</a></li></ol></div>
</div>
<div style="clear: both;"></div>


<div id="xin-frame-settings">

<div id="xin-frame-settings-center">
<div id="settings-left-panel">
<div id="settings-left-body">
<div id="settings-left-content">

<%
	String isUpdate = (String) request.getAttribute("update_success");
	String pass_not_match = (String) request.getAttribute("pass_not_match");
	String not_valid_email = (String) request.getAttribute("not_valid_email");

	if(isUpdate.equals("1")){
%>
<div class="notify"><p class="notify-green">用户信息更新成功 <span class="x-mark x-login-page">&#x2717;</span></p></div>
<%	}else if(isUpdate.equals("0")){
%>
<div class="notify"><p class="notify-red">用户信息更新失败<span class="x-mark x-login-page">&#x2717;</span></p></div>
<%  }
	
	if(pass_not_match.equals("1")){ 
%>
		<div class="notify"><p class="notify-red">新密码与确认新密码不搭配。用户信息更新失败<span class="x-mark x-login-page">&#x2717;</span></p></div>
<%
	}
	if(not_valid_email.equals("1")){ 
%>
	<div class="notify"><p class="notify-red">电子邮件格式不对。请重新输入。用户信息更新失败<span class="x-mark x-login-page">&#x2717;</span></p></div>
	<%} %>
	
<h3><%= (request.getAttribute("type").equals("0"))?"[ <span style=\"color: red;\">"+ user.getName() +"</span> ]基本信息":"编辑[ <span style=\"color: red;\">"+ user.getName() +"</span> ]基本信息" %></h3>
<div class="" id="bianji-yonghu-btn" style="float: right; position: relative; top: -40px; cursor: pointer;color: #D93F31;"><img src="./../../media/buttonimg/edit.png" width=18px height=18px style="position:relative; top: 2px;" /> 编辑用户</div>
<div class="" id="view-yonghu-btn" style="float: right; position: relative; top: -40px; cursor: pointer;color: #D93F31;"><img src="./../../media/buttonimg/view.png" width=18px height=18px style="position:relative; top: 2px;"/> 查看资料</div>
<div id="xin-table-login" style="!padding:10px;">
<form action="yonghuxinxi" method="post" enctype="multipart/form-data" onsubmit="readySubmit();">
<table class="image-editor" style="width:100%">
<tr><td class="xin-table-td-size" style="width:12%;"><label>编号</label></td><td class="xin-table-td-size" style="width:auto;"><span class="noedit-user-info"><%= user.getUserID() %></span><input class="edit-user-info" type="text" name="userid1" value="<%= user.getUserID() %>" maxlength="9" readonly="readonly"></td></tr>
<tr><td class="xin-table-td-size"><label>名字</label></td><td class="xin-table-td-size"><span class="noedit-user-info"><%= user.getName() %></span><input class="edit-user-info" type="text" name="name" value="<%= user.getName() %>" maxlength="79" required></td></tr>
<tr><td class="xin-table-td-size"><label>邮箱地址</label></td><td class="xin-table-td-size"><span class="noedit-user-info"><%= user.getEmail() %></span><input class="edit-user-info" type="email" name="email" value="<%= user.getEmail() %>"  oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,6}$" maxlength="45" required></td></tr>
<tr><td class="xin-table-td-size"><label>个人签名</label></td><td class="xin-table-td-size"><span class="noedit-user-info"><%= (user.getTitle() == null)?"":user.getTitle() %></span><input class="edit-user-info" type="text" name="title"  value="<%= user.getTitle() %>" maxlength="119" size="50"></td></tr>
<tr><td class="xin-table-td-size"><label>性别</label></td><td class="xin-table-td-size"><span class="noedit-user-info"><% if(user.getGender() == null){ out.write("");}else if(user.getGender().equals("female")){ out.write("女 ♀");}else if(user.getGender().equals("male")){ out.write("男 ♂");} %></span><select class="edit-user-info" name="gender" id="gender"> <option value="0">- 性别 - </option> <option value="male" >男 ♂</option> <option value="female">女 ♀</option> </select> </td></tr>
<tr><td class="xin-table-td-size"><label>年龄</label></td><td class="xin-table-td-size"><span class="noedit-user-info"> <%= (user.getYear() == null)?"":user.getYear()+" 年  " %><%= (user.getMonth() == null)?"":user.getMonth()+" 月" %></span><select class="edit-user-info" name="month"  id="month"> <option value="0">- 月份 - </option> <option value="1">1</option> <option value="2">2</option><option value="3">3</option> <option value="4">4</option>  <option value="5">5</option>  <option value="6">6</option>  <option value="7">7</option>  <option value="8">8</option>  <option value="9">9</option>  <option value="10">10</option> <option value="11">11</option> <option value="12">12</option> </select> <select  class="edit-user-info" name="year"  id="year" required> <option value="0">- 年份 -</option> <option value="1996">1996</option> 	<option value="1995">1995</option> 	<option value="1994">1994</option> 	<option value="1993">1993</option> 	<option value="1992">1992</option> 	<option value="1991">1991</option> 	<option value="1990">1990</option> 	<option value="1989">1989</option> 	<option value="1988">1988</option> 	<option value="1987">1987</option> 	<option value="1986">1986</option> 	<option value="1985">1985</option> 	<option value="1984">1984</option> 	<option value="1983">1983</option> 	<option value="1982">1982</option> 	<option value="1981">1981</option> 	<option value="1980">1980</option> 	<option value="1979">1979</option> 	<option value="1978">1978</option> 	<option value="1977">1977</option> 	<option value="1976">1976</option> 	<option value="1975">1975</option> 	<option value="1974">1974</option> 	<option value="1973">1973</option> 	<option value="1972">1972</option> 	<option value="1971">1971</option> 	<option value="1970">1970</option> 	<option value="1969">1969</option> 	<option value="1968">1968</option> 	<option value="1967">1967</option> 	<option value="1966">1966</option> 	<option value="1965">1965</option> 	<option value="1964">1964</option> 	<option value="1963">1963</option> 	<option value="1962">1962</option> 	<option value="1961">1961</option> 	<option value="1960">1960</option> 	<option value="1959">1959</option> 	<option value="1958">1958</option> 	<option value="1957">1957</option> 	<option value="1956">1956</option> 	<option value="1955">1955</option> 	<option value="1954">1954</option> 	<option value="1953">1953</option> 	<option value="1952">1952</option> 	<option value="1951">1951</option> 	<option value="1950">1950</option> 	<option value="1949">1949</option> 	<option value="1948">1948</option> 	<option value="1947">1947</option> 	<option value="1946">1946</option> 	<option value="1945">1945</option> 	<option value="1944">1944</option> 	<option value="1943">1943</option> 	<option value="1942">1942</option> 	<option value="1941">1941</option> 	<option value="1940">1940</option> 	<option value="1939">1939</option> 	<option value="1938">1938</option> 	<option value="1937">1937</option> 	<option value="1936">1936</option> 	<option value="1935">1935</option> 	<option value="1934">1934</option> 	<option value="1933">1933</option> 	<option value="1932">1932</option> 	<option value="1931">1931</option> 	<option value="1930">1930</option> 	<option value="1929">1929</option> 	<option value="1928">1928</option> 	<option value="1927">1927</option> 	<option value="1926">1926</option> 	<option value="1925">1925</option> 	<option value="1924">1924</option> 	<option value="1923">1923</option> 	<option value="1922">1922</option> 	<option value="1921">1921</option> 	<option value="1920">1920</option> 	<option value="1919">1919</option> 	<option value="1918">1918</option> 	<option value="1917">1917</option> 	<option value="1916">1916</option> 	<option value="1915">1915</option> 	<option value="1914">1914</option> 	<option value="1913">1913</option> 	<option value="1912">1912</option> 	<option value="1911">1911</option> 	<option value="1910">1910</option> 	<option value="1909">1909</option> 	<option value="1908">1908</option> 	<option value="1907">1907</option> 	<option value="1906">1906</option> 	<option value="1905">1905</option> 	<option value="1904">1904</option> 	<option value="1903">1903</option> 	<option value="1902">1902</option> 	<option value="1901">1901</option> 	<option value="1900">1900</option> </select> </td></tr>
<tr><td class="xin-table-td-size"><label>头像</label></td><td class="xin-table-td-size"><img src="https://s3.amazonaws.com/aiju-cloudfront-bucket/<%= user.getProfileImagePath() %>" class="noedit-user-info" width="150px" height="150px" style="border: 1px solid #eee; border-radius: 25px;"><input class="cropit-image-input edit-user-info" type="file"  id="cropit-image-input-size" ><span  class="edit-user-info"  id="alert-img-size">图片不能超过5MB</span></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td class="xin-table-td-size"><div class="edit-user-info cropit-image-preview"></div></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td class="xin-table-td-size"><div class="edit-user-info image-size-label" style="padding: 5px;">调整图像大小</div><br/><input type="range" class="edit-user-info cropit-image-zoom-input"></td></tr>
<tr><td class="xin-table-td-size"><label class="edit-user-info">新密码</label></td><td class="xin-table-td-size"><input class="edit-user-info" type="password" id="n_pass1" name="n_pass1"  maxlength="70" ></td></tr>
<tr><td class="xin-table-td-size"><label class="edit-user-info">确认新密码</label></td><td class="xin-table-td-size"><input class="edit-user-info" type="password" id="n_pass2" name="n_pass2"   maxlength="70" ></td></tr>
<tr><td></td><td style="padding-top: 20px;"><input type="hidden" name="default-img-path" value="<%= user.getProfileImagePath() %>"><textarea name="profileImage" class="current-image" style="display:none;"></textarea><input  class="edit-user-info" type="submit" value="确定更新" style="width:auto;"></td></tr>
</table>
</form>
</div>
</div>

</div>
</div>

<div id="settings-right-panel">
<div id="settings-right-body">
<div id="settings-right-content" >
<h3>爱聚系统管理 <small>v1.0</small></h3>
<ul>
<li><a href="index"><span class="ltc">活动推文</span></a></li>
<li><a href="liebiao"><span class="ltc">活动列表</span></a></li>
<li><a href="huishou"><span class="ltc">回收站</span></a></li>
<li style="cursor:default;">__________</li>
<li><a href="yonghuliebiao?i=1"><span class="ltc">用户列表</span></a></li>
<li><a href="yonghuliebiao?i=1"><span class="xin-selected-option">用户信息</span></a></li>
<li style="cursor:default;">__________</li>
<li><a href="zonghe-baogao?type=day_user"><span class="ltc">综合报告</span></a></li>
</ul>
</div>

</div>
</div>

</div>


<div style="clear: both;"></div>

</div>




<footer id="xin-footer" style="margin-top: 0px;padding-top:20px;">
<p>爱聚纽约 &middot; 版权所有  © 2014-2015</p>
</footer>

</div>
</div> <!-- xin body ends -->
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script>
$("#gender option[value='<%= user.getGender() %>']").attr("selected","selected");
$("#month option[value='<%= user.getMonth() %>']").attr("selected","selected");
$("#year option[value='<%= user.getYear() %>']").attr("selected","selected");


</script>
<script type="text/javascript" src="./../../static/javascript/xin/settings/shezhi.js"></script>
<script type="text/javascript" src="./../../static/javascript/xin/settings/jquery.cropit.js"></script>
<script type="text/javascript" src="./../../static/javascript/xin/xin.js"></script>
<script>

	initialize(<%= request.getAttribute("type") %>);

$(function() {
	  $('.image-editor').cropit({
	    imageState: {
	      src: 'https://s3.amazonaws.com/aiju-cloudfront-bucket/<%= user.getProfileImagePath() %>'
	    }
	  });
	});


$('#cropit-image-input-size').bind('change', function(file) {

	if(this.files[0].size > 5145728){
		$('.image-editor').cropit('imageSrc', 'https://s3.amazonaws.com/aiju-cloudfront-bucket/<%= user.getProfileImagePath() %>');
		$('#submit-crop-btn').prop('disabled',true);
		$('#cropit-image-input-size').css('border-color', 'red');
		$('#alert-img-size').css('color', 'red');
		$('#alert-img-size').html("照片超过5MB!! 请重新上传图片");
		this.removeFile(file);
		
  	}else{
  		$('#cropit-image-input-size').css('border-color', '#eee');
  		$('#alert-img-size').css('color', 'initial');
  		$('#alert-img-size').html("图片不能超过5MB");
  		$('#submit-crop-btn').prop('disabled',false);
  	}
});

function readySubmit() {
	var b64 = $('.image-editor').cropit('export', {
		  type: 'image/jpeg',
		  quality: .98,
		  originalSize: true
	});
	var b64s = b64.split("e64,");
	$('.current-image').val(b64s[1]);
}

$( ".cropit-image-preview" ).click(function() {

	var b64 = $('.image-editor').cropit('export', {
		  type: 'image/jpeg',
		  quality: .98,
		  originalSize: true
	});
	var b64s = b64.split("e64,");
	$('.current-image').val(b64s[1]);
});
$( ".cropit-image-zoom-input" ).click(function() {

	var b64 = $('.image-editor').cropit('export', {
		  type: 'image/jpeg',
		  quality: .98,
		  originalSize: true
	});

	var b64s = b64.split("ase64,");
	$('.current-image').val(b64s[1]);
});
	
function initialize(isTrue){
	
	if(isTrue){
		$(".noedit-user-info").hide();
		$("#bianji-yonghu-btn").hide();
	}else{
		$(".edit-user-info").hide();
		$("#view-yonghu-btn").hide();
	}
}

$("#bianji-yonghu-btn").click(function() {
	$(".edit-user-info").show();
	$(".noedit-user-info").hide();
	$("#view-yonghu-btn").show();
	$("#bianji-yonghu-btn").hide();
});

$("#view-yonghu-btn").click(function() {
	$(".edit-user-info").hide();
	$(".noedit-user-info").show();
	$("#view-yonghu-btn").hide();
	$("#bianji-yonghu-btn").show();
});

</script>
</html>