<%@page import="factory.CompanyFactory"%>
<%@page import="vo.Company"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员中心</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <!--<div class="topbar-inner clearfix">-->
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">管理员中心</a></h1>
        </div>
    </div>
</div>
<div class="container clearfix">
	<jsp:include page="left.jsp"></jsp:include>
    <!--/sidebar-->
    <div class="main-wrap">
	<%
		String id = request.getParameter("id");
		Company company = CompanyFactory.get().getCompanyById(id);
		User user = UserFactory.get().findById(company.getOwn());
	%>
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html" color="#white">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">用户管理</span></div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post" action="checkCompany">
            	<input type="hidden" name="id" value="<%=company.getId()%>">
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                        	<th style="text-align: center;">公司信息</th>
                        </tr>
                        <tr>
                        	<td>用户账号 : <%=user.getUsername() %></td>
                        </tr>
                        <tr>
                        	<td>用户邮箱 : <%=user.getEmail() %></td>
                        </tr>
                        <tr>
                        	<td>公司名称 : <%=company.getCompanyName() %></td>
                        </tr>
                        <tr>
                        	<td>联 系 人 : <%=company.getLianXiRen() %></td>
                        </tr>
                        <tr>
                        	<td>职&nbsp;&nbsp;&nbsp;&nbsp;位 : <%=company.getPosition() %></td>
                        </tr>
                        <tr>
                        	<td>联系方式 : <%=company.getPhone() %></td>
                        </tr>
                        <tr>
                        	<td>公司地址 : <%=company.getAddress() %></td>
                        </tr>
                        <tr>
                        	<td>社会信用代码 : 	<%=company.getCode() %></td>
                        </tr>
                        <tr>
                        	<td>审核意见 : <textarea rows="3" cols="100" name="stateText"></textarea></td>
                        </tr>
                        <tr>
                        	<td>审核结果 : 通过<input type="radio" name="state" value="2">    驳回<input type="radio" name="state" value="3"></td>
                        </tr>
                        <tr>
                        	<td align="center"><input type="submit" value="提交审核"></td>
                        </tr>	
                    </table>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>