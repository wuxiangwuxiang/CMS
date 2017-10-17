<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师注册</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/teacher//insertTeacher.do" method="post">
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