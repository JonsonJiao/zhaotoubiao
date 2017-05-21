<%@page import="vo.Code"%>
<%@page import="factory.CodeFactory"%>
<%@page import="factory.CompanyFactory"%>
<%@page import="vo.Company"%>
<%@page import="factory.ZhaoBiaoFactory"%>
<%@page import="vo.ZhaoBiao"%>
<%@page import="factory.MessageFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/showBuyOrder.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/buyOrder.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易猫_手机游戏交易平台</title>
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>查看我的商品</span>
</div>
<%
	String id = request.getParameter("listIndex");
	ZhaoBiao zhaobiao = ZhaoBiaoFactory.get().getZhaoBiaoById(id);
	Company conpany = CompanyFactory.get().getCompanyById(zhaobiao.getCompanyId());
	Code code2 = new Code("102",zhaobiao.getCompanyType()+"");
	if(zhaobiao!=null){

%>
	<div class="product">
		<div class="productInclude">
			<div class="productTop">
				<span>招标题目 : <%=zhaobiao.getTitle() %></span>
				<span>公司名称 : <%=zhaobiao.getCompanyName()%></span>
				<span>公司类型 : <%=CodeFactory.get().GetTextById(code2) %></span>
				<span>发 布 人 : <%=zhaobiao.getUserName() %></span>
				<span>邮箱地址 : <%=zhaobiao.getEmail() %></span>
				<span>联系电话 : <%=zhaobiao.getPhone()%></span>
				<span>招标内容 : <%=zhaobiao.getZhaoBiaoText() %></span>
				<span>发布日期 : <%=zhaobiao.getUpdateDate() %></span>
				<span>
					<s:fielderror  cssStyle="color: red">
		              			<s:param>product</s:param>
		        	</s:fielderror>
				</span>
				<span>
					<a href="user/addTouBiao.jsp?zhaoBiaoId=<%=zhaobiao.getId()%>"><input class="button" type="submit" value ="我要投标"></a>
				</span>
			</div>
			<div>
			
			</div>
		</div>
		
	</div>
<%
	}
%>
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