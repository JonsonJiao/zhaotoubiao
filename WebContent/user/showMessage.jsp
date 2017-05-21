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

<link rel="stylesheet" type="text/css" href="css/message.css">
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
				</div>
				<div class="search4">
					<div class="mycenter-head">
						<ul >
							<li class="title1">类型</li>
							<li class="title2">标题</li>
							<li class="title3">时间</li>
						</ul>
					</div>
					<% 
						HttpSession sess =request.getSession();
						String name = "";
						if(sess.getAttribute("User")!=null){
						name = 	(String)sess.getAttribute("User");
						}
						int index=1;
						if(request.getParameter("index")!=null){
							index = new Integer(request.getParameter("index"));
						}
						List<Message> list = null;
						list = MessageFactory.get().findByOwn(name,index);
						for(Message message:list){
							String state = message.getSee().equals("true")?"<b><已读></b>":"<b><未读></b>";
					%>						
						<div class="booking-table">
							<ul >
								<li class="item-info">
									<div class="con">
										<span class="unit">
											<%= message.getType()%>
										</span>
										<span class="name"><a href="message.jsp?listIndex=<%=message.getListIndex()%>">
										<%=state+message.getTitle() %></a></span>
										<span class="count"><%= message.getTime()%></span>
									</div>
								</li>
							</ul>
						</div>
						<%
							}
						%>
				</div>
				<div class="index">
					<%
						if(index==1){
					%>
						无上页
					<%	
						}else{
					%>
						<a href="showMessage.jsp?index=<%=index-1 %>">上一页</a>
					<%
						}
						int count =MessageFactory.get().count(name);
						count =count/6+1;
						int i =0;
						if((index-5)<0){
							i=0;
						}else{
							i=index-5;
						}
						for(int x=i;x<Math.min(Math.max(10, index+5), count);x++){
							if(x!=index-1){
					%>
						<a href="showMessage.jsp?index=<%=x+1 %>"><%=x+1 %></a>	
					<% 		
							}else{
					%>
							<%=x+1 %>
					<% 			
							}
						}
					%>
					<%
						if(index==count){
					%>
						无下页
					<%	
						}else{
					%>
						<a href="showMessage.jsp?index=<%=index+1 %>">下一页</a>
					<%
						}
					%>
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