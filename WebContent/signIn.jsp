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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>签到通道</title>
<script type="text/javascript">
function confirmRoNo() {
	 $.ajax({
         type: "GET",
         data: {
        	 "studentRoNo": $('#confirm').val(),
        	 "password":$('#password').val(),
        	 "courseId":$('#courseId').val(),
        	 "qrTime":$('#qrTime').val(),
        	 "validateCode":$('#ValidateCode').val()
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/student/insertQrTem.do",
         success: function (data) {
        	 alert(data.message);
         },
         error: function (data) {
             alert("服务器异常！");
         },
     });
}
</script>
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










	<%-- <div
		style="width: 70%; height: 500px; border: solid; border-color: red; 
		text-align: center; margin-left: 15%;font-size: 37px;">
		教师：<a href="#"><%=request.getParameter("teacherName") %></a><br /> 
		课程：<a href="#"><%=request.getParameter("courseName") %></a><br />
		日期: <a href="#"><%=request.getParameter("currentTime") %></a><br /> <br />
		<br />

		<form action="<%=request.getContextPath()%>/student/insertQrTem.do">
			<input style="display: none;" id="courseId" type="text" name="courseId" value="<%=request.getParameter("courseId") %>"
				disabled="disabled"><br /> 
				<input id="qrTime" type="date" name="qrTime"
				value="<%=request.getParameter("currentTime") %>" disabled="disabled"><br /> 
				学号：<input id="confirm" type="text" name="studentRoNo"><br /> 
				密码：<input id="password" type="password" name="studentPassword"><br />
				验证码：<input type="text" id="ValidateCode"/><br/>
			<input type="button" onclick="confirmRoNo()" value="立即签到" style="width: 50%">
		</form>


	</div> --%>
</body>
</html>