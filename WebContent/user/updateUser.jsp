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
		
			<div class="register">
				<div class="registerInclude">
				<span><b>修改账号信息</b></span>
					<hr>			
					<s:form class="registerForm" action="UpdateUser" validate="true">
						<input type="hidden" name="userName" value="<%=user.getUsername()%>">
						设置密码 ：<s:password class="text" label="输入密码" name="password"/>
						<s:fielderror  class="error" cssStyle="color: red">
			           		<s:param>password</s:param>
			       		</s:fielderror><br><br>
						确认密码 ：<s:password class="text" label="确认密码" name="password2"/><br><br>
						邮&nbsp;&nbsp;&nbsp;&nbsp;箱 ：<s:textfield class="text"  name ="email"/><br><br>
						用户姓名 ：<s:textfield class="text"  name ="name"/><br><br>
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