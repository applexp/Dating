

$("#resendLink").click(function(){    
	$( "#resendBtn" ).show(1000);
});
$("#resendBtn").click(function(){
	var link = $(location).attr('href');
	link = link.split("email=");
	link = link[1].split("#");

	var name = $('#name').val();
	var g1 = $('#g1').val();
	var g2 = $('#g2').val();

	window.location = "email_verification?type=1&name=" + name + "&g1=" + g1 + "&g2=" + g2 + "&email=" + link[0];
});

$(".x-verification").click(function(){   
	var link = $(location).attr('href');
	link = link.split("email=");

	var name = $('#name').val();
	var g1 = $('#g1').val();
	var g2 = $('#g2').val();

	$( ".notify" ).hide();
	window.location = "email_verification?type=0&name=" + name + "&g1=" + g1 + "&g2=" + g2 + "&email=" + link[1];
});

$(".x-login-page").click(function(){   
	var link = $(location).attr('href');
	link = link.split("email=");

	$( ".notify" ).hide();
	window.location = "login?type=0&email=" + link[1];
});

//info
//+ course
$("#addcourse2").click(function(){   

	if( !$("#c1").val() ) {

	}else{
		$( ".course2" ).show(500);
		$("#addcourse2").hide();
		$("#addcourse3").show(500);
	}

});
$("#addcourse3").click(function(){   

	if( !$("#c2").val() ) {

	}else{
		$( ".course3" ).show(500);
		$("#addcourse3").hide();
		$("#addcourse4").show(500);
	}
});
$("#addcourse4").click(function(){   


	if( !$("#c3").val() ) {

	}else{
		$( ".course4" ).show(500);
		$("#addcourse4").hide();
		$("#addcourse5").show(500);

	}
});
$("#addcourse5").click(function(){ 

	if( !$("#c4").val() ) {

	}else{
		$( ".course5" ).show(500);
		$("#addcourse5").hide();
	}

});
$(".x-course").click(function(){ 
	var number = $(this).attr('v');

	for(var i = number; i<= 5; i++){

		var cID = "#c" + i;
		var cName = ".course" + i;
		var iName = "#addcourse" + i;
		$(cName).hide();

		//always retain the first link
		if(i == number)
			$(iName).show(500);

		//prevent update education detail when 1st field is deleted abritary
		if((i-1) == 1)
			$('#c1').prop('required',false);


		//reset
		$(cID).prop('required',false);
		$(cName +" input").val('');
	}
});
$("#update-address-btn").click(function(){  

	var intRegex = /^\d+$/;

	var zipcode = $("#info-zipcode").val();
	var country = $( "#info-country option:selected" ).val();
	//alert(country);

	if(intRegex.test(zipcode)){
		$.get('others',{type:"address", input1:zipcode, input2:country},function(responseText) { 
			var address = responseText.split("||");
			//alert(address[0]+" "+ address[1]);
			$('#info-city').val(address[0]+"");
			$('#info-state').val(address[1]+"");

			$("#info-location").val(address[0]+", "+ address[1]);

			//window.location.href = "../request/reply?number="+responseText;
		});
	}
});

$("#info-left-btn1").click(function(){ 
	$(".section-show1").fadeIn("slow");
	$(".section-show2").fadeOut(0);
	$(".section-show3").fadeOut(0);
	$(".section-show4").fadeOut(0);
	$(".section-show5").fadeOut(0);

	$("#info-left-btn1").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});
});
$("#info-left-btn2").click(function(){ 
	$(".section-show1").fadeOut(0);
	$(".section-show2").fadeIn("slow");
	$(".section-show3").fadeOut(0);
	$(".section-show4").fadeOut(0);
	$(".section-show5").fadeOut(0);

	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn2").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});
});
$("#info-left-btn3").click(function(){  
	$(".section-show1").fadeOut(0);
	$(".section-show2").fadeOut(0);
	$(".section-show3").fadeIn("slow");
	$(".section-show4").fadeOut(0);
	$(".section-show5").fadeOut(0);

	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn3").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});

});
$("#info-left-btn4").click(function(){
	$(".section-show1").fadeOut(0);
	$(".section-show2").fadeOut(0);
	$(".section-show3").fadeOut(0);
	$(".section-show4").fadeIn("slow");
	$(".section-show5").fadeOut(0);

	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn4").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});
});
$("#info-left-btn5").click(function(){  
	$(".section-show1").fadeOut(0);
	$(".section-show2").fadeOut(0);
	$(".section-show3").fadeOut(0);
	$(".section-show4").fadeOut(0);
	$(".section-show5").fadeIn("slow");

	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""});
	$("#info-left-btn5").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
});
$("#profession-selector").change(function() {

	var selectedIndex = $( "#profession-selector option:selected" ).val();

	if(selectedIndex == 'etc'){
		$("#profession-selector-other").show(100);
		$('#profession-selector-other').prop('required',true);
	}else{
		$("#profession-selector-other").hide();
		$('#profession-selector-other').prop('required',false);
	}
});
$("#profession-selector1").change(function() {

	var selectedIndex = $( "#profession-selector1 option:selected" ).val();

	if(selectedIndex == 'etc'){
		$("#profession-selector-other1").show(100);
		$('#profession-selector-other1').prop('required',true);
	}else{
		$("#profession-selector-other1").hide();
		$('#profession-selector-other1').prop('required',false);
	}
});

//PROFILE
$(".profile-panel").mouseenter(function() {
	$("#profile-edit1").fadeIn();
	$("#profile-edit2").fadeIn();
	$("#profile-edit3").fadeIn();
	$("#profile-edit4").fadeIn();
	$("#profile-edit5").fadeIn();
});
$(".profile-panel").mouseleave(function() {
	$("#profile-edit1").fadeOut();
	$("#profile-edit2").fadeOut();
	$("#profile-edit3").fadeOut();
	$("#profile-edit4").fadeOut();
	$("#profile-edit5").fadeOut();
});
$("#profile-left-btn1").click(function(){  
	$(".reply-mail-section-panel").fadeIn("slow");
	//$(".profile-panel").fadeOut(0);

	$("#profile-left-btn1").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
	$("#profile-left-btn2").css({"border-left": "", "color": "","padding-left":""});
});
$("#profile-left-btn2").click(function(){  
	$(".reply-mail-section-panel").fadeOut("slow");
	//$(".profile-panel").fadeIn("slow");

	$("#profile-left-btn1").css({"border-left": "", "color": "","padding-left":""});
	$("#profile-left-btn2").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
});

//Mail

//$('.mail-click-tr').click(function() {
$('#mail-table-list').on('click','.mail-click-tr', function(){
	
	//$(".nano-text").nanoScroller({ scroll: 'bottom' });
	
	var mid = $(this).attr("uid");
	var tname = $(this).attr("title");
	var cid = $(this).attr("cid");
	var index = $(this).attr("index");
	
	redrawT(mid,tname,cid,index,-1);
});

function redrawT(m,t,c,i,textTopValue) {
	
	var mid = m;
	var tname = t;
	var cid = c;
	var index = i;

	$.post('mail',{mid:mid,tname:tname,index:index},function(data) {

		//var textTopValue = $(".nano-text .nano-content").scrollTop();
		var topValue = $(".nano .nano-content").scrollTop();
		//alert(bottomValue);
		
		var d1=data[0], d2=data[1];
		var d3=data[2], d4=data[3], d5=data[4], d6=data[5], d7=data[6];

		//alert(d7);
		$('#h3-name').html(d5 + "  &#187;  " + d4);


		$("#mail-table-list > tbody").empty();
		$(".nano").nanoScroller();


		var buildtable = "";
		for (var i = 0; i < d1.length; i++){
			
			if(d1[i]['mailID'] == mid)
				d7 = i;
			
			if(d3 != d1[i]['loverID']){

				var ltr = "<tr class=\"mail-click-tr\" uid=\"" + d1[i]['mailID'] + "\" title=\""+ d1[i]['loverName'] +"\" cid=\"" + d1[i]['coupleID'] + "\" index=\"" + i + "\">" +
				"<td id=\"mail-left-photo\" ><img src=\"" + d1[i]['loverPicture'] + "\" /></td>" +
				"<td ><div id=\"mail-left-edit\"><a href=\"#\" >"+ d1[i]['loverName'] +"</a><br/>"+ ((d1[i]['notViewTotalReplyA'] != 0)? "<span class=\"not-read-amount\" >"+d1[i]['notViewTotalReplyA']+" <img class=\"not-read-mail-icon\" src=\"./../media/lovemail.png\" /></span>":"")  +"</div></td>"+
				"</tr>";

				buildtable = ltr;

			}else{

				var rtr = "<tr class=\"mail-click-tr\" uid=\"" + d1[i]['mailID'] + "\" title=\""+ d1[i]['userName'] +"\" cid=\"" + d1[i]['coupleID'] + "\" index=\"" + i + "\">" +
				"<td id=\"mail-left-photo\" ><img src=\"" + d1[i]['userPicture'] + "\" /></td>" +
				"<td ><div id=\"mail-left-edit\"><a href=\"#\" >"+ d1[i]['userName'] +"</a><br/>"+ ((d1[i]['notViewTotalReplyB'] != 0)? "<span class=\"not-read-amount\" >"+d1[i]['notViewTotalReplyB']+" <img class=\"not-read-mail-icon\" src=\"./../media/lovemail.png\" /></span>":"") +"</div></td>"+
				"</tr>";

				buildtable = rtr;	
			}
			$("#mail-table-list").append(buildtable);
		}
		
		$("*[index='"+d7+"']").addClass( "highlight-clicktr" );

		//alert($("#msg-table-tr").html());

		$("#msg-table-tr > tbody").empty();
		$(".nano-text").nanoScroller();
		//alert($("#msg-table-tr").html());


		var buildtable1 = "";
		//alert(d2.length);
		for(var j = 0; j < d2.length; j++){

			if(d2[j]['isLeftRight'] == 'r'){
				//alert(d2[j]['isLeftRight']);

				var rtd = "<tr id=\"cbox"+j+"\" class=\"spaceUnder\"><td><table><tr>" +
				"<td  class=\"reply-td-text-left\"  width=\"550px\"><span class=\"reply-td-span-text-left\">" + d2[j]['message'] + "</span> </td>" +
				"<td class=\"reply-td-img\"><a href=\"profile\"><img class=\"info-profile-img\" src=\"" + d6 + "\" width=\"50px\" height=\"50px\" /></a></td>" +
				"</tr>" +
				"<tr>" +
				"<td colspan=\"2\" style=\"text-align: right;\">" + d2[j]['replyTime'] + "</td>" +
				"</tr></table></td></tr>";

				buildtable1 = rtd;

			}else{

				var p = (d1[parseInt(d7)]['userID'] == d2[j]['replyUserID']) ? d1[parseInt(d7)]['userPicture']: d1[parseInt(d7)]['loverPicture'];


				var ltd = "<tr id=\"cbox"+j+"\" class=\"spaceUnder\"><td><table><tr>" +
				"<td class=\"reply-td-img\"><a href=\"profile?id=" + d2[j]['replyUserID'] + "\" ><img class=\"info-profile-img\" src=\"" + p + "\" width=\"50px\" height=\"50px\" /></a></td>" +
				"<td class=\"reply-td-text-right\" width=\"550px\">" + d2[j]['message'] + "</td>" +
				"</tr>" +
				"<tr>" +
				"<td colspan=\"2\" style=\"text-align: right;\">" + d2[j]['replyTime'] + "</td>" +
				"</tr></table></td></tr>";

				buildtable1 = ltd;
			}

			$("#msg-table-tr").append(buildtable1);

		}
		
		$('#mailidfrombox').val(mid);
		$('#cidfrombox').val(cid);
		$('#tnamefrombox').val(tname);
		$('#indexfrombox').val(d7);

		//alert($(".nano-slider").scrollTop());
		
		//$(".nano-text").nanoScroller({ destroy: true });
		//$(".nano-text").nanoScroller({ destroy: false });
		
		$(".nano-text").nanoScroller();
		$(".nano").nanoScroller();
		
		if(textTopValue != -1)
			$(".nano-text").nanoScroller({ scrollTop: textTopValue });
		else
			$(".nano-text").nanoScroller({ scroll: 'bottom' });
		
		$(".nano").nanoScroller({ scrollTop: topValue });
		
		//alert(topValue);
		
		//$(".nano-text").nanoScroller({ scrollBottom: "+ topValue +" });
		
		//$(".nano").nanoScroller({ destroy: true });
		//$(".nano").nanoScroller({ destroy: false });
		//$(".nano-text").nanoScroller({ scroll: 'bottom' });
		
		
		//alert($("#msg-table-tr").html());
		//$(".mailbox-section").css({"border-color": "#666"});
		//$(".mailbox-section").animate({borderColor: '#eee'});

	},"Json");
}

$('#replymailbutton').click(function(){    

	var replyid = $('#replyidfrombox').val();
	var mailid = $('#mailidfrombox').val();
	var msg = $('#replymsgfrombox').val();
	var cid = $('#cidfrombox').val();
	var tname = $('#tnamefrombox').val();
	var index = $('#indexfrombox').val();
	
	//alert(mailid + " "+ msg);
	
	$.post('mailreply',{replyidfrombox:replyid,mailidfrombox:mailid,replymsgfrombox:msg,cidfrombox:cid,tnamefrombox:tname,indexfrombox:index},function(data) {
		
		redrawT4Reply(data[0],data[1],data[2],data[3]);
		$('#replymsgfrombox').val('');
		$('#charNum').text('1999');
		
	},"Json");
});

function redrawT4Reply(m,t,c,i) {
	
	var mid = m;
	var tname = t;
	var cid = c;
	var index = i;

	$.post('mail',{mid:mid,tname:tname,index:index},function(data) {

		var d1=data[0], d2=data[1];
		var d3=data[2], d4=data[3], d5=data[4], d6=data[5], d7=data[6];

		$('#h3-name').html(d5 + "  &#187;  " + d4);


		$("#mail-table-list > tbody").empty();
		$(".nano").nanoScroller();


		var buildtable = "";
		for (var i = 0; i < d1.length; i++){
			
			if(d1[i]['mailID'] == mid)
				d7 = i;
			
			if(d3 != d1[i]['loverID']){

				var ltr = "<tr class=\"mail-click-tr\" uid=\"" + d1[i]['mailID'] + "\" title=\""+ d1[i]['loverName'] +"\" cid=\"" + d1[i]['coupleID'] + "\" index=\"" + i + "\">" +
				"<td id=\"mail-left-photo\" ><img src=\"" + d1[i]['loverPicture'] + "\" /></td>" +
				"<td ><div id=\"mail-left-edit\"><a href=\"#\" >"+ d1[i]['loverName'] +"</a><br/>"+ ((d1[i]['notViewTotalReplyA'] != 0)? "<span class=\"not-read-amount\" >"+d1[i]['notViewTotalReplyA']+" <img class=\"not-read-mail-icon\" src=\"./../media/lovemail.png\" /></span>":"") +"</div></td>"+
				"</tr>";

				buildtable = ltr;

			}else{

				var rtr = "<tr class=\"mail-click-tr\" uid=\"" + d1[i]['mailID'] + "\" title=\""+ d1[i]['userName'] +"\" cid=\"" + d1[i]['coupleID'] + "\" index=\"" + i + "\">" +
				"<td id=\"mail-left-photo\" ><img src=\"" + d1[i]['userPicture'] + "\" /></td>" +
				"<td ><div id=\"mail-left-edit\"><a href=\"#\" >"+ d1[i]['userName'] +"</a><br/>"+ ((d1[i]['notViewTotalReplyB'] != 0)? "<span class=\"not-read-amount\" >"+d1[i]['notViewTotalReplyB']+" <img class=\"not-read-mail-icon\" src=\"./../media/lovemail.png\" /></span>":"") +"</div></td>"+
				"</tr>";

				buildtable = rtr;	
			}
			$("#mail-table-list").append(buildtable);
		}
		
		$("*[index='"+d7+"']").addClass( "highlight-clicktr" );
		
		$("#msg-table-tr > tbody").empty();
		$(".nano-text").nanoScroller();

		var buildtable1 = "";

		for(var j = 0; j < d2.length; j++){

			if(d2[j]['isLeftRight'] == 'r'){
				//alert(d2[j]['isLeftRight']);

				var rtd = "<tr id=\"cbox"+j+"\" class=\"spaceUnder\"><td><table><tr>" +
				"<td  class=\"reply-td-text-left\"  width=\"550px\"><span class=\"reply-td-span-text-left\">" + d2[j]['message'] + "</span> </td>" +
				"<td class=\"reply-td-img\"><a href=\"profile\"><img class=\"info-profile-img\" src=\"" + d6 + "\" width=\"50px\" height=\"50px\" /></a></td>" +
				"</tr>" +
				"<tr>" +
				"<td colspan=\"2\" style=\"text-align: right;\">" + d2[j]['replyTime'] + "</td>" +
				"</tr></table></td></tr>";

				buildtable1 = rtd;

			}else{

				var p = (d1[parseInt(d7)]['userID'] == d2[j]['replyUserID']) ? d1[parseInt(d7)]['userPicture']: d1[parseInt(d7)]['loverPicture'];


				var ltd = "<tr id=\"cbox"+j+"\" class=\"spaceUnder\"><td><table><tr>" +
				"<td class=\"reply-td-img\"><a href=\"profile?id=" + d2[j]['replyUserID'] + "\" ><img class=\"info-profile-img\" src=\"" + p + "\" width=\"50px\" height=\"50px\" /></a></td>" +
				"<td class=\"reply-td-text-right\" width=\"550px\">" + d2[j]['message'] + "</td>" +
				"</tr>" +
				"<tr>" +
				"<td colspan=\"2\" style=\"text-align: right;\">" + d2[j]['replyTime'] + "</td>" +
				"</tr></table></td></tr>";

				buildtable1 = ltd;
			}

			$("#msg-table-tr").append(buildtable1);

		}
		
		
		$('#indexfrombox').val(d7);

		$(".nano-text").nanoScroller({ destroy: true });
		$(".nano-text").nanoScroller({ destroy: false });
		$(".nano-text").nanoScroller({ scroll: 'bottom' });

		//alert($("#msg-table-tr").html());
		$(".mailbox-section").css({"border-color": "#666"});
		$(".mailbox-section").animate({borderColor: '#eee'});

	},"Json");
}
