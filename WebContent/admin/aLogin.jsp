<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
body{
	font-family: "微软雅黑";
	font-size: 14px;
	background: url(images/yejing.jpg) fixed center center;
}
.logo_box{
	width: 280px;
	height: 490px;
	padding: 35px;
	color: #EEE;
	position: absolute;
	left: 50%;
	top:100px;
	margin-left: -175px;
}
.logo_box h3{
	text-align: center;
	height: 20px;
	font: 20px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei",sans-serif;
	color: #FFFFFF;
	height: 20px;
	line-height: 20px;
	padding:0 0 35px 0;
}
.forms{
	width: 280px;
	height: 485px;
}
.logon_inof{
	width: 100%;
	min-height: 450px;
	padding-top: 35px;
	position: relative;
}		
.input_outer{
	height: 46px;
	padding: 0 5px;
	margin-bottom: 20px;
	border-radius: 50px;
	position: relative;
	border: black 2px solid !important;
}
.u_user{
	width: 75px;
	height: 25px;
	background-position:  -125px 0;
	position: absolute;
	margin: 12px 13px;
}
.us_uer{
	width: 105px;
	height: 25px;
	background-position: -125px -34px;
	position: absolute;
	margin: 12px 13px;
}
.l-login{
	position: absolute;
	z-index: 1;
	left: 50px;
	top: 0;
	height: 46px;
	font: 14px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei";
	line-height: 46px;
}
label{
	color: rgb(255, 255, 255);
	display: block;
}
.text{
	width: 220px;
	height: 46px;
	outline: none;
	display: inline-block;
	font: 14px "microsoft yahei",Helvetica,Tahoma,Arial,"Microsoft jhengHei";
	margin-left: 50px;
	border: none;
	background: none;
	line-height: 46px;
}
/*///*/
.mb2{
	margin-bottom: 20px
}
.submit {
	width: 220px;
	height: 30px;
	border: 0px;
	color:white;
	background-color: blue;
	margin-left: 30px;
}

</style>
</head>
<body>


<div class="logo_box">
	<h3>欢迎登录后台</h3>
	<s:form action="AdminLogin" name="f" method="post">
		<div class="input_outer">
			<span class="u_user">账号</span>
			<s:textfield name="name" class="text" onFocus=" if(this.value=='输入ID或用户名登录') this.value=''" onBlur="if(this.value=='') this.value='输入ID或用户名登录'" style="color: #FFFFFF !important" />
		</div>
		<s:fielderror cssStyle="color: red">
           		<s:param>name</s:param>
       		</s:fielderror><br>
		<div class="input_outer">
			<span class="us_uer">密码</span>
			<label class="l-login login_password" style="color: rgb(255, 255, 255);display: block;"></label>
			<s:password name="password" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;" onFocus="$('.login_password').hide()" onBlur="if(this.value=='') $('.login_password').show()" value="" type="password"/>
		</div>
		<s:fielderror cssStyle="color: red">
           		<s:param>password</s:param>
       		</s:fielderror><br>
		<div class="mb2"><s:submit class="submit" value="登录"/></div>
	</s:form>
</div>

</body>
</html>