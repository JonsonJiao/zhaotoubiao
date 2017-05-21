<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="factory.ProductFactory"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易猫_手机游戏交易平台</title>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/showBuyOrder.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<div class="top">
	<div class="topinclude">
		<div class="topleft">
		<ul>
			<li>
			<b>电脑版</b>
			</li>
			<li>
			<a href="#">手机版</a>
			</li>
		</ul>
		</div>
		<div class='topright'>
			<ul>
			<li>
			<% 
				HttpSession sess =request.getSession();
				String name = "";
				if(sess.getAttribute("User")!=null){
				name = 	(String)sess.getAttribute("User");
			%>
				欢迎<%=name %>登录交易猫！
			<%}else{
			%>
				您好 欢迎访问交易猫
			<%
				}
			%>
			</li>

			<li>
			<% 
				if(sess.getAttribute("User")!=null){
			%>
				<a href="out.jsp"> 注销 |</a>
			<%
				int count =MessageFactory.get().NoSee(name);
			%>
				<a href="showMessage.jsp">消息[<font color="red"><%=count %></font>]</a>
			<%
				}else{
			%>
				<a href="login.jsp">登录</a>
			<%
				}
			%>
			</li>
			<li>	
				<a href="showBuyOrder.jsp"> 购买记录 |</a>
			</li>
			<li>
				<a href="geRenZhongXin.jsp"> 个人中心 |</a>
			</li>
			<li>
				<a href="#" onmouseover="over()" onmouseout="out()">
					<div id="image2"><img src="./image/icons.png"></div>
					<div id="image1"><img src="./image/icons.png"></div>
					<span class="download">下载APP</span>
				</a>
			</li>
			</ul>
		</div>
	
	</div>
</div>

<div class="logo">
	<div class="logoinclude">
		<div class="logopic">
			<img src="./image/logo.png">
			<img src="./image/logo2.png">
		</div>
		<div class="search">
			<from>
				<input class="text" type ="text" name ="search">
				<input class="button" type="submit" value="搜索">
			</from>
		</div>
	</div>
</div>

<div class="navigation">
	<div class="navigationinclude">
		<input type="radio" id="radio_control_1" name="radio_set" checked="checked" />
		<a href="../shouYe.jsp"><span class="word">首页</span></a>
		<input type="radio" id="radio_control_2" name="radio_set" />
		<a href="showMessage.jsp"><span class="word">站内信</span></a>
		<input type="radio" id="radio_control_3" name="radio_set" />
		<a href="../allProduct.jsp"><span class="word">商品</span></a>
		<input type="radio" id="radio_control_4" name="radio_set" />
		<a href="#"><span class="word">游戏专区</span></a>
		<input type="radio" id="radio_control_5" name="radio_set" />
		<a href="geRenZhongXin.jsp"><span class="word">个人中心</span></a>
		<input type="radio" id="radio_control_6" name="radio_set" />
		<a href="main.jsp"><span class="word">客服中心</span></a>
	</div>
</div>

<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>查看我的商品</span>
</div>

<div class="management">
	<div class="managementInclude">
		<div class="managementLeft">
			<br>
			<!--<%
				User user = UserFactory.get().findById(name);
			%>-->
			<span class="title">登录用户信息</span>
			<hr>
			<span>账号：<%=user.getName()%></span><br>
			<span>QQ号码：<%=user.getQq()%></span><br>
			<span>手机号码：<%=user.getPhone()%></span><br>
			<a href="updateUser.jsp"><span>修改用户信息</span></a><br><br>
			<span class="title">我是买家</span>
			<hr>			
			<a href="allProduct.jsp"><span>我要买</span></a><br>
			<a href="showBuyOrder.jsp"><span>查看我的订单</span></a><br>
			<span class="title">我是卖家</span>		
			<hr>
			<a href="sell.jsp"><span>我要卖</span></a>			
			<a href="showProduct.jsp"><span>管理我的商品</span></a>			
			<a href="showSellOrder.jsp"><span>查看我的订单</span></a>
		</div>
		<div class="managementRight">
			<div class="search">
				<span><b>管理我的商品</b></span>
						<hr>
				<div class="search1">
					<form action="">
						<section>
							选择游戏  
							<select>
								<option name=""></option>
							</select>
						</section>
						<section>
							商品类型 
							<select>
								<option name=""></option>
							</select>
						</section><br>
						<section>
							创建时间  
							<input type="text" name=""> 至 <input type="text" name="">
						</section>
						<section>
							商品状态 
						 	<select>
								<option name=""></option>
							</select>
						</section>
						<input type="submit" value="查找">
				</form>
				</div>
				<div class="search2">
					<ul>
						<li>
							全部商品
						</li>
						<li>
							待提交
						</li>
						<li>
							审核中
						</li>
						<li>
							已上架
						</li>
						<li>
							已下架
						</li>
						<li>
							库存为零
						</li>				
					</ul>
				</div>

				<div class="search4">
					<div class="mycenter-sort">
						<span class="game-sort"><span class="title">订单排序</span>
						<select class="select" id="orderBySel">
							<option value="1" >按时间由近到远</option>
							<option value="2" >按时间由远到近</option>
						</select></span>
					</div>
					<div class="mycenter-head">
						<ul >
						<li class="title1">商品名称</li>
						<li class="title2">单价（元）</li>
						<li class="title3">库存</li>
						<li class="title4">商品状态</li>
						<li class="title5">操作</li>
						</ul>
					</div>
					<% 

						int index=1;
						if(request.getParameter("index")!=null){
							index = new Integer(request.getParameter("index"));
						}
						List<Product> list = null;
						list = ProductFactory.get().findByOwn(name,index);
						for(Product product:list){
					%>					
						<div class="booking-table">
							<ul >
								<li class="item-info">
									<div class="head">
										<span>寄售</span>
									</div>
									<div class="con">
										<span class="name">
											<a href="product.jsp?listIndex=<%=product.getListIndex()%>"><%= 
												product.getProductName()%></a>
										</span>
										<span class="unit"><%=product.getPrice() %></span>
										<span class="count">1</span>
										<span class="status">交易成功</span>
										<span>
											<a href="updateProduct.jsp?listIndex=<%=product.getListIndex()%>">修改</a>
											<a href="DeleteProduct?listIndex=<%=product.getListIndex()%>&productName
											=<%=product.getProductName()%>&own=<%=product.getOwn()%>">删除</a>
										</span>
									</div>
								</li>
							</ul>
						</div>
						<%
							}
						%>
					</div>
					<div class="index">
					<%
						if(index==1){
					%>
						无上页
					<%	
						}else{
					%>
						<a href="showProduct.jsp?index=<%=index-1 %>">上一页</a>
					<%
						}
						int count =ProductFactory.get().count();
						count =count/6+1;
						int i =0;
						if((index-5)<0){
							i=0;
						}else{
							i=index-5;
						}
						for(int x=i;x<Math.min(Math.max(10, index+5), count);x++){
							if(x!=index-1){
					%>
						<a href="showProduct.jsp?index=<%=x+1 %>"><%=x+1 %></a>	
					<% 		
							}else{
					%>
							<%=x+1 %>
					<% 			
							}
						}
					%>
					<%
						if(index==count){
					%>
						无下页
					<%	
						}else{
					%>
						<a href="showProduct.jsp?index=<%=index+1 %>">下一页</a>
					<%
						}
					%>
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