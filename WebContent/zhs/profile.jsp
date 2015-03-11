<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import = "roti.__User"%>
<%@page import = "roti.__UserAbout"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人简介</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="icon" type="image/png" href="#">
</head>
<body onload="onLoad()">
<div id="frame"> <!-- Frame starts -->
<%
	__User user = new __User();
	__UserAbout ab = (__UserAbout) request.getAttribute("userabout");
	String yourProfile = (String)request.getAttribute("yourprofile");
	
	user = ab.getUser();
%>

<div id="header">
	<nav id="language-bar"><ol><li><a href="#"><span class="highlight">简体</span></a></li><li><a href="../eng/index">English</a></li></ol></nav>
	<nav id="login-bar"><a href="logout">退出</a></nav>
</div>

<div id="menu">
<nav id="menu-bar"><ol><li><a href="<%= (yourProfile.equals("true")) ? "#":"profile" %>"><span class="highlight">个人简介</span></a></li><li><a href="main?z=0&type=0">搜索</a></li><li><a href="mail">信箱</a></li></ol></nav>
</div>

<section id="main-section-left">
<div id="main-div-left">

<div id="main-left-menu">
<div id="main-left-photo"><img class="info-profile-img" src="<%= user.getProfileImagePath() %>" /></div>

<%
	if(yourProfile.equals("false")){
%>
<div id="profile-left-btn1" class="info-link"><span class="info-link-span">留言</span></div>
<div id="profile-left-btn2" class="info-link"><span class="info-link-span">列入黑名单</span></div>
<%	}//end if
%>
</div>
</div>
</section>

<%
	if(yourProfile.equals("false")){
%>
<section id="profile-reply-section-right" class="reply-mail-section-panel" style="display: none;">
<div id="reply-div-right">

<div id="main-search" >
<form action="firsttimemail" method="post">
<input id="your-id" type="hidden" name="yourid" value="<%= request.getAttribute("yourid") %>"> <input type="hidden" name="loverid" value="<%= request.getAttribute("loverid") %>"> <input type="hidden" name="loverpicturepath" value="<%= user.getProfileImagePath() %>">
<input type="hidden" name="lovername" value="<%= user.getName() %>"> 
<table>
<tr>
<th width="12%">&nbsp;</th>
<th width="88%">&nbsp;</th>
</tr>
<tr>
<td class="info-td-top">首次留言</td>
<td class="info-td-left"><textarea class="small-font" name="reply" rows="5" cols="40" maxlength="1999" style="max-width:580px;min-width:580px;min-height:40px;"  onkeyup="countChar(this)"></textarea> <br/><div id="charNum" style="padding-left: 5px;"></div></td>
</tr>
</table>
<input class="red-button small-font" style="float: right; margin-right: 10px; margin-bottom: 10px;" type="submit" value="发送">
</form>
</div>
</div>
</section>
<%
	}
%>

<section id="main-section-right" class="profile-panel">
<div id="main-div-right">

<div id="main-search" >
<h3>简介 <%= ((yourProfile.equals("true"))) ? "<span id=\"profile-edit1\" style=\"float: right; font-size: 12px; display:none;\"><a href=\"info#basic\">[编辑]</a></span>" : "" %></h3>
<hr />
<table id="info-table" data-role="table" class="ui-responsive">
      <thead>
        <tr>
          <th width="16%">&nbsp;</th>
          <th width="84%">&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        <tr class="info-row-margin">
          <td class="profile-td-top">名&nbsp;&nbsp;&nbsp;&nbsp;字</td>
          <td class="profile-td-left"><%= user.getName() %></td>
        </tr>
        <tr class="info-row-margin">
          <td class="profile-td-top">个人签名</td>
          <td class="profile-td-left"><%= user.getTitle() %></td>
        </tr>
        <tr class="info-row-margin">
          <td class="profile-td-top">详细自我介绍</td>
          <td class="profile-td-left" ><%= user.getDesc() %></td>
        </tr>
        <tr class="info-row-margin">
          <td class="profile-td-top">性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
          <td class="profile-td-left" id="g-td"><select class="small-font" id="gender" name="target_gender" style="display: none;" required>  <option value="" selected>- 感情性向 -</option> <option value="male" >男 ♂</option> <option value="female">女 ♀</option> </select></td>
        </tr>
        <tr class="info-row-margin">
          <td class="profile-td-top">年&nbsp;&nbsp;&nbsp;&nbsp;龄</td>
          <td class="profile-td-left" ><%= user.getAge() %></td>
        </tr>
        <tr class="info-row-margin">
          <td class="profile-td-top">感情状况</td>
          <td class="profile-td-left" id="status-td"><select class="small-font" id="status" name="status" style="display: none;" required><option value="" selected>- 状况 -</option><option value="1">单身</option><option value="2">恋爱中</option><option value="3">订婚</option><option value="4">已婚</option><option value="5">同性伴侣</option><option value="6">同性恋 - 同居</option><option value="7">开放式的交往关系</option><option value="8">不好说</option><option value="9">分手</option><option value="10">离婚</option><option value="11">丧偶</option></select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">感情性向</td>
          <td class="profile-td-left" id="tg-td"><select class="small-font" id="target_gender" name="target_gender" style="display: none;" required>  <option value="" selected>- 感情性向 -</option> <option value="male" >男 ♂</option> <option value="female">女 ♀</option> </select> </td>
        </tr>
        <%
        DecimalFormat dformat = new DecimalFormat("###.00");
        
        %>
        <tr class="info-row-margin">
          <td class="profile-td-top">高&nbsp;&nbsp;&nbsp;&nbsp;度</td>
          <td class="profile-td-left"><% out.print(String.format( "%.2f", ab.getH())); %> 米</td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">体&nbsp;&nbsp;&nbsp;&nbsp;重(kg)</td>
          <td class="profile-td-left"><% out.print(String.format( "%.2f", ab.getW())); %> 公斤</td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">国&nbsp;&nbsp;&nbsp;&nbsp;籍</td>
          <td class="profile-td-left" id="nationality-td"><select class="small-font" id="nationality" name="nationality" style="display: none;"> <option value="">- 国家 -</option> <option value="Afganistan">Afghanistan</option> <option value="Albania">Albania</option> <option value="Algeria">Algeria</option> <option value="American Samoa">American Samoa</option> <option value="Andorra">Andorra</option> <option value="Angola">Angola</option> <option value="Anguilla">Anguilla</option> <option value="Antigua &amp; Barbuda">Antigua &amp; Barbuda</option> <option value="Argentina">Argentina</option> <option value="Armenia">Armenia</option> <option value="Aruba">Aruba</option> <option value="Australia">Australia</option> <option value="Austria">Austria</option> <option value="Azerbaijan">Azerbaijan</option> <option value="Bahamas">Bahamas</option> <option value="Bahrain">Bahrain</option> <option value="Bangladesh">Bangladesh</option> <option value="Barbados">Barbados</option> <option value="Belarus">Belarus</option> <option value="Belgium">Belgium</option> <option value="Belize">Belize</option> <option value="Benin">Benin</option> <option value="Bermuda">Bermuda</option> <option value="Bhutan">Bhutan</option> <option value="Bolivia">Bolivia</option> <option value="Bonaire">Bonaire</option> <option value="Bosnia &amp; Herzegovina">Bosnia &amp; Herzegovina</option> <option value="Botswana">Botswana</option> <option value="Brazil">Brazil</option> <option value="British Indian Ocean Ter">British Indian Ocean Ter</option> <option value="Brunei">Brunei</option> <option value="Bulgaria">Bulgaria</option> <option value="Burkina Faso">Burkina Faso</option> <option value="Burundi">Burundi</option> <option value="Cambodia">Cambodia</option> <option value="Cameroon">Cameroon</option> <option value="Canada">Canada</option> <option value="Canary Islands">Canary Islands</option> <option value="Cape Verde">Cape Verde</option> <option value="Cayman Islands">Cayman Islands</option> <option value="Central African Republic">Central African Republic</option> <option value="Chad">Chad</option> <option value="Channel Islands">Channel Islands</option> <option value="Chile">Chile</option> <option value="China">China</option> <option value="Christmas Island">Christmas Island</option> <option value="Cocos Island">Cocos Island</option> <option value="Colombia">Colombia</option> <option value="Comoros">Comoros</option> <option value="Congo">Congo</option> <option value="Cook Islands">Cook Islands</option> <option value="Costa Rica">Costa Rica</option> <option value="Cote DIvoire">Cote D'Ivoire</option> <option value="Croatia">Croatia</option> <option value="Cuba">Cuba</option> <option value="Curaco">Curacao</option> <option value="Cyprus">Cyprus</option> <option value="Czech Republic">Czech Republic</option> <option value="Denmark">Denmark</option> <option value="Djibouti">Djibouti</option> <option value="Dominica">Dominica</option> <option value="Dominican Republic">Dominican Republic</option> <option value="East Timor">East Timor</option> <option value="Ecuador">Ecuador</option> <option value="Egypt">Egypt</option> <option value="El Salvador">El Salvador</option> <option value="Equatorial Guinea">Equatorial Guinea</option> <option value="Eritrea">Eritrea</option> <option value="Estonia">Estonia</option> <option value="Ethiopia">Ethiopia</option> <option value="Falkland Islands">Falkland Islands</option> <option value="Faroe Islands">Faroe Islands</option> <option value="Fiji">Fiji</option> <option value="Finland">Finland</option> <option value="France">France</option> <option value="French Guiana">French Guiana</option> <option value="French Polynesia">French Polynesia</option> <option value="French Southern Ter">French Southern Ter</option> <option value="Gabon">Gabon</option> <option value="Gambia">Gambia</option> <option value="Georgia">Georgia</option> <option value="Germany">Germany</option> <option value="Ghana">Ghana</option> <option value="Gibraltar">Gibraltar</option> <option value="Great Britain">Great Britain</option> <option value="Greece">Greece</option> <option value="Greenland">Greenland</option> <option value="Grenada">Grenada</option> <option value="Guadeloupe">Guadeloupe</option> <option value="Guam">Guam</option> <option value="Guatemala">Guatemala</option> <option value="Guinea">Guinea</option> <option value="Guyana">Guyana</option> <option value="Haiti">Haiti</option> <option value="Hawaii">Hawaii</option> <option value="Honduras">Honduras</option> <option value="Hong Kong">Hong Kong</option> <option value="Hungary">Hungary</option> <option value="Iceland">Iceland</option> <option value="India">India</option> <option value="Indonesia">Indonesia</option> <option value="Iran">Iran</option> <option value="Iraq">Iraq</option> <option value="Ireland">Ireland</option> <option value="Isle of Man">Isle of Man</option> <option value="Israel">Israel</option> <option value="Italy">Italy</option> <option value="Jamaica">Jamaica</option> <option value="Japan">Japan</option> <option value="Jordan">Jordan</option> <option value="Kazakhstan">Kazakhstan</option> <option value="Kenya">Kenya</option> <option value="Kiribati">Kiribati</option> <option value="Korea North">Korea North</option> <option value="Korea Sout">Korea South</option> <option value="Kuwait">Kuwait</option> <option value="Kyrgyzstan">Kyrgyzstan</option> <option value="Laos">Laos</option> <option value="Latvia">Latvia</option> <option value="Lebanon">Lebanon</option> <option value="Lesotho">Lesotho</option> <option value="Liberia">Liberia</option> <option value="Libya">Libya</option> <option value="Liechtenstein">Liechtenstein</option> <option value="Lithuania">Lithuania</option> <option value="Luxembourg">Luxembourg</option> <option value="Macau">Macau</option> <option value="Macedonia">Macedonia</option> <option value="Madagascar">Madagascar</option> <option value="Malaysia">Malaysia</option> <option value="Malawi">Malawi</option> <option value="Maldives">Maldives</option> <option value="Mali">Mali</option> <option value="Malta">Malta</option> <option value="Marshall Islands">Marshall Islands</option> <option value="Martinique">Martinique</option> <option value="Mauritania">Mauritania</option> <option value="Mauritius">Mauritius</option> <option value="Mayotte">Mayotte</option> <option value="Mexico">Mexico</option> <option value="Midway Islands">Midway Islands</option> <option value="Moldova">Moldova</option> <option value="Monaco">Monaco</option> <option value="Mongolia">Mongolia</option> <option value="Montserrat">Montserrat</option> <option value="Morocco">Morocco</option> <option value="Mozambique">Mozambique</option> <option value="Myanmar">Myanmar</option> <option value="Nambia">Nambia</option> <option value="Nauru">Nauru</option> <option value="Nepal">Nepal</option> <option value="Netherland Antilles">Netherland Antilles</option> <option value="Netherlands">Netherlands (Holland, Europe)</option> <option value="Nevis">Nevis</option> <option value="New Caledonia">New Caledonia</option> <option value="New Zealand">New Zealand</option> <option value="Nicaragua">Nicaragua</option> <option value="Niger">Niger</option> <option value="Nigeria">Nigeria</option> <option value="Niue">Niue</option> <option value="Norfolk Island">Norfolk Island</option> <option value="Norway">Norway</option> <option value="Oman">Oman</option> <option value="Pakistan">Pakistan</option> <option value="Palau Island">Palau Island</option> <option value="Palestine">Palestine</option> <option value="Panama">Panama</option> <option value="Papua New Guinea">Papua New Guinea</option> <option value="Paraguay">Paraguay</option> <option value="Peru">Peru</option> <option value="Phillipines">Philippines</option> <option value="Pitcairn Island">Pitcairn Island</option> <option value="Poland">Poland</option> <option value="Portugal">Portugal</option> <option value="Puerto Rico">Puerto Rico</option> <option value="Qatar">Qatar</option> <option value="Republic of Montenegro">Republic of Montenegro</option> <option value="Republic of Serbia">Republic of Serbia</option> <option value="Reunion">Reunion</option> <option value="Romania">Romania</option> <option value="Russia">Russia</option> <option value="Rwanda">Rwanda</option> <option value="St Barthelemy">St Barthelemy</option> <option value="St Eustatius">St Eustatius</option> <option value="St Helena">St Helena</option> <option value="St Kitts-Nevis">St Kitts-Nevis</option> <option value="St Lucia">St Lucia</option> <option value="St Maarten">St Maarten</option> <option value="St Pierre &amp; Miquelon">St Pierre &amp; Miquelon</option> <option value="St Vincent &amp; Grenadines">St Vincent &amp; Grenadines</option> <option value="Saipan">Saipan</option> <option value="Samoa">Samoa</option> <option value="Samoa American">Samoa American</option> <option value="San Marino">San Marino</option> <option value="Sao Tome &amp; Principe">Sao Tome &amp; Principe</option> <option value="Saudi Arabia">Saudi Arabia</option> <option value="Senegal">Senegal</option> <option value="Serbia">Serbia</option> <option value="Seychelles">Seychelles</option> <option value="Sierra Leone">Sierra Leone</option> <option value="Singapore">Singapore</option> <option value="Slovakia">Slovakia</option> <option value="Slovenia">Slovenia</option> <option value="Solomon Islands">Solomon Islands</option> <option value="Somalia">Somalia</option> <option value="South Africa">South Africa</option> <option value="Spain">Spain</option> <option value="Sri Lanka">Sri Lanka</option> <option value="Sudan">Sudan</option> <option value="Suriname">Suriname</option> <option value="Swaziland">Swaziland</option> <option value="Sweden">Sweden</option> <option value="Switzerland">Switzerland</option> <option value="Syria">Syria</option> <option value="Tahiti">Tahiti</option> <option value="Taiwan">Taiwan</option> <option value="Tajikistan">Tajikistan</option> <option value="Tanzania">Tanzania</option> <option value="Thailand">Thailand</option> <option value="Togo">Togo</option> <option value="Tokelau">Tokelau</option> <option value="Tonga">Tonga</option> <option value="Trinidad &amp; Tobago">Trinidad &amp; Tobago</option> <option value="Tunisia">Tunisia</option> <option value="Turkey">Turkey</option> <option value="Turkmenistan">Turkmenistan</option> <option value="Turks &amp; Caicos Is">Turks &amp; Caicos Is</option> <option value="Tuvalu">Tuvalu</option> <option value="Uganda">Uganda</option> <option value="Ukraine">Ukraine</option> <option value="United Arab Erimates">United Arab Emirates</option> <option value="United Kingdom">United Kingdom</option> <option value="United States of America">United States of America</option> <option value="Uraguay">Uruguay</option> <option value="Uzbekistan">Uzbekistan</option> <option value="Vanuatu">Vanuatu</option> <option value="Vatican City State">Vatican City State</option> <option value="Venezuela">Venezuela</option> <option value="Vietnam">Vietnam</option> <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option> <option value="Virgin Islands (USA)">Virgin Islands (USA)</option> <option value="Wake Island">Wake Island</option> <option value="Wallis &amp; Futana Is">Wallis &amp; Futana Is</option> <option value="Yemen">Yemen</option> <option value="Zaire">Zaire</option> <option value="Zambia">Zambia</option> <option value="Zimbabwe">Zimbabwe</option> </select> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">民&nbsp;&nbsp;&nbsp;&nbsp;族</td>
          <td class="profile-td-left"><%= ab.getRace() %></td>
        </tr>
        
         <tr class="info-row-margin">
          <td class="profile-td-top">宗教信仰</td>
          <td class="profile-td-left"><%= ab.getReligion() %></td>
        </tr>
        
        
        
        <tr class="info-row-margin">
          <td class="profile-td-top">血&nbsp;&nbsp;&nbsp;&nbsp;型</td>
          <td class="profile-td-left" id="bloodtype-td"> <select id="bloodtype" class="small-font" name="bloodtype" style="display: none;"> <option value="" selected="selected" >- 血型 -</option>  <option disabled>───────</option> <option value="A"> A 型 </option> <option value="B"> B 型 </option><option value="O"> O 型 </option><option value="AB"> AB 型 </option> </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">星&nbsp;&nbsp;&nbsp;&nbsp;座</td>
          <td class="profile-td-left" id="sign-td"><select id="sign" class="small-font" name="sign" style="display: none;"> <option value="" selected="selected" >- 星座 -</option>  <option disabled>───────</option> <option value="Aries">白羊座 ♈</option> <option value="Taurus">金牛座 ♉</option> <option value="Gemini">双子座 ♊</option> <option value="Cancer">巨蟹座 ♋</option> <option value="Leo">狮子座 ♌</option> <option value="Virgo">处女座 ♍</option> <option value="Libra">天平座 ♎</option> <option value="Scorpius">天蝎座 ♏</option>  <option value="Sagittarius">射手座 ♐</option> <option value="Capricorn">摩羯座 ♑</option> <option value="Aquarius">水瓶座 ♒</option> <option value="Pisces">双鱼座 ♓</option> </select></td>
        </tr>
 
 		<tr class="info-row-margin">
          <td class="profile-td-top">语&nbsp;&nbsp;&nbsp;&nbsp;言</td>
          <td class="profile-td-left"><%= ab.getLanguage() %></td>
        </tr>
        
        
        <tr class="info-row-margin">
          <td class="profile-td-top">现居地</td>
          <td class="profile-td-left"><%= user.getCity() %>, <%= user.getState() %>, <span id="country-td"></span><select id="info-country" class="small-font"  name="country" style="display: none;" required>   <option value="">- 国家 -</option>  <option disabled>──────────</option> <option value="United States">美国</option>   <option value="Canada">加拿大</option>   <option disabled>──────────</option>   <option value="China">中国</option>   <option value="Taiwan">台湾</option>   <option value="Hong Kong">香港</option>   <option value="Macau">澳门</option>   <option value="Singapore">新加坡</option>   <option value="Malaysia">马来西亚</option>   <option value="South Korea">韩国</option>   <option value="Japan">日本</option>   <option value="India">印度</option>   <option disabled>──────────</option>   <option value="United Kingdom">英国</option>   <option value="Germany">德国</option>   <option value="France">法国</option>   <option value="Italy">意大利</option>   <option value="Spain">西班牙</option>   <option value="Russia">俄罗斯</option>   <option value="Australia">澳大利亚</option>   <option value="New Zealand">新西兰</option>   <option value="Brazil">巴西</option>   <option value="Mexico">墨西哥</option>   </select> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">家&nbsp;&nbsp;&nbsp;&nbsp;乡</td>
          <td class="profile-td-left"><%= ab.getHometown() %></td>
        </tr>
        
      </tbody>
      
      <tfoot>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tfoot>
    </table>
</div>

<div id="main-search" >
<h3>职业信息 <%= ((yourProfile.equals("true"))) ? "<span id=\"profile-edit2\" style=\"float: right; font-size: 12px; display:none;\"><a href=\"info#job\">[编辑]</a></span>" : "" %></h3>

<hr />
<table id="info-table" data-role="table" class="ui-responsive">
      <thead>
        <tr>
          <th width="16%">&nbsp;</th>
          <th width="84%">&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        <tr class="info-row-margin">
          <td class="profile-td-top">专业领域</td>
          <td class="profile-td-left" id="profession-td"><select id="profession-selector" name="profession" class="small-font" style="display:none;"> <option value="" selected>- 专业 -</option>  <option disabled>──────────</option>  <option value="acc"> 会计/金融</option> <option value="ofc"> 管理员/办公员工</option> <option value="egr"> 建筑设计师/工程师/CAD设计</option> <option value="med"> 艺术/媒体/设计</option> <option value="bus"> 工商管理 </option> <option value="csr"> 客户服务</option> <option value="edu"> 教育</option> <option value="fbh"> 食饮/酒店管理</option> <option value="lab">一般蓝领</option> <option value="gov"> 公务员</option> <option value="hea"> 医疗保健</option> <option value="hum"> 人力资源</option> <option value="eng"> 网络工程</option> <option value="lgl"> 法律/法律助理</option> <option value="mnu"> 制造业工作</option> <option value="mar"> 行销/广告/公关</option> <option value="npo"> 非盈利机构</option> <option value="rej"> 房地产</option> <option value="rfh"> 食品零售店</option> <option value="ret"> 经营批发业</option> <option value="sls"> 销售</option> <option value="spa"> 美发/保养/健身</option> <option value="sci"> 理学/生物科技</option> <option value="sec"> 保安</option> <option value="trd"> 技术/手艺</option> <option value="sof"> 软件/软件测试/数据库管理/等等</option> <option value="sad"> 系统/网络</option> <option value="tch"> 技术支持</option> <option value="trp"> 运输业</option> <option value="tfr"> 电台/电影/摄影/广播</option> <option value="web"> 网络/HTML/网络设计</option> <option value="wri"> 写作/编辑</option> <option value="alo"> 自由职业</option> <option value="etc"> 其他</option></select></td>
        </tr>
      </tbody>
      
       <tfoot>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tfoot>
</table>
</div>

<div id="main-search" >
<h3>学历信息 <%= ((yourProfile.equals("true"))) ? "<span id=\"profile-edit3\" style=\"float: right; font-size: 12px; display:none;\"><a href=\"info#edu\">[编辑]</a></span>" : "" %></h3>

<hr />
<table id="info-table" data-role="table" class="ui-responsive">
      <thead>
        <tr>
          <th width="16%">&nbsp;</th>
          <th width="84%">&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        <tr class="info-row-margin">
          <td class="profile-td-top">你最高学历</td>
          <td class="profile-td-left" id="educationlevel-td"><select id="educationlevel" class="small-font" name="educationlevel" style="display:none;"> <option value="" selected>- 学历 -</option> <option disabled>──────────</option>  <option value="1" >小学</option><option value="2">初中</option><option value="3">高中</option><option value="4">大学/学院</option><option value="5">学士</option> <option value="6">硕士</option> <option value="7">博士</option>  </select> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">高&nbsp;&nbsp;&nbsp;&nbsp;中</td>
          <td class="profile-td-left"><%= ab.getHighSchool() %></td>
        </tr>
        
        <%	int max = ab.getTotalColleges();
        
        	for(int j = 1; j<= max; j++){
        %>
        <tr class="info-row-margin">
          <td class="profile-td-top">大学 （<%= j %>）</td>
          <td class="profile-td-left"><table id="" data-role="table" class="ui-responsive" style="margin-left:-1px; border-collapse:collapse;">
        <thead>
        <tr>
          <th width="260px" style="display: none;">&nbsp;</th>
          <th width="160px" style="display: none;">&nbsp;</th>
          <th width="50px" style="display: none;">&nbsp;</th>
        </tr>
        </thead>
        
        <tbody>
        <tr>
        <td width="260px" style="vertical-align: top;"><% if(j == 1) out.write(ab.getCol1()); else if(j == 2) out.write(ab.getCol2()); else if(j == 3) out.write(ab.getCol3()); else if(j == 4) out.print(ab.getCol4()); else if(j == 5) out.print(ab.getCol5()); %></td>
        <td width="160px" style="vertical-align: top;"><% if(j == 1) out.print(ab.getMaj1()); else if(j == 2) out.print(ab.getMaj2()); else if(j == 3) out.print(ab.getMaj3()); else if(j == 4) out.print(ab.getMaj4()); else if(j == 5) out.print(ab.getMaj5()); %></td>
        <td width="50px" style="vertical-align: top;" id="d<%= j %>-td"><select id="d<%= j %>" class="small-font" name="d<%= j %>" style="display: none;"> <option value="" selected>- 等级 -</option> <option disabled>───────</option> <option value="cer">文凭</option> <option value="dip">副学士</option>  <option value="deg">学士</option> <option value="mas">硕士</option> <option value="pro">博士</option> <option value="lea">中途退学</option></select></td>
        </tr>
        </tbody>
        </table>
        </tr>
        <%
        	} //end of loop
        %>
      </tbody>
      
       <tfoot>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tfoot>
</table>
</div>



<div id="main-search" >
<h3>喜好信息 <%= ((yourProfile.equals("true"))) ? "<span id=\"profile-edit4\" style=\"float: right; font-size: 12px; display:none;\"><a href=\"info#interest\">[编辑]</a></span>" : "" %></h3>

<hr />
<table id="info-table" data-role="table" class="ui-responsive">
      <thead>
        <tr>
          <th width="16%">&nbsp;</th>
          <th width="84%">&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        <tr class="info-row-margin">
          <td class="profile-td-top">兴&nbsp;&nbsp;&nbsp;&nbsp;趣</td>
          <td class="profile-td-left"><%= ab.getInterests() %></td>
        </tr>
        
      </tbody>
      
       <tfoot>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tfoot>
</table>
</div>

<div id="main-search" >
<h3>找对象条件 <%= ((yourProfile.equals("true"))) ? "<span id=\"profile-edit5\" style=\"float: right; font-size: 12px; display:none;\"><a href=\"info#preference\">[编辑]</a></span>" : "" %></h3>

<hr />
<table id="info-table" data-role="table" class="ui-responsive">
      <thead>
        <tr>
          <th width="16%">&nbsp;</th>
          <th width="84%">&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        <tr class="info-row-margin">
          <td class="profile-td-top">对方个子</td>
          <td class="profile-td-left" id="tsize-td"><select id="t_size" class="small-font" name="t_size" style="display: none;" > <option value="0" selected>- 个子 -</option> <option disabled>──────────</option>  <option value="1" >小个子</option><option value="2">中小个子</option><option value="3">中等</option><option value="4">中大个子</option><option value="5">大个子</option> <option value="6">秘密</option> </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">对方最低身高</td>
          <td class="profile-td-left"><% out.print(String.format( "%.2f", ab.getTMinHeight() )); %> 米</td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">对方理想年龄</td>
          <td class="profile-td-left" ><span  id="tage1-td"></span> <select id="t_age1" class="small-font" name="t_age1" style="display: none;"> <option value="0" >所有</option>  <option value="1">保密</option> <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024" selected="selected">24</option>     <option value="025" >25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select>到  <span  id="tage2-td"></span> <select id="t_age2" class="small-font" name="t_age2" style="display: none;"> <option value="0" >所有</option>  <option value="1">保密</option> <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024" >24</option>     <option value="025" >25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035" selected="selected">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">对方最低学历</td>
          <td class="profile-td-left" id="teducationlevel-td"><select id="t_edu" class="small-font" name="t_edu"  style="display: none;"> <option value="" selected>- 学历 -</option> <option disabled>──────────</option>  <option value="1" >小学</option><option value="2">初中</option><option value="3">高中</option><option value="4">大学/学院</option><option value="5">学士</option> <option value="6">硕士</option> <option value="7">博士</option> <option value="8">无所谓</option> <option value="9">秘密</option> </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">对方的职业</td>
          <td class="profile-td-left" id="tprofession-td"><select id="profession-selector1" class="small-font" name="t_profession"  style="display: none;"> <option value="" selected>- 专业 -</option>  <option disabled>──────────</option>  <option value="acc"> 会计/金融</option> <option value="ofc"> 管理员/办公员工</option> <option value="egr"> 建筑设计师/工程师/CAD设计</option> <option value="med"> 艺术/媒体/设计</option> <option value="bus"> 工商管理 </option> <option value="csr"> 客户服务</option> <option value="edu"> 教育</option> <option value="fbh"> 食饮/酒店管理</option> <option value="lab">一般蓝领</option> <option value="gov"> 公务员</option> <option value="hea"> 医疗保健</option> <option value="hum"> 人力资源</option> <option value="eng"> 网络工程</option> <option value="lgl"> 法律/法律助理</option> <option value="mnu"> 制造业工作</option> <option value="mar"> 行销/广告/公关</option> <option value="npo"> 非盈利机构</option> <option value="rej"> 房地产</option> <option value="rfh"> 食品零售店</option> <option value="ret"> 经营批发业</option> <option value="sls"> 销售</option> <option value="spa"> 美发/保养/健身</option> <option value="sci"> 理学/生物科技</option> <option value="sec"> 保安</option> <option value="trd"> 技术/手艺</option> <option value="sof"> 软件/软件测试/数据库管理/等等</option> <option value="sad"> 系统/网络</option> <option value="tch"> 技术支持</option> <option value="trp"> 运输业</option> <option value="tfr"> 电台/电影/摄影/广播</option> <option value="web"> 网络/HTML/网络设计</option> <option value="wri"> 写作/编辑</option> <option value="alo"> 自由职业</option> <option value="etc"> 其他</option>     </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="profile-td-top">填写对象的条件</td>
          <td class="profile-td-left"><%= ab.getTDesc() %></td>
        </tr>
        
      </tbody>
       <tfoot>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tfoot>
</table>
</div>

</div>
</section>
<input id="your-id" type="hidden" name="yourid" value="<%= request.getAttribute("yourid") %>">



<div style="clear:both;"></div>
<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="./../static/javascript/dating.js"></script>
<script>
	var status = $("#status option[value='<%= ab.getStatus() %>']").attr("selected","selected").text();
	var tg = $("#target_gender option[value='<%= user.getTGender() %>']").attr("selected","selected").text();
	var g = $("#target_gender option[value='<%= user.getGender() %>']").attr("selected","selected").text();
	var nationality = $("#nationality option[value='<%= ab.getNationality() %>']").attr("selected","selected").text();
	var bloodtype = $("#bloodtype option[value='<%= ab.getBloodType() %>']").attr("selected","selected").text();
	var sign = $("#sign option[value='<%= ab.getSign() %>']").attr("selected","selected").text();
	var country = $("#info-country option[value='<%= user.getCountry() %>']").attr("selected","selected").text();
	var edulvl = $("#educationlevel option[value='<%= ab.getEducationLevel() %>']").attr("selected","selected").text();
	var d1 = $("#d1 option[value='<%= ab.getDeg1() %>']").attr("selected","selected").text();
	var d2 = $("#d2 option[value='<%= ab.getDeg2() %>']").attr("selected","selected").text();
	var d3 = $("#d3 option[value='<%= ab.getDeg3() %>']").attr("selected","selected").text();
	var d4 = $("#d4 option[value='<%= ab.getDeg4() %>']").attr("selected","selected").text();
	var d5 = $("#d5 option[value='<%= ab.getDeg5() %>']").attr("selected","selected").text();
	var tsize = $("#t_size option[value='<%= ab.getTSize() %>']").attr("selected","selected").text();
	var tminage = $("#t_age1 option[value='0<%= ab.getTMinAge() %>']").attr("selected","selected").text();
	var tmaxage = $("#t_age2 option[value='0<%= ab.getTMaxAge() %>']").attr("selected","selected").text();
	var tedulvl = $("#t_edu option[value='<%= ab.getTEduLevel() %>']").attr("selected","selected").text();
	
	$("#status-td").html(status);
	$("#tg-td").html(tg);
	$("#g-td").html(g);
	$("#nationality-td").html(nationality);
	$("#bloodtype-td").html(bloodtype);
	$("#sign-td").html(sign);
	$("#country-td").html(country);
	$("#educationlevel-td").html(edulvl);
	$("#d1-td").html(d1);
	$("#d2-td").html(d2);
	$("#d3-td").html(d3);
	$("#d4-td").html(d4);
	$("#d5-td").html(d5);
	$("#tsize-td").html(tsize);
	$("#tage1-td").html(tminage);
	$("#tage2-td").html(tmaxage);
	$("#teducationlevel-td").html(tedulvl);
	
	var etc_value = "<%= ab.getProfessionETC() %>";
	var tetc_value = "<%= ab.getTProfessionETC() %>";
		
	var v = $("#profession-selector option[value='<%= ab.getProfession() %>']").attr("selected","selected").val();
		
	if(v == "etc"){
		$("#profession-td").html(etc_value);
	}else{
		$("#profession-td").html($("#profession-selector option[value='<%= ab.getProfession() %>']").attr("selected","selected").text());
	}

	var v1 = $("#profession-selector1 option[value='<%= ab.getTProfession() %>']").attr("selected","selected").val();
	if(v1 == "etc"){
		$("#tprofession-td").html(tetc_value);
	}else{
		$("#tprofession-td").html($("#profession-selector1 option[value='<%= ab.getTProfession() %>']").attr("selected","selected").text());
	}
	
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