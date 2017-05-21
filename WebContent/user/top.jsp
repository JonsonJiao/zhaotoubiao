<%@page import="factory.MessageFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<body>
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
				HttpSession sess =request.getSession();
				String name = "";
				if(sess.getAttribute("User")!=null){
				name = 	(String)sess.getAttribute("User");
			%>
				欢迎<%=name %>登录交易猫！
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
				<a href="out.jsp"> 注销 |</a>
			<%
				int count =MessageFactory.get().NoSee(name);
			%>
				<a href="showMessage.jsp">消息[<font color="red"><%=count %></font>]</a>
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
			<from>
				<input class="text" type ="text" name ="search">
				<input class="button" type="submit" value="搜索">
			</from>
		</div>
	</div>
</div>

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
</body>
</html>