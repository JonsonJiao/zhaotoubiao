<%@page import="factory.CodeFactory"%>
<%@page import="vo.Code"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="managementLeft">
	<br>
	<%
		HttpSession sess =request.getSession();
		String name = "";
		if(sess.getAttribute("User")!=null){
		name = 	(String)sess.getAttribute("User");
		}
		User user = UserFactory.get().findById(name);
		Code code = new Code("100",user.getType()+"");
	%>
	<span class="title">登录用户信息</span>
	<hr>
	<span>姓名：<%=user.getName()%></span>
	<span>邮箱：<%=user.getEmail()%></span>
	<span>用户类型：<%=CodeFactory.get().GetTextById(code)%></span>
	<a href="updateUser.jsp"><span>修改用户信息</span></a><br><br>
	<span class="title">我的公司</span>
	<hr>			
	<a href="addCompany.jsp"><span>添加公司</span></a><br>
	<a href="showCompany.jsp"><span>管理公司</span></a><br>
	<a href="showZhaoBiao.jsp"><span>我的招标信息</span></a><br>
	<span class="title">投标信息</span>		
	<hr>
	<a href="showTouBiao.jsp"><span>我的投标信息</span></a>	<br> 			
	<a href="showProduct.jsp"><span>中标列表</span></a>	<br>		
	<span class="title">信用信息</span>	
	<hr>
	<a href="credit.jsp"><span>信用信息查看</span></a>
</div>
<script>
$("a").click(function(){
	alert($(this).text())
	$(this).addClass("aActive");
});
</script>
</body>
</html>