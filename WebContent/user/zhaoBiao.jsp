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
				<span><b>公司信息</b></span>
					<hr>			
					<table id="message">
						<%
							String id = request.getParameter("id");
							ZhaoBiao zhaobiao = ZhaoBiaoFactory.get().getZhaoBiaoById(id);
							Company company = null;
							if(zhaobiao.getState()>2){
								company = CompanyFactory.get().getCompanyById(zhaobiao.getZhongBiaoId());
							}
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
						<tr><th>招标状态 : <%=CodeFactory.get().GetTextById(code)%></th></tr>
						<tr><th>中标公司 : <%=zhaobiao.getState()>2?company.getCompanyName():"还未有公司中标" %></th></tr>
						<tr><th>修改日期 : <%=zhaobiao.getUpdateDate() %></th></tr>
					<%
						if(zhaobiao.getState()==1){
							
					%>
					<tr><th><b><a class="aButton" style="width:150px;" href="changeZhaoBiao?id=<%=zhaobiao.getId()%>&state=2">结束招标,开始评标</a></b></th></tr>
					<%
						}else if(zhaobiao.getState()==4){
							
					%>
					<tr><th><b><a class="aButton" href="changeZhaoBiao?id=<%=zhaobiao.getId()%>&state=4">工程完成</a></b></th></tr>
					<%
						}
					%>
					</table>
					<br>
					
					<% 
						if(zhaobiao.getState()>2){
							TouBiao touBiao = TouBiaoFactory.get().getTouBiaoById(zhaobiao.getZhongBiaoId());
					%>					
								<span><b>中标信息</b></span><hr>
								<table id="search">
									<tr class="firstTr">
										<th>投标公司</th>
										<th>工时</th>
										<th>项目报价</th>
										<th>投标日期</th>
										<th>操作</th>
									</tr>	
									<tr>
										<th class="name">
											<%=CompanyFactory.get().getCompanyById(touBiao.getCompanyId()).getCompanyName()%>
										</th>
										<th class="unit"><%=touBiao.getWorkTime()%>(天)</h>
										<th class="count"><%=touBiao.getMoney()%>(万元)</th>
										<th class="status"><%=touBiao.getUpdateDate()%></th>
										<th>
											<a href="touBiao.jsp?id=<%=touBiao.getId()%>&can=can">查看投标信息</a>
										</th>
									</tr>
					<%
						}
					%>
					<br>
					
					<span><b>投标信息</b></span><hr>
					<table id="search">
							<tr class="firstTr">
								<th>投标公司</th>
								<th>工时</th>
								<th>项目报价</th>
								<th>投标日期</th>
								<th>操作</th>
							</tr>
					<% 
						List<TouBiao> toubiaoList = TouBiaoFactory.get().getTouBiaoByZhaoBiaoId(zhaobiao.getId()+"");
						for(TouBiao touBiao:toubiaoList){
					%>						
									<tr>
										<th class="name">
											<%=CompanyFactory.get().getCompanyById(touBiao.getCompanyId()).getCompanyName()%>
										</th>
										<th class="unit"><%=touBiao.getWorkTime()%>(天)</h>
										<th class="count"><%=touBiao.getMoney()%>(万元)</th>
										<th class="status"><%=touBiao.getUpdateDate()%></th>
										<th>
											<a href="touBiao.jsp?id=<%=touBiao.getId()%>&can=can">查看投标信息</a>
										</th>
									</tr>
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