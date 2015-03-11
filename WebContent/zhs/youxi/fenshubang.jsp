<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String role = (String) request.getAttribute("role"); %>
<!DOCTYPE html>
<html ng-app="paimingApp">
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>爱聚万圣节活动列表</title>
<link rel="stylesheet" type="text/css" href="./../../static/css/xin/xinaiju.css">
<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>
li{
display:inline; 
}
#xin-event-ws-ol{
	margin-left: -30px;
}
#xin-event-ws-ol li{
	font-size: 1.3em;
	padding: 8px;
	display: inline;
	padding-left: 30px;
	cursor: pointer;
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
<img id="list-icon-game-btn" class="space-in-upper-icon hide-upper-link-icon" src="./../../media/buttonimg/list_open.png"  /> 
<%	if(!role.equals("0")){ %>
<a id="xin-setting-btn" href="#"><img  class="space-in-upper-icon show-upper-link-icon" src="./../../media/buttonimg/settings.png"  /></a>
<%	}else{ %>
<a href="../login"><img  class="space-in-upper-icon show-upper-link-icon" src="./../../media/buttonimg/login.png"  /></a>
<%	} %>
</td>
</tr>
</table>

</div>
</div>

<div style="clear: both;"></div>
<div id="xin-setting-frame">
<div id="xin-setting-menu"><ol><%= (role.equals("1"))? "<li><a href=\"../admin/index\">系统管理</a></li>":"" %><li><a href="../yonghu/shezhi">账户设置</a></li><li><a href="../logout">退出</a></li></ol></div>
</div>
<div style="clear: both;"></div>

<div id="xin-frame" >
<div class="xin-frame-icon-menu" >
<table id="xin-table-menu" >
<tr>
<td class="td-detail-center">
  <a href="../map"><img class="td-image-size" src="./../../media/buttonimg/map.png" /></a>
</td>
<td class="td-detail-center">
  <a href="../target?type=event&g=a"><img class="td-image-size" src="./../../media/buttonimg/activity.png" /></a>
</td>
<td class="td-detail-center">
  <a href="../target?type=event&g=s"><img class="td-image-size" src="./../../media/buttonimg/news.png" /></a>
</td>

<td class="td-detail-center">
  <a href="../target?type=event&g=wansheng"><img class="td-image-size" src="./../../media/buttonimg/wanshengbtn.png" /></a>
</td>
</tr>
<tr>
<td class="td-detail-center"><a href="../map">爱聚地图</a></td>
<td class="td-detail-center"><a href="../target?type=event&g=a"><%= (request.getAttribute("g").equals("a"))?"<span class=\"xin-selected-option\">爱聚活动</span>":"爱聚活动" %></a></td>
<td class="td-detail-center"><a href="../target?type=event&g=s"><%= (request.getAttribute("g").equals("s"))?"<span class=\"xin-selected-option\">爱聚专题</span>":"爱聚专题" %></a></td>
<td class="td-detail-center"><a href="../target?type=event&g=wansheng"><%= (request.getAttribute("g").equals("wansheng"))?"<span class=\"xin-selected-option\">爱聚万圣活动</span>":"爱聚万圣活动" %></a></td>
</tr>
</table>
</div>
</div>



<div id="xin-frame" ng-controller="paimingCtrl" >
<div id="xin-frame-body" class="about-padding-bottom" ><section id="xin-frame-section" style="width: 95%; margin:0 auto; font-size: 1.2em; padding-left: 0px; padding-right: 0px; padding-top: 36px; color: white; background-color: rgba(0,0,0,0.7); border-radius: 25px;  box-shadow: 0px 0px 8px #222;"><div id="xin-event-time-bar"><ol id="xin-event-ws-ol" ><li value="0"><a href="../target?type=event&g=wansheng"><span style="color: white;">爱聚万圣节活动列表</span></a></li><li value="1"><a href="wansheng_fenshu"><span class="xin-selected-option">打魔鬼游戏排名</span></a></li></ol></div><div style="margin-left: 60px;"><h1>打魔鬼游戏排名</h1></div><table style="width: 100%; padding-left: 80px;"><tr style="padding-bottom: 50px; font-size:1.2em;"><th >排名前(10)</th><th>游戏编号</th><th>分数</th><th>时间<small>（秒）</small></th></tr><tr ng-repeat="td in ps"><td style="width: 10%;text-align: center;"><span ng-bind="td.paiming"></span></td><td style="width: 40%;text-align: center;"><span ng-bind="td.haoma"></span></td><td style="width: 25%;text-align: center;"><span ng-bind="td.fenshu"></span></td><td style="width: 25%;text-align: center;"><span ng-bind="td.game_time"></span></td></tr></table></section>
</div> <!-- end about-frame-body -->
</div>

<div id="xin-lower-nav"><a href="../index"><img src="./../../media/buttonimg/left.png" /></a> <div style="float: right; "><a href="#dingbu"><img src="./../../media/buttonimg/top.png"  /></a> </div> </div>

<div id="xin-borderimage"></div>
<footer id="xin-footer">
<p>爱聚纽约 &middot; 版权所有  © 2014</p>
</footer>

</div>
</div> <!-- xin body ends -->
</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
<script type="text/javascript" src="./../../static/javascript/xin/xin.js"></script>
<script src="./../../static/javascript/youxi/paimingApp.js"></script>
<script>app.factory('ppsService', function(){return{pss: <%= request.getAttribute("top100") %>};});</script>
<script src="./../../static/javascript/youxi/paimingCtrl.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');
  

</script>
</html>