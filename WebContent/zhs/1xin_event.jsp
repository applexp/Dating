<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "roti.__Article"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>爱聚活动</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link rel="icon" type="image/png" href="./../media/logo/aijulogo50.png">
<style>
#about-body{
	width: 100%;
}
#about-header{
	width: 100%;
	height: 91px;
	!background-image: url('./../media/background/brillant.png');
	background-color: #eee;
}

@media (max-width:1080px) and (min-width: 520px) {
	#about-body{
		width: 100%;
	}
	#about-header{
		width: 100%;
		height: 11em;
		!background-image: url('./../media/background/brillant.png');
		background-color: #eee;
	}
}
</style>
</head>
<%
	List<__Article> articleList = new ArrayList<__Article>();
	articleList = (List <__Article>) request.getAttribute("articleList");
%>
<body id="index-body">
<div id="about-body">

<div id="about-header">
</div>

<div id="index-body-cover">
<div id="target-frame"> <!-- Frame starts -->

<div id="index-logo" style="display:none;">
<a href="index"><img src="./../media/aijulogo.jpg" /></a>
</div>



<section id="main-section" style="display:none;">
<nav id="index-nav-new" >
<ol>
<li><a  href="target?type=event"><img src="./../media/event.jpg"  width="60px" height="60px"/><span class="white-text index-mobile-font">爱聚活动</span></a></li>
</ol>
</nav>
</section>

<nav id="main-event-top-nav">
<a href="index"><img src="./../media/logo/aijulogo50.png" /></a> 
<a href="index"><span class="white-text index-mobile-font middle-link-on-top-bar"> 主页</span></a> 
</nav>

<section id="main-event-grid-section">
<% 
	for(int i= 0; i < articleList.size(); i++){
%>

<div id="main-event-grid-div">
<div id="main-event-grid-img-frame"><a href="article?post=<%= articleList.get(i).getPostID() %>" >
<img class="main-event-grid-img" src="<%= articleList.get(i).getCoverImage() %>"  />
</a></div><div class="main-event-grid-frame"><a href="article?post=<%= articleList.get(i).getPostID() %>" ><span class="main-event-grid-title"><%= articleList.get(i).getTitle() %></span></a></div></div>
<%} %>

</section>

</div> <!-- Frame ends -->

<div id="borderimage"></div>
<footer id="index-footer">
<p>爱聚纽约 &middot; <small>版权所有  © 2014</small></p>
</footer>
</div>
</div>
</body>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');

</script>
</html>