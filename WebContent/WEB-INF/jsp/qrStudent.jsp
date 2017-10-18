<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加入课程</title>
</head>
<body style="text-align: center;">

	<div id="backgroundPage"
		style="background-color: rgba(0, 0, 0, 0.5); height: 830px; display: none;">
	</div>

	<form id="showStudent" action="<%=request.getContextPath()%>/studentInfo/insertStudentInfo.do"
		style="margin-left: 30%; border: solid; border-color: red; position: fixed; width: 40%; top: 250px; font-size: 30px; z-index: 3">
		<h3>学生信息</h3>
		<input type="text" name="courseId" value="${course.courseId}" /> 
	         学号：<input type="text" name="studentRoNo"/><br /> 
		 密码：<input type="password" name="studentPassword"/><br /> 
		 <select name="clazzId">
		 <c:choose>
		 <c:when test="${! empty clazz}">
		 <c:forEach items="${clazz}" var="c">
		 <option value="${c.clazzId}">${c.clazzName}</option>
		 </c:forEach>
		 </c:when>
		 <c:otherwise>
		 <option selected="selected">暂无</option>
		 </c:otherwise>
		 </c:choose>
		 </select>
		<input type="submit" value="确认加入" />
	</form>
</body>
</html>