<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/title.css">
	<link rel="stylesheet" type="text/css" href="css/sell.css">
	<title>交易猫_手机游戏交易平台</title>
</head>

<body>
	<script type="text/javascript" src="js/logo.js"></script>
	<div class="top">
		<div class="topinclude">
			<div class="topleft">
				<ul>
					<li>
						<b>电脑版</b>
					</li>
					<li>
						<a href="#">手机版</a>
					</li>
				</ul>
			</div>
			<div class='topright'>
				<ul>
					<li>
					<% 
						String listIndex = request.getParameter("listIndex");
						HttpSession sess =request.getSession();
						String name = "";
						if(sess.getAttribute("User")!=null){
						name = 	(String)sess.getAttribute("User");
					%>
						欢迎<%=name %>登录交易猫
					<%}else{
					%>
						您好 欢迎访问交易猫
					<%
						}
					%>
					</li>
					<li>
					<% 
						if(sess.getAttribute("User")!=null){
					%>
						<a href="out.jsp">注销</a>
					<%
						}else{
					%>
						<a href="login.jsp">登录</a>
					<%
						}
					%>
					</li>
					<li>
						<a href="showBuyOrder.jsp"> 购买记录 |</a>
					</li>
					<li>
						<a href="geRenZhongXin.jsp"> 个人中心 |</a>
					</li>
					<li>
						<a href="#" onmouseover="over()" onmouseout="out()">
							<div id="image2"><img src="./image/icons.png"></div>
							<div id="image1"><img src="./image/icons.png"></div>
							<span class="download">下载APP</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="logo">
		<div class="logoinclude">
			<div class="logopic">
				<img src="./image/logo.png">
				<img src="./image/logo2.png">
			</div>
			<div class="search">
				<form>
					<input class="text" type="text" name="search">
					<input class="button" type="submit" value="搜索">
				</form>
			</div>
		</div>
	</div>

	<div class="navigation">
<div class="navigation">
	<div class="navigationinclude">
		<input type="radio" id="radio_control_1" name="radio_set" checked="checked" />
		<a href="../shouYe.jsp"><span class="word">首页</span></a>
		<input type="radio" id="radio_control_2" name="radio_set" />
		<a href="showMessage.jsp"><span class="word">站内信</span></a>
		<input type="radio" id="radio_control_3" name="radio_set" />
		<a href="../allProduct.jsp"><span class="word">商品</span></a>
		<input type="radio" id="radio_control_4" name="radio_set" />
		<a href="#"><span class="word">游戏专区</span></a>
		<input type="radio" id="radio_control_5" name="radio_set" />
		<a href="geRenZhongXin.jsp"><span class="word">个人中心</span></a>
		<input type="radio" id="radio_control_6" name="radio_set" />
		<a href="main.jsp"><span class="word">客服中心</span></a>
	</div>
</div>

	<div class="sell">
		<div class="progress">
			<span>选择游戏类型</span><span>填写游戏信息</span><span>发布成功</span>
		</div>
		<div class="sellInclude">
			<section>
				<span>常用分类：</span>
				<form action="">
					<select name="" id="">
						<option value="请选择">请选择</option>
					</select>
				</form>
			</section>

			<section>
				<s:form action="UpdateProduct" validate="true">
					<fieldset>
						<legend>出售商品信息</legend>
					<ul>
						<li>
							商品名称<s:textfield class="text"  name="productName"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>productName</s:param>
		        			</s:fielderror>
						</li>
						<li>
							<input  name="own" type="hidden" value="<%=name%>"/>
							<input  name="listIndex" type="hidden" value="<%=listIndex%>"/>
						</li>
						<li>
							账&nbsp;&nbsp;&nbsp;&nbsp;号<s:textfield class="text"  name="account"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>account</s:param>
		        			</s:fielderror>
						</li>
						<li>
							密&nbsp;&nbsp;&nbsp;&nbsp;码<s:textfield class="text"  name="password"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>password</s:param>
		        			</s:fielderror>
						</li>
						<li>
							所属游戏<s:textfield class="text"  name="game"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>game</s:param>
		        			</s:fielderror>
						</li>
						<li>
							操作系统<s:textfield class="text"  name="system"/>		
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>system</s:param>
		        			</s:fielderror>			
						</li>
						<li>
							等&nbsp;&nbsp;&nbsp;&nbsp;级<s:textfield class="text"  name="level"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>level</s:param>
		        			</s:fielderror>
						</li>
						<li>
							价&nbsp;&nbsp;&nbsp;&nbsp;格<s:textfield class="text"  name="price"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>price</s:param>
		        			</s:fielderror>
						</li>
						<li>
							描&nbsp;&nbsp;&nbsp;&nbsp;述<s:textarea  class="text" cols="70" rows="3"   name="information"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>information</s:param>
		        			</s:fielderror>
						</li>
						<li>
							<s:submit class="button"   value="出售"/>
						</li>
					</ul>
					</fieldset>
				</s:form>
			</section>
		</div>
	</div>

	<div class="footer">
		<div class="footerInclude">
			<ul>
				<li>
					<span>新手入门</span><br>
					<a href="#">免费注册</a><br>
					<a href="#">如何购买商品</a><br>
					<a href="#">如何发布商品</a>
				</li>
				<li>
					<span>诚信服务</span><br>
					<a href="#">用户协议</a><br>
					<a href="#">免责声明</a><br>
					<a href="#">7*24小时服务</a>
				</li>
				<li>
					<span>交易保障</span><br>
					<a href="#">寄售交易</a><br>
					<a href="#">支付宝交易</a><br>
					<a href="#">建议与投诉</a>
				</li>
				<li>
					<span>售后服务</span><br>
					<a href="#">联系客服</a>
				</li>
				<li>
					<span>友情链接</span><br>
					<a href="#">九游游戏</a>
				</li>
			</ul>
			<span class="span1">Copyright © 2013 jiaoyimao.com    版权所有    ICP证：粤ICP备13009613号-2 </span>
		</div>
	</div>
</body>

</html>