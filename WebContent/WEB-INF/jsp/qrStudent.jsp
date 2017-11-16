<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>加入${course.courseName}</title>
</head>
<body style="background-color: #eeeeee; padding-top: 100px;">

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
			<a id="lllww" style="width: 100px; color: white; font-size: 1.7em;">添加课程</a>
		</form>
	</div>
	</nav>
	<!-- 添加课程 -->
	<div
		style="heigh: 300px; background-color: white; margin-left: 19%; margin-right: 20%; padding-left: 10%; padding-right: 10%; padding-top: 8%; padding-bottom: 100px;">


		<div id="addCourseShow"
			style="background-color: #393D49; height: 10%; width: 20%; z-index: 20; position: fixed; margin-top: 10%; text-align: center; margin-left: 15%; display: none;">
			<h3 id="zzz" style="color: white; margin-top: 32%"></h3>
		</div>


		<form style="width: 80%;" class="layui-form-pane" action="">
			<input type="text" id="courseId" name="courseId"
				value="${course.courseId}" style="display: none;" />
			<div class="layui-form-item">
				<label class="layui-form-label" for="id">学号</label>
				<div class="layui-input-block">
					<input id="id" type="text" name="studentRoNo" required
						lay-verify="required|number|idvalidate" placeholder="请输入学号"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<br />
			<br />
			<div class="layui-form-item">
				<label class="layui-form-label" for="password">密码</label>
				<div class="layui-input-inline">
					<input id="password" type="password" name="studentPassword"
						required lay-verify="required|pass" placeholder="请输入密码"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<br />
			<br />
			<div class="layui-form-item">
				<label class="layui-form-label" for="password">班级</label>
				<div>
					<select id="clazzId" name="clazzId"
						style="height: 2.7em; width: 30%;">
						<c:choose>
							<c:when test="${! empty clazz}">
								<c:forEach items="${clazz}" var="c">
									<option value="${c.clazzId}">${c.clazzName}</option>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<option selected="selected">暂无</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>
			<div style="height: 60px; width: 300px; float: left;">
				<button style="margin-left: 0; float: left; margin-left: 4%;"
					class="layui-btn" onclick="trySubmit()">现在加入</button>
				<button style="float: left; margin-left: 24%; width: 100px"
					type="reset" class="layui-btn layui-btn-primary">重置</button>
				<br />
				<br />

			</div>
		</form>
	</div>

	<script>
	function onload() {
		$('#addCourseShow').hide();
	}
	function trySubmit() {
		if($('#id').val() != "" && $('#studentPassword').val() != ""){
		$.ajax({
              type: "GET",
              data: {
                  "studentRoNo": $('#id').val(),
                  "studentPassword": $('#password').val(),
                  "clazzId": $('#clazzId').val(),
                  "courseId":$('#courseId').val()
              },
              contentType: "application/json; charset=utf-8",
              async: false,
              dataType: "json",
              url: "<%=request.getContextPath()%>/student/confirmAddCourse.do",
							success : function(data) {
								if (data.result == true) {
									$('#zzz').html("成功添加该课程..");
									$('#addCourseShow').show();
									setTimeout('onload()',5000);
								} else if (data.message == "学号错误") {
									$('#zzz').html("学号错误..");
									$('#addCourseShow').show();
									setTimeout('onload()',5000);
								} else if (data.message == "密码错误") {
									$('#zzz').html("密码错误..");
									$('#addCourseShow').show();
									setTimeout('onload()',5000);
								} else if (data.message == '请勿重复加入') {
									$('#zzz').html("请勿重复加入..");
									$('#addCourseShow').show();
									setTimeout('onload()',5000);
								}
							},
							error : function(data) {

							}
						});
			}
		}
		//Demo
		layui.use('form', function() {
			var form = layui.form;
			form.verify({
				idvalidate : [ /^[\d]{10,20}$/, '学号必须是10到20位数字' ],
				pass : [ /^[\w]{6,16}$/, '密码必须6到16位的数字,字母或下划线' ]
			});
		});
	</script>

</body>
</html>