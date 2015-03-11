<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="./../static/dating.css">
<link rel="icon" type="image/png" href="#">
</head>
<body>
<div id="frame"> <!-- Frame starts -->

<div id="header">
	<nav id="language-bar"><ol><li><a href="#"><span class="highlight">简体</span></a></li><li><a href="../eng/index">English</a></li></ol></nav>
	<nav id="login-bar"><a href="index">首页</a></nav>
</div>

<div id="logo">
</div>

<div id="menu">
<nav id="menu-bar"><ol><li><a href="profile">个人资料</a></li><li><a href="#"><span class="highlight">搜索</span></a></li><li><a href="mail">信箱</a></li></ol></nav>
</div>

<section id="main-section-left">
<div id="main-div-left">

<div id="main-left-menu">
<div id="main-left-photo"><img src="./../media/dufu.jpg" /></div>

杜甫
<div id="main-left-edit"><span class="break"><a href="#"><span class="small-font">编辑资料</span></a></span><span class="break"><a href="#"><span class="small-font">管理照片</span></a></span></div>
</div>

</div>
</section>

<section id="main-section-right">
<div id="main-div-right">

<div id="main-search">
<form action="#" method="get">
<div class="cover">我是 <select class="small-font" name="gender" id="gender"> <option value="m2w" selected>男寻女</option> <option value="w2m">女寻男</option> <option value="m2m">男寻男</option> <option value="w2w">女寻女</option></select> </div>
<div class="cover">年龄 <select class="small-font"  name="age" id="age" required>     <option value="" >- 年龄 -</option>   <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024" selected="selected">24</option>     <option value="025" >25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select> 到 <select  class="small-font" name="age1" id="age1" required>     <option value="" >- 年龄 -</option>     <option value="018">18</option>     <option value="019">19</option>     <option value="020">20</option>     <option value="021">21</option>     <option value="022">22</option>     <option value="023">23</option>     <option value="024">24</option>     <option value="025">25</option>     <option value="026">26</option>     <option value="027">27</option>     <option value="028">28</option>     <option value="029">29</option>     <option value="030">30</option>     <option value="031">31</option>     <option value="032">32</option>     <option value="033">33</option>     <option value="034">34</option>     <option value="035" selected="selected">35</option>     <option value="036">36</option>     <option value="037">37</option>     <option value="038">38</option>     <option value="039">39</option>     <option value="040">40</option>     <option value="041">41</option>     <option value="042">42</option>     <option value="043">43</option>     <option value="044">44</option>     <option value="045">45</option>     <option value="046">46</option>     <option value="047">47</option>     <option value="048">48</option>     <option value="049">49</option>     <option value="050">50</option>     <option value="051">51</option>     <option value="052">52</option>     <option value="053">53</option>     <option value="054">54</option>     <option value="055">55</option>     <option value="056">56</option>     <option value="057">57</option>     <option value="058">58</option>     <option value="059">59</option>     <option value="050">50</option>     <option value="061">61</option>     <option value="062">62</option>     <option value="063">63</option>     <option value="064">64</option>     <option value="065">65</option>     <option value="066">66</option>     <option value="067">67</option>     <option value="068">68</option>     <option value="069">69</option>     <option value="070">70</option>     <option value="071">71</option>     <option value="072">72</option>     <option value="073">73</option>     <option value="074">74</option>     <option value="075">75</option></select></div> <input class="small-font" type="checkbox" name="picture" value="picture" checked>有照片  <input class="small-font" type="checkbox" name="isOnline" value="isOnline" >在线  <br />
<div class="cover">国家 <select class="small-font"  name="country" required>   <option value="all">所有</option>  <option disabled>──────────</option> <option value="United States">美国</option>   <option value="Canada">加拿大</option>   <option disabled>──────────</option>   <option value="China">中国</option>   <option value="Taiwan">台湾</option>   <option value="Hong Kong">香港</option>   <option value="Macao">澳门</option>   <option value="Singapore">新加坡</option>   <option value="Malaysia">马来西亚</option>   <option value="South Korea">韩国</option>   <option value="Japan">日本</option>   <option value="India">印度</option>   <option disabled>──────────</option>   <option value="United Kingdom">英国</option>   <option value="Germany">德国</option>   <option value="France">法国</option>   <option value="Italy">意大利</option>   <option value="Spain">西班牙</option>   <option value="Russia">俄罗斯</option>   <option value="Australia">澳大利亚</option>   <option value="New Zealand">新西兰</option>   <option value="Brazil">巴西</option>   <option value="Mexico">墨西哥</option>   <option disabled>──────────</option>   <option value="Asia">亚洲</option>   <option value="North America">北美洲</option>   <option value="South America">南美洲</option>   <option value="Europe">欧洲</option>   <option value="Africa">非洲</option>   <option value="Oceania">大洋洲</option> </select> </div>
<div class="cover">州  <select class="small-font"  name="country" required>   <option value="all" selected="selected">所有</option> </select></div>
<div class="cover">名字 <input class="small-font"  id="name" type="text" name="name" size="8" ></div><div class="cover">关键词 <input class="small-font"  id="name" type="text" name="name" size="20" ></div><br />
<input class="red-button" style="float: right; margin-right: 30px; margin-bottom: 10px;" type="submit" value="搜索">
<br />
</form>
</div>
<div style="clear:both;"></div>
<hr />

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
        <tr class="table-lover-tr">
          <td><img class="photo" src="./../media/zhugeliang.jpg" /></td>
          <td class="td-vertical-top move-down"><span class="break">诸葛亮</span><span class="break">男 - 31</span></td>
          <td class="td-vertical-top move-down">三个臭比讲，顶个诸葛亮</td>
        </tr>
        <tr class="table-lover-tr">
          <td><img class="photo" src="./../media/diaochan.jpg" /></td>
          <td class="td-vertical-top move-down"><span class="break">貂蝉</span><span class="break">女 - 22</span></td>
          <td class="td-vertical-top move-down">曹操未得志，先誘董卓，進貂蟬以惑其君。</td>
          
        </tr>
        <tr class="table-lover-tr">
          <td><img class="photo" src="./../media/libai.jpg" /></td>
          <td class="td-vertical-top move-down"><span class="break">李白</span><span class="break">男 - 41</span></td>
          <td class="td-vertical-top move-down">天生我材必有用，千金散尽还复来。</td>
          
        </tr>
        <tr class="table-lover-tr">
          <td><img class="photo" src="./../media/guanyu.jpg" /></td>
          <td class="td-vertical-top move-down"><span class="break">关羽</span><span class="break">男 - 32</span></td>
          <td class="td-vertical-top move-down">五虎上将</td>
          
        </tr>
        <tr class="table-lover-tr">
          <td><img class="photo" src="./../media/wuzetian.jpg" /></td>
          <td class="td-vertical-top move-down"><span class="break">武则天</span><span class="break">女 - 46</span></td>
          <td class="td-vertical-top move-down">中国历史上唯一一个正统的女皇帝</td>
          
        </tr>
        <tr class="table-lover-tr">
          <td><img class="photo" src="./../media/sudongpo.jpg" /></td>
          <td class="td-vertical-top move-down"><span class="break">苏东坡</span><span class="break">男 - 39</span></td>
          <td class="td-vertical-top move-down">一个朋字两个月， 一样颜色霜和雪； 不知哪个月下霜， 不知哪个月下雪。 一个官员马上接着吟道： 一个出字两重山， 一样颜色煤和炭； 不知哪座山出煤， 不知哪庄山出炭。 知府杨贵也摇头晃脑地吟道： 一个吕字两个口， 一样颜色茶和酒； 不知哪张口喝茶， 不知哪张口喝酒。 这时，苏东坡吟道： 一个二字两个一， 一样颜色龟和鳖； 不知哪一个是龟， 不知哪一个是鳖。 </td>
          
        </tr>
      </tbody>
    </table>
</div>

</div>
</section>
<div style="clear:both;"></div>

<section id="register-frame">


<div id="register-panel">
<h4>注册新账户</h4>
<form action="register" method="post">
<table>
	<tr>
		<td>名字 </td> 
		<td> <input id="name" type="text" name="name" size="32" maxlength="79" oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')" required> </td>
	</tr>
	<tr>
		<td>出生年份</td> 
		<td> <select name="month" required> <option value="">- 月份 - </option> <option value="1">1</option> <option value="2">2</option><option value="3">3</option> <option value="4">4</option>  <option value="5">5</option>  <option value="6">6</option>  <option value="7">7</option>  <option value="8">8</option>  <option value="9">9</option>  <option value="10">10</option> <option value="11">11</option> <option value="12">12</option> </select> <select name="year" required> <option value="">- 年份 -</option> <option value="1996">1996</option> 	<option value="1995">1995</option> 	<option value="1994">1994</option> 	<option value="1993">1993</option> 	<option value="1992">1992</option> 	<option value="1991">1991</option> 	<option value="1990">1990</option> 	<option value="1989">1989</option> 	<option value="1988">1988</option> 	<option value="1987">1987</option> 	<option value="1986">1986</option> 	<option value="1985">1985</option> 	<option value="1984">1984</option> 	<option value="1983">1983</option> 	<option value="1982">1982</option> 	<option value="1981">1981</option> 	<option value="1980">1980</option> 	<option value="1979">1979</option> 	<option value="1978">1978</option> 	<option value="1977">1977</option> 	<option value="1976">1976</option> 	<option value="1975">1975</option> 	<option value="1974">1974</option> 	<option value="1973">1973</option> 	<option value="1972">1972</option> 	<option value="1971">1971</option> 	<option value="1970">1970</option> 	<option value="1969">1969</option> 	<option value="1968">1968</option> 	<option value="1967">1967</option> 	<option value="1966">1966</option> 	<option value="1965">1965</option> 	<option value="1964">1964</option> 	<option value="1963">1963</option> 	<option value="1962">1962</option> 	<option value="1961">1961</option> 	<option value="1960">1960</option> 	<option value="1959">1959</option> 	<option value="1958">1958</option> 	<option value="1957">1957</option> 	<option value="1956">1956</option> 	<option value="1955">1955</option> 	<option value="1954">1954</option> 	<option value="1953">1953</option> 	<option value="1952">1952</option> 	<option value="1951">1951</option> 	<option value="1950">1950</option> 	<option value="1949">1949</option> 	<option value="1948">1948</option> 	<option value="1947">1947</option> 	<option value="1946">1946</option> 	<option value="1945">1945</option> 	<option value="1944">1944</option> 	<option value="1943">1943</option> 	<option value="1942">1942</option> 	<option value="1941">1941</option> 	<option value="1940">1940</option> 	<option value="1939">1939</option> 	<option value="1938">1938</option> 	<option value="1937">1937</option> 	<option value="1936">1936</option> 	<option value="1935">1935</option> 	<option value="1934">1934</option> 	<option value="1933">1933</option> 	<option value="1932">1932</option> 	<option value="1931">1931</option> 	<option value="1930">1930</option> 	<option value="1929">1929</option> 	<option value="1928">1928</option> 	<option value="1927">1927</option> 	<option value="1926">1926</option> 	<option value="1925">1925</option> 	<option value="1924">1924</option> 	<option value="1923">1923</option> 	<option value="1922">1922</option> 	<option value="1921">1921</option> 	<option value="1920">1920</option> 	<option value="1919">1919</option> 	<option value="1918">1918</option> 	<option value="1917">1917</option> 	<option value="1916">1916</option> 	<option value="1915">1915</option> 	<option value="1914">1914</option> 	<option value="1913">1913</option> 	<option value="1912">1912</option> 	<option value="1911">1911</option> 	<option value="1910">1910</option> 	<option value="1909">1909</option> 	<option value="1908">1908</option> 	<option value="1907">1907</option> 	<option value="1906">1906</option> 	<option value="1905">1905</option> 	<option value="1904">1904</option> 	<option value="1903">1903</option> 	<option value="1902">1902</option> 	<option value="1901">1901</option> 	<option value="1900">1900</option> </select> </td>
	</tr>
	<tr>
		<td>现居国家</td> 
		<td> <select name="country" required>
  <option value="">- 国家 -</option>
  <option disabled>──────────</option>
  <option value="United States">美国</option>
  <option value="Canada">加拿大</option>
  <option disabled>──────────</option>
  <option value="China">中国</option>
  <option value="Taiwan">台湾</option>
  <option value="Hong Kong">香港</option>
  <option value="Macau">澳门</option>
  <option value="Singapore">新加坡</option>
  <option value="Malaysia">马来西亚</option>
  <option value="South Korea">韩国</option>
  <option value="Japan">日本</option>
  <option value="India">印度</option>
  <option disabled>──────────</option>
  <option value="United Kingdom">英国</option>
  <option value="Germany">德国</option>
  <option value="France">法国</option>
  <option value="Italy">意大利</option>
  <option value="Spain">西班牙</option>
  <option value="Russia">俄罗斯</option>
  <option disabled>──────────</option>
  <option value="Australia">澳大利亚</option>
  <option value="New Zealand">新西兰</option>
  <option disabled>──────────</option>
  <option value="Brazil">巴西</option>
  <option value="Mexico">墨西哥</option>
</select>  </td> 
	</tr>
	<tr>
		<td>邮政编号 </td> 
		<td> <input id="postcode" type="number" name="postcode" size="32" min="0" max="999999999" oninvalid="this.setCustomValidity('无效')" oninput="setCustomValidity('')" required> </td>
	</tr>
	<tr>
		<td>密码</td> 
		<td> <input type="password" name="password" size="32" maxlength="30" required> </td> 
	</tr>
	<tr>
		<td><input type="hidden" name="g1" value="<%= request.getAttribute("g1") %>"><input type="hidden" name="g2" value="<%= request.getAttribute("g2") %>"><input type="hidden" name="email" value="<%= request.getAttribute("email") %>"></td>
		<td><input type="submit" value="注册"></td>
	</tr>
</table>
</form>
</div>
</section>

<footer>
<p><a href="about"><small>关于我们</small></a> &middot; <small>版权所有  © 2014</small></p>
</footer>

</div> <!-- Frame ends -->

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script>
$('html, body').css({
    'overflow': 'hidden',
    'height': '100%'
});
$("#register-panel").dblclick(function() {
	$( "#register-panel" ).effect( "shake" );
});
</script>

</body>
</html>