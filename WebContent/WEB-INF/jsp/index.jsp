<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/teacherPage.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<script src="<%=request.getContextPath()%>/layui/layui.js "></script>
<title>教师门户</title>
<script type="text/javascript">
	 $(document).ready(function () {
		 $('#checkCourseShow').click(function name1() {
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			$('#courseInfo').show();
		});
		 
		 $('#addCourse').click(function name1() {
				$('#courseInfo').hide();
				$('#doubleHandle').hide();
				$('#signal').hide();
			});
			$('#safeManage').click(function name1() {
				$('#courseInfo').hide();
				$('#doubleHandle').show();
				$('#signal').show();
			});
	 
	//获取学生密码，进行后台比对
		function getStuAnwser(password,studentRono) {
			var result = false;
			$.ajax({
	              type: "GET",
	              data: {
	                  "password": password,
	                  "studentRono":studentRono
	              },
	              contentType: "application/json; charset=utf-8",
	              async: false,
	              dataType: "json",
	              url: "<%=request.getContextPath() %>/student/confirmStudentPassWord.do",
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
		//点击申请修改触发密码验证
		$('#ccchangePass').click(function wannaSubmittt() {
			var password = $('#studentPassword').val();
			var studentRono = $('#studentRoNo').val();
			var newPassword = $('#newPassword').val();
			var rePassword = $('#rePassword').val();
			if(getStuAnwser(password,studentRono)){
				$('#passError').hide();
				if(newPassword != null && newPassword != "" && newPassword == rePassword){
					$('#noLike').hide();
					changeStuPass();					
				}else{
					$('#noLike').show();
				}
			}else {
				$('#passError').show();
			}
		});
		//ajax更改密码
		function changeStuPass() {
			$('#safe').submit();
		}
	 });
</script>
</head>
<body>

	<div class="layui-layout layui-layout-admin" style="">
		<!-- 头部导航 -->
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<a class="CMSlogo" href="/"><span
					style="color: white; font-size: 25px;">CMS</span></a>

				<ul class="layui-nav">
					<li class="layui-nav-item"><a href="#">消息<span
							class="layui-badge">9</span></a></li>
					<li class="layui-nav-item"><a href="#">个人中心<span
							class="layui-badge-dot"></span></a></li>
					<li class="layui-nav-item"><a href="#">${student.studentName}</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#">修改信息</a>
							</dd>
							<dd>
								<a id="safeManage" href="#">安全管理</a>
							</dd>
							<dd>
								<a href="#">注销</a>
							</dd>
						</dl></li>
				</ul>

			</div>
		</div>
		<!-- 左侧垂直导航 -->
		<div class="layui-side layui-bg-black" style=" position: absolute;">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">课程中心</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="checkCourseShow" href="#">课程信息</a>
							</dd>
							<dd>
								<a id="addCourse" href="#">添加课程</a>
							</dd>
							<dd>
								<a href="#">待定</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">数据平台</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#">签到记录</a>
							</dd>
							<dd>
								<a href="#">操作日志</a>
							</dd>
							<dd>
								<a href="#">待定</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="#">博客中心</a></li>
					<li class="layui-nav-item"><a href="#">课堂资料</a></li>
				</ul>
			</div>
		</div>
	</div>

		<!-- 内容显示 -->
		<div class="layui-body site-demo" style="padding-top: 7%;overflow: auto;">
			<br />
			
			<!-- 课程信息表 -->
			<table id="courseInfo" border="1" style="text-align: center; width: 80%; margin-left: 5%;">
			<tr>
			<th>课程名称</th>
			<th>类型</th>
			<th>开课时间</th>
			<th>结课时间</th>
			<th>学年</th>
			<th>学期</th>
			<th>老师</th>
			<th>联系方式</th>
			</tr>
			<c:choose>
			<c:when test="${! empty studentInfos}">
			<c:forEach items="${studentInfos}" var="s">
			<tr>
			<td>${s.course.courseName}</td>
			<td>${s.course.courseType}</td>
			<td>${s.course.startTime}</td>
			<td>${s.course.endTime}</td>
			<td>${s.course.currentYear}</td>
			<td>${s.course.schoolTem}</td>
			<td>${s.course.teacher.teacherName}</td>
			<td>${s.course.teacher.teacherMobile}</td>
			<!--  <td colspan="8"></td>-->
			</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
			<td colspan="8">(暂无课程)</td>
			</tr>
			</c:otherwise>
			</c:choose>
			</table>
			
			<!-- 安全/密码 -->
			<div id="signal" style="width: 95%; margin-left: 5%; padding-left:5%;
			background-color:#cccc00; height: 3%;display: none; font-family: 微软雅黑;">
			提示：修改邮箱后后请前往原邮箱确认..
			</div>
			
			<div id="doubleHandle" style="width: 70%; margin-left: 15%; margin-top: 8%; 
			display: none;text-align: center;border: solid;border-color: red;">
			<a href="#" style="float:left; height:20%; width: 49%;border: solid;border-color: red;font-size: 1.5em">更改密码</a>
			<a href="#" style="float:left; height:20%; width: 49%;border: solid;border-color: red;font-size: 1.5em">更换邮箱</a>
			<br/><br/>
			<form id="safe" action="<%=request.getContextPath()%>/student/updateStudentPassWord.do" style="width: 84%; margin-left: 5%; border: solid;border-color: red; text-align: center;">
			<table style="padding-left: 10%;">
			<br/>
			<tr style="width: 100%;">
			<td style="text-align: right; margin-left: 20%;">学号：</td>
			<td><input type="text"  readonly="readonly" name="studentRoNo" value="${student.studentRoNo}" id="studentRoNo" style="width: 19em;"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
			<tr>
			<td style="text-align: right; width: 20em;">原密码：</td>
			<td><input type="password" name="oldPassword" id="studentPassword" style="width: 19em"/></td>
			<td id="passError" style="color: red; margin-left: 1.8em; display: none;">*密码错误*</td>
			</tr>
			<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
			<tr>
			<td style="text-align: right;">新密码：</td>
			<td><input type="password" name="studentPassword" id="newPassword" style="width: 19em"/></td>
			</tr>
			<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
			<tr>
			<td style="text-align: right;">确认新密码：</td>
			<td><input type="password" name="rePassword" id="rePassword" style="width: 19em"/></td>
			<td id="noLike" style="color: red; margin-left: 1.8em; display: none;">*两次密码不一致*</td>
			</tr>
			<tr><td>&nbsp;</td></tr><tr><td>&nbsp;</td></tr>
			<tr>
			<td colspan="2"><input id="ccchangePass" type="button" value="申请修改" style="width: 70%; height: 1.5em; margin-left: 14em;"/></td>
			</tr>
			</table>
			</form>
			</div>
			

		
		</div>
		<div style="height: 100px; margin-top:42.6%; background-color: #000011;text-align: center; padding-top: 5px">
            <div class="navbar-header" style="text-align: center; width: 100%; margin-top:3%; color: white; z-index: 3">
				
				<a style="" class="navbar-brand" href="#">copyright by CMS team</a>
         </div>
         </div>
		
     
     
	<script>
		layui.use('element', function() {
			var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>
	
</body>
</html>