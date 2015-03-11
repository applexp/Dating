<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "roti.__Article"%>
<%
	__Article article = (__Article) request.getAttribute("article");
	String displayTimeLocation = (String) request.getAttribute("displayTimeLocation"); 


	String role = (String) request.getAttribute("role");
	String success_upload_event = (String) request.getAttribute("success_upload_event");
	String postid = article.getPostID()+"";
	
	String userid = article.getUserID();
	String photogroupid = article.getPostImageGroupID();
	String imageGroupIDPath = userid +"/article/"+ photogroupid +"/";
	int geshi = article.getGeshi();
	
	/*
	String userid = (String) request.getAttribute("userid");
	String name = (String) request.getAttribute("username");
	
	String photogroupid = (String) request.getAttribute("photogroupid");
	String imageGroupIDPath = userid +"/article/"+ photogroupid +"/";
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>爱聚系统管理 v1.0</title>
<link rel="stylesheet" href="./../../static/css/public/jq-ui.css">
<link rel="stylesheet" href="./../../static/css/xin/xinaiju.css">
<link rel="stylesheet" href="./../../static/css/bibi/uploadify.css">
<link rel="stylesheet" href="./../../static/css/bibi/admin_upload_event_page.css">
<link rel="icon" type="image/png" href="https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajlogo.png">
<style>
#xin-login-panel h1{
	color: #D93F31;
	font-size: 1.4em;
}
.login-small-text{
	width: auto;
}
.xin-table-td-size{
	width: 30%;
}
	
/*** settings content ***/
#xin-frame-settings{
	overflow:hidden;
	background-color:#D93F31;
	padding-top: 0px;
}
#xin-frame-settings-center{
	width: 100%;
	border-top: 25px solid #444;
	margin: 0 auto;
}

/** left **/
#settings-left-panel{
	float: left;
	width: 75%;
	height: 100%;
	background-color: white;
	!padding-bottom:100%;
	!margin-bottom:-100%;
}
#settings-left-body{
	float: right;
	width: 100%;
	height: auto;
	padding-bottom: 300px;
}
#settings-left-content{
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}

/** right **/
#settings-right-panel{
	float: left;
	width: 25%;
	height: 100%; 
	color: white;
	padding-bottom:100%;
	margin-bottom:-100%; 
}
#settings-right-body{
	float: left;
	width: 100%;
}
#settings-right-content{
	padding-left: 20px;
}
#settings-right-content ul{
	list-style-type: none;
}
#settings-right-content ul li{
	font-size: 1.1em;
	margin-left: -35px;
	margin-bottom: 30px;
	cursor:pointer;
}
/*** end settings content ***/

.cropit-image-preview {
	background-color: #f8f8f8;
    background-size: cover;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-top: 7px;
    !width: 600px;
    !height: 500px;
    cursor: move;
    margin-left: 5px;
}
.cropit-image-background {
    opacity: .2;
    cursor: auto;
}
.image-size-label {
	margin-top: 0.6rem;
}
    
/* Small devices (tablets, 768px and up) */
@media (min-width: 768px) {

	/*** settings content ***/
	#settings-left-body{
		!width: 740px;
	}
	/*** end settings content ***/
	#xin-table-login label{
		font-size: 1.2em;
	}
	#xin-table-login input{
		font-size: 1.3em;
		padding: 15px;
		width: 90%;
	}
	#xin-table-login select{
		font-size: 1.3em;
		padding: 15px;
		width: auto;
	}
}


/* Medium devices (desktops, 992px and up) */
@media (min-width: 992px) {

	.xin-table-td-size{
		!width: 240px;
	}
	/** end login panel **/
	#xin-table-login input{
		padding: 10px;
		width: 90%;
		font-size: 1.1em;
	}
	#xin-table-login select{
		font-size: 1.0em;
		padding: 5px;
		width: auto;
	}
	/*** settings content ***/
	#settings-left-body{
		!width: 840px;
	}
	#xin-frame-settings-center{
		border-top: 0px solid #fff;
	}
	#settings-left-panel{
		width: 70%;
	}
	#settings-left-content{
		padding-top: 20px;
	}
	#settings-right-panel{
		width: 30%;
	}
	#settings-right-content{
		padding-top: 20px;
	}
	/*** end settings content ***/
}

/* Medium devices (desktops, 992px and up) */
@media (min-width: 1200px) {

	/** end login panel **/
	#xin-table-login label{
		font-size: 1.0em;
	}
	#xin-table-login input{
		padding: 10px;
		width: auto;
		font-size: 1em;
	}
	
	/*** settings content ***/
	.xin-table-td-size{
		width: 100px;
		!background-color: green;
	}
	#xin-frame-settings-center{
		width: 940px;
	}
	#settings-left-body{
		width: 100%;
		padding-bottom: 200px;
	}
	#settings-left-panel{
		width: 80%;
	}
	#settings-left-content{
		
	}
	#settings-right-panel{
		width: 20%;
	}
	#settings-right-content ul li{
		font-size: 1em;
		margin-left: 0px;
		margin-bottom: 15px;
	}
	/*** end settings content ***/

}
/* Medium devices (desktops, 1800px and up) */
@media (min-width: 1800px) {

	/*** settings content ***/
	.xin-table-td-size{
		width: 100px;
	}
	
	#xin-frame-settings-center{
		width: 1160px;
	}
	#settings-left-panel{
		width: 75%;
	}
	#settings-right-panel{
		width: 25%;
	}
	#settings-left-body{
		padding-bottom: 440px;
	}
	/*** end settings content ***/

}
</style>
</head>
<body id="dingbu">
<div id="xin-body"> <!-- Frame starts -->
<div id="xin-body-cover">

<div id="xin-header">
<div id="xin-header-body">
<a href="../index"><img id="xin-aiju-logo" src="./../../media/aijulogo.jpg" /></a>  

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
<%	if(!role.equals("0")){ %>
<a id="xin-setting-btn" href="#"><img  class="space-in-upper-icon show-upper-link-icon" src="./../../media/buttonimg/settings.png"  /></a>
<%	}else{ %>
<a href="login"><img  class="space-in-upper-icon show-upper-link-icon" src="./../../media/buttonimg/login.png"  /></a>
<%	} %>
</td>
</tr>
</table>

</div>
</div>
<div style="clear: both;"></div>
<div id="xin-setting-frame">
<div id="xin-setting-menu"><ol><%= (role.equals("1"))? "<li><a href=\"../admin/index\">系统管理</a></li>":"" %><li><a href="../yonghu/shangchuan">活动推文</a></li><li><a href="../yonghu/shezhi">账户设置</a></li><li><a href="../logout">退出</a></li></ol></div>
</div>
<div style="clear: both;"></div>


<div id="xin-frame-settings">

<div id="xin-frame-settings-center">
<div id="settings-left-panel">
<div id="settings-left-body">
<div id="settings-left-content" bumen="bianjituiwen">
<%
	if(success_upload_event.equals("1")){
%>
<div class="notify"><p class="notify-green">更新成功<span class="x-mark x-login-page">&#x2717;</span></p></div>
<%	}else if(success_upload_event.equals("0")){
%>
<div class="notify"><p class="notify-red">更新失败<span class="x-mark x-login-page">&#x2717;</span></p></div>
<%  } %>
<h3>编辑推文与活动</h3>
<div id="xin-table-login" style="!padding:10px;">
<form action="bianji?type=form_submit" method="post" enctype="multipart/form-data" onsubmit="readySubmit();">
<table class="image-editor">
<tr><td class="xin-table-td-size"><label>活动标题</label></td><td><input id="title" type="text" name="title" value="<%= article.getTitle() %>" required></td></tr>
<tr><td class="xin-table-td-size"><label>活动简短描述</label></td><td><input id="shortdesc" type="text" name="shortdesc" maxlength="119" size="60" value="<%= (article.getShortDesc() == null)?"":article.getShortDesc() %>" required></td></tr>
<tr><td class="xin-table-td-size"><label>活动封面</label></td><td><input type="file"  id="cropit-image-input-size" class="cropit-image-input"><span id="alert-img-size">图片不能超过5MB</span></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><div class="cropit-image-preview"></div></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><div class="image-size-label" style="padding: 5px;">调整图像大小</div></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><input type="range" class="cropit-image-zoom-input"></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><br/></td></tr>
<tr><td class="xin-table-td-size"><label>活动内容</label></td><td><input type="file" name="uploadify_file_upload" id="file_upload"  /></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><textarea name="tinyMCE_event_content" id="tinyMCE" style="width:680px;height: 500px; max-width:680px; font-size: 16px;"><%= article.getContent() %></textarea></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><br/></td></tr>
<tr><td class="xin-table-td-size"><label>活动类型</label></td><td>
<select id="event-genre" name="event_type" required>
						<option value="3" selected="selected">爱聚合作</option>
						<option value="2">爱聚专题</option>
						<option value="4">爱聚推荐</option>
						<option value="6">爱聚独家</option>
						<option value="1">爱聚原创</option>
						<option value="5">爱聚福利</option>
						<option value="7">爱聚优惠</option>
						<option value="8">爱聚搜罗</option>
						<option value="9">爱聚纽约</option>
						<option value="10">爱聚招聘</option>
						<option value="12">爱聚厨房</option>
						<option value="13">爱聚书房</option>
						<option value="14">爱聚回顾</option>
						<option value="11">其他</option>
					</select>
</td></tr>
<tr><td class="xin-table-td-size" style="vertical-align: top;"><label>标签</label></td><td><input id="tags" name="tag" type="text" class="tags" value="<%= (article.getTag() == null)?"":article.getTag() %>" maxlength="199"></td></tr>
<tr><td class="xin-table-td-size"><label class="shiWenZhang">有售票？</label></td><td><input class="shiWenZhang" type="checkbox" id="ticket" name="isTicket" value="false"></td></tr>
<tr><td class="xin-table-td-size"><label></label></td><td><div class="hidden" id="payment_url_label"> <label>售票链接</label><input type="text" id="payment_url" name="url" value="n"> <small>http://www.aijunyc.com/zhs/index</small> </div></td></tr>
<tr><td class="xin-table-td-size"><label class="shiWenZhang">需时间地点？</label></td><td class="shiWenZhang"><div class="onoffswitch"> <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" value="false" id="datetime_addr_switch">  <label class="onoffswitch-label" for="datetime_addr_switch"> <span class="onoffswitch-inner"></span><span class="onoffswitch-switch"></span> </label> </div></td></tr>
<tr><td class="xin-table-td-size"><label class="time_addr hidden" >场地名字</label></td><td><div class="time_addr hidden"><input type="text" id="eventplacename" name="eventplacename" value="<%= (article.getEventPlaceName() == null)?"":article.getEventPlaceName() %>"></div></td></tr>
<tr><td class="xin-table-td-size"><label class="time_addr hidden">时间</label></td><td><div  class="time_addr hidden"><input type="text" id="event_datetime_start" name="datetime_start" value="<%= article.getEventDate() %>" placeholder="开始"/><input type="text" id="event_datetime_end" name="datetime_end" value="<%= article.getDisEventDate() %>" placeholder="结束"/></div></td></tr>
<tr><td class="xin-table-td-size"><label class="time_addr hidden">邮区编号</label></td><td><input  class="time_addr hidden" type="text" id="zip" name="zip" placeholder="10025" size="5" value="<%= (article.getZipcode() == null)?"":article.getZipcode() %>" maxlength="5"></td></tr>
<tr><td class="xin-table-td-size"><label id="city" class="hidden" >城市</label></td><td><div id="city"  class="hidden"><input type="text" id="city_input" name="city_name" value="<%= (article.getCity() ==null)?"":article.getCity() %>"></div></td></tr>
<tr><td class="xin-table-td-size"><label id="city_abbr" class="hidden" >州</label></td><td><div id="city_abbr" class="hidden"><input type="text" id="city_abbr_input" name="city_abbr" value="<%= (article.getState() == null)?"":article.getState() %>"></div></td></tr>
<tr><td class="xin-table-td-size"><label id="country" class="hidden" >国家</label></td><td><div id="country" class="hidden"><input type="text" id="country_input" name="country" value="<%= (article.getCountry() == null)?"":article.getCountry() %>"></div></td></tr>
<tr><td class="xin-table-td-size"><label class="time_addr hidden">活动地址</label></td><td><input class="time_addr hidden" type="text" id="address" name="Address" value="<%= (article.getAddress() == null)?"":article.getAddress() %>" placeholder="124 Broadway"></td></tr>
<tr><td class="xin-table-td-size" style="vertical-align: top;"><label class="hidden map_div">地图</label></td><td><div id="map_div" class="hidden"><div id="map_canvas"></div></div></td></tr>
<tr><td class="xin-table-td-size"><label id="latlonglb" class="hidden">经纬度</label></td><td><div id="latlongtd" class="hidden">纬度<input id="lat_box" name="latitude" value="<%= article.getLat() %>" readonly>经度<input id="lng_box" name="longitude" value="<%= article.getLong() %>" readonly></div></td></tr>
<tr><td></td><td style="padding-top: 20px;"><input type="hidden" name="posttime" value="<%= article.getPostDate() %>" ><input type="hidden" name="postid" value="<%= postid %>" ><input type="hidden" name="userid" value="<%= userid %>" ><input type="hidden" name="username" value="<%= article.getAuthor() %>" ><input type="hidden" name="imggroupid" value="<%= photogroupid %>" ><input type="hidden" id="imggroupidpath-id" name="imggroupidpath" value="<%= imageGroupIDPath %>" ><textarea name="profileImage" class="current-image" style="display:none;"></textarea><input type="submit" value="应用" style="width:auto;"></td></tr>
</table>
</form>
</div>
</div>

</div>
</div>

<div id="settings-right-panel">
<div id="settings-right-body">
<div id="settings-right-content" >
<h3>爱聚系统管理 <small>v1.0</small></h3>
<ul>
<li><a href="index"><span class="ltc">活动推文</span></a></li>
<li><a href="liebiao"><span class="ltc">活动列表</span></a></li>
<li><a href="bianji?hao=<%= article.getPostID() %>"><span class="xin-selected-option">编辑原文</span></a></li>
<li><a href="huishou"><span class="ltc">回收站</span></a></li>
<li style="cursor:default;">__________</li>
<li><a href="yonghuliebiao?i=1"><span class="ltc">用户列表</span></a></li>
<li style="cursor:default;">__________</li>
<li><a href="zonghe-baogao?type=day_user"><span class="ltc">综合报告</span></a></li>
</ul>
</div>

</div>
</div>

</div>


<div style="clear: both;"></div>

</div>




<footer id="xin-footer" style="margin-top: 0px;padding-top:20px;">
<p>爱聚纽约 &middot; 版权所有  © 2014-2015</p>
</footer>

</div>
</div> <!-- xin body ends -->
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>	
<script type="text/javascript" src="./../../static/javascript/bibi/jquery.uploadify.js"></script><!-- Uploadify -->
<script src="./../../static/javascript/bibi/tinymce.min.js"></script><!-- TextEditor -->
<script>
tinyMCE.baseURL = "./../../static/tinymce/";
tinyMCE.init({
	selector 	: "textarea#tinyMCE", 	// look for textarea with id tinyMCE
    theme	 	: "modern",				// theme modern, available only in v4
    language : 'zh_CN',
    plugins: [
              "advlist autolink lists link image charmap print preview hr anchor pagebreak",
              "searchreplace wordcount visualblocks visualchars code fullscreen",
              "insertdatetime media nonbreaking save table contextmenu directionality",
              "emoticons template paste textcolor colorpicker textpattern"
          ],
          toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
          toolbar2: "print preview media | fontsizeselect | forecolor backcolor emoticons",
          image_advtab: true,
          templates: [
              {title: 'Test template 1', content: 'Test 1'},
              {title: 'Test template 2', content: 'Test 2'}
          ]
});

$(document).ready(function() {
	var imgspath = "<%= imageGroupIDPath %>";
	var basepath = "./../../static/uploadify/";
	$("#file_upload").uploadify({
		'preventCaching' : false,
		'swf'		: basepath + 'uploadify.swf',
		'uploader'	: 'bianji?type=uploadify_photos&imgspath=' + imgspath,
		'cancelImg'	: basepath + "uploadify-cancel.png",
		'multi'		: true,
		'auto'		: true,
		'fileTypeDesc'	: 'Image Files',
		'fileTypeExts'	: '*.jpg;*.jpeg;*.gif;*.png;',
		'buttonText'	: '上传照片',
		'queueSizeLimit': 10,
		'uploadLimit'	: 1000,
		'fileSizeLimit'	: '15000KB', // 15mb
		'onUploadStart'	: function(file) {  // send file size to server
			$('#file_upload').uploadify("settings", 'formData',{"filesize":file.size});
		},
		'onUploadSuccess'	: function (fileObj, data, response) {
			if (response) {
				/* alert(fileObj.name); */
				/* console.log(fileObj); */
				var img = "<img class=\"xin-article-ya-img\" src='https://s3.amazonaws.com/aiju-cloudfront-bucket/"+ imgspath  + fileObj.name + "' />";
				tinyMCE.activeEditor.execCommand("mceInsertContent", true, img);
			} else {
				/* alert('upload failed'); */
				console.log(response);
				/* console.log(data); */
			}
		}
	});
});
</script>
<script type="text/javascript" src="./../../static/javascript/xin/settings/shezhi.js"></script>
<script type="text/javascript" src="./../../static/javascript/xin/settings/jquery.cropit.js"></script>
<script type="text/javascript" src="./../../static/javascript/xin/xin.js"></script>
<script type="text/javascript" src="./../../static/javascript/jquery.tagsinput.js"></script>
<script>

$(function() {
	  $('.image-editor').cropit({
	    imageState: {
	      src:  encodeURI('<%= article.getCoverImage() %>')
	    }
	  });
	});


$('#cropit-image-input-size').bind('change', function(file) {

	if(this.files[0].size > 5145728){
		$('.image-editor').cropit('imageSrc', 'https://s3.amazonaws.com/aiju-cloudfront-bucket/default_image/ajuploadimg.png');
		$('#submit-crop-btn').prop('disabled',true);
		$('#cropit-image-input-size').css('border-color', 'red');
		$('#alert-img-size').css('color', 'red');
		$('#alert-img-size').html("照片超过5MB!! 请重新上传图片");
		$('#imggroupidpath-id').val('default_image/ajuploadimg.png');
		this.removeFile(file);
		
		
	}else{
		//$('#imggroupidpath-id').val('<%= imageGroupIDPath %>');
		$('#cropit-image-input-size').css('border-color', '#eee');
		$('#alert-img-size').css('color', 'initial');
		$('#alert-img-size').html("图片不能超过5MB");
		$('#submit-crop-btn').prop('disabled',false);
	}
});

function readySubmit() {
	var b64 = $('.image-editor').cropit('export', {
		  type: 'image/jpeg',
		  quality: .99,
		  originalSize: true
	});
	var b64s = b64.split("e64,");
	$('.current-image').val(b64s[1]);
}

$( ".cropit-image-preview" ).click(function() {

	var b64 = $('.image-editor').cropit('export', {
		  type: 'image/jpeg',
		  quality: .99,
		  originalSize: true
	});
	var b64s = b64.split("e64,");
	$('.current-image').val(b64s[1]);
});
$( ".cropit-image-zoom-input" ).click(function() {

	var b64 = $('.image-editor').cropit('export', {
		  type: 'image/jpeg',
		  quality: .99,
		  originalSize: true
	});

	var b64s = b64.split("ase64,");
	$('.current-image').val(b64s[1]);
});

</script>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script><!-- Google Map -->
<!-- http://trentrichardson.com/examples/timepicker/ -->		 
<script type="text/javascript" src="./../../static/javascript/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="./../../static/javascript/jquery-ui-sliderAccess.js"></script>
<script>

$(document).ready(function() {

	$("#event-genre option[value='<%= article.getGenre() %>']").attr("selected","selected");
	
	$(".image-editor").cropit('previewSize', { width: 120, height: 100 });
	
	$('#show').click(function(){
		$('#display_form').show();
		$('.center').html(tinyMCE.activeEditor.getContent());
	});
		
	$('#cover_pic').bind('change', function() {
		var file_size = this.files[0].size;
		$('#cover_pic_file_size').val(file_size);
	});
	
	var full_address = "";
	var zip_code = "";

	$('#zip').bind('change', function(){
		if($(this).val().length == 5) {
			/* alert($(this).val()); */
			zip_code = $(this).val();
			$.post("http://maps.googleapis.com/maps/api/geocode/json?address=" + zip_code + "&sensor=false&components=country:US|postal_code:" + zip_code, 
					function(data, status) {					
						if (status == "success") {
							
							if (data.status == "OK") {				

								$("#zip").removeClass("invalid");
								
								var city_info = data.results[0].formatted_address;								
								var city_info_arr = city_info.split(",");
								
								var zip_city_name = city_info_arr[0];
								var zip_city_abbr_test = city_info_arr[1].match(/(.*)\s(\d{5})/);
								var zip_city_abbr = zip_city_abbr_test[1];
								var zip_country = city_info_arr[2]; 
						
								$('#city_input').val(zip_city_name);
								$('#city_abbr_input').val(zip_city_abbr);
								$('#country_input').val(zip_country);
								$("#city, #city_abbr, #country").show("slow");
								
								full_address = zip_city_name + " , " + zip_city_abbr + " " + zip_code + " , USA";	
							}
							else {
								alert(data.status);
								$("#zip").addClass("invalid");
							}	
						}
						else {
							alert("fail");
						}
					}, "json"
				);
		}
	});
	
	
	$('#address').focus(function(){
		console.log('in address');	
	}).blur(function(){
		console.log('out address');
		
		if (zip_code == "" || full_address == "") {
			$('#zip').addClass("invalid");
			/* alert("add invalid") */
		} 
		else {
			$.post("http://maps.googleapis.com/maps/api/geocode/json?address=" + $(this).val() + " ," + full_address + "&sensor=false&components=country:US|postal_code:" + zip_code,
					function(data, status){
						if (status == "success") {
							/* console.log(data); */
							var longitude_data = data.results[0].geometry.location.lng;
							var latitude_data = data.results[0].geometry.location.lat;
							$('#lng_box').val(data.results[0].geometry.location.lng);
							$('#lat_box').val(data.results[0].geometry.location.lat);
							
							google.maps.event.addDomListener(window, 'load', initialize(longitude_data, latitude_data));
							$('#map_div').show();
							$('#latlonglb').show();
							$('#latlongtd').show();
						}
			});
		}
	});
	
	
	

	var datetime_addr_switch_state = 1;
	
	if(<%= displayTimeLocation %>)
		datetime_addr_switch_state = 2;
	
	$('#datetime_addr_switch').bind('change',function(){
		if (datetime_addr_switch_state % 2 == 1) {
			$(".time_addr").show("slow");
			$("#zip, #eventplacename, #event_datetime_start, #event_datetime_end, #address").prop('required',true);
		}
		else {
			$(".time_addr").hide("slow");
			$("#zip, #eventplacename, #event_datetime_start, #event_datetime_end, #address").prop('required',false);
			$("#zip, #eventplacename, #event_datetime_start, #event_datetime_end, #address, #city, #city_abbr, #country, #map_div, #latlonglb, #latlongtd ").val("");
			$("#city, #city_abbr, #country, #map_div, #latlonglb, #latlongtd ").hide();
		}
		datetime_addr_switch_state++;
	}); 
	
	$('div.side-nav > h5').mouseover(function(){
	      $(this).addClass('hover');
	   });
	$('div.side-nav > h5').mouseout(function(){
	      $(this).removeClass('hover');
	   });
	
	$('#ticket').change(function() {
		if($(this).is(":checked")) {
			/*confirm("true");*/
			$('#payment_url_label').show();
		}
		else {
			$('#payment_url_label').hide()
		}
	});				
	
	
	$('#event_datetime_start').datetimepicker({
		onClose: function(dateText, inst) {
			var endDateTextBox = $('#event_datetime_end');
			if (endDateTextBox.val() != '') {
				var testStartDate = new Date(dateText);
				var testEndDate = new Date(endDateTextBox.val());
				
				if (testStartDate > testEndDate)
					endDateTextBox.val(dateText);
				
			}
			else {
				
				endDateTextBox.val(dateText);
			}
		},
		onSelect: function (selectedDateTime){
			var start = $(this).datetimepicker('getDate');
			$('#event_datetime_end').datetimepicker('option', 'minDate', new Date(start.getTime()));
		},
		timeFormat: 'hh:mm tt',
		stepMinute: 30
	});
	$('#event_datetime_end').datetimepicker({
		onClose: function(dateText, inst) {
			var startDateTextBox = $('#event_datetime_start');
			if (startDateTextBox.val() != '') {
				var testStartDate = new Date(startDateTextBox.val());
				var testEndDate = new Date(dateText);
				if (testStartDate > testEndDate)
					startDateTextBox.val(dateText);
			}
			else {
				startDateTextBox.val(dateText);
			}
		},
		onSelect: function (selectedDateTime){
			var end = $(this).datetimepicker('getDate');
			$('#event_datetime_start').datetimepicker('option', 'maxDate', new Date(end.getTime()) );
		},
		timeFormat: 'hh:mm tt',
		stepMinute: 30
	});
	
	function onAddTag(tag) {
		alert("Added a tag: " + tag);
	}
	function onRemoveTag(tag) {
		alert("Removed a tag: " + tag);
	}

	function onChangeTag(input,tag) {
		alert("Changed a tag: " + tag);
	}

	$(function() {
		$('#tags').tagsInput({width:'600',height:'60'});
	
	// Uncomment this line to see the callback functions in action
	// $('input.tags').tagsInput({onAddTag:onAddTag,onRemoveTag:onRemoveTag,onChange: onChangeTag});

	// Uncomment this line to see an input with no interface for adding new tags.
	// $('input.tags').tagsInput({interactive:false});
	}); 
	
	if(<%= displayTimeLocation %>){
		$("#zip, #eventplacename, #event_datetime_start, #event_datetime_end, #address, #cropit-image-input-size").prop('required',false);
		$(".time_addr").show();
		$("#zip, #eventplacename, #event_datetime_start, #event_datetime_end, #address, #city, #city_abbr, #country, #map_div, #latlonglb, #latlongtd ").show();
		$('#ticket').prop('checked', true);
		$('#datetime_addr_switch').prop('checked', true);
		$('#payment_url_label').show();
		$('#payment_url').val('<%= article.getPurchaseLink() %>');
		
		google.maps.event.addDomListener(window, 'load', initialize('<%= article.getLong() %>','<%= article.getLat() %>'));
		
	}
	
	var gshi = <%= geshi %>;
	if(gshi == 1){
		$('.shiWenZhang').css({'display':'none'});
	}
	
});

function initialize(longitude_data, latitude_data) {
    var myLatlng = new google.maps.LatLng(latitude_data, longitude_data);
    var myOptions = {
        zoom: 15,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        draggable:true
    });

    /* reverse geolocation listening to user movement */
	google.maps.event.addListener(
		    marker,
		    'drag',
		    function() {
		        $("#lat_box").val(marker.position.lat());
		        $("#lng_box").val(marker.position.lng());
		    }
	);
    
    /* Wait for user to stop dragging marker */
    google.maps.event.addListener(
    		marker,
    		'dragend',
    		function() {
    			get_address_from_latlng(marker.position.lat(),marker.position.lng());
    		}
    
    );
}

function get_address_from_latlng(lat, lng) {
	
	/* https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&resuly_type:country=US */
    $.post("http://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + lng + "&result_type:country=US",
			function(data, status){
				if (status == "success") {
					console.log(status);
					/* console.log(data); */
					var update_address = data.results[0].formatted_address;
					console.log(update_address);
					
					var addr_info_arr = update_address.split(",");
					var street_addr = addr_info_arr[0];
					var city_name = addr_info_arr[1];
					var addr_info_test = addr_info_arr[2].match(/(.*)\s(\d{5})/)
					var city_name_abbr = addr_info_test[1];
					zip_code = addr_info_test[2];
					var country = addr_info_arr[3];
					
					console.log(zip_code);
					
					$("#zip").val(zip_code);
					$("#city").val(city_name);
					$("#city_abbr").val(city_name_abbr);
					$("#country").val(country);
					$("#address").val(street_addr);
				}
		},"json"
	);
}
</script>

</html>