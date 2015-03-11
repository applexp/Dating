<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import = "roti.__User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="icon" type="image/png" href="#">
</head>
<body onload="onLoad()">
<div id="frame"> <!-- Frame starts -->

<div id="header">
	<nav id="language-bar"><ol><li><a href="#"><span class="highlight">简体</span></a></li><li><a href="../eng/index">English</a></li></ol></nav>
	<nav id="login-bar"><a href="logout">退出</a></nav>
</div>

<div id="menu">
<nav id="menu-bar"><ol><li><a href="profile">个人简介</a></li><li><a href="#"><span class="highlight">搜索</span></a></li><li><a href="mail">信箱</a></li></ol></nav>
</div>

<section id="main-section-left">
<div id="main-div-left">

<div id="main-left-menu">
<div id="main-left-photo"><img src="<%= request.getAttribute("imagePath") %>" /></div>

<%= request.getAttribute("name") %>
<div id="main-left-edit"><span class="break"><a href="info"><span class="small-font">编辑资料</span></a></span><span class="break"><a href="#"><span class="small-font">管理照片</span></a></span></div>
</div>

</div>
</section>

<section id="main-section-right">
<div id="main-div-right">

<div id="main-search">
<form action="main" method="post">
<div class="cover">我是 <select class="small-font" name="gender" id="gender"> <option value="m2w" selected>男寻女</option> <option value="w2m">女寻男</option> <option value="m2m">男寻男</option> <option value="w2w">女寻女</option></select> </div>
<div class="cover">年龄 <select class="small-font"  name="age" id="age" required>     <option value="0" >所有</option>   <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024" selected="selected">24</option>     <option value="025" >25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select> 到 <select  class="small-font" name="age1" id="age1" required>     <option value="0" >所有</option>     <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024">24</option>     <option value="025">25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035" selected="selected">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select></div> <input class="small-font" type="checkbox" name="picture" value="1" checked>有照片 <input class="small-font" type="checkbox" name="isOnline" value="zaixian" checked>在线  <br />
<div class="cover">国家 <select class="small-font"  name="country" required>   <option value="0">所有</option>  <option disabled>──────────</option> <option value="United States">美国</option>   <option value="Canada">加拿大</option>   <option disabled>──────────</option>   <option value="China">中国</option>   <option value="Taiwan">台湾</option>   <option value="Hong Kong">香港</option>   <option value="Macao">澳门</option>   <option value="Singapore">新加坡</option>   <option value="Malaysia">马来西亚</option>   <option value="South Korea">韩国</option>   <option value="Japan">日本</option>   <option value="India">印度</option>   <option disabled>──────────</option>   <option value="United Kingdom">英国</option>   <option value="Germany">德国</option>   <option value="France">法国</option>   <option value="Italy">意大利</option>   <option value="Spain">西班牙</option>   <option value="Russia">俄罗斯</option>   <option value="Australia">澳大利亚</option>   <option value="New Zealand">新西兰</option>   <option value="Brazil">巴西</option>   <option value="Mexico">墨西哥</option> </select> </div>
<div class="cover">州  <select class="small-font"  name="state" required>   <option value="0" selected="selected">所有</option> </select></div>
<div class="cover">名字 <input class="small-font" type="text" name="name" size="8" ></div><div class="cover">关键词 <input class="small-font" type="text" name="desc" size="20" ></div><br />
<input class="red-button" style="float: right; margin-right: 30px; margin-bottom: 10px;" type="submit" value="搜索">
<br />
</form>
</div>
<div style="clear:both;"></div>
<hr />

<% 
	List<__User> userList = new ArrayList<__User>();
	
	userList = (List <__User>) request.getAttribute("table_userList");
	String slimit = (String) request.getAttribute("limit");
	String soffset = (String) request.getAttribute("offset");
	String slooptime = (String) request.getAttribute("loop_times");
	String type = (String) request.getAttribute("type");
	String extra_link_details = (String) request.getAttribute("extra_link_detail");
	
	
	int offset = Integer.parseInt(soffset);
	double limit = Double.parseDouble(slimit);
	int ilimit = (int) limit;
	
	
	int loopTime = Integer.parseInt(slooptime);
	
	//int loopTime = (int) Math.ceil(totalrows / limit);
	
%>
<%	if(userList.size() >= 1 && userList.get(0).getUserID() != -1){ %>
<div id="main-result">

<table id="search-lover-table" data-role="table" class="ui-responsive">
      <thead>
        <tr>
          <th width="20%">&nbsp;</th>
          <th width="30%">&nbsp;</th>
          <th width="50%">&nbsp;</th>
        </tr>
      </thead>
      <tbody>
      <% for(int i = 0; i< limit && i < userList.size(); i++){ 
    	  
      %>
        <tr class="table-lover-tr">
          <td><a href="profile?id=<%= userList.get(i).getUserID() %>"><img class="photo <%= (userList.get(i).getStatus().equals("zaixian"))  ? "online" : "offline" %>" src="<%= userList.get(i).getProfileImagePath() %>" /></a></td>
          <td class="td-vertical-top move-down"><span class="break"><a href="profile?id=<%= userList.get(i).getUserID() %>"><%= userList.get(i).getName() %></a></span><span class="break"><%= userList.get(i).getGender() %> - <%= userList.get(i).getAge() %></span><span class="break"></span><span class="break"></span><span class="break"></span><span class="break"></span><span class="break"></span><span class="break"></span><span class="break"></span><span class="break"></span><span class="break"><%= userList.get(i).getCity() %>&nbsp;&nbsp;<%= userList.get(i).getState() %></span></td>
          <td class="td-vertical-top move-down"><%= (userList.get(i).getTitle() == null)  ? "" : userList.get(i).getTitle() %></td>
        </tr>
        <% 
    	  } %>
      </tbody>
    </table>

    <nav id="menu-bar"><ol>
    <% for(int j = 0; j< loopTime; j++){ 
    		if(j * ilimit == offset){
    %>
    	<li><a href="main?z=<%= j * ilimit %>&type=<%= (type.equals("0"))  ? "0" : "1"+ extra_link_details %>"><span class="highlight"><%= j+1 %></span></a></li>
    <%		}else{
    	%>
    	<li><a href="main?z=<%= j * ilimit %>&type=<%= (type.equals("1"))  ? "1"+ extra_link_details : "0" %>"><%= j+1 %></a></li>
    <% 		}
    	} //end of for loop
    %>
    </ol></nav>
   
</div>
 <%	} // if no record
    %>
    
</div>
</section>
<div style="clear:both;"></div>
<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="./../static/javascript/dating.js"></script>
<script>
   var timer = 0;
   var PERIOD_VISIBLE = 60000;
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
		  var userid = $("#your-id").val();
		  var type = 'updateMailBoxTotal';
		  //alert(userid);
		  $.post('others',{type:type, input1:userid},function(data) {
			  //alert(data);
		  });
	}
</script>
</body>
</html>