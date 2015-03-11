<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
	<title>爱聚纽约 - 系统管理</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
	<link rel="icon" type="image/png" href="./../media/logo/aijulogo50.png">
	<link rel="stylesheet" href="./../../static/css/admin/admin_upload_event_page.css">
	<!-- Uploadify -->
	<link rel="stylesheet" href="./../../static/css/admin/uploadify.css">
</head>
<body>
	<div id="top-header">
		<h1><a href="../index"><span style="color: #444; text-decoration: none;">系统管理 1.0</span></a></h1>
	</div>

	<div class="side-nav">
		<h3>功能</h3>
		<hr>
		<h5>上传推文和活动</h5>
	</div>

	<div id="section">
		<h2>上传推文或活动</h2>
		<form action="index?type=form_submit" method="post" enctype="multipart/form-data">
			<fieldset>
				<div>
					<label>活动标题:</label>
					<input id="title" type="text" name="title" placeholder="event title" required>
				</div>
				<div>
					<label>活动简短描述:</label>
					<input id="shortdesc" type="text" name="shortdesc" maxlength="119" size="60"  required>
				</div>
				<div>
					<label>首页照片:</label>
					<input type="hidden" id="cover_pic_file_size" name="cover_pic_file_size" value="0">
					<input type="hidden" name="MAX_FILE_SIZE" value="2000" /> <!-- 2000Kb ~ 2Mb MAKE A JQUERY TEST FOR SIZE -->
					<input type="file" id="cover_pic" name="cover_pic" accept="image/jpeg, image/png, image/jpg" required>
					<h3 style="<%= request.getAttribute("bad_pic") %>"><%= request.getAttribute("bad_pic_msg") %></h3>
				</div>
				<div>
					<label>活动类型:</label>
					<select name="event_type" required>
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
						<option value="11">其他</option>
					</select>
				</div>
				<div>
					<label>售票活动:</label>
					<input type="checkbox" id="ticket" name="isTicket" value="false">
				</div>
				<div class="hidden" id="payment_url_label">
					<label>售票转接:</label>
					<input type="text" id="payment_url" name="url" value="">
				</div>					
			</fieldset>
			
			<fieldset class="hidden" id="datetime_addr_fieldset">
				<div>
					<label>时间：</label>
					<input type="text" id="event_datetime_start" name="datetime_start" value="" placeholder="开始"/>
					<input type="text" id="event_datetime_end" name="datetime_end" value="" placeholder="结束"/>
				</div>
				<br>
				<label>
					<span>Zip:</span>
					<input type="text" id="zip" name="zip" placeholder="10025" size="5" maxlength="5">
				</label>
				<label class="hidden" id="city">
					<br>
					<span>城市：</span>
					<input type="text" id="city_input" name="city_name" value="">
				</label>
				<label class="hidden" id="city_abbr">
					<br>
					<span> 城市简称：</span>
					<input type="text" id="city_abbr_input" name="city_abbr" value="">
				</label>
				<label class="hidden" id="country">
					<br>
					<span>国家：</span>
					<input type="text" id="country_input" name="country" value="">
				</label>
				<div>
					<label>地址:</label>
					<input type="text" id="address" name="Address" placeholder="124 Broadway">
				</div>
				
				<div id="map_div" class="hidden">
					<div id="map_canvas"></div>
					<input id="lat_box" name="latitude" value="-1" readonly>
					<input id="lng_box" name="longitude" value="-1" readonly>			
				</div>
				
			</fieldset>
			
			<fieldset>
				<label>需时间地点？</label>
				<div class="onoffswitch">
				    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" value="false" id="datetime_addr_switch">
				    <label class="onoffswitch-label" for="datetime_addr_switch">
				        <span class="onoffswitch-inner"></span>
				        <span class="onoffswitch-switch"></span>
				    </label>
				</div>
			</fieldset>
			
			<br>
			<input type="file" name="uploadify_file_upload" id="file_upload" />
			
			<!-- tinyCME box -->
			<textarea name="tinyMCE_event_content" id="tinyMCE">Your content here.</textarea>
			
			<br>		
			<input type="submit" value="Submit"/>		
		</form>
	</div>
	
</body>
<!-- JQuery -->
	<!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>	
	
	<!-- Uploadify -->
	<script type="text/javascript" src="./../../static/javascript/admin/jquery.uploadify.js"></script>
	
	
	<!-- TextEditor -->
	<script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
	
	<script>
		tinyMCE.baseURL = "./../../static/tinymce/";
		tinyMCE.init({
			selector 	: "textarea#tinyMCE", 	// look for textarea with id tinyMCE
	        theme	 	: "modern",				// theme modern, available only in v4
	        plugins		: [
	                       "advlist autosave autolink media link image lists charmap print preview hr anchor pagebreak spellchecker",
	                       "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
	                       "save table contextmenu directionality emoticons template paste textcolor"
	                 ],
	        theme_advanced_fonts : "Andale Mono=andale mono,times;"+
            "Arial=arial,helvetica,sans-serif;"+
            "Arial Black=arial black,avant garde;"+
            "Book Antiqua=book antiqua,palatino;"+
            "Comic Sans MS=comic sans ms,sans-serif;"+
            "Courier New=courier new,courier;"+
            "Georgia=georgia,palatino;"+
            "Helvetica=helvetica;"+
            "Impact=impact,chicago;"+
            "Symbol=symbol;"+
            "Tahoma=tahoma,arial,helvetica,sans-serif;"+
            "Terminal=terminal,monaco;"+
            "Times New Roman=times new roman,times;"+
            "Trebuchet MS=trebuchet ms,geneva;"+
            "Verdana=verdana,geneva;"+
            "Webdings=webdings;"+
            "Wingdings=wingdings,zapf dingbats",
			toolbar	: "save,|,image,media,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,|,fontselect,fontsizeselect,|,spellchecker,preview",
            theme_advanced_toolbar_location	: "top",
	        theme_advanced_toolbar_align	: "left",
	        theme_advanced_resizing	: true,
	        theme_advanced_statusbar_location	: "bottom" 
		});
		
		$(document).ready(function() {
			var basepath = "./../../static/uploadify/";
			$("#file_upload").uploadify({
				'preventCaching' : false,
				'swf'		: basepath + 'uploadify.swf',
				'uploader'	: 'index?type=uploadify_photos',
				'cancelImg'	: basepath + "uploadify-cancel.png",
				'multi'		: true,
				'auto'		: true,
				'fileTypeDesc'	: 'Image Files',
				'fileTypeExts'	: '*.jpg;*.jpeg;*.gif;*.png;',
				'buttonText'	: '上传照片',
				'queueSizeLimit': 10,
				'uploadLimit'	: 20,
				'fileSizeLimit'	: '5000KB', // 5mb
				'onUploadStart'	: function(file) {  // send file size to server
					$('#file_upload').uploadify("settings", 'formData',{"filesize":file.size});
				},
				'onUploadSuccess'	: function (fileObj, data, response) {
					if (response) {
						/* alert(fileObj.name); */
						/* console.log(fileObj); */
						var img = "<img width=\"100%\" src = 'https://s3.amazonaws.com/aiju-cloudfront-bucket/userD/"  + fileObj.name + "'" +  "/>";
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
	
<!-- 	<script type="text/javascript">
	    $(function() {
	        $('#file_upload').uploadify({
	            'swf'      : 'uploadify.swf',
	            'uploader' : 'index',
	            'multi'	   : true
	            // Your options here
	        });
	    });
    </script> -->	
	
	
	
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
	
	<!-- http://trentrichardson.com/examples/timepicker/ -->		 
	<script type="text/javascript" src="https://struts2-jquery.googlecode.com/svn-history/r1647/trunk/struts2-jquery-plugin/src/main/resources/template/js/plugins/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript" src="https://struts2-jquery.googlecode.com/svn-history/r1647/trunk/struts2-jquery-plugin/src/main/resources/template/themes/jquery-ui-timepicker-addon.css"></script>
	<script type="text/javascript" src="https://dew-scrumy.googlecode.com/svn-history/r240/trunk/FulbitoPortal/WebContent/js/jquery-ui-sliderAccess.js"></script>		
		
		
	<script>
				
		$(document).ready(function() {

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
								}
					});
				}
			});
			
			
			var datetime_addr_switch_state = 1;
			$('#datetime_addr_switch').bind('change',function(){
				if (datetime_addr_switch_state % 2 == 1) {
					$("#datetime_addr_fieldset").show("slow");
					$("#zip, #event_datetime_start, #event_datetime_end, #address").prop('required',true);
				}
				else {
					$("#datetime_addr_fieldset").hide("slow");
					$("#zip, #event_datetime_start, #event_datetime_end").prop('required',false);
					$("#zip, #event_datetime_start, #event_datetime_end, #address, #city, #city_abbr, #country").val("");
					$("#city, #city_abbr, #country").hide();
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