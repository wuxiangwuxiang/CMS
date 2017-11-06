<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type"
	content="multipart/form-data; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />

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

<title>学生找回密码</title>
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
				<label class="layui-form-label" for="id">学号</label>
				<div class="layui-input-block">
					<input id="id" type="text" name="studentRoNo" required
						lay-verify="required|number|idvalidate" placeholder="请输入学号"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" for="name">姓名</label>
				<div class="layui-input-block">
					<input id="name" type="text" name="studentName" required
						lay-verify="required" placeholder="请输入姓名" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" for="mobile">手机</label>
				<div class="layui-input-block">
					<input id="mobile" type="text" name="studentMobile" required
						lay-verify="required|phone|number" placeholder="请输入手机"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label" for="mail">邮箱</label>
				<div class="layui-input-block">
					<input id="mail" type="text" name="studentEmail" required
						lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<a id="ifhaveThisPerson" href="#" style="color: red;margin-left: 20%; display: none;">*查无此人*</a><br/>
			<br />
			<div style="background-color: blue;">
				<div style="height: 60px; width: 300px; float: left;">
					<button class="layui-btn" lay-submit lay-filter="formDemo"
						type="button" onclick="beforechangePass()"
						style="float: left; margin-left: 8%;">密码找回</button>
					<input id="tct" type="text" name="studentPhoto" value=""
						style="display: none" />
					<button style="float: left; margin-left: 20%; width: 100px"
						type="reset" class="layui-btn layui-btn-primary">重置</button>
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
			style="background-color: #393D49; height: 30%; width: 30%; z-index: 3;
			position: fixed; margin-top: 8%; text-align: center; display: none;">
         <h3 style="color: white; margin-top: 19%">请查看邮箱完成密码重置..</h3>
		</div>
		
		
		<div id="xSirShow"
			style="background-color: #393D49; height: 30%; width: 30%; z-index: 3;
			position: fixed; margin-top: 8%; text-align: center; display: none;">
         <h3 style="color: white; margin-top: 19%">请稍后哦后台君正在加速处理..</h3>
		</div>

	</div>


	<script>
	
		//格式验证
		layui.use('form', function() {
			var form = layui.form;			
			form.verify({
				idvalidate:[/^[\d]{10,20}$/,'学号必须是10到20位数字']
			});
		});
		//监听找回密码按钮点击
		function beforechangePass() {
			$('#xSirShow').show();
			setTimeout('changePass()',500); 
		}
		function changePass() {
			var id = $('#id').val();
			if (trySubmit(id)) {
				$('#ifhaveThisPerson').hide();
				$('#divShow').show();
				setTimeout('yourFunction()',2000); 
			}else{
				$('#ifhaveThisPerson').show();
			} 
		}
		//关闭当前页面
		function yourFunction() {
			window.opener=null;
			window.open('','_self');
			window.close();
		}
		//ajax验证账号信息是否正确
		function trySubmit(id) {
			var studentRoNo = id;
			var name = $('#name').val();
			var mobile = $('#mobile').val();
			var mail = $('#mail').val();
			  var result = false;
			$.ajax({
	              type: "GET",
	              data: {
	                  "studentRoNo": studentRoNo,
	                  "name":name,
	                  "mobile":mobile,
	                  "mail":mail
	              },
	              contentType: "application/json; charset=utf-8",
	              async: false,
	              dataType: "json",
	              url: "<%=request.getContextPath()%>/student/forStudentReGetPass.do",
						success : function(data) {
							$('#xSirShow').hide();
							if (data.result == true) {
								result = true;
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