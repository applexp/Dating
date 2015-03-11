<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<meta name="viewport" content="width=320px, initial-scale=1">
<title>爱聚地图</title>
<link rel="stylesheet" type="text/css" href="./../static/css/xin/xinaiju1.css">
<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>
html, body
{
	font-family: "SimSun";
	width: 100%;
	margin: 0px;
	background-color: #D93F31;
	color: #333;
}	

#xin-body{
	margin-top: 6px;
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

/** header portion **/
#xin-header{
	height: 40px;
	background-image: url('./../media/background/brillant.png');
	border-top: 1px solid #eee;
	border-bottom: 5px solid #f6f6f6;
}
#xin-header-body{
	margin-bottom: -50px;
}
#xin-header-body img{
	margin-top: -3px;
	width: 50px;
	height: 50px;
	
}
/** end header portion **/



/** nav **/
#xin-upper-nav{
	display: none;
}
#xin-upper-nav-div-icon img{
	float: right;
	position: relative;
	right: 12px;
	top: 5px;
	width: 20px;
	height: 20px;
	display: none;
}
#xin-lower-nav{
	position: fixed; 
    bottom: 0;
    background-color: rgba(0,0,0,0.8);
    width: 100%;
    height: 50px;
    z-index: 9999;
}
#xin-lower-nav img{
	width:50px;
}

/** content **/
#xin-frame{
	!padding-bottom: 30px;
	background-color: #999999;
}

/** event map **/
#index-event-map{
	width: 100%;
	height: 100vh;
	overflow: hidden;
}

#index-map-menu{
  	background: rgba(0,0,0,0.7); 
	z-index: 2;
}
#index-map-menu img{
	background-color: #444;
	border-right: 1px solid #555;
	width: 25px;
    height: 25px;
	padding: 8px;
	display: block;
	
}
#index-map-menu img:hover{
	background: #000; 
    background: rgba(0,0,0,0.7); 
    !border-radius: 18px 18px 18px 18px;
}
.dropSheet
{
   background: #000; 
   background: rgba(0,0,0,0.6); 
   !border-radius: 18px 18px 18px 18px;
}
/** end event map **/

.popup-map-dialog{
	width: 240px;
}

/* Small devices (tablets, 768px and up) */
@media (min-width: 768px) {
	.popup-map-dialog{
		width: 340px;
	}
}
@media (min-width: 992px) {
	.popup-map-dialog{
		width: 440px;
	}
}
</style>
</head>
<%
	String gsonArticle = (String) request.getAttribute("gsonArticle");
%>
<body id="dingbu">
<div id="xin-body"> <!-- Frame starts -->

<div id="xin-header">
<div id="xin-header-body">
<a href="index"><img src="./../media/aijulogo.jpg" /></a>  
</div>
<div id="xin-upper-nav-div-icon" ><img id="list-icon-btn" src="./../media/buttonimg/list.png"  /></div>
</div>
<div style="clear: both;"></div>

<div id="xin-frame">
<div id="index-map-menu" class="dropSheet">
<img id="index-map-menu-eventbtn" src="./../media/marker/menu_yellowmarker.png" />
</div>
<div style="clear: both;"></div>
<div id="index-event-map"></div>
</div>

<div id="xin-lower-nav"><a href="target?type=event&g=a"><img src="./../media/buttonimg/left.png" /></a> <div style="float: right; "> <a href="index"><img src="./../media/buttonimg/right.png"  /></a></div> </div>


</div> <!-- xin body ends -->
</body>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="./../static/javascript/xin/xin.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvFc-k0Obrpu06gT312NL0jb2U8j3Atws"></script>
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