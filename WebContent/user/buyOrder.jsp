<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="factory.BuyOrderFactory"%>
<%@page import="vo.BuyOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/showBuyOrder.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/sellOrder.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<a href="out.jsp"> 注销 |</a>
			<%
				int count =MessageFactory.get().NoSee(name);
			%>
				<a href="showMessage.jsp">消息[<font color="red"><%=count %></font>]</a>
			<%
				}else{
			%>
				<a href="register.jsp"> 注册 |</a>
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

<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>订单详情</span>
</div>

<div class="management">
	<div class="managementInclude">
		<div class="managementLeft">
			<br>
			<%
				User user = UserFactory.get().findById(name);
			%>
			<span class="title">登录用户信息</span>
			<hr>
			<span>账号：<%=user.getName()%></span><br>
			<span>QQ号码：<%=user.getQq()%></span><br>
			<span>手机号码：<%=user.getPhone()%></span><br>
			<a href="updateUser.jsp"><span>修改用户信息</span></a><br><br>
			<span class="title">我是买家</span>
			<hr>			
			<a href="allProduct.jsp"><span>我要买</span></a><br>
			<a href="showBuyOrder.jsp"><span>查看我的订单</span></a><br>
			<span class="title">我是卖家</span>		
			<hr>
			<a href="sell.jsp"><span>我要卖</span></a>			
			<a href="showProduct.jsp"><span>管理我的商品</span></a>			
			<a href="showSellOrder.jsp"><span>查看我的订单</span></a>
		</div>
		<%
			String listIndex = request.getParameter("listIndex");
			BuyOrder buyOrder = null;
			buyOrder = BuyOrderFactory.get().findById(listIndex);
			if(buyOrder!=null){
		
		%>
		<div class="managementRight">
			<div class="search">
				<span>订单号：<%=buyOrder.getListIndex() %></span>
				<hr>
				<ul>
					<li><span class="title">订单详情</span></li>
					<li>商品名称：<%=buyOrder.getOrderName() %></li>
					<li>所属游戏：<%=buyOrder.getGame() %></li>
					<li>购买价格：<%=buyOrder.getPrice() %></li>
					<li>完成时间：<%=buyOrder.getTime() %></li>
					<li>目前状态： <%=buyOrder.getState() %></li>
					<li>账&nbsp;&nbsp;&nbsp;&nbsp;号： <%=buyOrder.getAccount()%></li>
					<li>密&nbsp;&nbsp;&nbsp;&nbsp;码： <%=buyOrder.getPassword() %></li>
				</ul>
				<ul>
					<li><span class="title">商品详情</span></li>
					
					<li>所属游戏：<%=buyOrder.getGame() %></li>
					<li>操作系统：<%=buyOrder.getSystem() %></li>
					<li>角色等级：<%=buyOrder.getLevel() %></li>
					<li>商品描述：<%=buyOrder.getInformation() %></li>
				
				</ul>
			</div>
		</div>
		<%
			}
		%>
	</div>
</div>
<div class="footer">
	<div class ="footerInclude">
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