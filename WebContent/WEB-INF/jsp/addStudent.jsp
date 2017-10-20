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

<title>学生注册</title>
<script type="text/javascript">
	function getPath(obj) {
		if (obj) {
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				obj.select();
				return document.selection.createRange().text;
			} else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
				if (obj.files) {
					return obj.files.item(0).getAsDataURL();
				}
				return obj.value;
			}
			return obj.value; 
		}
	}
	/** 
	 * 将本地图片 显示到浏览器上 
	 */
	function getFileUrl(sourceId) {
		var url;
		url = window.URL
				.createObjectURL(document.getElementById(sourceId).files
						.item(0));
		return url;
	}
	function preImg(sourceId, targetId, tct) {
		var fileName = document.getElementById(sourceId).value;
		var fileNamePlus = fileName.substr(12);
		var url = getFileUrl(sourceId);
		var imgPre = document.getElementById(targetId);
		imgPre.style.display = "block";
		imgPre.src = url;
		document.getElementById(tct).value = fileNamePlus;
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
	</div>
	</nav>


	<div
		style="background-color: white; margin-left: 20%; margin-right: 20%; padding-left: 250px; padding-right: 250px; padding-top: 8%; padding-bottom: 50px;">
		<form class="layui-form layui-form-pane" action="" value="studentForm">
			<div class="layui-form-item">
				<label class="layui-form-label" for="id">学号</label>
				<div class="layui-input-block">
					<input id="id" type="text" name="studentRoNo" required
						lay-verify="required|number|idvalidate" placeholder="请输入学号"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" for="password">密码</label>
				<div class="layui-input-inline">
					<input id="password" type="password" name="studentPassword"
						required lay-verify="required|pass" placeholder="请输入密码"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16位的数字,字母或下划线</div>
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
				<label class="layui-form-label" for="mail">油箱</label>
				<div class="layui-input-block">
					<input id="mail" type="text" name="studentEmail" required
						lay-verify="required|email" placeholder="请输入油箱" autocomplete="off"
						class="layui-input">
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
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="sex" value="男" title="男"
						checked> 
						<input type="radio" name="sex"
						value="女" title="女">
				</div>
			</div>


			<div style="background-color: blue;">
				<div style="height: 140px; width: 100px; float: left;">
					<input type="file" name="file" id="uploadFile"
						style="display: none;" onchange="preImg(this.id, 'imgPre','tct');" />
					<button class="layui-btn" type="button"
						onclick="uploadFile.click()">上传照片</button>
					<input id="tct" type="text" name="studentPhoto" value=""
						style="display: none" />
				</div>
				<div class="layui-upload-list" style="float: left;">
					<img class="layui-upload-img" style="width: 140px; height: 140px;"
						id="imgPre">
					<p id="demoText"></p>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				layer.msg(JSON.stringify(data.field));
				return false;
			});

			form.verify({
				idvalidate:[/^[\d]{10,20}$/,'学号必须是10到20位数字']
				,pass : [/^[\w]{6,16}$/, '密码必须6到16位的数字,字母或下划线']
			});
		});
	</script>
</body>
</html>