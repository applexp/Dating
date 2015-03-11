<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import = "roti.__Mail"%>
<%@page import = "roti.__MailMsg"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>信箱</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="stylesheet" type="text/css" href="./../static/nano.css">
<link rel="stylesheet" type="text/css" href="./../static/nanotxt.css">
<link rel="icon" type="image/png" href="#">
</head>
<body onload="onLoad()">
<div id="frame"> <!-- Frame starts -->

<%
	List<__Mail> mailList = new ArrayList<__Mail>();
	List<__MailMsg> msgList = new ArrayList<__MailMsg>();
	
	//String userImagePath = (String) request.getAttribute("userphotopath");
	String suid = (String) request.getAttribute("yourid");
	String isHighlight = (String) request.getAttribute("highlight");
	//String username = (String) request.getAttribute("yourname");
	int userID = Integer.parseInt(suid);
	mailList = (List <__Mail>) request.getAttribute("mailList");
	msgList = (List <__MailMsg>) request.getAttribute("messageList");
%>
<div id="header">
	<nav id="language-bar"><ol><li><a href="#"><span class="highlight">简体</span></a></li><li><a href="../eng/index">English</a></li></ol></nav>
	<nav id="login-bar"><a href="logout">退出</a></nav>
</div>

<div id="menu">
<nav id="menu-bar"><ol><li><a href="profile">个人简介</a></li><li><a href="main?z=0&type=0">搜索</a></li><li><a href="#"><span class="highlight">信箱</span></a></li></ol></nav>
</div>


<section id="main-section-left">
<div id="main-div-left">

<div id="main-left-menu">
<div id="about" class="nano">
    <div class="nano-content">
    
<table id="mail-table-list" >
    
    <%
    	for(int i = 0 ; i < mailList.size(); i++){
    		if(userID != mailList.get(i).getLoverID()){
    %>
    <tr class="mail-click-tr <%= (i == 0)?"highlight-clicktr":"" %>" uid="<%= mailList.get(i).getMailID() %>" title="<%= mailList.get(i).getLoverName() %>" cid="<%= mailList.get(i).getCoupleID() %>" index="<%= i %>">
    <td id="mail-left-photo"  ><img  src="<%= mailList.get(i).getLoverPicture() %>" /></td>
    <td ><div id="mail-left-edit"  ><a  href="#" ><%= mailList.get(i).getLoverName() %></a><br/><%= (mailList.get(i).getNotViewTotalReplyA() != 0)? "<span class=\"not-read-amount\" >" +mailList.get(i).getNotViewTotalReplyA()+" <img class=\"not-read-mail-icon\" src=\"./../media/lovemail.png\" /></span>":"" %></div></td>
	</tr>
	<%
    		}else{
    			%>
    <tr class="mail-click-tr <%= (i == 0)?"highlight-clicktr":"" %>" uid="<%= mailList.get(i).getMailID() %>" title="<%= mailList.get(i).getUserName() %>"  cid="<%= mailList.get(i).getCoupleID() %>" index="<%= i %>">
    <td id="mail-left-photo" ><img src="<%= mailList.get(i).getUserPicture() %>" /></td>
    <td ><div id="mail-left-edit"><a href="#" title="<%= mailList.get(i).getUserName() %>" ><%= mailList.get(i).getUserName() %></a><br/><%= (mailList.get(i).getNotViewTotalReplyB() != 0)? "<span class=\"not-read-amount\" >"+mailList.get(i).getNotViewTotalReplyB()+" <img class=\"not-read-mail-icon\" src=\"./../media/lovemail.png\" /></span>":"" %></div></td>
	</tr>
    			<%
    		}
    	} //end of mail list
	%>
</table>


	</div>
   </div>
</div>
</div>
</section>

<section id="mailbox-section-right" class="mailbox-section">
<div id="mail-div-right">


<div id="main-search" >
<h3 id="h3-name"><% if(mailList.size() != 0){  if(userID != mailList.get(0).getUserID()){ out.print(mailList.get(0).getUserName());}else if(userID != mailList.get(0).getLoverID()){out.print(mailList.get(0).getLoverName());}else{out.print("");} }else{ out.print("");} %>  &#187; <% if(mailList.size() != 0){  if(userID == mailList.get(0).getUserID()){ out.print(mailList.get(0).getUserName());}else if(userID == mailList.get(0).getLoverID()){out.print(mailList.get(0).getLoverName());}else{out.print("");} }else{ out.print("");} %></h3>

<hr />
<div id="about" class="nano-text">
    <div class="nano-content">
<table id="msg-table-tr">
	<%
	if(userID != -1){
		for(int j = 0; j< msgList.size(); j++){
			if(userID == msgList.get(j).getReplyUserID()){
	%>
	<tr  id="cbox<%= j %>"  class="spaceUnder">
	<td>
	<table>
	
		<tr>
		<td class="reply-td-text-left"  width="550px"><span class="reply-td-span-text-left"><%= msgList.get(j).getMessage() %></span> </td>
		<td class="reply-td-img"><a href="profile"><img class="info-profile-img" src="<%= (msgList.get(j).getReplyUserID() == mailList.get(0).getLoverID())? mailList.get(0).getLoverPicture(): mailList.get(0).getUserPicture() %>" width="50px" height="50px" /></a></td>
		</tr>
		<tr>
		<td colspan="2" style="text-align: right;"><%= msgList.get(j).getReplyTime() %></td>
		</tr>
	</table>
	</td>
	</tr>	
	<%
			}else{
				%>
	<tr id="cbox<%= j %>"  class="spaceUnder">
	<td>
		<table>
			
			<tr>
			<td class="reply-td-img"><a href="profile?id=<% if(userID != mailList.get(0).getUserID()){ out.print(mailList.get(0).getUserID());}else if(userID != mailList.get(0).getLoverID()){out.print(mailList.get(0).getLoverID());} %>" ><img class="info-profile-img" src="<%= (msgList.get(j).getReplyUserID() == mailList.get(0).getLoverID())? mailList.get(0).getLoverPicture() : mailList.get(0).getUserPicture() %>" width="50px" height="50px" /></a></td>
			<td class="reply-td-text-right" width="550px"><%= msgList.get(j).getMessage() %></td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: right;"><%= msgList.get(j).getReplyTime() %></td>
			</tr>
		</table>
	</td>
	</tr>
				<%
			}
		} //end of message list
	}//end of -1 statement
	%>
	
	
</table>

   </div>
</div>
<br />
</div>


</div>
</section>


<%
	if(mailList.size() != 0){
%>
<section id="reply-section-right">
<div id="">

<div id="main-search" >

<input type="hidden" id="replyidfrombox" name="replyidfrombox" value="<%= suid %>"> <input type="hidden" id="mailidfrombox" name="mailidfrombox" value="<%= msgList.get(0).getMailID() %>">
<input type="hidden" id="cidfrombox" name="cidfrombox" value="<%= mailList.get(0).getCoupleID() %>">
<input type="hidden" id="tnamefrombox" name="tnamefrombox" value="<%= mailList.get(0).getLoverName() %>">
<input type="hidden" id="indexfrombox" name="indexfrombox" value="0">
<table>
<tr>
<th width="6%">&nbsp;</th>
<th width="94%">&nbsp;</th>
</tr>
<tr>
<td class="info-td-top">文字</td>
<td class="info-td-left"><textarea class="small-font" id="replymsgfrombox" name="replymsgfrombox" rows="5" cols="40" maxlength="1999" style="max-width:620px;min-width:620px;min-height:40px;"  onkeyup="countChar(this)"></textarea> <br/><div id="charNum" style="padding-left: 5px;"></div></td>
</tr>
</table>
<input id="replymailbutton" class="red-button small-font" style="float: right; margin-right: 40px; margin-bottom: 10px;" type="button" value="回复">
</div>


</div>
</section>

<%
	} // end if (mailList != 0)
%>

<div style="clear:both;"></div>
<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="./../static/javascript/jquery.animate-colors.js"></script>
<script src="./../static/javascript/dating.js"></script>
<script src="./../static/javascript/nano.js"></script>
<script>
$(".nano").nanoScroller();
$(".nano-text").nanoScroller();
$(".nano-text").nanoScroller({ scroll: 'bottom' });

function countChar(val) {
    var len = val.value.length;
    if (len >= 1999) {
      val.value = val.value.substring(0, 1999);
    } else {
      $('#charNum').text(1999 - len);
    }
  };
  
  
  
  
</script>
<script>
   var timer = 0;
   var PERIOD_VISIBLE = 3000;
   var PERIOD_NOT_VISIBLE = 300000;

   function onLoad() {
       timer = setInterval(updateMailBox, (document.hidden) ? PERIOD_NOT_VISIBLE : PERIOD_VISIBLE);
       if(document.addEventListener) document.addEventListener("visibilitychange", visibilityChanged);
   }

   function visibilityChanged() {
       clearTimeout(timer);
       timer = setInterval(updateMailBox, (document.hidden) ? PERIOD_NOT_VISIBLE : PERIOD_VISIBLE);
   }

   function updateMailBox(){
	  
	   
		var mid = $('.highlight-clicktr').attr("uid");
		var tname = $('.highlight-clicktr').attr("title");
		var cid = $('.highlight-clicktr').attr("cid");
		var index = $('.highlight-clicktr').attr("index");
		
		var textTopValue = $(".nano-text .nano-content").scrollTop();
		redrawT(mid,tname,cid,index,textTopValue);

	}
   
   function isScrolledIntoView(elem)
   {
       var docViewTop = $(window).scrollTop();
       var docViewBottom = docViewTop + $(window).height();

       var elemTop = $(elem).offset().top;
       var elemBottom = elemTop + $(elem).height();

       return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
   }
</script>
</body>
</html>