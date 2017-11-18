<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/cms2.ico" media="screen" />

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mycss.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<script src="<%=request.getContextPath()%>/layui/layui.js "></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>超管登录</title>
<script type="text/javascript">
//点击登录进行账号密码分别验证流程
function wannaLogin() {
	var adminId = $('#adminId').val();
	var adminPassword = $('#adminPassword').val();
	if(confirmCount(adminId,adminPassword)){
			$('#adminForm').submit();
	}else {
		alert("账号或密码错误..");
	}
}
//验证超管账号
function confirmCount(adminId,adminPassword) {
	var result = false;
	$.ajax({
          type: "GET",
          data: {
              "adminId": adminId,
              "adminPassword":adminPassword
          },
          contentType: "application/json; charset=utf-8",
          async: false,
          dataType: "json",
          url: "<%=request.getContextPath()%>/admin/ConfirmAdminCount.do",
			success : function(data) {
				if (data.result == true) {
					result = true;
				}
			},
			error : function(data) {
				alert("服务器异常..");
			}
		});
		return result;
	}
</script>
<style type="text/css">
#lllww:HOVER {
	text-decoration: none;
}
</style>
</head>
<body style="background-image: url('<%=request.getContextPath() %>/lib/timg (1).jpg'); 
background-repeat: no-repeat; background-size: cover;">
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">CMS</a>
		</div>
		<form class="navbar-form navbar-right"
			style="margin-right: 5%; float: left;">
			<a id="lllww" href="#"
				style="width: 100px; color: white; font-size: 1.5em; text-decoration: none;">超级管理员</a>
		</form>
	</div>
	</nav>
	<div class="site-text site-block"
		style="width: 100%; margin-top: 10%;text-align: center;">
		<form id="adminForm"
			action="<%=request.getContextPath()%>/admin/adminLogin.do"
		    style="text-align: center; font-size: 20px;width:40%; margin-left:30%;
			background-color: rgba(0, 0, 0, 0.7);">
			<br> <br> <br> <br> <span style="color: white">账号:</span><input
				type="password" id="adminId" name="adminId" /><br /> <br /> <span
				style="color: white">密码:</span><input type="password" id="adminPassword" 
				name="adminPassword" />
				<br/><br/><br/>
			<div style="text-align: center;">
				<input class="layui-btn" style="width: 130px;"
					id="tryLogin" type="button" onclick="wannaLogin()" value="强势登录" />
			</div>
			<br>
			<br>
		</form>

	</div>

	<%-- <form id="adminForm"
		action="<%=request.getContextPath()%>/admin/adminLogin.do"
		method="post">
		<input type="text" name="repageNow" value="1" style="display: none;"/>
		<h3>管理员登录</h3>
		账号：<input type="password" id="adminId" name="adminId" /><br /> 密码：<input
			type="password" id="adminPassword" name="adminPassword" /><br /> <input
			id="tryLogin" type="button" onclick="wannaLogin()" value="强势登录" />
	</form> --%>
</body>
</html>