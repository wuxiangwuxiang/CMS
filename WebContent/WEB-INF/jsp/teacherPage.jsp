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
<style type="text/css">

</style>
<script type="text/javascript">
	 $(document).ready(function () {
		 var tem;
		 $('#createCourse').click(function() {
			$('#courseShow').toggle();
		});
		 $('#false').click(function() {
			$('#torf').hide();
		});

	 });
	
	 function showQrImg(id) {
		     var url = "/ClassManageSys/qrImg/" + id + ".gif";
		     var imgPre = document.getElementById("target");
		     imgPre.style.display = "block";
		     imgPre.src = url;
		}
	 function forDeleteThis(courseId) {
		 var courseId = courseId;
		 tem = courseId;
		 document.getElementById("torf").style.display = "block";
	}
	 function deleteThis() {
		 var Id = tem;
		 lookApplyPeople(Id); 
	}
	 
	 //删除课程
	  function lookApplyPeople(courseId) {
          $.ajax({
              type: "GET",
              data: {
                  "courseId": courseId
              },
              contentType: "application/json; charset=utf-8",
              async: true,
              url: "<%=request.getContextPath()%>/course/deleteCourseById.do",
//              beforeSend:function(){$("#href").html("等待..");},
              success: function (data) {
            	  document.getElementById("abs"+tem).style.display = "none";
              },
              error: function (data) {
                  alert("出错了！");
              },
              dataType: "json",
          });
          $('#torf').hide();
      }
	 //添加课程
	 function addCourse() {
		 $.ajax({
             type: "GET",
             data: {
                 "teacherMobile":$('#teacherMobile').val(),
                 "courseName": $('#courseName').val(),
		         "courseType": $('#courseType').val(),
		         "classCapacity": $('#classCapacity').val(),
		         "startTime": $('#startTime').val(),
		         "endTime": $('#endTime').val(),
		         "currentYear": $('#currentYear').val(),
		         "schoolTem": $('#schoolTem').val()
             },
             contentType: "application/json; charset=utf-8",
             async: false,
             url: "<%=request.getContextPath()%>/course/insertCourse.do ",
			success : function(data) {
				alert(data.message);
				window.location.reload();
			},
			error : function(data) {
				alert("服务器异常");
			},
			dataType : "json",
		});
	}
	//跳转到班级页面，post
	function aClick(clazzId) {
		document.getElementById("asd" + clazzId).submit()
	}
</script>
</head>
<body>

	<div class="layui-layout layui-layout-admin">
		<!-- 头部导航 -->
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<a class="CMSlogo" href="/"><span
					style="color: white; font-size: 25px;">CMS</span></a>

				<ul class="layui-nav">
					<li class="layui-nav-item"><a href="">控制台<span
							class="layui-badge">9</span></a></li>
					<li class="layui-nav-item"><a href="">个人中心<span
							class="layui-badge-dot"></span></a></li>
					<li class="layui-nav-item"><a href="">${teacher.teacherName}老师</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">修改信息</a>
							</dd>
							<dd>
								<a href="javascript:;">安全管理</a>
							</dd>
							<dd>
								<a href="javascript:;">注销</a>
							</dd>
						</dl></li>
				</ul>

			</div>
		</div>
		<!-- 左侧垂直导航 -->
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">默认展开</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="createCourse" href="#">新建课程</a>
							</dd>
							<dd>
								<a href="javascript:;">选项2</a>
							</dd>
							<dd>
								<a href="">跳转</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="">移动模块</a>
							</dd>
							<dd>
								<a href="">后台模版</a>
							</dd>
							<dd>
								<a href="">电商平台</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="">产品</a></li>
					<li class="layui-nav-item"><a href="">大数据</a></li>
				</ul>
			</div>
		</div>
        
        <!-- 内容显示 -->
		<div class="layui-body site-demo">

			<div id="torf"
				style="width: 180px; height: 150px; position: fixed; top: 200px; margin-left: 45%; background-color: white; border: solid; border-color: #C0C0C0; display: none;">
				<h3 style="color: red; text-align: center;">确定删除该课程？</h3>
				<a id="delete" onclick="deleteThis()" href="#"
					style="float: left; margin-left: 30px; margin-top: 30px;">删除</a> <a
					id="false" href="#"
					style="float: left; margin-left: 60px; margin-top: 30px;">取消</a>
			</div>

             <br/>
             
            <!-- 新建课程 -->
			<form id="courseShow" style="display: none;">
				课程名称：<input type="text" id="courseName" name="courseName" /><br />
				<input type="text" id="teacherMobile" name="teacher.teacherMobile"
					value="${teacher.teacherMobile}" style="display: none;" />
				课程类型：&nbsp;&nbsp;&nbsp;<input id="courseType" type="radio"
					name="courseType" value="必修" checked="checked" />必修 <input
					id="courseType" type="radio" name="courseType" value="选修" />选修&nbsp;<br />
				班级容量：<input id="classCapacity" type="text" name="classCapacity" /><br />
				开始时间：<input id="startTime" type="date" name="startTime" /><br />
				结束时间：<input id="endTime" type="date" name="endTime" /><br /> 当前学年：<input
					id="currentYear" type="text" name="currentYear">年<br />
				当前学期：<select id="schoolTem" name="schoolTem">
					<option selected="selected" value="春季">春季学期</option>
					<option value="夏季">夏季学期</option>
					<option value="秋季">秋季学期</option>
					<option value="冬季">冬季学期</option>
				</select> <input id="subButton" onclick="addCourse()" type="button"
					value="提交" />
			</form>

            <!-- 课程信息 -->
			<table border="1"
				style="width: 50%; line-height: 3em; margin-left: 10em; margin-top: 5em; background: #cccccc">
				<tr onmouseover="this.style.backgroundColor = '#ffff66';"
					onmouseout="this.style.backgroundColor = '#d4e3e5';">
					<th style="width: 4em">课程名称</th>
					<th>二维码信息</th>
					<th>学年</th>
					<th>班级</th>
					<th colspan="3">操作</th>
				</tr>
				<c:choose>
					<c:when test="${! empty courses}">
						<c:forEach items="${courses}" var="r">
							<tr id="abs${r.courseId}"
								onmouseover="this.style.backgroundColor = '#ffff66';"
								onmouseout="this.style.backgroundColor = '#d4e3e5';">
								<td><a
									href="<%=request.getContextPath()%>/course/forsearchClazz.do?courseId=${r.courseId}">${r.courseName}</a></td>
								<td style="text-align: center;"><a id="${r.qrImg}"
									onclick="showQrImg(this.id)" href="#">获取</a></td>
								<td style="text-align: center;">${r.currentYear}</td>
								<td style="text-align: center;"><c:choose>
										<c:when test="${! empty r.clazz}">
											<c:forEach items="${r.clazz}" var="c">
												<form style="margin-top: 0; margin-bottom: 0;"
													id="asd${c.clazzId}"
													action="<%=request.getContextPath()%>/student/selectStudentByClazzId.do"
													method="post">
													<input name="clazzId" style="display: none;"
														value="${c.clazzId}" /> <a id="${c.clazzId}"
														onclick="aClick(this.id)" href="#">${c.clazzName}</a>
												</form>
												<br />
											</c:forEach>
										</c:when>
										<c:otherwise>
											<a>（空）</a>
										</c:otherwise>
									</c:choose></td>
								<td style="text-align: center;"><a
									href="<%=request.getContextPath()%>/course/forsearchClazz.do?courseId=${r.courseId}&teacherMobile=${teacher.teacherMobile}">查看/签到</a></td>
								<td><a
									href="<%=request.getContextPath()%>/course/forChangeCousrInfo.do?courseId=${r.courseId}">修改</a></td>
								<td><a id="${r.courseId}" onclick="forDeleteThis(this.id)"
									href="#">删除</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="1">（空）</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>

			<div>
				<img id="target" style="width: 150px; height: 140px;" alt="课程二维码"
					src="" />
			</div>

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