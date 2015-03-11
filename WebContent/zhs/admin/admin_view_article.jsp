<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "roti.__Article"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import = "roti.__Comment"%>
<!DOCTYPE html>
<%
    __Article article = new __Article();
	article = (__Article) request.getAttribute("article");
	String articlePurchaseLink = article.getPurchaseLink();
	List<__Comment> commentList = new ArrayList<__Comment>();
	commentList = (List <__Comment>) request.getAttribute("commentList");
	Collections.reverse(commentList);
	
%>
<% String role = (String) request.getAttribute("role"); 
	String userID = (String) request.getAttribute("uid");
	String user_photo_path = (String) request.getAttribute("user_photo_path");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="keywords" content="<%= article.getTitle() %>, 爱聚纽约">
<title><%= article.getTitle() %></title>
<link rel="stylesheet" type="text/css" href="./../../static/css/xin/xinaiju.css">
<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>
/** 
article
**/

/** article body **/

#xin-article-left-panel{
	width: 100%;
	color: #FF3333;
}
#xin-article-body{
	padding: 25px;
}
#xin-article-right-panel{
	display: none;
}
#xin-article-title{
	color: white;
}
#xin-article-date{
	font-size: 0.9em;
	color: white;
	padding-bottom: 40px;
}
#xin-article-location{
	font-size: 1.2em;
	background-color: #eeeeee;
	padding: 36px;
	width: 90%;
	margin: 0 auto;
	color: #D93F31;
	overflow: hidden;
}
#xin-article-text{
	font-size: 1.2em;
	background-color: #eeeeee;
	padding: 36px;
	width: 90%;
	margin: 0 auto;
	color: #D93F31;
	overflow: hidden;
}
#xin-article-text img{
	width: 100%;
}
/** end article body **/

/** reply **/
#xin-article-comment-frame{
	position:fixed;
    top:0; right:0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.8);
    overflow:hidden;
    display: none;
    
}
#xin-article-comment-body{
	width: 100%;
	height: 100%;
}
textarea{
	width: 740px;
	max-width: 740px;
}
#xin-article-comment-reply{
	padding: 8px;
	width: 100%;
	margin: 0 auto;
	background-color: #D93F31;
	border-bottom: 1px solid #D94444;
}
#xin-article-comment-reply img{
	width: 100px;
	height: 100px;
	border-radius: 15px;
}


#xin-article-comment-list{
	padding: 8px;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	background-color: #444;
	color: white;
	overflow-y: scroll;
}
xin-article-table-comment-list{
}
.xin-article-comment-name{
	padding-left: 20px;
	font-size: 1.3em;
	font-weight: bold;
	width: 100%;
}
.xin-article-comment-content{
	font-size: 1.2em;
	padding-left: 20px;
	width: 100%; 
}
.xin-article-comment-content-td{
	vertical-align: top;
	padding-right: 45px;
}
.xin-article-time-content-td{
	text-align: right;
	padding-right: 35px;
	width: auto;
	color: #bbb;
}
#xin-article-comment-list img{
	width: 100px;
	height: 100px;
	border-radius: 15px;
}
/** end reply **/
/** 
End article 
**/

/* Medium devices (desktops, 768px and up) */
@media (min-width: 768px) {

	#xin-article-comment-reply button, #xin-article-comment-reply textarea{
		background-color: white;
		color: #D93F31;
		font-size: 1.3em;
		padding: 15px;
	}
	#xin-article-comment-reply textarea{
		color: #444;
	
	}
}


/* Medium devices (desktops, 992px and up) */
@media (min-width: 992px) {

	/** article body **/
	
	#xin-article-left-panel{
		float: left;
		width: 60%;
		background-color: #fefefe;
		color: #FF3333;
		position: relative;
		left: 60px;
	}
	#xin-article-body{
		padding: 25px;
	}
	/** right block **/
	#xin-article-right-panel{
		float: right;
		width: 28%;
		display: inline;
		position: relative;
		right: 65px;
	}
	#xin-article-right-panel-block {
		margin-top: 20px;
		width: 100%;
	}
	#xin-article-right-panel-block-title{
		width: 100%;
		margin: 0 auto;
		font-size: 1.2em;
		color: white;
		font-weight: bold;
		padding-bottom: 8px;
	}
	#xin-article-right-panel-block img{
		width: 100%;
	}
	/** end right block **/
	
	#xin-article-title{
		color: #D93F31;
	}
	#xin-article-date{
		padding: 10px;
		font-size: 1em;
		color: #D93F31;
		padding-bottom: 30px;
		z-index: 4;
	}
	#xin-article-location{
		padding-top: 0px;
		padding-bottom: 0px;
		font-size: 1.0 em;
		box-shadow: 0px 0px 3px #888888;
		width: auto;
		!margin: 0 auto;
		z-index: 2;
		margin-bottom: 30px;
	}
	#xin-article-text{
		padding-top: 0px;
		padding-bottom: 0px;
		font-size: 1.0 em;
		box-shadow: 0px 0px 3px #888888;
		width: auto;
		!margin: 0 auto;
		z-index: 2;
	}
	#xin-article-text img{
		width:100%;
    	max-width:576px;
	}
	
	
	
	/** reply **/
	#xin-article-comment-reply{
		padding-top: 8px;
		width: 600px;
		margin: 0 auto;
		background-color: #D93F31;
		border-bottom: 1px solid #D94444;
	}
	#xin-article-comment-body{
		width: 620px;
		height: auto;
		margin: 0 auto;
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		padding: 10px 8px 10px 8px;
		border-radius: 15px;
		 background-color: rgba(255,255,255,0.3);
		!background-color: white;
	}
	textarea{
		width: 480px;
		max-width: 480px;
	}
	#xin-article-comment-reply img{
		width: 50px;
		height: 50px;
		border-radius: 5px;
	}
	#xin-article-comment-list{
		padding: 8px;
		width: 600px;
		height: 380px;
		margin: 0 auto;
		background-color: #444;
		color: white;
		overflow-y: scroll;
	}
	.xin-article-comment-name{
		padding-left: 20px;
		font-size: 1.1em;
		font-weight: bold;
		width: 500px;
	}
	.xin-article-comment-content{
		padding-left: 20px;
		font-size: 1.0em;
		width: 500px; 
	}
	.xin-article-comment-content-td{
		padding-right: 0px;
	}
	.xin-article-time-content-td{
		padding-right: 0px;
	}
	#xin-article-comment-list img{
		width: 50px;
		height: 50px;
		border-radius: 5px;
	}
	/** end reply **/

	/** end article body **/
	
	#xin-article-comment-reply button, #xin-article-comment-reply textarea{
		font-size: 1em;
		padding: 5px;
	}
	/** event map **/
	#index-event-map{
		width: 100%;
		height: 280px;
	}
	
}

/* Medium devices (desktops, 1200px and up) */
@media (min-width: 1200px) {

	#xin-article-left-panel{
		!float: left;
		width: 64%;
		background-color: #fefefe;
		color: #FF3333;
		position: relative;
		left: 30px;
	}
	#xin-article-body{
		padding: 25px;
	}
	/** right block **/
	#xin-article-right-panel{
		!float: right;
		width: 28%;
		display: inline;
		position: relative;
		right: 35px;
	}
	/** event map **/
	#index-event-map{
		height: 220px;
	}
	
	/** article text **/
	#xin-article-text img{
		width: 100%;
    	max-width:505px;
	}
}
/* Medium devices (desktops, 1800px and up) */
@media (min-width: 1800px) {
	/** article text **/
	#xin-article-text img{
    	max-width:645px;
	}
	
	/** event map **/
	#index-event-map{
		height: 280px;
	}
}
</style>
</head>
<body id="dingbu">
<div id="xin-body"> <!-- Frame starts -->
<div id="xin-body-cover">

<div id="xin-header">
<div id="xin-header-body">
<a href="index"><img id="xin-aiju-logo" src="./../../media/aijulogo.jpg" /></a>  

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
<img id="list-icon-btn" class="space-in-upper-icon hide-upper-link-icon" src="./../../media/buttonimg/list_open.png"  /> 
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
<div id="xin-setting-menu"><ol><%= (role.equals("1"))? "<li><a href=\"index\">系统管理</a></li>":"" %><li><a href="../yonghu/shangchuan">活动推文</a></li><li><a href="../yonghu/shezhi">账户设置</a></li><li><a href="../logout">退出</a></li></ol></div>
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
</tr>
<tr>
<td class="td-detail-center"><a href="../map">地图</a></td>
<td class="td-detail-center"><a href="../target?type=event&g=a">活动</a></td>
<td class="td-detail-center"><a href="../target?type=event&g=s">专题</a></td>
</tr>
</table>
</div>
</div>

<div id="xin-frame" >
<div id="xin-frame-body" class="about-padding-bottom">
<div id="xin-article-left-panel">
<div id="xin-article-body">
<div id="xin-article-title"><h1><%= article.getTitle() %></h1></div>
<div id="xin-article-date"><%= article.getPostDate() %> &diams; <%= article.getAuthor() %></div>
<div id="xin-article-location">

<h3>基本推文活动信息</h3><br />
<span>认证状态: </span> <select id="event-verify"><option value="0">未审查</option><option value="1">批准</option><option value="2">不通过</option></select> <br />
<span>创建时间: </span><%= article.getPostDate() %><br />
<span>更新时间: </span><%= article.getPostUpdatedDate() %><br />

<% if(article.getGeshi()==2){ %>
<h4>活动地址信息</h4><br />
<%= article.getEventPlaceName() %><br />
<%= article.getAddress() %><br />
<%= article.getCity() %>, <%= article.getState() %> <%= article.getZipcode() %><br />
<br /><br /><span>链接</span><%= article.getPurchaseLink() %>
<%} %>
<br /><br />
</div>
<div id="xin-article-text">
<%= article.getContent() %>
</div>
</div>
</div>
<div id="xin-article-right-panel"><div id="index-event-map"></div></div>
<div id="xin-article-right-panel"><div id="xin-article-right-panel-block"><div id="xin-article-right-panel-block-title"><span style="color: #5BC236; font-weight: bold;">&middot;</span>爱聚微信二维码</div><img src="http://mmbiz.qpic.cn/mmbiz/W6UfGJf1ib6hfugLibQXPcUar4wFzxeueEqWodPmP4EvocJA6ZicWzMO0B83jY5l2G2SichzK1icA3zsvTtcYYWb0sw/640" />
</div></div>
</div> <!-- end about-frame-body -->
</div>

<div style="clear: both;"></div>

<div id="xin-lower-nav"><div style="float: left; "><ol><li><a href="target?type=event&g=a"><span>活动</span></a> </li><%= (!article.getPurchaseLink().equals("n"))? "<li><span style=\"color: yellow; font-weight: bold;\">&middot;</span> <a href=\""+ articlePurchaseLink +"\" target=\"_blank\"><span>购票</span></a> </li>": "" %></ol></div>
<div style="float: right; ">
<ol>
<li><a id="dingbu-lower-nav" href="#dingbu"><span>返回顶部</span></a> <span style="color: yellow; font-weight: bold;">&middot;</span></li> 
<li><a id="popup-reply-box" href=""><span>留言</span></a></li>
</ol>
</div>
 </div>

<div id="xin-borderimage"></div>
<footer id="xin-footer">
<p>爱聚纽约 &middot; 版权所有  © 2014-2015</p>
</footer>


<div id="xin-article-comment-frame" >
<div id="xin-article-comment-body" style="z-index: 9;">
<div id="xin-article-comment-reply">
<form action="article" method="post" >
<table>
<tr>
<td style="vertical-align: top; padding-top: 8px;"><img src="https://s3.amazonaws.com/aiju-cloudfront-bucket/<%= (userID.equals("-1"))? "default_image/aijulogo.jpg": user_photo_path+"" %>" /></td>
<td>
<table>
<tr><td style="vertical-align: top; padding-left: 20px;"><textarea id="xin-article-reply-textarea" rows="3" cols="50" placeholder="发表评论" <%= (userID.equals("-1"))? "disabled=\"disabled\"": ""%> ></textarea></td></tr>
<tr><td style="text-align: right;"><input id="userid" name="userid" type="hidden" value="<%= userID %>"><input id="postid" name="userid" type="hidden" value="<%= article.getPostID() %>"><%= (userID.equals("-1"))? "<button type=\"button\" id=\"login-post-article-comment-btn\" style=\"width: auto;\">登录发表意见</button>":"<button type=\"button\" id=\"post-article-comment-btn\" style=\"width: auto;\">发表意见</button>" %></td></tr>
</table>
</td>
</tr>
</table>
</form>
</div>

<div id="xin-article-comment-list">
<table id="xin-article-table-comment-list" >
<% 

	if(commentList.size() != 0){
		for(int i=0;i< commentList.size(); i++){
		%>
		<tr>
			<td style="vertical-align: top; padding-top: 8px;"><img src="<%= commentList.get(i).getUserPic() %>" /></td>
			<td>
			<table>
			<tr><td style="vertical-align: top;"><div class="xin-article-comment-name"><%= commentList.get(i).getUsername() %></div></td></tr>
			<tr><td class="xin-article-comment-content-td"><div class="xin-article-comment-content" ><%= commentList.get(i).getComment() %></div></td></tr>
			<tr><td class="xin-article-time-content-td"><small><%= commentList.get(i).getCommentTime() %></small></td></tr>
			</table>
			</td>
		</tr>
<%		}
	}
%>

</table>
</div>
</div>
</div>

</div>
</div> <!-- Frame ends -->
</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="./../../static/javascript/wechat/custom_link.js"></script>
<script type="text/javascript" src="./../../static/javascript/xin/xin.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
	$("#event-verify option[value='<%= article.getVerify() %>']").attr("selected","selected");
	$("#event-verify").change(function(){
		var value = $( "#event-verify" ).val();
		var pid = '<%= article.getPostID() %>';
		
		$.post('kan',{value:value,postid:pid},function(data) {
			alert('认证更新成功');
		},"Json");
	});

	var imgUrl = '<%= article.getCoverImage() %>';
	var lineLink = 'http://www.aijunyc.com/zhs/article?post=<%= article.getPostID() %>';
	var descContent = '<%= (article.getShortDesc() == null || article.getShortDesc() == "")? "爱聚纽约， 纽约最大的活动资讯平台，内容覆盖文化生活、时尚艺术、娱乐交友等纽约城市生活的多个版块。":article.getShortDesc()+"" %>';
	var shareTitle = '<%= article.getTitle() %>';
	
	
	function initialize(){
		
		var styles = [
		              {
		                featureType: "road.arterial",
		                elementType: "geometry",
		                stylers: [
		                  { hue: "#FF3300" },
		                  { saturation: 50 }
		                ]
		              },{
		                featureType: "poi",
		                elementType: "labels",
		                stylers: [
		                  { visibility: "off" }
		                ]
		              },{
		                    featureType: "road.highway",
		                    stylers: [
		                      {  hue: "#009A31" },
		                    	  { saturation: -80 }
		                    ]
		              },{
		                    featureType: "poi.park",
		                    stylers: [
		                      {  hue: "#CEFFCE" },
		                	  { saturation: -60 }
		                    ]
		              },{
		                    featureType: "water",
		                    stylers: [
		                      {  hue: "#CFD6DE" },
		                	  { saturation: -60 }
		                    ]
		              },{
		                    featureType: "landscape.natural.terrain",
		                    stylers: [
		                      {  hue: "#CEFFCE" },
		                	  { saturation: -60 }
		                    ]
		              },{
		                    featureType: "administrative",
		                    elementType: "labels",
		                    stylers: [
		                      { visibility: "off" }
		                    ]
		                  },
		            ];
  
		var evenlatlng = new google.maps.LatLng(<%= article.getLat() %>,<%= article.getLong() %>);
				  
		// Create a new StyledMapType object, passing it the array of styles,
		// as well as the name to be displayed on the map type control.
		var styledMap = new google.maps.StyledMapType(styles,
		    {name: "Styled Map"});
		
		var mapProp = {
				zoom: 15,
			    center: evenlatlng,
			    disableDefaultUI: true,
			    mapTypeControlOptions: {
				      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
				    }
		  };
		
		var map=new google.maps.Map(document.getElementById("index-event-map"),mapProp);
		
		
		
			//Associate the styled map with the MapTypeId and set it to display.
		  map.mapTypes.set('map_style', styledMap);
		  map.setMapTypeId('map_style');
		  
		// To add the marker to the map, use the 'map' property
			 var marker = new google.maps.Marker({
			    position: evenlatlng,
			    title:"Here"
		 });
		
		  if(evenlatlng != "(40.7569068, -73.98455189999999)"){
			// To add the marker to the map, call setMap();
			  marker.setMap(map);
				
		  }
		
		
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);

</script>
</html>