/** header drop down button **/
$("#list-icon-btn").click(function(){    
	$( ".xin-frame-icon-menu" ).toggle();
	
	if ( $(".xin-frame-icon-menu").is(':visible'))
		$("#list-icon-btn").attr("src", "./../media/buttonimg/list_open.png");
	else
		$("#list-icon-btn").attr("src", "./../media/buttonimg/list.png");
	
});
$("#list-icon-game-btn").click(function(){    
	$( ".xin-frame-icon-menu" ).toggle();
	
	if ( $(".xin-frame-icon-menu").is(':visible')){
		$("#list-icon-game-btn").attr("src", "./../../media/buttonimg/list_open.png");
		$("#xin-frame").css({'margin-top':'0px'});
	}else{
		$("#list-icon-game-btn").attr("src", "./../../media/buttonimg/list.png");
		$("#xin-frame").css({'margin-top':'60px'});
	}
	
});
/** setting menu **/
$("#xin-setting-btn").click(function(){   
	$( "#xin-setting-frame" ).slideToggle(500);
});

/** x button **/
$(".x-mark").click(function(){   

	$( ".notify" ).hide();
});                

/** resend button **/
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

	window.location = "email-verification?type=1&name=" + name + "&g1=" + g1 + "&g2=" + g2 + "&email=" + link[0];
});

/** popup comment **/
$(document).on('click', '#popup-reply-box', function(e) {
	$( "#xin-article-comment-frame" ).toggle();
	
	var height = $(window).height(); 
	var width = $(window).width(); 
	//alert(width);
	if(height > 900 && width > 1200)
		$("#xin-article-comment-list").css("height","480px");
	else if(height < 760 && width > 1200)
		$("#xin-article-comment-list").css("height","380px");

	
	//$("#popup-reply-box-img").attr("src", "./../media/buttonimg/x-mark.png");
	
	if ( $("#xin-article-comment-frame").is(':visible')){
		$("#popup-reply-box span").text("返回");
		$("#dingbu-lower-nav span").text("");
		
	}else{
		$("#popup-reply-box span").text("留言");
		$("#dingbu-lower-nav span").text("返回顶部");
	}
	e.preventDefault();
});
$("#xin-article-comment-frame").click(function(){
	$(this).fadeOut("fast");
	  
	if (!$("#xin-article-comment-frame").is(':visible')){
		$("#popup-reply-box span").text("留言");
		$("#dingbu-lower-nav span").text("返回顶部");
	}else{
		$("#popup-reply-box span").text("留言");
		$("#dingbu-lower-nav span").text("返回顶部");
	}
	
	}).children().click(function(e) {
		return false;
});
$("#post-article-comment-btn").click(function(){
	
	var id = $('#userid').val();
	var pid = $('#postid').val();
	var content = $('#xin-article-reply-textarea').val();
	
	$.post('article',{uid:id,comment:content,postid:pid},function(data) {
		
		var d1=data;
		d1.reverse(); 
		
		$("#xin-article-table-comment-list tr").remove(); 
		
		var buildtable = "";
		for (var i = 0; i < d1.length; i++){
			
			var ltr = "<tr>" +
						"<td style=\"vertical-align: top; padding-top: 8px;\"><img src=\""+ d1[i]['userPic'] +"\" /></td>" +
						"<td>" +
						"<table>" +
						"<tr><td style=\"vertical-align: top;\"><div class=\"xin-article-comment-name\">"+ d1[i]['username'] +"</div></td></tr>" +
						"<tr><td style=\"vertical-align: top;\"><div class=\"xin-article-comment-content\" >"+ d1[i]['comment'] +"</div></td></tr>" +
						"<tr><td style=\"text-align: right; width: auto; color: #bbb;\"><small>"+ d1[i]['commentTime'] +"</small></td></tr>" +
						"</table>" +
						"</td>" +
					"</tr>";

			buildtable = ltr;

			$("#xin-article-table-comment-list").append(buildtable);
			
		}
	},"Json");
});
$("#login-post-article-comment-btn").click(function(){    
	window.location.href = "login";
});
/** list event **/

var d = new Date();
var dateToday1 = d.getTime();
var curr_date = d.getDate();
var curr_month = d.getMonth()+1;
var curr_year = d.getFullYear();
var dateToday = Date.parse(curr_year + "/" + curr_month + "/" + curr_date);
var today_t = new Date(Date.parse(curr_year + "/" + curr_month + "/" + curr_date+" "+d.getHours()+":"+d.getMinutes()+":00"));
var day_t_st = today_t.getTime() - (3600000*5);
var day_t = today_t.getFullYear()+""+(today_t.getMonth()+1)+""+today_t.getDate()+"";

function jXiaowei(gwz, jl, c, opt){
	var wz = {};
	switch(opt){
		case 0:
			wz = jintian(gwz,jl);
			break;
		case 1:
			wz = mingtian(gwz,jl);
			break;
		case 2:
			wz = zhou(gwz,jl);
			//alert(wz);
			break;
		case 3:
			wz = yue(gwz,jl);
			break;
		case 4:
			wz = quanbu(gwz,jl);
			break;
		case 5:
			wz = houqi(gwz,jl);
			break;
	}
	hua(wz,c);
}


function jintian(wz,jl){
	
	var today = new Date(Date.parse(curr_year + "/" + curr_month + "/" + curr_date +" 00:00:00"));
	var day1 = today.getDate()+""+(today.getMonth()+1)+""+today.getFullYear()+"";

	var arts = wz;
	var i;
	var newArts = [];
	
	for(i = 0; i < arts.length; i++){
		
		var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
		var cudate = eventTime.getDate();
	    var cumonth = eventTime.getMonth()+1;
	    var cuyear = eventTime.getFullYear();
	    var last = new Date(Date.parse(cuyear + "/" + cumonth + "/" + cudate +" 00:00:00"));
	    var day2 = last.getDate()+""+(last.getMonth()+1)+""+last.getFullYear()+"";
		
		if(day1 === day2)
			newArts.push(arts[i]);	
		
	}
	
	return newArts;
	
}
function mingtian(wz,jl){
	
	var day = new Date();
	var tmr = day.setDate(day.getDate()+1);
	var yts = day.setDate(day.getDate()-1);
	
	var arts = wz;
	var i;
	var newArts = [];

	for(i = 0; i < arts.length; i++){
		
		var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
		
		if((eventTime < tmr) && (eventTime > yts))
			newArts.push(arts[i]);	
		
	}
	
	return newArts;
}

function zhou(wz,jl){
	
	var curr = new Date; // get current date
	var first = curr.getDate() - curr.getDay(); // First day is the day of the month - the day of the week
	var last = first + 6; // last day is the first day + 6

	var sun = new Date(curr.setDate(first));
	var mon = new Date(curr.setDate(last));
	
	var arts = wz;
	var i;
	var newArts = [];
	
	for(i = 0; i < arts.length; i++){
		
		var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
		
		if((eventTime >= sun) && (eventTime <= mon)){
			newArts.push(arts[i]);	
		}
	}
	
	return newArts;
}
function yue(wz,jl){
	

	var date = new Date(), y = date.getFullYear(), m = date.getMonth();

	var firstDay = new Date(y, m, 1); //2014 10 1

	var lastDay = new Date(y, m + 1, 0);
	
	var arts = wz;
	var i;
	var newArts = [];

	for(i = 0; i < arts.length; i++){
		var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
		
		if((eventTime <= lastDay) && (eventTime >= firstDay))
			newArts.push(arts[i]);	
	}
	
	return newArts;
}
function quanbu(wz,jl){
	return wz;
}
function houqi(wz,jl){
	
	var arts = wz;
	var i;
	var newArts = [];

	for(i = 0; i < arts.length; i++){
		
		var eventTime = new Date(Date.parse(jsDate(arts[i].eventDate)));
		
		if(eventTime < dateToday)
			newArts.push(arts[i]);	
		
	}
	
	return newArts;
}
function hua(wz,c){
	
	if(c==1){
		
		var linkpath = "";
		var e_time = "";
		
		$("#xin-event-inner-table tr").remove(); 
		
		var buildtable = "";
		
		add_post_ltr = addPost(c);
		$("#xin-event-inner-table").append(add_post_ltr);
		
		for (var i = 0; i < wz.length; i++){
			
			var eventTime = new Date(Date.parse(jsDate(wz[i]['eventDate'])));
			var cudate = eventTime.getDate();
		    var cumonth = eventTime.getMonth()+1;
		    var cuyear = eventTime.getFullYear();
		    //var eventtime = cudate+""+cumonth+""+cuyear+"";
		    var stime = wz[i]['stime'].substring(0,5);
		    var eventtime = new Date(Date.parse(cuyear + "/" + cumonth + "/" + cudate +" "+stime+":00"));
		    var eventtimestamp = eventtime.getTime() - (3600000*5);
			
			if(wz[i]['geshi'] != '1'){
				if(eventtimestamp >= day_t_st)
					linkpath += "<div class=\"xin-event-plink\"><a href=\"" + wz[i]['purchaseLink'] + "\"><span>RSVP</span></a></div>";
				else
					linkpath += "<div class=\"xin-event-plink\"><span>结束</span></div>";
			}
			
			if(wz[i]['geshi'] == 2)
				e_time = wz[i]['stime'];
			
			var ltr = "<tr class=\"xin-event-tr-space\">" +
				"<td width=\"100%\">" +
				"<div class=\"xin-focus-size\" ><a href=\"article?post=" + wz[i]['postID'] + "\"><img src=\"" + wz[i]['coverImage'] + "\" /></a></div>" +
				"<div class=\"xin-event-title\" ><a href=\"article?post=" + wz[i]['postID'] + "\">" + wz[i]['title'] + "</a></div>" +
				"<div class=\"xin-event-author\" >" + wz[i]['author'] + "</div>" +
				"<div class=\"xin-event-date\" >" + wz[i]['disEventDate'] + " " + wz[i]['day_of_week'] + " " + e_time + "" +
				linkpath + "</div>" +
				"</td>" +
				"</tr>";
			
			buildtable = ltr;

			linkpath = "";
			e_time = "";
			
			$("#xin-event-inner-table").append(buildtable);
			
		}
		
	}else{
		
		$("#xin-event-inner-table tr").remove(); 
		
		var buildtable = "";
		var e_time = "";
		var looptime = Math.ceil(wz.length/3.0);
		//var last = looptime - (looptime -1);
		var z = 0;
		var linkpath = "";
		
		buildtable += addPost(buildtable);
		//alert(buildtable);
		
		// prevent empty looptime
		if(looptime == 0)
			looptime = 1;
		
		for (var i = 0; i < looptime; i++){
			
			var ltr = "";
			
			if(i==0){
				c = 2; // 2 posts occupy in first row.
				ltr = addPost(c);
			}else{
				ltr = "<tr class=\"xin-event-tr-space\">";
				c = 3; // 3 posts occupy in first row.
			}
			
			for(var j=0; j<c; j++){
				if(j < wz.length && wz[z] != null){
					//day_t = today_t.getDate()+""+(today_t.getMonth()+1)+""+today_t.getFullYear()+"";
					var eventTime = new Date(Date.parse(jsDate(wz[z]['eventDate'])));
					var cudate = eventTime.getDate();
				    var cumonth = eventTime.getMonth()+1;
				    var cuyear = eventTime.getFullYear();
				    //var eventtime = cuyear+""+cumonth+""+cudate+"";
					var stime = wz[z]['stime'].substring(0,5);
					var eventtime = new Date(Date.parse(cuyear + "/" + cumonth + "/" + cudate +" "+stime+ ":00"));
				    var eventtimestamp = eventtime.getTime() - (3600000*5);
				    
					if(wz[z]['geshi'] != '1'){
						if((eventtimestamp > day_t_st)){
							linkpath += "<div class=\"xin-event-plink\"><a href=\"" + wz[z]['purchaseLink'] + "\"><span>RSVP</span></a></div>";
						}else{
							linkpath += "<div class=\"xin-event-plink\"><span>结束</span></div>";
						}
					}
					
					if(wz[z]['geshi'] == 2)
						e_time = wz[z]['stime'];
					/*
					if(wz[z]['purchaseLink'] != 'n')
						linkpath += "<div class=\"xin-event-plink\"><a href=\"" + wz[z]['purchaseLink'] + "\"><span>RSVP</span></a></div>";
					*/
					ltr += "<td width=\"33.33%\">" +
						"<div class=\"xin-focus-size\" ><a href=\"article?post=" + wz[z]['postID'] + "\"><img src=\"" + wz[z]['coverImage'] + "\" /></a></div>" +
						"<div class=\"xin-event-title\" ><a href=\"article?post=" + wz[z]['postID'] + "\">" + wz[z]['title'] + "</a></div>" +
						"<div class=\"xin-event-author\" >" + wz[z]['author'] + "</div>" +
						"<div class=\"xin-event-date\" >" + wz[z]['disEventDate'] + " " + wz[z]['day_of_week'] + " " + e_time + "" +
						linkpath + "</div>" +
						"</td>";
				}else{
					ltr += "<td width=\"33.33%\"></td>";
				}
				z++;
				
				linkpath = "";
				e_time = "";
				
				//alert(ltr);
			}
			

			ltr += 	"</tr>";
			
			buildtable = ltr;

			$("#xin-event-inner-table").append(buildtable);
		}
		
	}
	
}
function addPost(c){
	
	var add_post_ltr;
	
	if(c == 1){
		
		add_post_ltr = "<tr class=\"xin-event-tr-space\">" +
					"<td width=\"100%\" ><div class=\"xin-addposts-size\">" +
						"<div class=\"xin-addposts-icon\" >" +
						"<a href=\"chuang-jian?t=huodong\"><img src=\"./../media/buttonimg/add-add.png\" > 发活动</a>" +
						"</div>" +
						"<div class=\"xin-addposts-icon\" >" +
						"<a href=\"chuang-jian?t=tuiwen\"><img src=\"./../media/buttonimg/add-add.png\"  > 发推文</a>" +
						"</div>" +
					"</td></div></tr>";
		
	}else if(c == 2){
		
		add_post_ltr = "<tr class=\"xin-event-tr-space\">" +
					"<td width=\"33.33%\" style=\"vertical-align: top;\"><div class=\"xin-addposts-size\">" +
						"<div class=\"xin-addposts-icon\" >" +
						"<a href=\"chuang-jian?t=huodong\"><img src=\"./../media/buttonimg/add-add.png\"  /> 发活动</a>" +
						"</div>" +
						"<div class=\"xin-addposts-icon\" >" +
						"<a href=\"chuang-jian?t=tuiwen\"><img src=\"./../media/buttonimg/add-add.png\"  /> 发推文</a>" +
						"</div>" +
						"<br />" +
						"<div style=\"clear: left;\"></div>" +
						"" +
						"<div style=\"width:100%; margin-left: 10px;\"><a href=\"article?post=258\"> <img class=\"xin-addposts-detail-size-img\" src=\"https://s3.amazonaws.com/aiju-cloudfront-bucket/69/article/2014-12-22 02:39:12.585/post_cover.jpg\" ></img>  </a>" +
						"</div>" +
						"" +
						"<br />" +
					"</div></td>";
		/*
		 * 
		 * 
		 "<div style=\"width:30%;float:left; margin: 5% 10%;	cursor:pointer; \">" +
						"</div>" +
						"" +
						"</div>" +
						"<div style=\"width:30%;float:left; margin: 5% 10%;	cursor:pointer; \">" +
						"  </a>" +
						"</div>" +
						"<div style=\"width:30%;float:left; margin: 5% 10%;	cursor:pointer; \">" +
						"<a href=\"article?post=238\">      <img src=\"https://s3.amazonaws.com/aiju-cloudfront-bucket/69/article/2014-12-08 03:44:39.348/post_cover.jpg\" width=\"80px\" height=\"80px\"></img>  </a>" +
						"</div>" +
						
		 "<div style=\"width:5%;float:left; margin: 5% 1%;	cursor:pointer; \">" +
						"<a href=\"article?post=222\">      <img src=\"https://s3.amazonaws.com/aiju-cloudfront-bucket/28/article/2014-11-25 18:41:21.492/post_cover.jpg\" width=\"40px\" height=\"40px\"></img>  </a>" +
						"</div>" +
						"<div style=\"width:5%;float:left; margin: 5% 1%;	cursor:pointer; \">" +
						"<a href=\"article?post=238\">      <img src=\"https://s3.amazonaws.com/aiju-cloudfront-bucket/69/article/2014-12-08 03:44:39.348/post_cover.jpg\" width=\"40px\" height=\"40px\"></img>  </a>" +
						"</div>" +
		"<div style=\"width:5%;float:left; margin: 5% 1%;	cursor:pointer; \">" +
		"<a href=\"article?post=220\">      <img src=\"https://s3.amazonaws.com/aiju-cloudfront-bucket/45/article/2014-11-24 19:51:39.713/post_cover.jpg\" width=\"40px\" height=\"40px\"></img>  </a>" +
		"</div>" +
		"<div style=\"width:5%;float:left; margin: 5% 1%;	cursor:pointer; \">" +
		"<a href=\"article?post=150\">      <img src=\"https://s3.amazonaws.com/aiju-cloudfront-bucket/userD/640.jpg\"  width=\"40px\" height=\"40px\"></img>  </a>" +
		"</div>" +
		"<div style=\"width:5%;float:left; margin: 5% 1%;	cursor:pointer; \">" +
		"" +
		"</div>" +
		*/
	}
	
	return add_post_ltr;
}
function jsDate(str){
	return str.split('-').join('/');
}
$('#xin-event-time-ol li').click(function(){
	var index = $(this).attr('value');
	var liname = $(this).text();
	
	var templiname;
	$('#xin-event-time-ol li').each(function(i, li) {
		templiname = $(li).text(); 
		$(li).html("");
		
		if(i == index)
			$("*[value='"+i+"']").append("<span class=\"xin-selected-option\">"+ liname + "</span>");
		else
			$("*[value='"+i+"']").append(templiname);
	});
	
	//$("*[value='"+index+"']").html("");
	//$("*[value='"+index+"']").append("<span class=\"xin-selected-option\">"+ liname + "</span>");
});
