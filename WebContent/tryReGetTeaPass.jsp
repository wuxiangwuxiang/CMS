<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="css/mycss.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<title>密码重置</title>
</head>
<style type="text/css">
#lll:HOVER {
	text-decoration: none;
}
</style>
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
			<a class="navbar-brand" href="#" style="float: left;">CMS</a>
		</div>
		<form class="navbar-form navbar-right" style="margin-right: 5%; float: left; ">
					<a id="lll" style="width: 100px; color: white; font-size: 1.7em;">密码重置</a>
				</form>
	</div>
	</nav>

	<div
		style="heigh: 300px; background-color: white; margin-left: 19%; margin-right: 20%; padding-left: 10%; padding-right: 10%; padding-top: 12%; padding-bottom: 500px;">
		<form style="float: left; width: 80%;"
			class="layui-form layui-form-pane" action="">
			<div class="layui-form-item">
				<label class="layui-form-label" for="mobile">手机</label>
				<div class="layui-input-block">
					<input id="mobile" type="text" name="teacherMobile" required
						lay-verify="required|number|phone" value="<%=request.getParameter("teacherMobile") %>"
						autocomplete="off" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label" for="password">密码</label>
				<div class="layui-input-inline">
					<input id="password" type="password" name="teacherPassword"
						required lay-verify="required|pass" placeholder="请输入密码"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16位的数字,字母或下划线</div>
			</div>
			<br />
			<div style="background-color: blue;">
				<div style="height: 60px; width: 300px; float: left;">
					<button class="layui-btn" lay-submit lay-filter="formDemo"
						type="button" onclick="changePass()"
						style="float: left; margin-left: 8%;">重置密码</button>
					<input id="tct" type="text" name="studentPhoto" value=""
						style="display: none" />
					<button style="float: left; margin-left: 20%; width: 100px"
						type="reset" class="layui-btn layui-btn-primary">输入重置</button>
					<br /><br /><br />
				</div>
			</div>

			<br /><br /><br />
			
		</form>
		<div class="layui-upload-list"
			style="width: 100px; heigh: 120px; float: left; margin-left: 10px">
			<img class="layui-upload-img" src=""
				style="width: 100px; heigh: 120px;" id="imgPre">
			<p id="demoText"></p>
		</div>


		<div id="divShow"
			style="background-color: #393D49; height:150px; width: 30%; z-index: 3;
			position: fixed; margin-top: 8%; text-align: center; display: none;">
         <h3 style="color: white; margin-top: 19%">修改完成，请重新登录..</h3>
		</div>

	</div>


	<script>
	
		//监听找回密码按钮点击
		function changePass() {
			var mobile = $('#mobile').val();
			if (trySubmit(mobile)) {
				$('#divShow').show();
				setTimeout('yourFunction()',2000); 
			}
		}
		//关闭当前页面
		function yourFunction() {
			window.opener=null;
			window.open('','_self');
			window.close();
		}
		//ajax验证账号信息是否正确
		function trySubmit(mobile) {
			var mobile = mobile;
			var password = $('#password').val();
			  var result = false;
			$.ajax({
	              type: "GET",
	              data: {
	                  "mobile": mobile,
	                  "password":password
	              },
	              contentType: "application/json; charset=utf-8",
	              async: false,
	              dataType: "json",
	              url: "<%=request.getContextPath()%>/teacher/ajaxupdateTeacherPassWord.do",
						success : function(data) {
							if (data.result == true) {
								result = true;
							}else{
								alert(data.result);
							}
						},
						error : function(data) {
							alert("服务器异常！！");
						}
					});
			return result;
		}
	</script>

</body>

</html>