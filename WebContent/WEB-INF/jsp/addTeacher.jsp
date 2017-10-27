<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

<title>教师注册</title>



<script type="text/javascript">
	
	/** 
	 * 将本地图片 显示到浏览器上 
	 */
	
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
		style="heigh: 300px; background-color: white; margin-left: 19%; margin-right: 20%; padding-left: 10%; padding-right: 10%; padding-top: 8%; padding-bottom: 500px;">
		<form style="float: left; width: 80%;"
			class="layui-form layui-form-pane"
			action="<%=request.getContextPath()%>/teacher/insertTeacher.do"
			 method="post">
			<div class="layui-form-item">
				<label class="layui-form-label" for="mobile">手机</label>
				<div class="layui-input-block">
					<input id="mobile" type="text" name="teacherMobile" required
						lay-verify="required|number|phone" placeholder="请输入手机"
						autocomplete="off" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label" for="mail">邮箱</label>
				<div class="layui-input-block">
					<input id="mail" type="text" name="teacherEmail" required
						lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off"
						class="layui-input">
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



			<div class="layui-form-item">
				<label class="layui-form-label" for="name">姓名</label>
				<div class="layui-input-block">
					<input id="name" type="text" name="teacherName" required
						lay-verify="required" placeholder="请输入姓名" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="teacherGender" value="男" title="男"
						checked> <input type="radio" name="teacherGender"
						value="女" title="女">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label">选择课程</label>
				<div class="layui-input-block">
					<select name="teacherSubject" lay-verify="required">
						<option value="" selected>请选择</option>
						<option value="离散数学">离散数学</option>
						<option value="大学英语">大学英语</option>
						<option value="计算机网络">计算机网络</option>
						<option value="C语言程序设计">C语言程序设计</option>
						<option value="数据结构">数据结构</option>
						<option value="数据挖掘">数据挖掘</option>
						<option value="高数">高数</option>
					</select>
				</div>
			</div>


			<div style="background-color: white;">
				<div style="height: 60px; width: 300px;">
						<button style="margin-left: 14%;" class="layui-btn" lay-submit
						lay-filter="formDemo">点击注册</button>
						<button style=" margin-left: 14%; width: 100px"
						type="reset" class="layui-btn layui-btn-primary">重置</button>
					<br /> <br /> <br />
				</div>

			</div>
			<br /> <br /> <br />
		</form>
	</div>

	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				
				var mobile = $('#mobile').val();
				if (trySubmit(mobile)) {
					return true;
				} else {
					alert("注册失败，手机号已注册!");
					return false;
				}
			});
			
			form.verify({
				pass : [/^[\w]{6,16}$/, '密码必须6到16位的数字,字母或下划线']
			});
		});	
		
		function trySubmit(mobile) {
			  var result = false;
			$.ajax({
	              type: "GET",
	              data: {
	                  "teacherMobile": mobile
	              },
	              contentType: "application/json; charset=utf-8",
	              async: false,
	              dataType: "json",
	              url: "<%=request.getContextPath() %>/teacher/confirmExitsTeacher.do",
//	              beforeSend:function(){$("#href").html("等待..");},
	              success: function (data) {
	            	  if(data.result == true){
	            		  result = true;
	            	  }
	              },
	              error: function (data) {
	            	  alert("服务器异常");
	              }
	          });
			  return result;
		}
		
	</script>

</body>
</html>