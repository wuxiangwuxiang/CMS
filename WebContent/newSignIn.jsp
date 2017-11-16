<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/cms2.ico" media="screen" />

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mycss.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<script src="<%=request.getContextPath()%>/layui/layui.js "></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>签到通道</title>
<script type="text/javascript">
function confirmRoNo() {
	if($('#confirm').val() !="" && $('#password').val() != "" && $('#ValidateCode').val() != ""){
	 $.ajax({
         type: "GET",
         data: {
        	 "studentRoNo": $('#confirm').val(),
        	 "password":$('#password').val(),
        	 "courseId":<%=request.getParameter("courseId") %>,
        	 "qrTime":<%=request.getParameter("currentTime") %>,
        	 "validateCode":$('#ValidateCode').val()
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/student/insertQrTem.do",
			success : function(data) {
				alert(data.message);
			},
			error : function(data) {
				alert("服务器异常！");
			},
		});
	}else {
		alert("请检查输入,不可为空！");
	}
	}
</script>
</head>
<body style="background-color: #eeeeee">

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
		<form class="navbar-form navbar-right"
			style="margin-right: 5%; float: left;">
			<a id="lllww" style="width: 100px; color: white; font-size: 1.7em;">签到通道</a>
		</form>
	</div>
	</nav>

	<!-- 信息栏 -->

	<div style="heigh: 300px; background-color: white; margin-left: 19%; margin-right: 20%; 
	padding-left: 10%; padding-right: 10%; padding-top: 8%; padding-bottom: 100px;">
		<div id="signInShow"
			style="background-color: #393D49; height: 10%; width: 20%; z-index: 20; position: fixed; margin-top: 10%; text-align: center; margin-left: 15%; display: none;">
			<h3 id="zzz" style="color: white; margin-top: 32%"></h3>
		</div>


		<form style="width: 80%;" class="layui-form-pane" action="">
		<div class="layui-form-item">
				<label class="layui-form-label">课程</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input"
						value="<%=request.getParameter("courseName")%>" disabled="disabled">
				</div>
			</div>
			
			
			<div class="layui-form-item">
				<label class="layui-form-label">教师</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input"
						value="<%=request.getParameter("teacherName")%>" disabled="disabled">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">日期</label>
				<div class="layui-input-block">
					<input type="text" class="layui-input"
						value="<%=request.getParameter("currentTime")%>" disabled="disabled">
				</div>
			</div>
			<br /> <br />
			<div class="layui-form-item">
				<label class="layui-form-label">学号</label>
				<div class="layui-input-block">
					<input id="confirm" type="text" name="studentRoNo" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input id="password" type="password" name="studentPassword" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">验证码</label>
				<div class="layui-input-block">
					<input type="text" id="ValidateCode" class="layui-input">
				</div>
			</div>
			
			<div style="height: 60px; width: 300px; float: left;">
				<button style="margin-left: 0; float: left; margin-left: 4%;"
					class="layui-btn" onclick="confirmRoNo()">立即签到</button>
				<button style="float: left; margin-left: 24%; width: 100px"
					type="reset" class="layui-btn layui-btn-primary">重置</button>
				<br /> <br />

			</div>
		</form>
	</div>










	<%-- <div
		style="width: 70%; height: 500px; border: solid; border-color: red; 
		text-align: center; margin-left: 15%;font-size: 37px;">
		教师：<a href="#"><%=request.getParameter("teacherName") %></a><br /> 
		课程：<a href="#"><%=request.getParameter("courseName") %></a><br />
		日期: <a href="#"><%=request.getParameter("currentTime") %></a><br /> <br />
		<br />

		<form action="<%=request.getContextPath()%>/student/insertQrTem.do">
			<input style="display: none;" id="courseId" type="text" name="courseId" value="<%=request.getParameter("courseId") %>"
				disabled="disabled"><br /> 
				<input id="qrTime" type="date" name="qrTime"
				value="<%=request.getParameter("currentTime") %>" disabled="disabled"><br /> 
				学号：<input id="confirm" type="text" name="studentRoNo"><br /> 
				密码：<input id="password" type="password" name="studentPassword"><br />
				验证码：<input type="text" id="ValidateCode"/><br/>
			<input type="button" onclick="confirmRoNo()" value="立即签到" style="width: 50%">
		</form>


	</div> --%>
</body>
</html>