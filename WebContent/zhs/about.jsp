<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>关于我们</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="icon" type="image/png" href="./../media/logo/aijulogo50.png">
<style>
#about-body{
	font-family: "SimSun";
	margin-top: 30px;
	color: #333;
}
#about-header{

	height: 180px;
	background-image: url('./../media/background/brillant.png');
	border-top: 1px solid #eee;
	border-bottom: 10px solid #fafafa;
	text-align: center;
}
#about-logo{
	position: relative;
	top: -10px;
	width: 50px;
	height: auto;
}
#about-frame{
	
	background-color: white;
}
.about-padding-bottom{
	padding-bottom: 60px;
}
#about-frame-body{
	padding: 20px;
	max-width: 1080px;
	margin: 0 auto;
	!padding-top: 100px;
	!padding-bottom: 100px;
}
#about-frame-section{
	margin-bottom: 80px;
}
#about-frame-break1{
	display:none;
}
#about-frame-body-video{
	width: 100%;
}
#about-frame-body-title{
	width: 60%;
}
#about-frame-body-text{
	color: #666;
	padding: 8px;
	padding-left: 20px;
	padding-right: 20px;
}

@media (min-width: 1080px) {

	#about-frame-break1{
		display:block;
		width: 100%;
		height: 450px;
		background-image: url('./../media/background/break-img-1.JPG');
		background-position: 0 0px;
		background-size: 100%;
		background-repeat: no-repeat;
	    background-attachment: fixed;
	    
	}
	#about-frame-body-video{
		 width:520px;
		 height:340px;
	}
	#index-footer{
	
		padding-top: 160px;
		padding-bottom: 50px;
		!margin-left: -8px;
		margin-bottom: -50px;
		!padding-right: 16px;
		width: 100%;
		color: #ccc;
		font-size: 16px;
		font-weight: bold;
		!background-color: rgba(0,0,0,0.8);
		background-color: black;
	}
	#index-p{
		
		color: #eee;
		font-size: 16px;
		font-weight: bold;
	}
	#borderimage{
		background-image:url('./../media/bottomborder.jpg');
	    width: 100%;
		height: 550px;
	}
}

@media (max-width:1080px) and (min-width: 520px) {

	#about-frame-body-title{
		font-size: 2.5em;
	}
	#about-frame-body-text{
		font-size: 2.2em;
	}
}


</style>
</head>
<body>
<div id="about-body"> <!-- Frame starts -->

<div id="about-header">
<a id="about-logo" href="index"><img src="./../media/aijulogo.jpg" /></a>
</div>

<div id="about-frame" style="padding-top: 100px;">
<div id="about-frame-body">
<section id="about-frame-section">
<div id="about-frame-body-title"><h1>关于爱聚</h1></div>
<div id="about-frame-body-text">爱聚纽约， 纽约最大的综合性社交活动平台，内容覆盖文化生活、时尚艺术、娱乐交友等纽约城市生活的多个版块。凭借与近百家社会组织和学生团体的商业合作，为纽约的近万名华人学生和年轻白领提供最全面的线上活动咨询和交友服务。</div>
</section>
</div> <!-- end about-frame-body -->
</div>


<div id="about-frame-break1">
</div>

<div id="about-frame" class="about-padding-bottom">
<div id="about-frame-body">
<section id="about-frame-section1">
<div id="about-frame-body-title"><h1>媒体报道</h1></div>
<div id="about-frame-body-text">
<h3>美国中文网采访 (Sino VisionNet)</h3>
 <video id="about-frame-body-video" controls>
  <source src="https://s3.amazonaws.com/dating-video1/about+us.mp4" type="video/mp4">
Your browser does not support the video tag.
</video> 

<br />
<br />
说到华人社交平台，人们往往想到的是相亲、交友，而一个以纽约华裔青年创业团队创办的社交平台，更注重年轻一代的精神层面，举办各种公益文化活动，不仅给年轻一代提供梦想平台，也实现着自己的创业梦，一起来看看他们的创业故事。<a href="http://video.sinovision.net/?id=24207&cid=112">（美国中文网 崔菡）</a>
</div>
</section>
</div> <!-- end about-frame-body -->
</div>

<div id="borderimage"></div>
<footer id="index-footer">
<p><a href="about"><small id="index-p">关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->
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