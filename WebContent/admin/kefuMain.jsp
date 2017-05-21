<%@page contentType="text/html" pageEncoding="UTF-8" %>
<html>
<head>
<title>聊天室</title>
<link href="css/style.css" rel="stylesheet">
<script language="javascript" src="js/AjaxRequest.js"></script>
<script language="javascript">
window.setInterval("showContent();",1000);
var sysBBS="<span style='font-size:14px; line-height:30px;'>欢迎使用交易猫客服客服端- - - - - - -当前客户：<%=request.getParameter("username")%></span><br><span style='line-height:22px;'>";
//此处需要加?nocache="+new Date().getTime()，否则将出现在线人员列表不更新的情况
var remain ="";
function showContent(){
	var param="username=${User}";
	var loader1=new net.AjaxRequest("../KgetMessages",deal_content,onerror,"POST",param);
}
function onerror(){
	alert("很抱歉，服务器出现错误，当前窗口将关闭！");
	window.opener=null;
	window.close();
}
function deal_content(){
	var returnValue=this.req.responseText;		//获取Ajax处理页的返回值
	var h=returnValue.replace(/\s/g,"");	//去除字符串中的Unicode空白符
	if(h=="error"){
		//alert("您的账户已经过期，请重新登录！");
		Exit();
	}else{
		remain =sysBBS+returnValue+"</span>";
		content.innerHTML=sysBBS+returnValue+"</span>";
		document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;	//当聊天信息超过一屏时，设置最先发送的聊天信息不显示
	}
}

window.onload=function(){
	showContent();						//当页面载入后显示聊天内容
}

window.onbeforeunload=function(){    		//当用户单击浏览器中的关闭按钮时执行退出操作
    if(event.clientY<0 && event.clientX>document.body.scrollWidth){  
         Exit();                    		//执行退出操作
    }
}
</script>
<script language="javascript">
	function send(){	//验证聊天信息并发送
		if(form1.content1.value==""){
			alert("发送信息不可以为空！");form1.content1.focus();return false;
		}
		var param=	"&content1="+form1.content1.value+"&username=${User}";
        var loader=new net.AjaxRequest("../KsendMessages",deal_send,onerror,"POST",param);

	}
	function deal_send(){
		var returnValue=this.req.responseText;		//获取Ajax处理页的返回值
		var h=returnValue.replace(/\s/g,"");	//去除字符串中的Unicode空白符
		if(h==""){
			content.innerHTML = remain;
		}else{
			remain =sysBBS+returnValue+"</span>";
			content.innerHTML=sysBBS+returnValue+"</span>";
		}
	}
	function Exit(){
		window.location.href="leave?username=${User}";
		alert("欢迎您下次光临！");
	}
</script>
<script type="text/javascript">
	function checkScrollScreen(){
    if(!form1.scrollScreen.checked){
        document.getElementById("content").style.overflow='scroll';
    }else{
        document.getElementById("content").style.overflow='hidden';
        //当聊天信息超过一屏时，设置最先发送的聊天信息不显示
        document.getElementById('content').scrollTop = document.getElementById('content').scrollHeight*2;    
    }
    setTimeout('checkScrollScreen()',500);
}
	
</script>

</head>

<body>
	<section>
		<table background="images/2.jpg" class="table_one">
			<tr>
				<td><span>顾客至上</span><br><span>用心沟通</span></td>
			</tr>
		</table>

		<table width="778" height="276" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="613" height="200px" valign="top" bgcolor="lightcyan" style="padding:5px;border:0;">
					<div id="content">聊天内容</div>
				</td>
			</tr>
		</table>

		<table width="778" height="95" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D6D3CE" background="images/6.jpg">
			<form action="" name="form1" method="post">
				<tr>
					<td width="21" height="30" align="left">&nbsp;</td>
					<td width="600px" align="left">
						<input name="content1" type="text" size="70" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
						<input name="Submit2" type="button" class="btn_grey" value="发送" onClick="send()"></td>
					<td ><input name="button_exit" type="button" class="btn_grey" id="exit" value="结束对话" onClick="Exit()"></td>
					<td align="center">&nbsp;</td>
					<td width="40" align="right">
						<input name="scrollScreen" type="checkbox" class="noborder" id="scrollScreen" onClick="checkScrollScreen()" value="1" checked>
					</td>
				</tr>
			</form>
		</table>
	</section>
</body>

</html>