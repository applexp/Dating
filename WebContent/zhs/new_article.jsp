<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "roti.__Article"%>
<%
    __Article article = new __Article();
	article = (__Article) request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title><%= article.getTitle() %></title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link rel="icon" type="image/png" href="./../media/logo/aijulogo50.png">
<style>
#about-header{

	height: 91px;
	!background-image: url('./../media/background/brillant.png');
	background-color: white;
}

@media (max-width:1080px) and (min-width: 520px) {

	#about-header{

		height: 11em;
		!background-image: url('./../media/background/brillant.png');
		background-color: white;
	}
}
</style>
</head>
<body id="index-body">
<div id="about-body"> <!-- Frame starts -->

<div id="about-header">
</div>

<div id="index-body-cover">
<div id="target-frame"> <!-- Frame starts -->
<nav id="main-event-top-nav"><a href="index"><img src="./../media/logo/aijulogo50.png" /></a> <a href="index"><span class="white-text index-mobile-font middle-link-on-top-bar"> 主页</span></a> <span style="color: yellow; font-weight: bold;"> &bull;</span> <a  href="target?type=event"><span class="white-text index-mobile-font  middle-link-on-top-bar">爱聚活动</span></a> </a>
</nav>


<section id="main-event-list-section">
<div id="main-event-list-frame">

<div id="main-event-list-title"><%= article.getTitle() %></div>
<div id="main-event-list-date"><%= article.getPostDate() %> &diams; <%= article.getAuthor() %></div>
<div  id="main-event-list-detail"><br />
<span id="article-content"><%= article.getContent() %></span>
</div>
<div id="main-event-list-picture">
</div>

</div>
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