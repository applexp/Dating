<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "roti.__User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<% 
	String role = (String) request.getAttribute("role"); 
	String total = (String) request.getAttribute("total");
	List<__User> userList = new ArrayList<__User>();
	userList = (List <__User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>爱聚系统管理 v1.0</title>
<link rel="stylesheet" href="./../../static/css/xin/xinaiju.css">
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
/*** end settings content ***/

/*** edit list post ***/
#admin-edit-list-table{
	border-collapse: collapse;
	width:100%;
}
#admin-edit-list-table th{
	padding-bottom: 20px;
}
#admin-edit-list-table tr > td{
	padding-top: 6px;
	padding-bottom: 6px;
}
#admin-edit-list-table tr:hover{
	background-color: #aaa;
	color: white;
}
/*** end edit list post ***/

    
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

	.xin-table-td-size{
		!width: 240px;
	}
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
	.xin-table-td-size{
		width: 100px;
		!background-color: green;
	}
	#xin-frame-settings-center{
		width: 940px;
	}
	#settings-left-body{
		width: 100%;
		padding-bottom: 200px;
	}
	#settings-left-panel{
		width: 80%;
	}
	#settings-left-content{
		
	}
	#settings-right-panel{
		width: 20%;
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
	.xin-table-td-size{
		width: 100px;
	}
	
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
<div id="xin-setting-menu"><ol><%= (role.equals("1"))? "<li><a href=\"../admin/index\">系统管理</a></li>":"" %><li><a href="../yonghu/shangchuan">活动推文</a></li><li><a href="../yonghu/shezhi">账户设置</a></li><li><a href="../logout">退出</a></li></ol></div>
</div>
<div style="clear: both;"></div>


<div id="xin-frame-settings">

<div id="xin-frame-settings-center">
<div id="settings-left-panel">
<div id="settings-left-body">
<div id="settings-left-content" bumen="bianji">

<h3>所有用户列表</h3>
<div id="xin-table-login" style="!padding:10px;">
<form action="index?type=form_submit" method="post" enctype="multipart/form-data" onsubmit="readySubmit();">
<table id="admin-edit-list-table" style="width: 100%;">
<tr index="-1">
<th style="width: 2% ;text-align: left;"></th>
<th style="width: 7% ;text-align: left;">编号</th>
<th style="width: 7% ;text-align: left;">图像</th>
<th style="width: 15% ;text-align: left;">名字</th>
<th style="width: 32% ;text-align: left;">邮件地址</th>
<th style="width: 10% ;text-align: center;">角色</th>
<th style="width: 20% ;text-align: center;">创建时间</th>
<th style="width: 15% ;text-align: center;">编辑</th>
</tr>
<% 
	for(int i=0; i< userList.size(); i++){
%>
<tr index="<%= userList.get(i).getUserID() %>-<%= i %>">
<td></td>
<td style="text-align: left;"><%= userList.get(i).getUserID() %></td>
<td style="text-align: left;"><img src="https://s3.amazonaws.com/aiju-cloudfront-bucket/<%= userList.get(i).getProfileImagePath() %>" width="35px" height="35px"/></td>
<td style="text-align: left;"><%= userList.get(i).getName() %></td>
<td style="text-align: left;"><%= userList.get(i).getEmail() %></td>
<td style="text-align: center;"><%= userList.get(i).getRole() %></td>
<td style="text-align: center;"><%= userList.get(i).getCreatedDate() %></td>
<td style="text-align: center;"><a href="yonghuxinxi?bianji=0&hao=<%= userList.get(i).getUserID() %>" target="__blank"><img src="./../../media/buttonimg/view.png" width=18px height=18px /></a> 
<a href="yonghuxinxi?bianji=1&hao=<%= userList.get(i).getUserID() %>"><img src="./../../media/buttonimg/edit.png" width=18px height=18px /></a></td>
</tr>
<%	} %>
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
<li><a href="shenpiliebiao"><span class="ltc">用户活动列表</span></a></li>
<li style="cursor:default;">__________</li>
<li><a href="yonghuliebiao?i=1"><span class="xin-selected-option">用户列表</span></a></li>
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
<script type="text/javascript" src="./../../static/javascript/xin/settings/shezhi.js"></script>
<script type="text/javascript" src="./../../static/javascript/xin/xin.js"></script>
</html>