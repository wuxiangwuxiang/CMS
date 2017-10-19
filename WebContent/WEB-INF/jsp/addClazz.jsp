<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加课程</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/clazz/addClazz.do">
班级名称：<input type="text" name="clazzName"><br/>
当前学年：<input type="text" name="currentYear"><br/>
<input type="text" name="course.courseId" value="${course.courseId}"><br/>
<input type="submit" value="提交"><br/>
</form>
</body>
</html>