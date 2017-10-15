<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生登录</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/student/studentLogin.do" method="post">
		学号:<input name="studentRoNo" type="text" /><br /><br/> 
		密码:<input name="studentPassword" type="password" /><br /><br /> 
		<input type="submit" value="登录" />
	</form>
</body>
</html>