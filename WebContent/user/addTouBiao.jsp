<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="factory.CompanyFactory"%>
<%@page import="vo.Company"%>
<%@page import="java.util.List"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/title.css">
	<link rel="stylesheet" type="text/css" href="css/sell.css">
	<title>投标</title>
</head>

<body>
	<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="top.jsp"></jsp:include>
	<div class="sell">
		<div class="sellInclude">
			<section>
			</section>
<%
	String zhaoBiaoId = request.getParameter("zhaoBiaoId");
	HttpSession sess =request.getSession();
	String name = "";
	if(sess.getAttribute("User")!=null){
	name = 	(String)sess.getAttribute("User");
	}
	User user = UserFactory.get().findById(name);
	List<Company> list = CompanyFactory.get().getCompanyByOwnofAll(user.getUsername());
	request.setAttribute("list", list);
%>
			<section>
				<s:form action="touBiao" validate="true">
					<fieldset>
						<legend>投标信息</legend>
					<ul>
						<li>
							投标公司<s:select list="#request.list" style="margin-left:20px;" name="companyId"  listKey="id" listValue="companyName" headerKey="" headerValue="--请选择--"></s:select>
							<s:fielderror class="error" cssStyle="color: red">
		              			<s:param>companyId</s:param>
		        			</s:fielderror>
						</li>
						<li>
							预计时间<s:textfield class="text"  name="workTime"/>(天)
							<s:fielderror class="error" cssStyle="color: red">
		              			<s:param>workTime</s:param>
		        			</s:fielderror>
						</li>
						<li>
							<input  name="zhaoBiaoId" type="hidden" value="<%=zhaoBiaoId%>"/>
						</li>
						<li>
							项目报价<s:textfield class="text"  name="money"/>(万元)
							<s:fielderror class="error" cssStyle="color: red">
		              			<s:param>workTime</s:param>
		        			</s:fielderror>
						</li>
						<li>
							<s:submit class="button"   value="投标"/>
						</li>
					</ul>
					</fieldset>
				</s:form>
			</section>
		</div>
	</div>

	<div class="footer">
		<div class="footerInclude">
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