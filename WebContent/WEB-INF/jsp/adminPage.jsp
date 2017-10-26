<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超管登录</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/admin/adminLogin.do" method="post">
管理员账号：<input type="password" name="adminId"/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码：<input type="password" name="adminPassword"/><br/>
<input type="submit" value="强势登录"/>
</form>
</body>
</html>