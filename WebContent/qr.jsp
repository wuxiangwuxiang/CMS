<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息</title>
</head>
<body>
<form style="width: 250px; padding-left:20px; margin: 220px auto;">
<h3>课程名称：<%=request.getParameter("courseName") %></h3>
<h3>任课老师：<%=request.getParameter("teacherName") %></h3>
<h3>当前学年：<%=request.getParameter("currentTime") %>年</h3>
<h3>当前学期：<%=request.getParameter("tem") %>学期</h3>
<input type="submit" value="加入课程" style="margin-left:10px;width: 60%;"/>
</form>
</body>
</html>