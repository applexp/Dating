<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import = "roti.__User"%>
<%@page import = "roti.__UserAbout"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="icon" type="image/png" href="#">
</head>
<body>
<div id="frame"> <!-- Frame starts -->
<%
	__User user = new __User();
	__UserAbout ab = (__UserAbout) request.getAttribute("userabout");
	
	user = ab.getUser();
%>
<div id="header">
	<nav id="language-bar"><ol><li><a href="#"><span class="highlight">简体</span></a></li><li><a href="../eng/index">English</a></li></ol></nav>
	<nav id="login-bar"><a href="logout">退出</a></nav>
</div>

<div id="menu">
<nav id="menu-bar"><ol><li><a href="profile">个人简介</a></li><li><a href="main?z=0&type=0">搜索</a></li><li><a href="mail">信箱</a></li></ol></nav>
</div>

<section id="main-section-left">
<div id="main-div-left">

<div id="main-left-menu">
<div id="main-left-photo"><img class="info-profile-img" src="<%= user.getProfileImagePath() %>" /></div>

<div id="info-left-btn1" class="info-link"><span class="info-link-span">编辑基本信息</span></div>
<div id="info-left-btn2" class="info-link"><span class="info-link-span">编辑个人职业</span></div>
<div id="info-left-btn3" class="info-link"><span class="info-link-span">编辑个人学历</span></div>
<div id="info-left-btn4" class="info-link"><span class="info-link-span">编辑个人喜好</span></div>
<div id="info-left-btn5" class="info-link"><span class="info-link-span">编辑找对象条件</span></div>

</div>


</div>
</section>

<section id="main-section-right" class="section-show1">
<div id="main-div-right">

<form action="info" method="post">
<input type="hidden" name="s" value="basic">
<div id="main-search">
<h3 id="basic">编辑基本信息</h3>

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
          <td class="info-td-top">名&nbsp;&nbsp;&nbsp;&nbsp;字</td>
          <td class="info-td-left"><input class="small-font" type="text" name="name" size="20" maxlength="79" value="<%= user.getName() %>" required> </td>
        </tr>
        <tr class="info-row-margin">
          <td class="info-td-top">个人签名</td>
          <td class="info-td-left"><input class="small-font" type="text" name="title" maxlength="119" size="79" value="<%= user.getTitle() %>" onkeyup="countChar1(this)">  
          <br/><div id="charNum1" style="padding-left: 5px;"></div>
          </td>
        </tr>
        <tr class="info-row-margin">
          <td class="info-td-top">详细自我介绍</td>
          <td class="info-td-left">
			<textarea class="small-font" name="self_desc" rows="20" cols="80" maxlength="1999" style="max-width:490px;min-width:90px;min-height:120px;"  onkeyup="countChar(this)"><%= user.getDesc() %></textarea> 
			<br/><div id="charNum" style="padding-left: 5px;"></div>
			</td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">感情状况</td>
          <td class="info-td-left"><select class="small-font" id="status" name="status" required><option value="" selected>- 状况 -</option><option value="1">单身</option><option value="2">恋爱中</option><option value="3">订婚</option><option value="4">已婚</option><option value="5">同性伴侣</option><option value="6">同性恋 - 同居</option><option value="7">开放式的交往关系</option><option value="8">不好说</option><option value="9">分手</option><option value="10">离婚</option><option value="11">丧偶</option></select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">感情性向</td>
          <td class="info-td-left"><select class="small-font" id="target_gender" name="target_gender" required>  <option value="" selected>- 感情性向 -</option> <option value="male" >男 ♂</option> <option value="female">女 ♀</option> </select> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">体&nbsp;&nbsp;&nbsp;&nbsp;型</td>
          <td class="info-td-left">高度(m) <input class="small-font" type="number" step="any" value="<% out.print(String.format( "%.2f", ab.getH()));%>" name="height" min="0" max="300" style="width:60px;" > 体重(kg) <input class="small-font" type="number" step="any" name="weight" min="0" max="500" value="<% out.print(String.format( "%.2f", ab.getW()));%>" style="width:60px;" > </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">国&nbsp;&nbsp;&nbsp;&nbsp;籍</td>
          <td class="info-td-left"><select class="small-font" id="nationality" name="nationality"> <option value="">- 国家 -</option> <option value="Afganistan">Afghanistan</option> <option value="Albania">Albania</option> <option value="Algeria">Algeria</option> <option value="American Samoa">American Samoa</option> <option value="Andorra">Andorra</option> <option value="Angola">Angola</option> <option value="Anguilla">Anguilla</option> <option value="Antigua &amp; Barbuda">Antigua &amp; Barbuda</option> <option value="Argentina">Argentina</option> <option value="Armenia">Armenia</option> <option value="Aruba">Aruba</option> <option value="Australia">Australia</option> <option value="Austria">Austria</option> <option value="Azerbaijan">Azerbaijan</option> <option value="Bahamas">Bahamas</option> <option value="Bahrain">Bahrain</option> <option value="Bangladesh">Bangladesh</option> <option value="Barbados">Barbados</option> <option value="Belarus">Belarus</option> <option value="Belgium">Belgium</option> <option value="Belize">Belize</option> <option value="Benin">Benin</option> <option value="Bermuda">Bermuda</option> <option value="Bhutan">Bhutan</option> <option value="Bolivia">Bolivia</option> <option value="Bonaire">Bonaire</option> <option value="Bosnia &amp; Herzegovina">Bosnia &amp; Herzegovina</option> <option value="Botswana">Botswana</option> <option value="Brazil">Brazil</option> <option value="British Indian Ocean Ter">British Indian Ocean Ter</option> <option value="Brunei">Brunei</option> <option value="Bulgaria">Bulgaria</option> <option value="Burkina Faso">Burkina Faso</option> <option value="Burundi">Burundi</option> <option value="Cambodia">Cambodia</option> <option value="Cameroon">Cameroon</option> <option value="Canada">Canada</option> <option value="Canary Islands">Canary Islands</option> <option value="Cape Verde">Cape Verde</option> <option value="Cayman Islands">Cayman Islands</option> <option value="Central African Republic">Central African Republic</option> <option value="Chad">Chad</option> <option value="Channel Islands">Channel Islands</option> <option value="Chile">Chile</option> <option value="China">China</option> <option value="Christmas Island">Christmas Island</option> <option value="Cocos Island">Cocos Island</option> <option value="Colombia">Colombia</option> <option value="Comoros">Comoros</option> <option value="Congo">Congo</option> <option value="Cook Islands">Cook Islands</option> <option value="Costa Rica">Costa Rica</option> <option value="Cote DIvoire">Cote D'Ivoire</option> <option value="Croatia">Croatia</option> <option value="Cuba">Cuba</option> <option value="Curaco">Curacao</option> <option value="Cyprus">Cyprus</option> <option value="Czech Republic">Czech Republic</option> <option value="Denmark">Denmark</option> <option value="Djibouti">Djibouti</option> <option value="Dominica">Dominica</option> <option value="Dominican Republic">Dominican Republic</option> <option value="East Timor">East Timor</option> <option value="Ecuador">Ecuador</option> <option value="Egypt">Egypt</option> <option value="El Salvador">El Salvador</option> <option value="Equatorial Guinea">Equatorial Guinea</option> <option value="Eritrea">Eritrea</option> <option value="Estonia">Estonia</option> <option value="Ethiopia">Ethiopia</option> <option value="Falkland Islands">Falkland Islands</option> <option value="Faroe Islands">Faroe Islands</option> <option value="Fiji">Fiji</option> <option value="Finland">Finland</option> <option value="France">France</option> <option value="French Guiana">French Guiana</option> <option value="French Polynesia">French Polynesia</option> <option value="French Southern Ter">French Southern Ter</option> <option value="Gabon">Gabon</option> <option value="Gambia">Gambia</option> <option value="Georgia">Georgia</option> <option value="Germany">Germany</option> <option value="Ghana">Ghana</option> <option value="Gibraltar">Gibraltar</option> <option value="Great Britain">Great Britain</option> <option value="Greece">Greece</option> <option value="Greenland">Greenland</option> <option value="Grenada">Grenada</option> <option value="Guadeloupe">Guadeloupe</option> <option value="Guam">Guam</option> <option value="Guatemala">Guatemala</option> <option value="Guinea">Guinea</option> <option value="Guyana">Guyana</option> <option value="Haiti">Haiti</option> <option value="Hawaii">Hawaii</option> <option value="Honduras">Honduras</option> <option value="Hong Kong">Hong Kong</option> <option value="Hungary">Hungary</option> <option value="Iceland">Iceland</option> <option value="India">India</option> <option value="Indonesia">Indonesia</option> <option value="Iran">Iran</option> <option value="Iraq">Iraq</option> <option value="Ireland">Ireland</option> <option value="Isle of Man">Isle of Man</option> <option value="Israel">Israel</option> <option value="Italy">Italy</option> <option value="Jamaica">Jamaica</option> <option value="Japan">Japan</option> <option value="Jordan">Jordan</option> <option value="Kazakhstan">Kazakhstan</option> <option value="Kenya">Kenya</option> <option value="Kiribati">Kiribati</option> <option value="Korea North">Korea North</option> <option value="Korea Sout">Korea South</option> <option value="Kuwait">Kuwait</option> <option value="Kyrgyzstan">Kyrgyzstan</option> <option value="Laos">Laos</option> <option value="Latvia">Latvia</option> <option value="Lebanon">Lebanon</option> <option value="Lesotho">Lesotho</option> <option value="Liberia">Liberia</option> <option value="Libya">Libya</option> <option value="Liechtenstein">Liechtenstein</option> <option value="Lithuania">Lithuania</option> <option value="Luxembourg">Luxembourg</option> <option value="Macau">Macau</option> <option value="Macedonia">Macedonia</option> <option value="Madagascar">Madagascar</option> <option value="Malaysia">Malaysia</option> <option value="Malawi">Malawi</option> <option value="Maldives">Maldives</option> <option value="Mali">Mali</option> <option value="Malta">Malta</option> <option value="Marshall Islands">Marshall Islands</option> <option value="Martinique">Martinique</option> <option value="Mauritania">Mauritania</option> <option value="Mauritius">Mauritius</option> <option value="Mayotte">Mayotte</option> <option value="Mexico">Mexico</option> <option value="Midway Islands">Midway Islands</option> <option value="Moldova">Moldova</option> <option value="Monaco">Monaco</option> <option value="Mongolia">Mongolia</option> <option value="Montserrat">Montserrat</option> <option value="Morocco">Morocco</option> <option value="Mozambique">Mozambique</option> <option value="Myanmar">Myanmar</option> <option value="Nambia">Nambia</option> <option value="Nauru">Nauru</option> <option value="Nepal">Nepal</option> <option value="Netherland Antilles">Netherland Antilles</option> <option value="Netherlands">Netherlands (Holland, Europe)</option> <option value="Nevis">Nevis</option> <option value="New Caledonia">New Caledonia</option> <option value="New Zealand">New Zealand</option> <option value="Nicaragua">Nicaragua</option> <option value="Niger">Niger</option> <option value="Nigeria">Nigeria</option> <option value="Niue">Niue</option> <option value="Norfolk Island">Norfolk Island</option> <option value="Norway">Norway</option> <option value="Oman">Oman</option> <option value="Pakistan">Pakistan</option> <option value="Palau Island">Palau Island</option> <option value="Palestine">Palestine</option> <option value="Panama">Panama</option> <option value="Papua New Guinea">Papua New Guinea</option> <option value="Paraguay">Paraguay</option> <option value="Peru">Peru</option> <option value="Phillipines">Philippines</option> <option value="Pitcairn Island">Pitcairn Island</option> <option value="Poland">Poland</option> <option value="Portugal">Portugal</option> <option value="Puerto Rico">Puerto Rico</option> <option value="Qatar">Qatar</option> <option value="Republic of Montenegro">Republic of Montenegro</option> <option value="Republic of Serbia">Republic of Serbia</option> <option value="Reunion">Reunion</option> <option value="Romania">Romania</option> <option value="Russia">Russia</option> <option value="Rwanda">Rwanda</option> <option value="St Barthelemy">St Barthelemy</option> <option value="St Eustatius">St Eustatius</option> <option value="St Helena">St Helena</option> <option value="St Kitts-Nevis">St Kitts-Nevis</option> <option value="St Lucia">St Lucia</option> <option value="St Maarten">St Maarten</option> <option value="St Pierre &amp; Miquelon">St Pierre &amp; Miquelon</option> <option value="St Vincent &amp; Grenadines">St Vincent &amp; Grenadines</option> <option value="Saipan">Saipan</option> <option value="Samoa">Samoa</option> <option value="Samoa American">Samoa American</option> <option value="San Marino">San Marino</option> <option value="Sao Tome &amp; Principe">Sao Tome &amp; Principe</option> <option value="Saudi Arabia">Saudi Arabia</option> <option value="Senegal">Senegal</option> <option value="Serbia">Serbia</option> <option value="Seychelles">Seychelles</option> <option value="Sierra Leone">Sierra Leone</option> <option value="Singapore">Singapore</option> <option value="Slovakia">Slovakia</option> <option value="Slovenia">Slovenia</option> <option value="Solomon Islands">Solomon Islands</option> <option value="Somalia">Somalia</option> <option value="South Africa">South Africa</option> <option value="Spain">Spain</option> <option value="Sri Lanka">Sri Lanka</option> <option value="Sudan">Sudan</option> <option value="Suriname">Suriname</option> <option value="Swaziland">Swaziland</option> <option value="Sweden">Sweden</option> <option value="Switzerland">Switzerland</option> <option value="Syria">Syria</option> <option value="Tahiti">Tahiti</option> <option value="Taiwan">Taiwan</option> <option value="Tajikistan">Tajikistan</option> <option value="Tanzania">Tanzania</option> <option value="Thailand">Thailand</option> <option value="Togo">Togo</option> <option value="Tokelau">Tokelau</option> <option value="Tonga">Tonga</option> <option value="Trinidad &amp; Tobago">Trinidad &amp; Tobago</option> <option value="Tunisia">Tunisia</option> <option value="Turkey">Turkey</option> <option value="Turkmenistan">Turkmenistan</option> <option value="Turks &amp; Caicos Is">Turks &amp; Caicos Is</option> <option value="Tuvalu">Tuvalu</option> <option value="Uganda">Uganda</option> <option value="Ukraine">Ukraine</option> <option value="United Arab Erimates">United Arab Emirates</option> <option value="United Kingdom">United Kingdom</option> <option value="United States of America">United States of America</option> <option value="Uraguay">Uruguay</option> <option value="Uzbekistan">Uzbekistan</option> <option value="Vanuatu">Vanuatu</option> <option value="Vatican City State">Vatican City State</option> <option value="Venezuela">Venezuela</option> <option value="Vietnam">Vietnam</option> <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option> <option value="Virgin Islands (USA)">Virgin Islands (USA)</option> <option value="Wake Island">Wake Island</option> <option value="Wallis &amp; Futana Is">Wallis &amp; Futana Is</option> <option value="Yemen">Yemen</option> <option value="Zaire">Zaire</option> <option value="Zambia">Zambia</option> <option value="Zimbabwe">Zimbabwe</option> </select> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">民&nbsp;&nbsp;&nbsp;&nbsp;族</td>
          <td class="info-td-left"><input class="small-font" type="text" name="race" value="<%= ab.getRace() %>" placeholder="汉族" size="20" > </td>
        </tr>
        
         <tr class="info-row-margin">
          <td class="info-td-top">宗教信仰</td>
          <td class="info-td-left"><input class="small-font" type="text" name="religion" value="<%= ab.getReligion() %>" placeholder="无宗教" size="20" maxlength="44"></td>
        </tr>
        
        
        
        <tr class="info-row-margin">
          <td class="info-td-top">血&nbsp;&nbsp;&nbsp;&nbsp;型</td>
          <td class="info-td-left"> <select id="bloodtype" class="small-font" name="bloodtype" > <option value="" selected="selected" >- 血型 -</option>  <option disabled>───────</option> <option value="A"> A 型 </option> <option value="B"> B 型 </option><option value="O"> O 型 </option><option value="AB"> AB 型 </option> </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">星&nbsp;&nbsp;&nbsp;&nbsp;座</td>
          <td class="info-td-left"><select id="sign" class="small-font" name="sign" > <option value="" selected="selected" >- 星座 -</option>  <option disabled>───────</option> <option value="Aries">白羊座 ♈</option> <option value="Taurus">金牛座 ♉</option> <option value="Gemini">双子座 ♊</option> <option value="Cancer">巨蟹座 ♋</option> <option value="Leo">狮子座 ♌</option> <option value="Virgo">处女座 ♍</option> <option value="Libra">天平座 ♎</option> <option value="Scorpius">天蝎座 ♏</option>  <option value="Sagittarius">射手座 ♐</option> <option value="Capricorn">摩羯座 ♑</option> <option value="Aquarius">水瓶座 ♒</option> <option value="Pisces">双鱼座 ♓</option> </select></td>
        </tr>
 
 		<tr class="info-row-margin">
          <td class="info-td-top">语&nbsp;&nbsp;&nbsp;&nbsp;言</td>
          <td class="info-td-left"><div style="width: 490px; height: auto;" ><input id="tags_1" name="language" type="text" class="tags small-font" value="<%= ab.getLanguage() %>" maxlength="199"></div></td>
        </tr>
        
        
        <tr class="info-row-margin">
          <td class="info-td-top">现居地</td>
          <td class="info-td-left"> <input id="info-location" class="small-font" type="text" name="location" value="<%= user.getCity() +", "+ user.getState() %>" size="30" readonly>  <input id="info-city" class="small-font" type="hidden" name="location_city" value="<%= user.getCity() %>" size="30" ><input id="info-state" class="small-font" type="hidden" name="location_state" value="<%= user.getState() %>" size="30"></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top"></td>
          <td class="info-td-left"> <input id="info-zipcode" class="small-font" type="number" name="postcode" placeholder="邮政编号" value="<%= user.getPostcode() %>" style="width:80px;" min="0" max="999999999" required> <select id="info-country" class="small-font"  name="country" required>   <option value="">- 国家 -</option>  <option disabled>──────────</option> <option value="United States">美国</option>   <option value="Canada">加拿大</option>   <option disabled>──────────</option>   <option value="China">中国</option>   <option value="Taiwan">台湾</option>   <option value="Hong Kong">香港</option>   <option value="Macau">澳门</option>   <option value="Singapore">新加坡</option>   <option value="Malaysia">马来西亚</option>   <option value="South Korea">韩国</option>   <option value="Japan">日本</option>   <option value="India">印度</option>   <option disabled>──────────</option>   <option value="United Kingdom">英国</option>   <option value="Germany">德国</option>   <option value="France">法国</option>   <option value="Italy">意大利</option>   <option value="Spain">西班牙</option>   <option value="Russia">俄罗斯</option>   <option value="Australia">澳大利亚</option>   <option value="New Zealand">新西兰</option>   <option value="Brazil">巴西</option>   <option value="Mexico">墨西哥</option>   </select>   <input id="update-address-btn" class="red-button small-font" type="button" value="更新现居地">  </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">家&nbsp;&nbsp;&nbsp;&nbsp;乡</td>
          <td class="info-td-left"> <input class="small-font" type="text" name="hometown" value="<%= ab.getHometown() %>" placeholder="福建莆田" size="20" maxlength="44">  </td>
        </tr>
        
      </tbody>
</table>

</div>
<input class="red-button" style="float: right; margin-right: 50px; margin-bottom: 10px;" type="submit" value="更新资料">
</form>
</div>
</section>

<section id="main-section-right" class="section-show2" style="display: none;">
<div id="main-div-right">

<form action="info" method="post">
<input type="hidden" name="s" value="job">
<div id="main-search">
<h3 id="job">编辑个人职业</h3>

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
          <td class="info-td-top">专业领域</td>
          <td class="info-td-left"><select id="profession-selector" name="profession" class="small-font"> <option value="" selected>- 专业 -</option>  <option disabled>──────────</option>  <option value="acc"> 会计/金融</option> <option value="ofc"> 管理员/办公员工</option> <option value="egr"> 建筑设计师/工程师/CAD设计</option> <option value="med"> 艺术/媒体/设计</option> <option value="bus"> 工商管理 </option> <option value="csr"> 客户服务</option> <option value="edu"> 教育</option> <option value="fbh"> 食饮/酒店管理</option> <option value="lab">一般蓝领</option> <option value="gov"> 公务员</option> <option value="hea"> 医疗保健</option> <option value="hum"> 人力资源</option> <option value="eng"> 网络工程</option> <option value="lgl"> 法律/法律助理</option> <option value="mnu"> 制造业工作</option> <option value="mar"> 行销/广告/公关</option> <option value="npo"> 非盈利机构</option> <option value="rej"> 房地产</option> <option value="rfh"> 食品零售店</option> <option value="ret"> 经营批发业</option> <option value="sls"> 销售</option> <option value="spa"> 美发/保养/健身</option> <option value="sci"> 理学/生物科技</option> <option value="sec"> 保安</option> <option value="trd"> 技术/手艺</option> <option value="sof"> 软件/软件测试/数据库管理/等等</option> <option value="sad"> 系统/网络</option> <option value="tch"> 技术支持</option> <option value="trp"> 运输业</option> <option value="tfr"> 电台/电影/摄影/广播</option> <option value="web"> 网络/HTML/网络设计</option> <option value="wri"> 写作/编辑</option> <option value="alo"> 自由职业</option> <option value="etc"> 其他</option></select></td>
        </tr>
        <tr class="info-row-margin">
          <td class="info-td-top">&nbsp;</td>
          <td class="info-td-top"><input id="profession-selector-other" class="small-font" placeholder="填写专业" type="text" value="<%= ab.getProfessionETC() %>" name="profession_other" size="20" maxlength="44" style="display:none; margin-left: -2px;"> </td>
        </tr>
      </tbody>
</table>
    
</div>
<input class="red-button" style="float: right; margin-right: 50px; margin-bottom: 10px;" type="submit" value="更新职业">
</form>
</div>
</section>

<section id="main-section-right"  class="section-show3" style="display: none;">
<div id="main-div-right">

<form action="info" method="post">
<div id="main-search">
<h3 id="edu">编辑个人学历</h3>
<input type="hidden" name="s" value="education">
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
          <td class="info-td-top">你最高学历</td>
          <td class="info-td-left"><select id="educationlevel" class="small-font" name="educationlevel" > <option value="" selected>- 学历 -</option> <option disabled>──────────</option>  <option value="1" >小学</option><option value="2">初中</option><option value="3">高中</option><option value="4">大学/学院</option><option value="5">学士</option> <option value="6">硕士</option> <option value="7">博士</option>  </select> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">高&nbsp;&nbsp;&nbsp;&nbsp;中</td>
          <td class="info-td-left"><input class="small-font" type="text" name="highschool" value="<%= ab.getHighSchool() %>" size="20" maxlength="44"> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">大学 （1）</td>
          <td class="info-td-left"><input id="c1" class="small-font" type="text" name="c1" size="20" placeholder="AB大学" value="<%= ab.getCol1() %>" maxlength="44"> 本科<input class="small-font" type="text" name="m1" size="10" placeholder="天文学" value="<%= ab.getMaj1() %>" maxlength="30"> 等级 <select id="d1" class="small-font" name="d1" > <option value="" selected>- 等级 -</option> <option disabled>───────</option> <option value="cer">文凭</option> <option value="dip">副学士</option>  <option value="deg">学士</option> <option value="mas">硕士</option> <option value="pro">博士</option> <option value="lea">中途退学</option></select></td>
        </tr>
        
        <% 
        
        	int count = ab.getTotalColleges();
        	int j;	
        
        	if(count >=2){
        		
        		for(j = 1; j < count ; j++){
        			%>
		<tr class="info-row-margin">
			<td class="info-td-top"><span class="course<%= j+1 %>" >大学 （<%= j+1 %>）</span></td>
			<td class="info-td-left" ><span id="addcourse<%= j+1 %>" style="display:none"><a href="#edu">[+] 加科目</a></span><span class="course<%= j+1 %>" ><input id="c<%= j+1 %>" class="small-font" type="text" name="c<%= j+1 %>" value="<% if(j+1 == 2) out.write(ab.getCol2()); else if(j+1 == 3) out.write(ab.getCol3()); else if(j+1 == 4) out.print(ab.getCol4()); else if(j+1 == 5) out.print(ab.getCol5()); %>" size="20" maxlength="44" required> 本科<input class="small-font" type="text" name="m<%= j+1 %>" size="10" value="<% if(j+1 == 2) out.print(ab.getMaj2()); else if(j+1 == 3) out.print(ab.getMaj3()); else if(j+1 == 4) out.print(ab.getMaj4()); else if(j+1 == 5) out.print(ab.getMaj5()); %>" maxlength="30"> 等级 <select id="d<%= j+1 %>" class="small-font" name="d<%= j+1 %>" > <option value="" selected>- 等级 -</option> <option disabled>───────</option> <option value="cer">文凭</option> <option value="dip">副学士</option>  <option value="deg">学士</option> <option value="mas">硕士</option> <option value="pro">博士</option> <option value="lea">中途退学</option></select> <span class="x-mark x-course" v="<%= j+1 %>" > <a href="#edu">&#x2717;</a></span></span> </td>
		</tr>
        			<%
        		}
        		
        		for(int k = j + 1; k<= 5 ; k++){

        			%>
        			
		<tr class="info-row-margin">
			<td class="info-td-top"><span class="course<%= k %>" style="display:none">大学 （<%= k %>）</span></td>
			<td class="info-td-left" ><span id="addcourse<%= k %>" class="course<%= k %>"  <% if(k == j + 1) out.print(""); else out.print("style=\"display:none\""); %>><a href="#edu">[+] 加科目</a></span><span class="course<%= k %>"  style="display:none"><input id="c<%= k %>" class="small-font" type="text" name="c<%= k %>" size="20" maxlength="44"> 本科<input class="small-font" type="text" name="m<%= k %>" size="10" maxlength="30"> 等级 <select id="d<%= k %>" class="small-font" name="d<%= k %>" > <option value="" selected>- 等级 -</option> <option disabled>───────</option> <option value="cer">文凭</option> <option value="dip">副学士</option>  <option value="deg">学士</option> <option value="mas">硕士</option> <option value="pro">博士</option>  <option value="lea">中途退学</option></select> <span class="x-mark x-course" v="<%= k %>" > <a href="#edu">&#x2717;</a></span></span> </td>
		</tr>
        			<%
        		}
        		
        	}else{
        		%>
		<tr class="info-row-margin">
		   <td class="info-td-top"><span class="course2" style="display:none">大学 （2）</span></td>
		   <td class="info-td-left" ><span id="addcourse2" ><a href="#edu">[+] 加科目</a></span><span class="course2" style="display:none"><input id="c2" class="small-font" type="text" name="c2" size="20" maxlength="44"> 本科<input class="small-font" type="text" name="m2" size="10" value="" maxlength="30"> 等级 <select id="d2" class="small-font" name="d2" > <option value="" selected>- 等级 -</option> <option disabled>───────</option> <option value="cer">文凭</option> <option value="dip">副学士</option>  <option value="deg">学士</option> <option value="mas">硕士</option> <option value="pro">博士</option> <option value="lea">中途退学</option></select> <span class="x-mark x-course" v="2" > <a href="#edu">&#x2717;</a></span></span> </td>
		</tr>
        		<% 
        		
        		for(int k = 3; k<= 5 ; k++){

        			%>
        			
		<tr class="info-row-margin">
			<td class="info-td-top"><span class="course<%= k %>" style="display:none">大学 （<%= k %>）</span></td>
			<td class="info-td-left" ><span id="addcourse<%= k %>" class="course<%= k %>"  style="display:none;"><a href="#edu">[+] 加科目</a></span><span class="course<%= k %>"  style="display:none"><input id="c<%= k %>" class="small-font" type="text" name="c<%= k %>" size="20" maxlength="44"> 本科<input class="small-font" type="text" name="m<%= k %>" size="10" maxlength="30"> 等级 <select id="d<%= k %>" class="small-font" name="d<%= k %>" > <option value="" selected>- 等级 -</option> <option disabled>───────</option> <option value="cer">文凭</option> <option value="dip">副学士</option>  <option value="deg">学士</option> <option value="mas">硕士</option> <option value="pro">博士</option>  <option value="lea">中途退学</option></select> <span class="x-mark x-course" v="<%= k %>" > <a href="#edu">&#x2717;</a></span></span> </td>
		</tr>
        			<%
        		}
        	} // end if 
        %>   
        
      </tbody>
</table>
</div>
<input class="red-button" style="float: right; margin-right: 50px; margin-bottom: 10px;" type="submit" value="更新学历">
</form>
</div>
</section>

<section id="main-section-right" class="section-show4" style="display: none;">
<div id="main-div-right">
<form action="info" method="post">
<div id="main-search">
<h3 id="interest">编辑个人喜好</h3>
<input type="hidden" name="s" value="interest">
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
          <td class="info-td-top">兴&nbsp;&nbsp;&nbsp;&nbsp;趣</td>
          <td class="info-td-left">	<div style="width: 490px; height: auto;" ><input id="tags_2" name="interests" type="text" class="tags small-font" value="<%= ab.getInterests() %>" maxlength="499"></div></td>
        </tr>
        
      </tbody>
</table>
</div>
<input class="red-button" style="float: right; margin-right: 50px; margin-bottom: 10px;" type="submit" value="更新喜好">
</form>
</div>
</section>

<section id="main-section-right" class="section-show5" style="display: none;">
<div id="main-div-right">
<form action="info" method="post">
<div id="main-search">
<h3 id="preference">编辑找对象条件</h3>
<input type="hidden" name="s" value="t_preferences">
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
          <td class="info-td-top">对方个子</td>
          <td class="info-td-left"><select id="t_size" class="small-font" name="t_size" > <option value="0" selected>- 个子 -</option> <option disabled>──────────</option>  <option value="1" >小个子</option><option value="2">中小个子</option><option value="3">中等</option><option value="4">中大个子</option><option value="5">大个子</option> <option value="6">秘密</option> </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">对方最低身高(m)</td>
          <td class="info-td-left"> <input class="small-font" type="number" step="any" value="<% out.print(String.format( "%.2f", ab.getTMinHeight()));%>" name="t_minheight" min="0" max="300" style="width:60px;" >  </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">对方理想年龄</td>
          <td class="info-td-left"> <select id="t_age1" class="small-font" name="t_age1"> <option value="0" >所有</option>  <option value="1">秘密</option> <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024" selected="selected">24</option>     <option value="025" >25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select>到  <select id="t_age2" class="small-font" name="t_age2"> <option value="0" >所有</option>  <option value="1">秘密</option> <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024" >24</option>     <option value="025" >25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035" selected="selected">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">对方最低学历</td>
          <td class="info-td-left"><select id="t_edu" class="small-font" name="t_edu" > <option value="" selected>- 学历 -</option> <option disabled>──────────</option>  <option value="1" >小学</option><option value="2">初中</option><option value="3">高中</option><option value="4">大学/学院</option><option value="5">学士</option> <option value="6">硕士</option> <option value="7">博士</option> <option value="8">无所谓</option> <option value="9">秘密</option> </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">对方的职业</td>
          <td class="info-td-left"><select id="profession-selector1" class="small-font" name="t_profession"> <option value="" selected>- 专业 -</option>  <option disabled>──────────</option>  <option value="acc"> 会计/金融</option> <option value="ofc"> 管理员/办公员工</option> <option value="egr"> 建筑设计师/工程师/CAD设计</option> <option value="med"> 艺术/媒体/设计</option> <option value="bus"> 工商管理 </option> <option value="csr"> 客户服务</option> <option value="edu"> 教育</option> <option value="fbh"> 食饮/酒店管理</option> <option value="lab">一般蓝领</option> <option value="gov"> 公务员</option> <option value="hea"> 医疗保健</option> <option value="hum"> 人力资源</option> <option value="eng"> 网络工程</option> <option value="lgl"> 法律/法律助理</option> <option value="mnu"> 制造业工作</option> <option value="mar"> 行销/广告/公关</option> <option value="npo"> 非盈利机构</option> <option value="rej"> 房地产</option> <option value="rfh"> 食品零售店</option> <option value="ret"> 经营批发业</option> <option value="sls"> 销售</option> <option value="spa"> 美发/保养/健身</option> <option value="sci"> 理学/生物科技</option> <option value="sec"> 保安</option> <option value="trd"> 技术/手艺</option> <option value="sof"> 软件/软件测试/数据库管理/等等</option> <option value="sad"> 系统/网络</option> <option value="tch"> 技术支持</option> <option value="trp"> 运输业</option> <option value="tfr"> 电台/电影/摄影/广播</option> <option value="web"> 网络/HTML/网络设计</option> <option value="wri"> 写作/编辑</option> <option value="alo"> 自由职业</option> <option value="etc"> 其他</option>     </select></td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">&nbsp;</td>
          <td class="info-td-top"><input id="profession-selector-other1" class="small-font" placeholder="填写专业" type="text" name="profession_other" value="<%= ab.getTProfessionETC() %>" size="20" maxlength="44" style="display:none;"> </td>
        </tr>
        
        <tr class="info-row-margin">
          <td class="info-td-top">填写对象的条件</td>
          <td class="info-td-left">
			<textarea class="small-font" name="t_desc" rows="4" cols="80" maxlength="1999" style="max-width:490px;min-width:90px;min-height:80px;"  onkeyup="countChar2(this)"><%= ab.getTDesc() %></textarea> 
			<br/><div class="small-font" id="charNum2" style="padding-left: 5px;"></div>
			</td>
        </tr>
        
      </tbody>
</table>

</div>
<input class="red-button" style="float: right; margin-right: 50px; margin-bottom: 10px;" type="submit" value="更新条件">
</form>
</div>
</section>

<div style="clear:both;"></div>
<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>
</div> <!-- Frame ends -->


<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="./../static/javascript/dating.js"></script>
<script type="text/javascript" src="./../static/javascript/jquery.animate-colors.js"></script>
<script type="text/javascript" src="./../static/javascript/jquery.tagsinput.js"></script>
<script type="text/javascript">	
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

	$('#tags_1').tagsInput({width:'485',height:'60'});

	$('#tags_2').tagsInput({width:'485',height:'140'});
	
	// Uncomment this line to see the callback functions in action
	// $('input.tags').tagsInput({onAddTag:onAddTag,onRemoveTag:onRemoveTag,onChange: onChangeTag});

	// Uncomment this line to see an input with no interface for adding new tags.
	// $('input.tags').tagsInput({interactive:false});
	}); 
</script>
<script>

$("#status option[value='<%= ab.getStatus() %>']").attr("selected","selected");
$("#target_gender option[value='<%= user.getTGender() %>']").attr("selected","selected");
$("#nationality option[value='<%= ab.getNationality() %>']").attr("selected","selected");
$("#bloodtype option[value='<%= ab.getBloodType() %>']").attr("selected","selected");
$("#sign option[value='<%= ab.getSign() %>']").attr("selected","selected");
$("#info-country option[value='<%= user.getCountry() %>']").attr("selected","selected");
$("#educationlevel option[value='<%= ab.getEducationLevel() %>']").attr("selected","selected");
$("#d1 option[value='<%= ab.getDeg1() %>']").attr("selected","selected");
$("#d2 option[value='<%= ab.getDeg2() %>']").attr("selected","selected");
$("#d3 option[value='<%= ab.getDeg3() %>']").attr("selected","selected");
$("#d4 option[value='<%= ab.getDeg4() %>']").attr("selected","selected");
$("#d5 option[value='<%= ab.getDeg5() %>']").attr("selected","selected");
$("#t_size option[value='<%= ab.getTSize() %>']").attr("selected","selected");
$("#t_age1 option[value='0<%= ab.getTMinAge() %>']").attr("selected","selected");
$("#t_age2 option[value='0<%= ab.getTMaxAge() %>']").attr("selected","selected");
$("#t_edu option[value='<%= ab.getTEduLevel() %>']").attr("selected","selected");
$("#profession-selector1 option[value='<%= ab.getTProfession() %>']").attr("selected","selected");

$( document ).ready(function() {
	
	$("#profession-selector option[value='<%= ab.getProfession() %>']").attr("selected","selected");
	var v = $( "#profession-selector option:selected").val();
	if(v == "etc"){
		$("#profession-selector-other").show(100);
		$('#profession-selector-other').prop('required',true);
	}
	
	$("#profession-selector1 option[value='<%= ab.getTProfession() %>']").attr("selected","selected");
	var v = $( "#profession-selector1 option:selected").val();
	if(v == "etc"){
		$("#profession-selector-other1").show(100);
		$('#profession-selector-other1').prop('required',true);
	}
	
	//prevent update education detail when 1st field is deleted abritary
	var no = <%= ab.getTotalColleges() %>;
	if( no >= 2)
		$('#c1').prop('required',true);
	
	//change panel color
	var page = '<%= request.getAttribute("which_section") %>';
	var isTrue = '<%= request.getAttribute("success_update") %>';
	
	
	
	if(page == 'basic'){
		
		if(isTrue == 'true'){
			
			$(".section-show1").fadeIn("slow"); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});
			$(".section-show1").css({"border-color": "#666"});
			$(".section-show1").animate({borderColor: '#eee'});
		}
	}else if(page == 'job'){
		if(isTrue == 'true'){
			$(".section-show1").fadeOut(0); 	$(".section-show2").fadeIn("slow"); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});
			$(".section-show2").css({"border-color": "#666"});
			$(".section-show2").animate({borderColor: '#eee'});
		}
	}else if(page == 'education'){
		if(isTrue == 'true'){
			$(".section-show1").fadeOut(0); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeIn("slow"); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});
			$(".section-show3").css({"border-color": "#666"});
			$(".section-show3").animate({borderColor: '#eee'});
		}
	}else if(page == 'interest'){
		if(isTrue == 'true'){
			//alert(urls[1]);
			$(".section-show1").fadeOut(0); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeIn("slow"); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});
			$(".section-show4").css({"border-color": "#666"});
			$(".section-show4").animate({borderColor: '#eee'});
		}
	}else if(page == 't_preferences'){
		if(isTrue == 'true'){
			$(".section-show1").fadeOut(0); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeIn("slow");  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});
			$(".section-show5").css({"border-color": "#666"});
			$(".section-show5").animate({borderColor: '#eee'});
		}
	}
	
	// profile & info page
	var url = $(location).attr('href');
	var urls = url.split('#');
	if(urls[1] == 'basic'){
		$(".section-show1").fadeIn("slow"); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});

	}else if(urls[1] == 'job'){
		$(".section-show1").fadeOut(0); 	$(".section-show2").fadeIn("slow"); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});

	}else if(urls[1] == 'edu'){
		$(".section-show1").fadeOut(0); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeIn("slow"); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});

	}else if(urls[1] == 'interest'){
		$(".section-show1").fadeOut(0); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeIn("slow"); 	$(".section-show5").fadeOut(0);  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"}); 	$("#info-left-btn5").css({"border-left": "", "color": "","padding-left":""});

	}else if(urls[1] == 'preference'){
		$(".section-show1").fadeOut(0); 	$(".section-show2").fadeOut(0); 	$(".section-show3").fadeOut(0); 	$(".section-show4").fadeOut(0); 	$(".section-show5").fadeIn("slow");  	$("#info-left-btn1").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn2").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn3").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn4").css({"border-left": "", "color": "","padding-left":""}); 	$("#info-left-btn5").css({"border-left": "thick solid #DD0E0E", "color": "#DD0E0E","padding-left":"25px"});

	}
});
	
      function countChar(val) {
        var len = val.value.length;
        if (len >= 1999) {
          val.value = val.value.substring(0, 1999);
        } else {
          $('#charNum').text(1999 - len);
        }
      };
      
      function countChar1(val) {
          var len = val.value.length;
          if (len >= 119) {
            val.value = val.value.substring(0, 119);
          } else {
            $('#charNum1').text(119 - len);
          }
        };
        
        function countChar2(val) {
            var len = val.value.length;
            if (len >= 1999) {
              val.value = val.value.substring(0, 1999);
            } else {
              $('#charNum2').text(1999 - len);
            }
          };
</script>

</body>
</html>