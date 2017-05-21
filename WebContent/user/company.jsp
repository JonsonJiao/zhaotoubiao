<%@page import="factory.CodeFactory"%>
<%@page import="vo.Code"%>
<%@page import="factory.CompanyFactory"%>
<%@page import="vo.Company"%>
<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司信息</title>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/showBuyOrder.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/sellOrder.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>查看我的商品</span>
</div>
<%
		HttpSession sess =request.getSession();
		String name = "";
		if(sess.getAttribute("User")!=null){
		name = 	(String)sess.getAttribute("User");
		}
		User user = UserFactory.get().findById(name);
	%>
<div class="management">
	<div class="managementInclude">
		<jsp:include page="left.jsp"></jsp:include>	
		<div class="managementRight">
				<span><b>公司信息</b></span>
					<hr>			
					<table id="message">
						<%
							String id = request.getParameter("id");
							Company company = CompanyFactory.get().getCompanyById(id);
							Code code = new Code("104",company.getState()+"");
						%>
						<tr><th>用户账号 : <%=user.getUsername() %></th></tr>
						<tr><th>用户邮箱 : <%=user.getEmail() %></th></tr>
						<tr><th>公司名称 : <%=company.getCompanyName() %></th></tr>
						<tr><th>联 系 人 : <%=company.getLianXiRen() %></th></tr>
						<tr><th>职&nbsp;&nbsp;&nbsp;&nbsp;位 : <%=company.getPosition() %></th></tr>
						<tr><th>联系方式 : <%=company.getPhone() %></th></tr>
						<tr><th>公司地址 : <%=company.getAddress() %></th></tr>
						<tr><th>社会信用代码 : <%=company.getCode() %></th></tr>
						<tr><th>审核意见 : <%=company.getStateText() %></th></tr>
						<tr><th>审核结果 : <%=CodeFactory.get().GetTextById(code) %></th></tr>
						<%
							if(company.getState()==2){
						%>
							<tr><th><b><a class="aButton" href="addZhaoBiao.jsp?id=<%=company.getId()%>
							&name=<%=company.getCompanyName()%>&userId=<%=user.getUsername()%>">发布招标信息</a></b></th></tr>
						<% 
							}
						 %>
				</table>
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