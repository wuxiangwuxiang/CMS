<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>首页</title>
 <script type="text/javascript">
	 $(document).ready(function () {
		 $('#gotoCreateTeacher').click(function() {
			$('#getTheTeacher').toggle();
		});
	 });
	function change(id) {
		var id = document.getElementById(id).value;
		alert(id);
	}
	</script>
</head>
<body>
	<h1>你好，罗网</h1>
	<a href="http://blog.csdn.net/juinh">个人博客</a><br/>
	<a href="<%=request.getContextPath()%>/anna/exchange.do">拦截模板</a><br/><br/>
	<a href="#">学生登录</a><br/>
	<a href="<%=request.getContextPath()%>/student/addStudent.do" target="_blank">学生注册</a><br/><br/>
	<a href="<%=request.getContextPath()%>/teacher/forTeacherLogin.do" target="_blank">教师登录</a><br/>
	<a id="gotoCreateTeacher" href="#">创建教师账号</a><br/>
	<form action="<%=request.getContextPath()%>/student/selectStudentTemById.do">
	查询：<input type="text" name="studentRoNo"/>
	<input type="submit" value="提交"/>
	</form>
	
	
	<form id="getTheTeacher" style="display: none;" 
	action="<%=request.getContextPath()%>/teacher/insertTeacher.do" method="post">
		手机：<input type="text" name="teacherMobile"><br/> 
		邮箱：<input type="text" name="teacherEmail"><br/> 
		密码：<input type="password" name="teacherPassword"><br/> 
		名字：<input id="teacherName" type="text" name="teacherName" onchange="change(this.id)"><br /> 
		性别：<input type="text" name="teacherGender"><br/> 
		课程：<input type="text" name="teacherSubject"><br/> 
			<input type="submit" value="提交" />
	</form>
	
</body>
</html>