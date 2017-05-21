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
<link rel="stylesheet" type="text/css" href="css/updateUser.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>查看我的商品</span>
</div>
<%
	String id = request.getParameter("id");
	String companyName = request.getParameter("name");
	String userId = request.getParameter("userId");
%>
<div class="management">
	<div class="managementInclude">
		<jsp:include page="left.jsp"></jsp:include>	
		<div class="managementRight">
		
			<div class="register">
				<div class="registerInclude">
				<span><b>修改账号信息</b></span>
					<hr>			
					<s:form class="registerForm" action="addZhaoBiao" validate="true">
						<input type="hidden" name="companyId" value="<%=id%>">
						<input type="hidden" name="companyName" value="<%=companyName%>">
						<input type="hidden" name="userId" value="<%=userId%>">
						招标标题 ：<s:textfield class="text"  name ="title"/><br><br>
						公司名称 ：<%=companyName %><br><br>
						发 布 人 ：<s:textfield class="text"  name="userName"/><br><br>
						单位类型 ： <s:radio name="type" list="#{'1':'业主','2':'招标代理结构','3':'其他'}"></s:radio><br><br>
						联系电话 ：<s:textfield class="text"  name ="phone"/><br><br>
						邮箱地址 ：<s:textfield class="text"  name ="email"/><br><br>
						招标内容 ：<s:textarea rows="3" cols="60" name="zhaoBiaoText"></s:textarea><br><br>
						<s:submit class="submit"  value="提交"/>
					</s:form>
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