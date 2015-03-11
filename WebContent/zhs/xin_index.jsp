<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String role = (String) request.getAttribute("role"); %>
<!DOCTYPE html>
<html>
<head>
<title>爱聚纽约</title>
<meta charset="UTF-8">
<meta name="google-site-verification" content="dpFo7Bojso81ec9pIJ5sGMZNzbLqtt2ts0zfFOAh62o" >
<meta name="keywords" content="爱聚纽约,爱聚, aiju, aijunyc">
<meta name="description" content="爱聚纽约， 纽约最大的活动资讯平台，内容覆盖文化生活、时尚艺术、娱乐交友等纽约城市生活的多个版块。" >
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
<td class="td-detail-center"><a href="map">地图</a></td>
<td class="td-detail-center"><a href="target?type=event&g=a">活动</a></td>
<td class="td-detail-center"><a href="target?type=article&g=s">专题</a></td>
</tr>
</table>
</div>
</div>



<div id="xin-frame" >
<div id="xin-frame-body" class="about-padding-bottom">
<section id="xin-frame-section" >

<div id="xin-frame-body-title"><h1>这就是爱聚</h1></div>
<div id="xin-frame-body-text">
“说到社交平台，人们往往想到的是相亲、交友、而一个以纽约华裔青年团队创办的社交平台，更注重年轻一代的精神层面，举办各种公益文化活动，不仅给年轻一代提供梦想平台，也实现着自己的创业梦。”
<br /><br />
——美国中文电视记者崔菡
<br /><br />
华裔青年创业团队（美国中文电视独家采访）
<br />
<br />
<br /><br />
<div id="xin-index-img"> <video id="xin-frame-body-video" controls>
  <source src="https://s3.amazonaws.com/dating-video1/about+us.mp4" type="video/mp4">
Your browser does not support the video tag.
</video> </div>
<br /><br /><br /><br />
我们要做的是有主题有意义的东西，不只是单纯的把人聚在一起，而是要通过独具特色的社交活动，把思想，把知识，把梦想都汇聚在一起，这才是我们爱聚的目标。通过举办不同主题的社交活动，让大家能接触到各种他们感兴趣的，各行各业的人，能够有机会分享信息，交流思想。
<br /><br /><br />
<div id="xin-index-img"><img src="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/aijubanner.png" /></div>
<br /><br />
爱聚的成立源于一个简单的想法，就是和一群有趣的人一起，发现新鲜好玩的事，认识志趣相投的人。经历了两年的前期市场调研和反复内部测试后，在2014年的春天，爱聚成立了。在它的背后不只是一群有热情的年轻人，而是有一套成熟的商业运营模式，来支持着这个团队的运转以及未来的发展。从技术开发，活动策划，到公共关系维护，再到市场推广都有专业并投入的成员负责。爱聚的商业模式目前已得到了多家风险投资公司的支持和看好。
<br/>
<br/>
我们已经与近百家社会组织和学生团体建立了良好持续的合作关系，凭借着自身成熟的商业模式以及高效的团队运作，连续保持源源不断的活动资讯更新，内容涉及商业论坛，文化生活，时尚艺术，聚会交友等涵盖城市生活方方面面的活动资讯，成为纽约地区影响力最大，关注人数最多的社交活动平台。
<br /><br />
<br /><br />
<div id="xin-index-img"><a href="target?type=event&g=a"><img src="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/d1.PNG" /></a></div>
</div>
</section>
</div> <!-- end about-frame-body -->
</div>

<div id="xin-frame" >
<div id="xin-frame-body" class="about-padding-bottom">
<section id="xin-frame-section" >
<div id="xin-frame-body-title"><h1>爱聚数字</h1></div>
<div id="xin-frame-body-text">

爱聚从创立到现在的短短半年时间，共发布了260+场活动介绍及咨询，活动量和信息量在纽约的华人活动资讯平台中稳居首位。
<br /><br />
爱聚的独家采访视频在短短两天内的播放量达到2000+。
<br /><br />
爱聚是纽约首家举办大型免费派对的活动资讯平台，其独家举办的SkyRoom的免费RoofTop派对参与人数创纪录的达到300＋人，远超越所有其他平台的派对活动规模。
<br /><br />
爱聚原创撰写的中秋特辑－纽约月饼推荐的阅读量更是在短短的24小时内达到5000+，创下纽约华人活动资讯平台的的最高纪录。
<br /><br />
这个从无到有的发展过程是艰难的，成果是显著的，未来是任重道远的，而我们的努力是从未懈怠的。爱聚欢迎和纽约各大活动组织进行友好合作,有意者请发邮件至：
<br /><br />
marketing@aijunyc.com
<br /><br />
有想成为爱聚团队一分子的朋友请发送简历及自我介绍至：
<br /><br />
marketing@aijunyc.com
<br /><br />
了解更多最新资讯 扫一扫二维码关注我们:
<br /><br /><br /><br />
<div id="xin-index-img"><img src="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/aijuqr.png" /></div>
<br /><br />
</div>
</section>
</div> <!-- end about-frame-body -->
</div>

<div id="xin-lower-nav"><a href="map"><img src="./../media/buttonimg/left.png" /></a> <div style="float: right; "><a href="#dingbu"><img src="./../media/buttonimg/top.png"  /></a> <a href="target?type=event&g=a"><img src="./../media/buttonimg/right.png"  /></a></div> </div>

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
<script type="text/javascript" src="./../static/javascript/other/jsnow1.js"></script>
<script>
snowStorm.followMouse = false;snowStorm.animationInterval = 10;snowStorm.flakesMax = 80;snowStorm.snowCharacter = '•';snowStorm.flakesMaxActive = 40;
	var imgUrl = 'https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/aijubanner.png';
	var lineLink = 'http://aijunyc.com/zhs/index';
	var descContent = '爱聚纽约， 纽约最大的活动资讯平台，内容覆盖文化生活、时尚艺术、娱乐交友等纽约城市生活的多个版块';
	var shareTitle = '爱聚纽约';

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');

</script>
<script>

</script>
</html>