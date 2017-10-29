<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>签到通道</title>
<script type="text/javascript">
function confirmRoNo() {
	var studentRoNo = $('#confirm').val();
	alert(studentRoNo);
	 $.ajax({
         type: "GET",
         data: {
        	 "studentRoNo": studentRoNo,
        	 "password":$('#password').val(),
        	 "courseId":$('#courseId').val(),
        	 "qrTime":$('#qrTime').val(),
        	 "validateCode":$('#ValidateCode').val()
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/student/insertQrTem.do",
         success: function (data) {
        	 alert(data.message);
         },
         error: function (data) {
             alert("服务器异常！");
         },
     });
}
</script>
</head>
<body>
	<div
		style="width: 70%; height: 500px; border: solid; border-color: red; 
		text-align: center; margin-left: 15%;font-size: 37px;">
		教师：<a href="#"><%=request.getParameter("teacherName") %></a><br /> 
		课程：<a href="#"><%=request.getParameter("courseName") %></a><br />
		日期: <a href="#"><%=request.getParameter("currentTime") %></a><br /> <br />
		<br />

		<form action="<%=request.getContextPath()%>/student/insertQrTem.do">
			<input id="courseId" type="text" name="courseId" value="<%=request.getParameter("courseId") %>"
				disabled="disabled"><br /> 
				<input id="qrTime" type="date" name="qrTime"
				value="<%=request.getParameter("currentTime") %>" disabled="disabled"><br /> 
				学号：<input id="confirm" type="text" name="studentRoNo"><br /> 
				密码：<input id="password" type="password" name="studentPassword"><br />
				验证码：<input type="text" id="ValidateCode"/><br/>
			<input type="button" onclick="confirmRoNo()" value="立即签到" style="width: 50%">
		</form>


	</div>
</body>
</html>