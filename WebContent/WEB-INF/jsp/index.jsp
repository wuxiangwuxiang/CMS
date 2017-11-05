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
			$('#courseInfo').show();
		});
		 
		 $('#addCourse').click(function name1() {
				$('#courseInfo').hide();
			});
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
								<a href="#">安全管理</a>
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