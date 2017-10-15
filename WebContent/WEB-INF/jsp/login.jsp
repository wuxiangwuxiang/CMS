<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/login.do" method="post">
	    <h3 style="color: red;">请先登录</h3>
		<a href="<%=request.getContextPath()%>/student/forStudentLogin.do">学生登录</a><br />
		<a href="<%=request.getContextPath()%>/teacher/forTeacherLogin.do">教师登录</a><br />
	</form>
</body>
</html>