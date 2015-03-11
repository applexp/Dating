<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="./../static/css/xin/xinaiju.css">
<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>

/* Small devices (tablets, 768px and up) */
@media (min-width: 768px) {
	#xin-nonpost-panel{
		width: 100%;
		padding-bottom: 100px;
		padding-top: 100px;
		background-color: white;
		
	}
	.image-editor{
		width: 95%;
	}
	
	#xin-nonpost-panel input{
		font-size: 1.3em;
		padding: 15px;
		width: 90%;
	}
}


/* Medium devices (desktops, 992px and up) */
@media (min-width: 992px) {

	#xin-nonpost-panel input{
		font-size: 1em;
		padding: 8px;
		width: 90%;
	}
	
	#xin-nonpost-panel{
		margin: 0 auto;
		width: 50%;
		background-color: white;
		border-radius: 8px;
		padding: 20px;
		
	}
	#tinyMCE{
		width: 600px;
	}
}

/* Medium devices (desktops, 992px and up) */
@media (min-width: 1200px) {

	

}
</style>
</head>
<body id="dingbu">
<div id="xin-body"> <!-- Frame starts -->

<div id="xin-header">
<div id="xin-header-body">
<a href="index"><img id="xin-aiju-logo" src="./../media/aijulogo.jpg"/></a>  
</div>
</div>

<div id="xin-frame" >
<div id="xin-nonpost-panel">
<h2>上传<%= request.getAttribute("title") %></h2>
<form action="chuang-jian" method="post" enctype="multipart/form-data" >
<table class="image-editor">
<tr><td class="xin-table-td-size"><label>标题</label></td><td><input class="xin-table-td-size-input" id="title" type="text" name="title" required></td></tr>
<tr><td class="xin-table-td-size" style="vertical-align:top;"><label>内容</label></td><td class="overme"><textarea name="tinyMCE_event_content" class="tinyMCE_event_content" id="tinyMCE" style="height:300px;"></textarea></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><br/></td></tr>
<tr><td><input id="geshi" type="hidden" name="geshi" value="<%= request.getAttribute("geshi") %>" ></td><td><input type="submit" value="发布<%= request.getAttribute("title") %>" style="width:auto;"></td></tr>
</table>
</form>


</div>
</div>

<div id="xin-borderimage"></div>
<footer id="xin-footer">
<p>爱聚纽约 &middot; 版权所有  © 2014-2015</p>
</footer>


</div> <!-- xin body ends -->
</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="./../static/javascript/xin/xin.js"></script>
<script src="./../static/javascript/bibi/tinymce.min.js"></script>
<script> tinyMCE.baseURL = "./../static/tinymce/"; tinymce.init({     selector: "textarea#tinyMCE",     theme: "modern",     language : 'zh_CN',     plugins: [               "link image"           ],     toolbar1: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image" }); </script>
<script>
//$(document).ready(function(){
	$(".overme").mouseover(function() {
		
		if(typeof(Storage) !== "undefined") {
	
			var pObject = { 'title': $('#title').val(), 'contents': tinyMCE.get('tinyMCE').getContent(), 'gs': $('#geshi').val() };
			
			// Put the object into storage
			localStorage.setItem('pObject', JSON.stringify(pObject));
	
			// Retrieve the object from storage
			//var retrievedObject = localStorage.getItem('pObject');
	
			//console.log('retrievedObject: ', JSON.parse(retrievedObject));
		} else {
		    alert("Sorry! No Web Storage support.. Please update your web browser.");
		    //event.preventDefault();
		}
	});
//});
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