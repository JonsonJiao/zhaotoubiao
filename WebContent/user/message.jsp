<%@page import="vo.Message"%>
<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易猫_手机游戏交易平台</title>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/messages.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>信件</span>
</div>

<div class="management">
	<div class="managementInclude">
		<jsp:include page="left.jsp"></jsp:include>
		<div class="managementRight">
			<div class="search">
				<div class="search1">
					<span><b>我的站内信</b></span>
					<hr>
				</div>
				<%
					String listIndex = request.getParameter("listIndex");
					Message message = MessageFactory.get().findById(listIndex);
				%>
				<div class="search2">
					<span>标题:<%=message.getTitle() %></span><br>
					<hr>
					<span>类型:<%=message.getType() %></span><br>
					<hr>
					<span>时间:<%=message.getTime() %></span><br>
					<hr>
					<span>内容:<%=message.getText() %></span><br>
					<a href="main.jsp">【咨询在线客服】</a><br>
				</div>
				<div class="a">
					<a href="DeleteMessage?listIndex=<%=listIndex%>">删除消息</a>
				</div>
			</div>
		</div>
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