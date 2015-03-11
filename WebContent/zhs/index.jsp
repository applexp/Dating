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

<body>
<div id="frame"> <!-- Frame starts -->

<div id="header">
	<nav id="language-bar"><ol><li><a href="#"><span class="highlight">简体</span></a></li></ol></nav>
	<nav id="login-bar" style="display:none;"><a href="login?type=0&email=">登录</a></nav>
</div>

<div id="logo" style="display:none;">
<img src="./../media/logo.png" width="150px" height="150px" />
</div>

<section id="main" style="display:none;">
<h4>有了互动网，我们的关系变得更相近</h4>
<p>互动网 - 北美海外华人婚姻交友网</p>

<div id="search-panel">
<form action="checkavailableemail" method="post">
我是 <select name="g1" id="gender1"> <option value="male" selected>男 ♂</option> <option value="female">女 ♀</option> </select> 
寻找  <select  name="g2" id="gender2"> <option value="male">男 ♂</option><option value="female" selected>女 ♀</option></select> <br /> <br />
电子邮件 <br /><input id="user_email" type="email" name="email" size="32" value="your@email.com" placeholder="your@email.com" maxlength="44" oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required> <br /> <br />
  <input type="submit" value="搜索">
</form>
</div>

</section>

<section id="main-section">

<div style="display:none;">
<label  class="small-font" for="from">搜索活动从</label>
<input class="small-font" type="text" id="from" name="from">
<label  class="small-font" for="to">到</label>
<input  class="small-font" type="text" id="to" name="to">
</div>

<nav>
<ol>
<li>交友活动</li>
<li>派对活动</li>
</ol>
</nav>
<div id="event-map"></div>



</section>
<hr />

<section id="main-event-list-section">
活动行程表

<div  id="main-event-list-frame">

<div id="main-event-list-title">SkyRoom星空派对</div>
<div id="main-event-list-date">8月23号</div>
<div  id="main-event-list-detail">　狮子处女座是内向与外向人格的综合体。在他们身上可找出处女座的实际、踏实的性格，也能发现狮子暴躁易怒、直觉强烈的个性;这两种特质造就了外表安静、灵感丰富的个体，内心永远有一盏温暖的亮光。有些狮子处女的人会掩饰其才华洋溢的一面，初见面时，给人一种安静、深沉的印象。也有些狮子处女的人比较爱出风头，但是内心却相当敏感，重视隐私。他们可能会掩饰自己人格的某些面向或心中的秘密，而且时间持续好几年，但是即使是他们之中最内向的人，也会每隔一段时间突然展现其内在丰厚的特质，让全世界都知道他们究竟是什么样子的人，正在做什么事。到了这个时候，这类型的人才会了解刻意掩饰自己是没有用的，他们越想躲起来，别人越会注意到他们。不妨光明正大一点，敞开心胸，让别人有亲近了解他们的机会，不需要在内敛和外向之间摇摆不定，自寻苦恼。 ... <a href="#">[查询]</a>
</div>
<div id="main-event-list-picture">
<img src="./../media/bars/bar1.jpg" width="450px" height="300px" />
<img src="./../media/bars/bar3.jpg" width="450px" height="300px" />
<img src="./../media/bars/bar4.jpg" width="450px" height="300px" />
<img src="./../media/bars/bar5.jpg" width="450px" height="300px" />

<table>
<tr>
<td width="20%"><img src="./../media/bars/bar1.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar2.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar4.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar3.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar5.jpg" width="100%" height="" /></td>
</tr>
</table>
</div>

</div>

<div id="main-event-list-frame">

<div id="main-event-list-title">SkyRoom星空派对</div>
<div id="main-event-list-date">8月20号</div>
<div  id="main-event-list-detail">　狮子处女座是内向与外向人格的综合体。在他们身上可找出处女座的实际、踏实的性格，也能发现狮子暴躁易怒、直觉强烈的个性;这两种特质造就了外表安静、灵感丰富的个体，内心永远有一盏温暖的亮光。有些狮子处女的人会掩饰其才华洋溢的一面，初见面时，给人一种安静、深沉的印象。也有些狮子处女的人比较爱出风头，但是内心却相当敏感，重视隐私。他们可能会掩饰自己人格的某些面向或心中的秘密，而且时间持续好几年，但是即使是他们之中最内向的人，也会每隔一段时间突然展现其内在丰厚的特质，让全世界都知道他们究竟是什么样子的人，正在做什么事。到了这个时候，这类型的人才会了解刻意掩饰自己是没有用的，他们越想躲起来，别人越会注意到他们。不妨光明正大一点，敞开心胸，让别人有亲近了解他们的机会，不需要在内敛和外向之间摇摆不定，自寻苦恼。 ... <a href="#">[查询]</a>
</div>
<div id="main-event-list-picture">
<table>
<tr>
<td width="20%"><img src="./../media/bars/bar4.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar2.jpg" width="100%" height="" /></td>
<td width="20%">&nbsp;</td>
<td width="20%">&nbsp;</td>
<td width="20%">&nbsp;</td>
</tr>
</table>
</div>

</div>

<div id="main-event-list-frame">

<div id="main-event-list-title">SkyRoom星空派对</div>
<div id="main-event-list-date">8月16号</div>
<div  id="main-event-list-detail">　狮子处女座是内向与外向人格的综合体。在他们身上可找出处女座的实际、踏实的性格，也能发现狮子暴躁易怒、直觉强烈的个性;这两种特质造就了外表安静、灵感丰富的个体，内心永远有一盏温暖的亮光。有些狮子处女的人会掩饰其才华洋溢的一面，初见面时，给人一种安静、深沉的印象。也有些狮子处女的人比较爱出风头，但是内心却相当敏感，重视隐私。他们可能会掩饰自己人格的某些面向或心中的秘密，而且时间持续好几年，但是即使是他们之中最内向的人，也会每隔一段时间突然展现其内在丰厚的特质，让全世界都知道他们究竟是什么样子的人，正在做什么事。到了这个时候，这类型的人才会了解刻意掩饰自己是没有用的，他们越想躲起来，别人越会注意到他们。不妨光明正大一点，敞开心胸，让别人有亲近了解他们的机会，不需要在内敛和外向之间摇摆不定，自寻苦恼。 ... <a href="#">[查询]</a>
</div>
<div id="main-event-list-picture">
<table>
<tr>
<td width="20%"><img src="./../media/bars/bar5.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar4.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar3.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar2.jpg" width="100%" height="" /></td>
<td width="20%">&nbsp;</td>
</tr>
</table>
</div>

</div>

<div id="main-event-list-frame">

<div id="main-event-list-title">SkyRoom星空派对</div>
<div id="main-event-list-date">8月10号</div>
<div  id="main-event-list-detail">asdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdf
aasdf asdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdf
asdfaasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdf
sdfa  asdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdfasdfasdfasdfa asdf asd asdf asd asdfasdfa asdf asdf asdf asdf asdf ... 
<a href="#">[查询]</a></div>
<div id="main-event-list-picture">
<table>
<tr>
<td width="20%"><img src="./../media/bars/bar1.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar4.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar3.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar5.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar2.jpg" width="100%" height="" /></td>
</tr>
</table>
</div>

</div>

<div id="main-event-list-frame">

<div id="main-event-list-title">SkyRoom星空派对</div>
<div id="main-event-list-date">8月8号</div>
<div  id="main-event-list-detail">　狮子处女座是内向与外向人格的综合体。在他们身上可找出处女座的实际、踏实的性格，也能发现狮子暴躁易怒、直觉强烈的个性;这两种特质造就了外表安静、灵感丰富的个体，内心永远有一盏温暖的亮光。有些狮子处女的人会掩饰其才华洋溢的一面，初见面时，给人一种安静、深沉的印象。也有些狮子处女的人比较爱出风头，但是内心却相当敏感，重视隐私。他们可能会掩饰自己人格的某些面向或心中的秘密，而且时间持续好几年，但是即使是他们之中最内向的人，也会每隔一段时间突然展现其内在丰厚的特质，让全世界都知道他们究竟是什么样子的人，正在做什么事。到了这个时候，这类型的人才会了解刻意掩饰自己是没有用的，他们越想躲起来，别人越会注意到他们。不妨光明正大一点，敞开心胸，让别人有亲近了解他们的机会，不需要在内敛和外向之间摇摆不定，自寻苦恼。 ... <a href="#">[查询]</a>
</div>
<div id="main-event-list-picture">
<table>
<tr>
<td width="20%"><img src="./../media/bars/bar4.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar3.jpg" width="100%" height="" /></td>
<td width="20%"><img src="./../media/bars/bar1.jpg" width="100%" height="" /></td>
<td width="20%">&nbsp;</td>
<td width="20%">&nbsp;</td>
</tr>
</table>
</div>

</div>


</section>


<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>

var map;
function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(40.7559068, -73.9165519)
  };
  map = new google.maps.Map(document.getElementById('event-map'),
      mapOptions);
  
  setMarkers(map, events);

}

var events = [
               ['DOB',40.727078, -73.983835, 4],
               ['Gotham Bar & Grill', 40.734176, -73.993751, 5],
               ['Lincoln Center for the Performing Arts', 40.772437, -73.983534, 3],
               ['Cask Bar and Kitchen', 40.745389, -73.978983, 2],
               ['Bill\'s Bar & Burger', 40.740266, -74.005601, 1]
             ];

function setMarkers(map, locations) {
	  // Add markers to the map

	  for (var i = 0; i < locations.length; i++) {
	    var beach = locations[i];
	    var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
	    var marker = new google.maps.Marker({
	        position: myLatLng,
	        map: map,
	        title: beach[0],
	        zIndex: beach[3]
	    });
	  }
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