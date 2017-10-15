<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证拦截页面</title>
</head>
<body>
	<h3>信息："${test.studentName}"</h3>
	<a href="<%=request.getContextPath()%>/index.jsp">首页</a>
</body>
</html>