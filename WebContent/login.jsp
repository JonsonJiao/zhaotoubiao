<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<body>
<div class="top">
	<div class="topInclude">
		<a href="#">
			<img src="./image/logo3.png">
			<span>专业招标投标平台</span>
		</a>
	</div>
</div>
<div class="login">
		<div class="loginInclude">
		<div class="title">
			使用UC账号登录<span>交易猫</span>
		</div>
		<div>
			<div class="loginMain">
				<s:form action="login" >
				<h3>账号</h3><br>
				<s:textfield class="text" name="userName" label="用户名"/> <br>
				<s:fielderror cssStyle="color: red">
              		<s:param>name</s:param>
        		</s:fielderror>
        		<h3>密码</h3><br>
				<s:password class="text" name="password" label=" 密 码 "/><br>
				<s:fielderror cssStyle="color: red">
              		<s:param>password</s:param>
        		</s:fielderror><br>
				<s:submit class="button" value="登录"></s:submit>
			</s:form>	
			</div>
			<hr>
			<div class="friend">
				使用合作网站账号登录：<br>
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