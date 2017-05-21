<%@page import="factory.BuyOrderFactory"%>
<%@page import="vo.BuyOrder"%>
<%@page import="factory.SellOrderFactory"%>
<%@page import="vo.SellOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员中心</title>
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
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="user.jsp"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="kefu.jsp"><i class="icon-font">&#xe005;</i>客服服务</a></li>
                        <li><a href="order.jsp"><i class="icon-font">&#xe006;</i>订单查询</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html" color="#white">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">订单查询</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="order.jsp" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="id"  type="text"></td>
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
                            <td style="text-align: center;">订单信息</td>
                        </tr>
                        <%
                        	String id = request.getParameter("id");
                        	if(id!=null){
                        	SellOrder sellOrder = SellOrderFactory.get().findById(id);
                        	if(sellOrder==null){
                        		BuyOrder buyOrder = BuyOrderFactory.get().findById(id);
                       %>
                       	<tr>
                            <td>订单编号：<%=buyOrder.getListIndex() %></td> 
                        </tr>
                        <tr>
                            <td>订单名称：<%=buyOrder.getOrderName() %>
                            </td>
                        </tr>
                        <tr>
                            <td>订单状态：<%=buyOrder.getState() %></td> 
                        </tr>
                        <tr>
                        	<td>用户：<%=buyOrder.getOwn() %></td>
                        </tr>
                        <tr>
                        	<td>所属游戏：<%=buyOrder.getGame() %></td>
                        </tr>
                        <tr>
                        	<td>订单价格：<%=buyOrder.getPrice() %></td>
                        </tr>
                        <tr>
                        	<td>操作：</td>
                        </tr>
                       <% 
                        	}else{
                        %>
                        <tr>
                            <td>订单编号：<%=sellOrder.getListIndex() %></td> 
                        </tr>
                        <tr>
                            <td>订单名称：<%=sellOrder.getOrderName() %>
                            </td>
                        </tr>
                        <tr>
                            <td>订单状态：<%=sellOrder.getState() %></td> 
                        </tr>
                        <tr>
                        	<td>用户：<%=sellOrder.getOwn() %></td>
                        </tr>
                        <tr>
                        	<td>所属游戏：<%=sellOrder.getGame() %></td>
                        </tr>
                        <tr>
                        	<td>订单价格：<%=sellOrder.getPrice() %></td>
                        </tr>
                        <tr>
                        	<td>操作：</td>
                        </tr>
                        
                        <% 
                        		}
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