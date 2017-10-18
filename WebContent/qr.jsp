<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>课程信息</title>
</head>
<body style="text-align: center;">


<form action="<%=request.getContextPath()%>/course/createQrNew.do" id="courseInfo" style="width: 70%; margin: 220px auto;font-size: 30px;">
<h3>课程名称：<%=request.getParameter("courseName") %></h3>
<h3>任课老师：<%=request.getParameter("teacherName") %></h3>
<h3>当前学年：<%=request.getParameter("currentTime") %>年</h3>
<h3>当前学期：<%=request.getParameter("tem") %>学期</h3>
<h3>courseId：<%=request.getParameter("courseId") %>学期</h3>
<input type="text" name="courseId" value="<%=request.getParameter("courseId") %>">
<input type="text" name="teacherMobile" value="<%=request.getParameter("teacherMobile") %>"> 
<input id="iii" type="submit" value="加入课程"
			style="margin-left: 10px; width: 60%;" />
	</form>
</body>
</html>