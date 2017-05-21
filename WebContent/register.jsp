<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<link rel="stylesheet" type="text/css" href="css/register.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>

<script type="text/javascript">
function mobile(){
	document.getElementById("span1").style.backgroundcolor="white";
}

function email(){
	document.getElementById("span1").style.backgroundcolor="rgb(240,240,240)";
	document.getElementById("span2").style.backgroundcolor="white";
	document.getElementById("RegisterRight").style.display="block";
}
</script>
 
</head>
<body>
<div class="top">
	<div class="topInclude">
		<div class="topLeft">
			<ul>
				<li>
					<a href="#"><img src="./image/logo3.png"></a>
				</li>
				<li>
					<span >招标无忧账号是招标无忧各业务通行的账号。<br>
					拥有招标无忧账号，你就可以玩转招标无忧！</span>
				</li>
			</ul>
		</div>
		<div class="topRight">
			<a href="shouYe.jsp"><img src="./image/house.png"><span>返回首页</span></a>
		</div>
	</div>
</div>
<div class="register">
	<div class="registerInclude">
		<div class="registerLeft">
			<ul>
				<li>
					<div class="bgcolor">
						<img src="./image/mobile.png"><span id="span1" onclick="mobile()">账号注册</span>
					</div>	
				</li>	
			</ul>
		</div>
		
		<div id="registerRight">
		<span class="title">提示：如果你已有招标无忧账号，请直接 <a href="login.jsp">登录</a></span>
		<s:form class="registerForm" action="register" validate="true">
			登录账号 ：<s:textfield class="text"  name ="userName"/>
			<s:fielderror cssStyle="color: red">
           		<s:param>name</s:param>
      		</s:fielderror><br><br>
			设置密码 ：<s:password class="text" name="password"/>
			<s:fielderror cssStyle="color: red">
           		<s:param>password</s:param>
       		</s:fielderror><br><br>
			确认密码 ：<s:password class="text"  name="password2"/><br><br>
			邮&nbsp;&nbsp;&nbsp;&nbsp;箱 ：<s:textfield class="text"  name ="email"/><br><br>
			用户姓名 ：<s:textfield class="text"  name ="name"/><br><br>
			用户类型 ：<s:radio name="type" list="#{'1':'普通用户','2':'专家用户'}"></s:radio><br><br>
			<s:submit class="submit"  value="注册" style="margin-left:130px" />
		</s:form>
		</div>
	</div>
</div>

<div class="footer">
	<span>
	<a href="#">招标无忧 </a><a href="#"> 招标无忧产品 </a><a href="#"> 帮助中心 </a><a href="#"> 意见反馈 </a><br>
       招标无忧  2009-2016 © 版权所有
	</span>
</div>
</body>
</html>