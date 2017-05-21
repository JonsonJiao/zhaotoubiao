<%@page import="factory.CodeFactory"%>
<%@page import="vo.Code"%>
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
        <div class="search-wrap">
            <div class="search-content">
                <form action="user.jsp" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="name"  type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>用户名</th>
                            <th>电子邮箱</th>
                            <th>姓名</th>
                            <th>用户类型</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        <%
                        	User user =null;
                        	String name = request.getParameter("name");
                        	if(name!=null){
                        		user = UserFactory.get().findById(name);
                        	}
                        	if(user!=null){
                        		Code code = new Code("100",user.getType()+"");
                        %>
                        <tr>
                            <td><%=user.getUsername() %></td> 
                            <td><%=user.getEmail() %></td>
                            <td><%=user.getName() %></td> 
                            <td><%=CodeFactory.get().GetTextById(code)%></td> 
                            <td><%=user.getState() %></td> 
                            <td><a href="Limit?name=<%=user.getName() %>&state=limit">封禁</a> &nbsp; &nbsp;
                            	<a href="Limit?name=<%=user.getName() %>&state=ok">解封</a></td> 
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