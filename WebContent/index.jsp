<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/mycss.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#lll').click(function() {
			$('#loginForm').toggle();
		});
		$('#sss').click(function() {
			$('#sss').css("background-color", "rgba(0,0,0,1)");
			$('#ttt').css("background-color", "rgba(0,0,0,0)");
			$('#studentForm').show();
			$('#teacherForm').hide();
		});
		$('#ttt').click(function() {
			$('#sss').css("background-color", "rgba(0,0,0,0)");
			$('#ttt').css("background-color", "rgba(0,0,0,1)");
			$('#studentForm').hide();
			$('#teacherForm').show();
		});
	});
</script>
</head>

<body
	style="background-image: url('lib/timg (1).jpg'); background-repeat: no-repeat; background-size: cover;">


	<div style="width: 100%; height: 1000px">
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
					style="width: 30%; higth: 100%; margin-top: 170px; background-color:rgba(0, 0, 0, 0.7); position: fixed; margin-left: 320px; display: none;">
					<a href="#" id="sss" class="alogin"
						style=" float: left; text-decoration: none; color: white; font-size: 28px; background-color: rgba(0,0,0,1); ">学生登录</a>
					<a href="#" id="ttt" class="alogin"
						style="float: left; text-decoration: none; color: white; font-size: 28px;">教师登录</a>
					<form id="studentForm"
						action="<%=request.getContextPath()%>/student/studentLogin.do"
						method="post" style="text-align: center; font-size: 20px;">
						<br> <br> <br> <br> <span style="color: white">学号:</span>><input
							name="studentRoNo" type="text" /><br /> <br /> <span
							style="color: white">密码:</span>><input name="studentPassword"
							type="password" /><br /> <br /> <input
							class="btn btn-primary btn-lg" style="width: 150px" type="submit"
							value="登录" /> <br>
						<br>
						<a href="<%=request.getContextPath()%>/student/addStudent.do"
							target="_blank" style="margin-left: 300px">去注册>></a>
					</form>
					<form id="teacherForm"
						action="<%=request.getContextPath()%>/teacher/teacherLogin.do"
						method="post"
						style="text-align: center; font-size: 20px; display: none;">
						<br> <br> <br> <br> <span style="color: white">手机:</span>><input
							name="teacherId" type="text" /><br /> <br /> <span
							style="color: white">密码:</span>><input name="password"
							type="password" /><br /> <br /> <input class="btn btn-primary btn-lg" style="width: 150px" type="submit"
							value="登录" />
							<br><br>
							 <a
							href="<%=request.getContextPath()%>/teacher/forTeacherRegister.do"
							style="margin-left: 300px" >去注册>></a>
					</form>
					<br> <br> <br> <br> <br>
				</div>
				<form class="navbar-form navbar-right">
					<a href="#" id="lll" type="submit" class="btn btn-primary">登录</a>
				</form>
			</div>
		</div>
		</nav>


		<div
			style="background-color: rgba(0, 0, 0, 0.6); height: 100%; background-size: cover;">
			<div class="container"></div>
		</div>
	</div>

</body>
</html>