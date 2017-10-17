<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>课程信息</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#iii').click(function() {
			$('#courseInfo').hide();
			$('#backgroundPage').show();
			$('#showStudent').toggle();
		});
	});
</script>
</head>
<body style="text-align: center;">
<form id="showStudent" style="margin-left:30%; border:solid;border-color:red; 
position:fixed; width: 40%; top: 250px; display: none;font-size: 30px;z-index: 3">
<h3>学生信息</h3>
学号：<input type="text"/><br/>
密码：<input type="password"/><br/>
<input type="submit" value="确认加入"/>
</form>

<div id="backgroundPage"
			style="background-color: rgba(0, 0, 0, 0.5); height: 830px; display: none;">
</div>
<div id="courseInfo" style="width: 70%; margin: 220px auto;font-size: 30px;">
<h3>课程名称：<%=request.getParameter("courseName") %></h3>
<h3>任课老师：<%=request.getParameter("teacherName") %></h3>
<h3>当前学年：<%=request.getParameter("currentTime") %>年</h3>
<h3>当前学期：<%=request.getParameter("tem") %>学期</h3>
<input id="iii" type="button" value="加入课程" style="margin-left:10px;width: 60%;"/>
</div>
</body>
</html>