<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link rel="icon" type="image/png" href="#">
</head>
<body id="index-body">
<div id="target-frame"> <!-- Frame starts -->

<div id="index-logo" >
<a href="index"><img src="./../media/aijulogo.jpg" /></a>
</div>


<section id="main-section">
<nav id="index-nav-new" >
<ol>
<li><img src="./../media/calender.jpg" width="60px" height="60px"/><span class="white-text index-mobile-font">活动日期</span></li>
<li><a  href="target?type=event"><img src="./../media/event.jpg"  width="60px" height="60px"/><span class="white-text index-mobile-font">爱聚活动</span></a></li>
</ol>
</nav>
</section>

<section id="main-event-list-section">
<div id="main-event-list-frame">

<div id="main-event-list-title">【爱聚推荐】9/14 NYU CSSA新学期中央公园野餐活动 </div>
<div id="main-event-list-date">9月14号 &diams; 爱聚</div>
<div  id="main-event-list-detail"><br />
<span>9月14日星期日10:00-16:00，人见人爱的CSSA工作人员们将带领18组小队从NYU御花园Washington Square Park出发前往纽约城市绿洲Central Park野餐。沿途会玩些破冰游戏，介绍学校周边好去处，并采购野餐美食，共度美好周日～ 本次活动完全免费，无需门票。但是也请每位确认参与活动的同学当天携带现金或信用卡以便购买自己心水的野餐材料。: )</span><br />
<br />
<a href="article?post=4">... [继续阅读]</a>
</div>
<div id="main-event-list-picture">
<table>
<tr>
<td><img src="http://mmbiz.qpic.cn/mmbiz/LhibOHNd1iaDlB5NuLia9NmjArg1MqvHuvAsBJ5Gyiac157eliaw6ImYOk3CPtWA2P6v1f6bKRuSnySib6Y0Xic7HzOnA/0" width="100%"></td>
</tr>
</table>
</div>
<hr />




<div id="main-event-list-title"> 【爱聚福利】9/5 Mulberry英式下午茶＋Cara Delevingne包包预售会! </div>
<div id="main-event-list-date">9月5号 &diams; 爱聚</div>
<div  id="main-event-list-detail"><br />
<span>了 解知识产权和知识产权保护对于每个有想法有主意的人都至关重要，不论是一项发明，一个品牌名称，还是任何一种创意作品。SSMP律师事务所的合伙人朱小纯 博士将带你熟悉不同类型的知识产权，包括行业秘密，商标，版权，和专利等概念，以及这些权利的基本构成内容。朱博士还会就专利保护话题展开讨论，并介绍美 国专利法的最新发展，包括近期美国最高法院的一些裁决。</span><br />
<br />
<a href="article?post=3">... [继续阅读]</a>
</div>
<div id="main-event-list-picture">
<table>
<tr>
<td><img src="http://mmbiz.qpic.cn/mmbiz/LhibOHNd1iaDlB5NuLia9NmjArg1MqvHuvAy8uI4O7bqdIZjmJBW861MZl6LJESHsTVY7Dk91gqsFyWPN9l1qPaibg/640" width="100%"></td>
</tr>
</table>
</div>


</div>
</section>




</div> <!-- Frame ends -->

<footer id="index-footer">
<p><a href="about"><small id="index-p">关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>

var map;
function initialize() {
  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(40.7389068, -73.9965519),
    disableDefaultUI: true
  };
  map = new google.maps.Map(document.getElementById('index-event-map'),
      mapOptions);
  
  setMarkers(map, events);

}

var events = [
               ['DOB',40.727078, -73.983835, 1, './../media/event_maker.jpg'],
               ['Gotham Bar & Grill', 40.734176, -73.993751, 2, './../media/lover_maker.jpg'],
               ['Lincoln Center for the Performing Arts', 40.772437, -73.983534, 3, './../media/event_maker.jpg'],
               ['Cask Bar and Kitchen', 40.745389, -73.978983, 4, './../media/lover_maker.jpg'],
               ['Bill\'s Bar & Burger', 40.740266, -74.005601, 5, './../media/event_maker.jpg']
             ];

function setMarkers(map, locations) {
	  // Add markers to the map

	  for (var i = 0; i < locations.length; i++) {
	    var event1 = locations[i];
	    var myLatLng = new google.maps.LatLng(event1[1], event1[2]);
	    
	    
	    
	    var marker = new google.maps.Marker({
	        position: myLatLng,
	        map: map,
	        title: event1[0],
	        zIndex: event1[3],
	        icon: event1[4]
	    });

	   
	    
	    addClickListener(marker, i, event1[0]);

	    
	    
	    

	  }
}

function addClickListener(marker, num, title) {
	
	var contentString = '<div style="width: 94.2%; padding-left:10px; height: 25px;float: left;color: #FFF;background: #D93F31;line-height: 25px;border-radius:5px 5px 0px 0px;"><strong><b>"You feild"</b></strong></div><div style="clear:both;height:0px;"><div style="float:left;width:90%;padding:5px 10px;border:1px solid #ccc;border-top:none;border-radius:0px 0px 5px 5px;"><div style="float:left;color:#666;font-size:18px;font-weight:bold;margin:5px 0px;"> <div style="padding: 0px;">]]..product_list[i].category..[[</div></div><div style="clear:both;height:0px;"></div><div style="float:left;line-height:18px;color:#666;font-size:13px;">"You feild"</div><div style="clear:both;height:0px;"></div><form action=\"navigat:"You feild"\"><input type=\"submit\"/ style=\"background:#7e7e7e;float:right;color:#FFF;padding:5px 7px;font-size:10px;font-weight:bold;border:none;margin:5px 0px; border-radius:0px !important;\" value=\"More Info\" ></form></div></div>';
	 var infowindow = new google.maps.InfoWindow({
	        content: contentString
	  });
	 
	google.maps.event.addListener(marker, 'click', function() {
    	
        map.setZoom(17);
        map.setCenter(marker.getPosition());
        infowindow.open(marker.get('map'), marker);
      });
}

google.maps.event.addDomListener(window, 'load', initialize);


initialize();
</script>

 <script>
$(function() {
	$( "#from" ).datepicker({
		defaultDate: "+1w",
		changeMonth: true,
		numberOfMonths: 3,
		onClose: function( selectedDate ) {
		$( "#to" ).datepicker( "option", "minDate", selectedDate );
		}
	});
	$( "#to" ).datepicker({
		defaultDate: "+1w",
		changeMonth: true,
		numberOfMonths: 3,
		onClose: function( selectedDate ) {
		$( "#from" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});
</script>
</html>