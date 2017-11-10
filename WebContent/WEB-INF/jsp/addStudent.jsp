<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
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
<title>学生注册</title>
<style type="text/css">
#lllww:HOVER {
	text-decoration: none;
}
</style>
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
		<form class="navbar-form navbar-right" style="margin-right: 5%; float: left; ">
					<a id="lllww" style="width: 100px; color: white; font-size: 1.7em;">学生注册</a>
				</form>
	</div>
	</nav>


	<div
		style="heigh:300px;background-color: white; margin-left: 19%; margin-right:20%; padding-left: 10%; padding-right:10%;  padding-top: 8%; padding-bottom: 500px;">
		<form style="float:left; width: 80%;" class="layui-form layui-form-pane"  action="<%=request.getContextPath()%>/student/insertStudent.do" enctype="multipart/form-data" method="post">
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
				<label class="layui-form-label" for="mail">邮箱</label>
				<div class="layui-input-block">
					<input id="mail" type="text" name="studentEmail" required
						lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off"
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
					<input type="radio" name="studentGender" value="男" title="男"
						checked> 
						<input type="radio" name="studentGender"
						value="女" title="女">
				</div>
			</div>


			<div style="background-color: blue;">
				<div style="height: 60px; width: 300px; float: left;">
					<input type="file" name="file" id="uploadFile"
						style="display: none;" onchange="preImg(this.id, 'imgPre','tct');" />
					<button class="layui-btn" type="button"
						onclick="uploadFile.click()" style="float: left;">上传照片</button>
					<input id="tct" type="text" name="studentPhoto" value=""
						style="display: none" />
						<button style="float: left;margin-left: 34%; width:100px" type="reset" class="layui-btn layui-btn-primary">重置</button>
				        <br/><br/><br/><button style="margin-left: 0;" class="layui-btn" lay-submit lay-filter="formDemo">现在注册</button>
				</div>
				
				<!--  <div class="layui-upload-list" style="float: left;">
					<img class="layui-upload-img" style="width: 140px; height: 140px; display: none;" id="imgPre">
					<p id="demoText"></p>
				</div>-->
			</div><br/><br/><br/>
			<!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
		</form>
				<div class="layui-upload-list" style="width: 100px; heigh:120px; float: left; margin-left: 10px">
				<img class="layui-upload-img" src="" style="width: 100px; heigh:120px;" id="imgPre">
					<p id="demoText"></p>
				</div>
				
	</div>

	<script>
		//Demo
		layui.use('form', function() {
			var form = layui.form;

			//监听提交
			form.on('submit(formDemo)', function(data) {
				
				var id = $('#id').val();
				if (trySubmit(id)) {
					return true;
				} else {
					alert("用户已存在!");
					return false;
				}
			});
			
			function trySubmit(id) {
				var studentRoNo = id;
				  var result = false;
				$.ajax({
		              type: "GET",
		              data: {
		                  "studentRoNo": studentRoNo
		              },
		              contentType: "application/json; charset=utf-8",
		              async: false,
		              dataType: "json",
		              url: "<%=request.getContextPath() %>/student/confirmExitsStudent.do",
//		              beforeSend:function(){$("#href").html("等待..");},
		              success: function (data) {
		            	  if(data.result == true){
		            		  result = true;
		            	  }
		              },
		              error: function (data) {
		            	  
		              }
		          });
				  return result;
			}

			form.verify({
				idvalidate:[/^[\d]{10,20}$/,'学号必须是10到20位数字'],
				pass : [/^[\w]{6,16}$/, '密码必须6到16位的数字,字母或下划线']
			});
		});
	</script>
</body>
</html>