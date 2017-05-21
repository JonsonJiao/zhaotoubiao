<%@page import="factory.CreditFactory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Credit"%>
<%@page import="java.util.List"%>
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
<title>信用信息</title>
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
				<span><b>信用信息</b></span>
					<hr>			
					<table id="message">
						<%	
							int zhaoBiaoCount = 0;
							int workCount = 0;
							int workTime = 0;
							int workquality = 0;
							int creditCount = 0;
							Code code = new Code("100",user.getType()+"");
							List<Company> list = null;
							if(user.getType()==1){
								list = CompanyFactory.get().getCompanyByOwnofAll(user.getUsername());
								for(Company company:list){
									Credit credit = CreditFactory.get().getCreditById(company.getId()+"");
									if(credit!=null){
										zhaoBiaoCount += credit.getZhaoBiaoCount();
										workCount += credit.getWorkCount();
										workTime +=credit.getWorkTime();
										workquality +=credit.getWorkquality();
										creditCount++;
									}
								}
								workTime /= creditCount;
								workquality /= creditCount;
						%>
							
							<tr><th>用户类型 : <%=CodeFactory.get().GetTextById(code) %></th></tr>
							<tr><th>公司数量 : <%=list.size() %></th></tr>
							<tr><th>招标数量 : <%=zhaoBiaoCount %></th></tr>
							<tr><th>投标数量 : <%=workCount %></th></tr>
							<tr><th>完成质量评分: <%=workquality %></th></tr>
							<tr><th>完成时间评分 : <%=workTime %></th></tr>
						<% 
							}else{
								Credit credit = CreditFactory.get().getCreditById(user.getUsername());
								workCount += credit.getWorkCount();
								workquality +=credit.getWorkquality();
						%>
							<tr><th>用户类型 : <%=CodeFactory.get().GetTextById(code) %></th></tr>
							<tr><th>评标数量 : <%=workCount %></th></tr>
							<tr><th>评标结果评分 : <%=workquality %></th></tr>
							
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