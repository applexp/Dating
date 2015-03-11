<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String role = (String) request.getAttribute("role"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>爱聚活动</title>
<link rel="stylesheet" type="text/css" href="./../static/css/xin/xinaiju.css">
<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
</head>
<body id="dingbu">
<div id="xin-body"> <!-- Frame starts -->
<div id="xin-body-cover">

<div id="xin-header">
<div id="xin-header-body">
<a href="index"><img id="xin-aiju-logo" src="./../media/aijulogo.jpg" /></a>  

<table id="xin-upper-nav-table">
<tr class="xin-upper-nav-vertical-top">
<td class="xin-upper-nav-row-gap">

</td>
<td class="xin-upper-nav-row-gap">
<%	if(role.equals("0")){ %>
Welcome!
<%	}else if(role.equals("1")){ %>
管理员, <%= request.getAttribute("sname") %>
<%	}else if(role.equals("2")){ %>
你好, <%= request.getAttribute("sname") %>
<%	} %>
</td>
</tr>

<tr>
<td colspan="2" style="text-align: right;">
<img id="list-icon-btn" class="space-in-upper-icon hide-upper-link-icon" src="./../media/buttonimg/list_open.png"  /> 
<%	if(!role.equals("0")){ %>
<a id="xin-setting-btn" href="#"><img  class="space-in-upper-icon show-upper-link-icon" src="./../media/buttonimg/settings.png"  /></a>
<%	}else{ %>
<a href="login"><img  class="space-in-upper-icon show-upper-link-icon" src="./../media/buttonimg/login.png"  /></a>
<%	} %>
</td>
</tr>
</table>

</div>
</div>

<div style="clear: both;"></div>
<div id="xin-setting-frame">
<div id="xin-setting-menu"><ol><%= (role.equals("1"))? "<li><a href=\"admin/index\">系统管理</a></li>":"" %><li><a href="yonghu/shangchuan">活动推文</a></li><li><a href="yonghu/shezhi">账户设置</a></li><li><a href="logout">退出</a></li></ol></div>
</div>
<div style="clear: both;"></div>

<div id="xin-frame" >
<div class="xin-frame-icon-menu" >
<table id="xin-table-menu" >
<tr>
<td class="td-detail-center">
  <a href="map"><img class="td-image-size" src="./../media/buttonimg/map.png" /></a>
</td>
<td class="td-detail-center">
  <a href="target?type=event&g=a"><img class="td-image-size" src="./../media/buttonimg/activity.png" /></a>
</td>
<td class="td-detail-center">
  <a href="target?type=article&g=s"><img class="td-image-size" src="./../media/buttonimg/news.png" /></a>
</td>

</tr>
<tr>
<td class="td-detail-center"><a href="map">爱聚地图</a></td>
<td class="td-detail-center"><a href="target?type=event&g=a"><%= (request.getAttribute("g").equals("a"))?"<span class=\"xin-selected-option\">爱聚活动</span>":"爱聚活动" %></a></td>
<td class="td-detail-center"><a href="target?type=article&g=s"><%= (request.getAttribute("g").equals("s"))?"<span class=\"xin-selected-option\">爱聚专题</span>":"爱聚专题" %></a></td>
</tr>
</table>
</div>
</div>

<div id="xin-frame">
<div id="xin-frame-body" class="about-padding-bottom" >
<section id="xin-frame-section" style="padding-left: 0px; padding-right: 0px; padding-top: 36px;">
<div id="xin-event-time-bar"><ol id="xin-event-time-ol"><li value="0" onclick="xx(0)">今天</li> <li value="1" onclick="xx(1)">明天</li> <li value="2" onclick="xx(2)">本周</li> <li value="3"  onclick="xx(3)"><span class="xin-selected-option">本月</span></li> <li value="4" onclick="xx(4)">全部</li> <li value="5" onclick="xx(5)">前期活动</li></ol></div>

<table id="xin-event-inner-table"></table>

</section>
</div> <!-- end about-frame-body -->
</div>

<div id="xin-lower-nav"><a href="index"><img src="./../media/buttonimg/left.png" /></a> <div style="float: right; "><a href="#dingbu"><img src="./../media/buttonimg/top.png"  /></a> </div> </div>

<div id="xin-borderimage"></div>
<footer id="xin-footer">
<p>爱聚纽约 &middot; 版权所有  © 2014-2015</p>
</footer>

</div>
</div> <!-- xin body ends -->
</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="./../static/javascript/wechat/custom_link.js"></script>
<script type="text/javascript" src="./../static/javascript/xin/xin.js"></script>
<script type="text/javascript" src="./../static/javascript/other/date.js"></script>
<script>

var c = 0;
var arts = <%= request.getAttribute("gsonArticle") %>;
var jl = '<%= request.getAttribute("jiele") %>';
var g = '<%= request.getAttribute("g") %>';
$(document).ready(function(){

	var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;var height = (window.innerHeight > 0) ? window.innerHeight : screen.height;
	
	if(width >= 992){c=3;}else{c=1;}
	
	if(g == 'food')
		ini(4);
	else
		ini(3);
});
function ini(opt){
	jXiaowei(arts,jl,c,opt);
}
function xx(opt){
	jXiaowei(arts,jl,c,opt);
}
</script>
<script>
	var imgUrl = 'https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/d1.PNG';
	var lineLink = 'http://aijunyc.com/zhs/target?type=event&g=a';
	var descContent = '爱聚纽约， 纽约最大的活动资讯平台，内容覆盖文化生活、时尚艺术、娱乐交友等纽约城市生活的多个版块';
	var shareTitle = '爱聚活动';

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');

</script>
</html>