<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息</title>
</head>
<body>

	<h3>课程：${course.courseName}</h3>
	<input type="text" value="${course.courseId}" style="display: none;" />
	<table  border="1">
		<tr>
			<th>班级</th>
			<th>学年</th>
			<th>人数</th>
			<th colspan="3">操作</th>
		</tr>

		<c:choose>
			<c:when test="${! empty course.clazz }">
				<c:forEach items="${course.clazz}" var="c">
					<tr>
						<td>${c.clazzName}</td>
						<td>${c.currentYear}</td>
						<td></td>
						<td><a href="<%=request.getContextPath()%>/student/selectStudentByClazzId.do?clazzId=${c.clazzId}">查看</a></td>
						<td><a href="#">修改</a></td>
						<td><a href="#">删除</a></td>
					</tr>
					<br />
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h3>(空)</h3>
			</c:otherwise>
		</c:choose>
	</table>

</body>
</html>