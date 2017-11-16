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
<title>课程信息</title>
</head>
<body style="background-color: #eeeeee">


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
		<form class="navbar-form navbar-right" style="margin-right: 5%; float: left; ">
					<a id="lllww" style="width: 100px; color: white; font-size: 1.7em;">添加课程</a>
				</form>
	</div>
	</nav>
	<div class="site-text site-block"
		style="width: 100%; margin-top: 6%;padding-left: 20%">
		<form action="<%=request.getContextPath()%>/course/createQrNew.do">
			<table style="width: 60%; height: 40em;"
				class="layui-table">
				<tr>
					<td>课程名称</td>
					<td><%=request.getParameter("courseName")%></td>
				</tr>
				
				<tr>
					<td>任课老师</td>
					<td><%=request.getParameter("teacherName")%></td>
				</tr>
				
				<tr>
					<td>当前学年</td>
					<td><%=request.getParameter("currentTime")%></td>
				</tr>
				
				<tr>
					<td>当前学期</td>
					<td><%=request.getParameter("tem")%></td>
				</tr>
				
				<tr>
					<td>课程编码</td>
					<td><%=request.getParameter("courseId")%></td>
				</tr>
				
				<tr style="text-align: center;">
					<td colspan="2"><input
						id="perfectButton" type="submit"
						value="加入课程" class="layui-btn" style="width: 70%;"></td>
				</tr>
				
			</table>
			<input style="display: none;" type="text" name="courseId"
				value="<%=request.getParameter("courseId")%>"> <input
				style="display: none;" type="text" name="teacherMobile"
				value="<%=request.getParameter("teacherMobile")%>">
		</form>

	</div>

</body>
</html>