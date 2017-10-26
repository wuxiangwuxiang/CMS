<%-- 
    Document   : waitForRegister
    Created on : 2017-6-8, 17:33:13
    Author     : Juin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3;URL=<%=request.getContextPath() %>/student/exchangeStudent.do?studentRoNo=${student.studentRoNo}">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript">
</script>
<title>等待跳转..</title>
</head>
<body onload="shownum()">
	<h1>注册成功，<span id="time">3</span>s后自动跳转..</h1>
</body>
</html>
