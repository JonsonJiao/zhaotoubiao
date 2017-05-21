<%@page import="factory.TouBiaoFactory"%>
<%@page import="vo.TouBiao"%>
<%@page import="java.util.List"%>
<%@page import="vo.ZhaoBiao"%>
<%@page import="factory.ZhaoBiaoFactory"%>
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
<title>交易猫_手机游戏交易平台</title>
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
				<span><b>招标信息</b></span>
					<hr>			
					<table id="message">
						<%
							String id = request.getParameter("id");
							TouBiao toubiao = TouBiaoFactory.get().getTouBiaoById(id);
							ZhaoBiao zhaobiao = ZhaoBiaoFactory.get().getZhaoBiaoById(toubiao.getZhaoBiaoId());
							Company company = CompanyFactory.get().getCompanyById(toubiao.getCompanyId());
							Code code = new Code("103",zhaobiao.getState()+"");
							Code code2 = new Code("102",zhaobiao.getCompanyType()+"");
						%>
						<tr><th>招标题目 : <%=zhaobiao.getTitle()%></th></tr>
						<tr><th>公司名称 : <%=zhaobiao.getCompanyName()%></th></tr>
						<tr><th>公司类型 : <%=CodeFactory.get().GetTextById(code2) %></th></tr>
						<tr><th>发 布 人 : <%=zhaobiao.getUserName() %></th></tr>
						<tr><th>邮箱地址 : <%=zhaobiao.getEmail() %></th></tr>
						<tr><th>联系电话 : <%=zhaobiao.getPhone()%></th></tr>
						<tr><th>招标内容 : <%=zhaobiao.getZhaoBiaoText() %></th></tr>
						<tr><th>修改日期 : <%=zhaobiao.getUpdateDate() %></th></tr>
					</table>
				<span><b>投标公司信息</b></span>
					<hr>			
					<table id="message">
						<tr><th>公司名称 : <%=company.getCompanyName() %></th></tr>
						<tr><th>联 系 人 : <%=company.getLianXiRen() %></th></tr>
						<tr><th>职&nbsp;&nbsp;&nbsp;&nbsp;位 : <%=company.getPosition() %></th></tr>
						<tr><th>联系方式 : <%=company.getPhone() %></th></tr>
						<tr><th>公司地址 : <%=company.getAddress() %></th></tr>
						<tr><th>社会信用代码 : <%=company.getCode() %></th></tr>
					</table>
						
				<span><b>投标信息</b></span>
					<hr>			
					<table id="message">
						<tr><th>工期时间 : <%=toubiao.getWorkTime()%>(天)</th></tr>
						<tr><th>项目报价 : <%=toubiao.getMoney()%>(万元)</th></tr>
					</table>
				<%
					String can = request.getParameter("can");
					if(can!=null&&!can.equals("")){
				%>
					<tr><th><b><a class="aButton" href="addZhaoBiao.jsp?id=<%=company.getId()%>
					&name=<%=company.getCompanyName()%>&userId=<%=user.getUsername()%>">选中该企业中标</a></b></th></tr>
				
				<% 		
					}
				%>
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