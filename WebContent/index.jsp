<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#lll').click(function() {
			$('#loginForm').toggle();
		});
		$('#sss').click(function() {
			$('#studentForm').show();
			$('#teacherForm').hide();
		});
		$('#ttt').click(function() {
			$('#studentForm').hide();
			$('#teacherForm').show();
		});
	});
</script>
</head>

<body
	style="background-image: url('lib/backimg.jpg'); background-repeat: no-repeat; background-size: 100%">


	<div style="width: 100%; height: 830px;">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">CMS</a>
			</div>

			<div id="navbar" class="navbar-collapse collapse">

				<div id="loginForm"
					style="width: 30%; higth: 100%; margin-top: 170px; background-color: white; position: fixed; margin-left: 320px; display: none;">
					<a href="#" id="sss"
						style="float: left; text-decoration: none; width: 50%; text-align: center; color: white; background-color: green; font-size: 28px;">学生登录</a>
					<a href="#" id="ttt"
						style="float: left; text-decoration: none; width: 50%; text-align: center; color: white; background-color: blue; font-size: 28px;">教师登录</a>
					<form id="studentForm"
						action="<%=request.getContextPath()%>/student/studentLogin.do"
						method="post" style="text-align: center; font-size: 20px;">
						<br><br>
						<br>
						<br> 学号:<input name="studentRoNo" type="text" /><br />
						<br /> 密码:<input name="studentPassword" type="password" /><br />
						<br /> <input type="submit" value="登录" /> <a href="<%=request.getContextPath()%>/student/addStudent.do" target="_blank"
							style="margin-left: 30px">去注册>></a>
					</form>
					<form id="teacherForm"
						action="<%=request.getContextPath()%>/teacher/teacherLogin.do"
						method="post"
						style="text-align: center; font-size: 20px; display: none;">
						<br>
						<br>
						<br> 手机:<input name="teacherId" type="text" /><br />
						<br /> 密码:<input name="password" type="password" /><br />
						<br /> <input type="submit" value="提交" /> <a href="#"
							style="margin-left: 30px">去注册>></a>
					</form>
					<br> <br>
					<br>
					<br>
					<br>
				</div>
				<form class="navbar-form navbar-right">
					<a href="#" id="lll" type="submit" class="btn btn-primary">登录</a>
				</form>
			</div>
		</div>
		</nav>


		<div class="jumbotron"
			style="background-color: rgba(0, 0, 0, 0.5); height: 100%;">
			<div class="container"></div>


		</div>
	</div>

</body>
</html>