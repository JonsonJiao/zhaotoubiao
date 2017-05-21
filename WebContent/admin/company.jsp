<%@page import="factory.CompanyFactory"%>
<%@page import="vo.Company"%>
<%@page import="java.util.List"%>
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

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html" color="#white">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">用户管理</span></div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>公司名称</th>
                            <th>公司所有人</th>
                            <th>联系人</th>
                            <th>职位</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	List<Company> list = CompanyFactory.get().getCompanyByNoCheck();
                        	for(Company company:list){
                        %>
                        <tr>
                            <td><%=company.getCompanyName() %></td> 
                            <td><%=company.getOwn() %></td>
                            <td><%=company.getLianXiRen() %></td> 
                            <td><%=company.getPosition() %></td> 
                            <td><a href="companyCheck.jsp?id=<%=company.getId() %>">查看信息</a></td> 
                        </tr>
                        <% 
                        	}
                        %>
                    </table>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>