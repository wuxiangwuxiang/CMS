<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息修改</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/course/changeCourse.do">
<input type="text" name="courseId" value="${course.courseId}" /><br/>
<input type="text" name="teacherMobile" value="${course.teacher.teacherMobile}" /><br/>
课程名称：<input type="text" name="courseName" value="${course.courseName}"/><br/>
课程类型：&nbsp;&nbsp;&nbsp;<input type="radio" name="courseType" value="必修" checked="checked"/>必修
<input type="radio" name="courseType" value="选修"/>选修&nbsp;<br/>
班级容量：<input type="text" name="classCapacity" value="${course.classCapacity}"/><br/>
开始时间：<input type="date" name="startTime" value="${course.startTime}"/><br/>
结束时间：<input type="date" name="endTime" value="${course.endTime}"/><br/>
当前学年：<input type="text" name="currentYear" value="${course.currentYear}"/><br/>
当前学期：<select name="schoolTem">
<option selected="selected" value="春季">春季学期</option>
<option value="夏季">夏季学期</option>
<option value="秋季">秋季学期</option>
<option value="冬季">冬季学期</option>
</select><br/>
<input type="submit" value="提交"/>
</form>
</body>
</html>