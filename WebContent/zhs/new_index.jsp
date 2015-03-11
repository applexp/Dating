<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="爱聚纽约， 纽约最大的综合性社交活动平台，内容覆盖文化生活、时尚艺术、娱乐交友等纽约城市生活的多个版块。凭借与近百家社会组织和学生团体的商业合作，为纽约的近万名华人学生和年轻白领提供最全面的线上活动咨询和交友服务。" />
<title>爱聚纽约</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link rel="icon" type="image/png" href="./../media/logo/aijulogo50.png">
<meta name="viewport" content="width=320px, initial-scale=1">
<style>
#about-body{
	width: 100%;
}
#about-header{
	width: 100%;
	height: 110px;
	!background-image: url('./../media/background/brillant.png');
	background-color: #fff;
	border-bottom: 5px solid #EBEBEB;
}
#about-event-top-nav{
	padding: 5px;
	font-size:0.8em;
	position: fixed; 
	top: 0px; 
	width: 100%;
	height: 50px;
	color: white;
	border-bottom: 1px solid #333;
	background: rgba(0,0,0,0.7);
	background-image: url('./../media/background/absurdidad.png');
	z-index: 3;
}
#about-event-top-nav span{
	position: relative;
	bottom:31px;
	left: 0px;
}
#about-event-top-nav img{
	position: relative;
	bottom:7px;
	left: 0px;
	width: 65px;
	height: 65px;
}
#about-event-lower-nav{
	float: right; 
	font-size: 10px;
	font-weight: bold;
}
#about-event-lower-nav img{
	width: 25px;
	height: 25px;
	position: relative;
	top: -33px;
	right: 10px;
}
#about-event-lower-nav span{
	position: relative;
	top: -38px;
	right: 10px;
	color: #777;
}
#popup-aijuweixinqr-frame{
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	background: rgba(0,0,0,0.8);
	z-index: 10;
	overflow: hidden;
}
#popup-aijuweixinqr-frame img{
	position: relative;
	top: 50px;
	left: 50px;
    width: 260px;
    height: 260px;
}

/** map **/
#index-event-map{
	height: 380px;
}
#popup-event-frame{
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background: rgba(0,0,0,0.7);
	z-index: 10;
	overflow: hidden;
}
#popup-event-map{
	!padding: 10px;
	width: 100%;
	height: 80%;
	position: relative;
	top: 0px;
	margin: 0 auto;
}
#popup-map-menu{
	position:relative;
	top: 80px;  /* adjust value accordingly */
	left: 10px;  /* adjust value accordingly */
	width: 40px;
	height: 60px;
	z-index: 11;
}
#popup-map-menu img{
	padding-top: 10px;
	width: 40px;
	height: 40px;
}
.popup-map-dialog{
	width: 260px;
}
#index-footer{
	position: relative;
	bottom: 0px;
	left: 0px;
}
@media only screen and (min-width: 1080px){
	#about-header{
		width: 100%;
		height: 120px;
		!background-image: url('./../media/background/brillant.png');
		
	}
	
	#about-event-top-nav{
		padding: 15px;
		font-size:1.1em;
		position: fixed; 
		top: 0px;
		left: 0px; 
		width: 100%; 
		height: 38px;
		color: white;
		!border-bottom: 1px solid #111;
		background: rgba(0,0,0,0.7);
		background-image: url('./../media/background/absurdidad.png');
	}
	#about-event-top-nav img{
		position: relative;
		bottom: 15px;
		width: 70px;
		height: 70px;
	}
	#about-event-top-nav span{
		position: relative;
		bottom: 42px;
	}
	
	/**
		map
	***/
	#index-event-map{
		height: 75vh;
	}
	#popup-event-map{
		top: 10px;
		height: 85%;
	}
	#popup-map-menu{
		position:relative;
	  	top: 80px;  /* adjust value accordingly */
	  	left: 10px;  /* adjust value accordingly */
	  	width: 40px;
	  	height: 60px;
		z-index: 11;
	}
	#popup-map-menu img{
		padding-top: 10px;
		width: 40px;
		height: 40px;
	}
	.popup-map-dialog{
		width: 460px;
	}

}
@media (max-width:980px) and (min-width: 520px) {
	
	#about-header{
		width: 100%;
		height: 120px;
		!background-image: url('./../media/background/brillant.png');
		
	}
	
	#about-event-top-nav{
		padding: 15px;
		font-size:1.0em;
		position: fixed; 
		top: 0px;
		left: 0px; 
		width: 100%; 
		height: 38px;
		color: white;
		!border-bottom: 1px solid #111;
		background: rgba(0,0,0,0.7);
		background-image: url('./../media/background/absurdidad.png');
	}
	#about-event-top-nav img{
		position: relative;
		bottom: 15px;
		width: 70px;
		height: 70px;
	}
	#about-event-top-nav span{
		position: relative;
		bottom: 42px;
	}
	
	/** map **/
	#index-event-map{
		height: 600px;
	}
	#popup-map-menu{
		position:relative;
	  	top: 80px;  /* adjust value accordingly */
	  	left: 10px;  /* adjust value accordingly */
	  	width: 40px;
	  	height: 60px;
		z-index: 11;
	}
	#popup-map-menu img{
		padding-top: 10px;
		width: 40px;
		height: 40px;
	}
	.popup-map-dialog{
		width: 340px;
	}
	
}
@media (max-width:320px) and (min-width: 520px){
	#index-event-map{
		height: 340px;
	}
	
}
</style>
</head>
<%
	String gsonArticle = (String) request.getAttribute("gsonArticle");
%>
<body id="index-body">
<div id="about-body">

<div id="about-header">
</div>

<nav id="about-event-top-nav">
<a href="index"><img src="./../media/logo/aijulogo50.png" /></a> 
<a href="index"><span class="white-text index-mobile-font middle-link-on-top-bar">主页</span></a>
<span style="color: yellow; font-weight: bold;"> &bull;</span> 
<a href="target?type=event"><span class="white-text index-mobile-font middle-link-on-top-bar">爱聚活动</span></a> 
</nav>

<div id="about-event-lower-nav" >
<a id="aijuweixin-qr" href="#"><img src="./../media/logo/aijuweixin_s.png" /><span class="index-mobile-font middle-link-on-top-bar">爱聚微信</span></a>
<span style="color: #D93F31; font-weight: bold;"> &bull;</span> 
<a href="about"><span class="index-mobile-font middle-link-on-top-bar">关于我们</span></a>
</div>
<div id="index-body-cover">
<div id="index-frame"> <!-- Frame starts -->


<section id="main-section">
<nav id="index-nav1" style="display:none;">
<ol>
<li><figure><img src="./../media/calender.jpg" width="85px" height="85px"/><figcaption class="index-icon-middle">交友活动</figcaption></figure></li>
<li><figure><img src="./../media/event.jpg"  width="85px" height="85px"/><figcaption class="index-icon-middle">婚姻活动</figcaption></figure></li>
<li><figure><img src="./../media/lover.jpg"  width="85px" height="85px"/><figcaption class="index-icon-middle">爱聚新闻</figcaption></figure></li>
</ol>
</nav>

<div id="index-map-menu" class="dropSheet">
<img id="index-map-menu-eventbtn" src="./../media/marker/menu_yellowmarker.png" />
</div>
<div id="index-event-map"></div>


</section>

</div> <!-- Frame end -->



<div id="popup-event-frame" style="display:none">
<div id="popup-map-menu" class="dropSheet">
<img id="popup-map-menu-eventbtn" src="./../media/marker/menu_yellowmarker.png" />
</div>
<div id="popup-event-map"></div>
</div>



<div id="popup-aijuweixinqr-frame" style="display:none">
<img src="./../media/logo/aijuweixin_l.png" />
</div>

<div id="borderimage"></div>
<footer id="index-footer">
<p><a href="about"><small id="index-p">关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>
</div> <!-- Body cover end -->
</div>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>

var map;

function initialize(e, which) {

	
	var markerlist;
	
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
	
	if(e == 'event'){
		markerlist = <%= gsonArticle %>
	}else if(e == 'lover'){
		markerlist = [
		               ['【爱聚推荐】9/14 NYU CSSA新学期中央公园野餐活动 ', 40.734176, -73.993751, 1, './../media/lover_maker.jpg', 'article?post=4', '新学期转眼就来，你是否也急切地想找到组织，结识小伙伴呢？  下面是NYU CSSA开学两周的活动一览，欢迎大家踊跃参与，加入我们中国留学生的大...'],
		               ['【爱聚福利】9/5 Mulberry英式下午茶＋Cara Delevingne包包预售会!', 40.745389, -73.978983, 2, './../media/lover_maker.jpg', 'article?post=3', '又是一年返校季，怎么能不go shopping？时尚人士ONLY！9月5日（星期五）4-6pm，英国顶级品牌Mulberry于其SOHO Store (134 Spring St.) 倾力...'],
		             ];
	}else{
		
		markerlist = <%= gsonArticle %>
		
	}
		
	// Create a new StyledMapType object, passing it the array of styles,
	  // as well as the name to be displayed on the map type control.
	  var styledMap = new google.maps.StyledMapType(styles,
	    {name: "Styled Map"});

	  

	  
  var mapOptions = {
    zoom: 13,
    center: new google.maps.LatLng(40.7569068, -73.9845519),
    disableDefaultUI: true,
    mapTypeControlOptions: {
	      mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
	    }
  };
  
  var mapid;
  if(which == 1)
	  mapid = "index-event-map";
  else if(which == 2)
	  mapid = "popup-event-map";
  
  //alert(mapid);
  
  map = new google.maps.Map(document.getElementById(mapid),
      mapOptions);
  
	//Associate the styled map with the MapTypeId and set it to display.
  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
  
  setMarkers(map, markerlist);

}



function setMarkers(map, locations) {
	  // Add markers to the map
	  
	var pinColor = "FCB040";
	var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|" + pinColor,
    new google.maps.Size(21, 34),
    new google.maps.Point(0,0),
    new google.maps.Point(10, 34));
	  
	  for (var i = 0; i < locations.length; i++) {
	    var event1 = locations[i];
	    var myLatLng = new google.maps.LatLng(event1[1], event1[2]);
	    
	    
	    var marker = new google.maps.Marker({
	        position: myLatLng,
	        map: map,
	        title: event1[0],
	        zIndex: event1[3],
	        icon: pinImage
	        /*
	        icon: {
	            url: event1[4],
	            Size: new google.maps.Size(50, 50) // pixels
	        }*/
	        
	    });

	    addClickListener(marker, i, event1[0], event1[5], event1[6]);

	  }
}
var infoWindowList =[];
function addClickListener(marker, num, title, link, content) {
	
	var contentString = '<div class="popup-map-dialog"><div class="marker-title" style="font-size: 16px; width: 90.5%; padding: 10px; float: left;color: #FFF;background: #D93F31;border-radius:15px 15px 0px 0px; z-index: 7;"><strong><b>'+ title +
	'</b></strong></div><div style="clear:both;height:0px;"><div  class="marker-content" style=" float:left;width:90%;padding:5px 10px;border:1px solid #ccc;border-top:none;border-radius:0px 0px 5px 5px;"><div style="float:left;color:#666;font-size:12px;font-weight:bold;margin:5px 0px;"> <div style="padding: 0px;">'+ content +
	'</div></div><div style="clear:both;height:0px;"></div><div style="float:left;line-height:18px;color:#666;font-size:13px;"></div><div style="clear:both;height:0px;"></div><a href="'+ link +'"><div style=\"background:#D93F31;float:right;color:white;padding:5px;font-size:14px;font-weight:bold;border:none;margin:5px 0px; border-radius:0px !important;\" >点击原文</div></a></div></div></div>';
	 var infowindow = new google.maps.InfoWindow({
	        content: contentString
	  });
	 
	 infoWindowList[num] = infowindow;
	 
	google.maps.event.addListener(marker, 'click', function() {
		closeAllInfoWindow();
        map.setZoom(15);
        map.setCenter(marker.getPosition());
        infowindow.open(marker.get('map'), marker);
        
      });
}

function closeAllInfoWindow(){
    for(var i=0; i<infoWindowList.length; i++){
    	infoWindowList[i].close();
    }
}

google.maps.event.addDomListener(window, 'load', initialize);


initialize('all',1); //all, map 1

</script>
<script>
$("#index-event-map").click(function(){    
	$("#index-body").css({"overflow-y":"hidden"}); 

	$("#popup-event-frame").show();
	initialize('all',2);
});
$("#popup-event-frame").click(function(e){ 
	if(e.target == this){
		$("#popup-event-frame").hide();
		$("#index-body").css({"overflow-y":"initial"}); 
		initialize('all',1);
	}
});
$("#aijuweixin-qr").click(function(e){ 
	$("#index-body").css({"overflow-y":"hidden"}); 
	
	$("#popup-aijuweixinqr-frame").fadeIn(1000);
});

$("#popup-aijuweixinqr-frame").click(function(e){ 
	if(e.target == this){
		$("#popup-aijuweixinqr-frame").fadeOut(0);
		$("#index-body").css({"overflow-y":"initial"}); 
	}
});
</script>
<script>
$("#index-map-menu-eventbtn").click(function(){    
	initialize('event',1);
});

$("#popup-map-menu-eventbtn").click(function(){    
	initialize('event',2);
});
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-21181504-3', 'auto');
  ga('send', 'pageview');

</script>
</html>