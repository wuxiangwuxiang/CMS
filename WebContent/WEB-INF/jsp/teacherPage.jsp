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
	href="<%=request.getContextPath()%>/icon/cms2.ico" media="screen" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>

<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<script src="<%=request.getContextPath()%>/layui/layui.js "></script>
<title>教师门户</title>
<script type="text/javascript">
	 $(document).ready(function () {
		 if(${page.pageNow} > 1){
			 $('#changeCourseinfo').hide();
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#courseShow').hide();
			 $('#courseInfo').hide();
			 $('#fushuMessage').hide();
			 $('#seprateMessage').show();
			 $('#messageShow').show();
		 }
		 //如果消息数量为0
		 //if(${messageCount} == 0){
			// var TmessageCount = document.getElementById("TmessageCount")
			// TmessageCount.style.display="none";
		 //}
		 //每1秒执行一次消息数量的查询
		 setInterval(gggetMessageCount,1000);
		 function gggetMessageCount() {
			 
			 $.ajax({
	             type: "GET",
	             data: {
	            	 "teacherMobile":$('#teacherMobile').val()
	             },
	             contentType: "application/json; charset=utf-8",
	             async: true,
	             //url不加空格！！！！！！！！！！！！！！！！！！！！！！！
	             url: "<%=request.getContextPath()%>/teacher/gggetMessageCount.do",
				success : function(data) {
					if(data.message > 0){
						$('#TmessageCount').html(data.message);
					}else {
						var TmessageCount = document.getElementById("TmessageCount")
						 TmessageCount.style.display="none";
					}
				},
				error : function(data) {
					
				},
				dataType : "json",
			});
		}
		 //添加课程
		 $('#createCourse').click(function() {
		    $('#changeCourseinfo').hide();
			$('#doubleHandle').hide();
			$('#signal').hide();
		    $('#courseInfo').hide();
		    $('#messageShow').hide();
		    $('#seprateMessage').hide();
		    $('#fushuMessage').hide();
			$('#courseShow').show();
		});
		 //课程信息
		 $('#checkCourseShow').click(function() {
			 $('#seprateMessage').hide();
			 $('#changeCourseinfo').hide();
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#courseShow').hide();
			 $('#messageShow').hide();
			 $('#fushuMessage').hide();
			 $('#courseInfo').show();
			});
		 //点击消息
		  $('#messageButtton').click(function() {
			 $('#changeCourseinfo').hide();
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#courseShow').hide();
			 $('#courseInfo').hide();
			 $('#fushuMessage').hide();
			 $('#seprateMessage').show();
			 $('#messageShow').show();
			});
		 //点击二维码叉号
		 $('#esc').click(function() {
			 $('#targetup').hide();
			 $('#courseInfo').show();
			});
		 //删除课程，点击取消时
		 $('#false').click(function() {
			$('#torf').hide();
		});
		
	 });
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
             //url不加空格！！！！！！！！！！！！！！！！！！！！！！！
             url: "<%=request.getContextPath()%>/course/insertCourse.do",
			success : function(data) {
				$('#addCourseShow').show();
				setTimeout('yourFunction()',2000); 
			},
			error : function(data) {
				alert("服务器异常");
			},
			dataType : "json",
		});
	}
	 //刷新页面函数
	 function yourFunction() {
		 window.location.reload();
	}
	//跳转到班级页面，post
	function aClick(clazzId) {
		document.getElementById("asd" + clazzId).submit()
	}
	var tem = ${messageCount}
	//点击某个消息
	function getMessage(messageId) {
		$('#me'+messageId).html("已读");
		$('#mem'+messageId).val("已读");
		getMessageByAjax(messageId);
	}
	function getMessageByAjax(messageId) {
		$.ajax({
            type: "GET",
            data: {
		         "messageId": messageId
            },
            contentType: "application/json; charset=utf-8",
            async: false,
            //url不加空格！！！！！！！！！！！！！！！！！！！！！！！
            url: "<%=request.getContextPath()%>/teacher/getMessageByAjax.do",
			success : function(data) {
				if(data.mmm.messageType == 'insertCourse'){
					$('#forMessageContent').hide();
					$('#messageContent').hide();
					$('#seprateMessage').hide();
					$('#insertCourseDiv').show();
					$('#MstudentRoNo').val(data.mmm.messageSender);
					$('#MCourseId').val(data.mmm.messageContent);
				}
				$('#messageShow').hide();
				$('#messageTitle').html('标题 <' + data.mmm.messageTitle + '>');
				$('#messageSnder').html('发送人账号 <' + data.mmm.messageSender +'>');
				if(data.student != null){
				$('#messageSenderName').html('发送人姓名 <' + data.student.studentName +'><br/><br/><br/><br/>');
				$('#messageSenderName').show();
				  }
				$('#sendTime').html('时间 <' + data.mmm.sendTime +'>');
				$('#messageContent').html(data.mmm.messageContent + '<br/><br/>');
				$('#fushuMessage').show();
				
			},
			error : function(data) {
				alert("服务器异常");
			},
			dataType : "json",
		});
	}
	function myFunction() {
		$('#handleMessageShow').hide();
		 $('#changeCourseinfo').hide();
		 $('#doubleHandle').hide();
		 $('#signal').hide();
		 $('#courseShow').hide();
		 $('#courseInfo').hide();
		 $('#fushuMessage').hide();
		 $('#seprateMessage').show();
		 $('#messageShow').show();
	}
	function agree() {
		 $.ajax({
             type: "GET",
             data: {
            	 "teacherMobile":$('#teacherMobile').val(),
		         "studentRoNo": $('#MstudentRoNo').val(),
		         "content": $('#MCourseId').val()
             },
             contentType: "application/json; charset=utf-8",
             async: false,
             //url不加空格！！！！！！！！！！！！！！！！！！！！！！！
             url: "<%=request.getContextPath()%>/studentInfo/insertStudentInfoByteacher.do",
			success : function(data) {
				if(data.result == true){
					$('#handleMessageShow').show();
					setTimeout('myFunction()',1500);
				}else{
					alert("请勿重复添加");
				}
			},
			error : function(data) {
				alert("服务器异常");
			},
			dataType : "json",
		});
	} 
	function dontCare() {
			 $('#changeCourseinfo').hide();
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#courseShow').hide();
			 $('#courseInfo').hide();
			 $('#fushuMessage').hide();
			 $('#seprateMessage').show();
			 $('#messageShow').show();
	}
</script>
</head>
<body>
	<!-- 课程二维码 -->
	<img id="target"
		style="width: 390px; height: 390px; display: none; z-index: 9; background-color: rgba(0, 0, 0, 1);"
		src="" /> 

	<!-- 新建课程成功提示信息 -->
	<div id="addCourseShow"
		style="background-color: #393D49; height: 20%; width: 20%; z-index: 20; position: fixed; margin-top: 23%; text-align: center; margin-left: 50%; display: none;">
		<h3 style="color: white; margin-top: 19%">添加课程成功..</h3>
	</div>
	
	<!-- 修改课程成功提示信息 -->
	<div id="changeCourseSuccess"
		style="background-color: #393D49; height: 27%; width: 25%; z-index: 20; position: fixed; margin-top: 23%; text-align: center; margin-left: 50%; display: none;">
		<h3 style="color: white; margin-top: 15%">修改课程成功..</h3>
	</div>
	
	
	<!-- 处理消息成功提示信息 -->
	<div id="handleMessageShow"
		style="background-color: #393D49; height: 20%; width: 20%; z-index: 20; position: fixed; margin-top: 20%; text-align: center; margin-left: 30%; display: none;">
		<h3 style="color: white; margin-top: 19%">处理成功..</h3>
	</div>

	<div class="layui-layout layui-layout-admin">
		<!-- 头部导航 -->
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<a class="CMSlogo" href="/"><span
					style="color: white; font-size: 25px;">CMS</span></a>

				<ul class="layui-nav">
					<li class="layui-nav-item"><a id="messageButtton" href="#">消息<span id="TmessageCount"
							class="layui-badge">${messageCount}</span></a></li>
					<li class="layui-nav-item"><a href="#">个人中心<span
							class="layui-badge-dot"></span></a></li>
					<li class="layui-nav-item"><a href="#">${teacher.teacherName}老师</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#">修改信息</a>
							</dd>
							<dd>
								<a href="#" id="safeManage">安全管理</a>
							</dd>
							<dd>
								<a href="#">注销</a>
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
						href="javascript:;">课程</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="checkCourseShow" href="#">课程信息</a>
							</dd>
							<dd>
								<a id="createCourse" href="#">新建课程</a>
							</dd>
							<dd>
								<a href="">跳转</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="#">资料</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#">个人资料</a>
							</dd>
							<dd>
								<a href="#">课件上传</a>
							</dd>
							<dd>
								<a href="#">待定</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="#">个人博客</a></li>
					<li class="layui-nav-item"><a href="#">操作日志</a></li>
				</ul>
			</div>
		</div>

		<!-- 内容显示 -->
		<div class="layui-body site-demo">
			<br />
			
			
			<!-- 显示消息 -->
			<div class="site-text site-block" id="messageShow"
				style="padding-left: 2%; display: none;">
				<table>
				<c:choose>
				<c:when test="${! empty message}">
				<c:forEach items="${message}" var="m">
				<tr style="margin-top: 3%">
				<td><img alt="图标cms" src="<%=request.getContextPath()%>/icon/cms3.ico" width="40px" height="40px"></td>
				<td width="11%">&nbsp;</td>
				<td><a id="${m.messageId}" onclick="getMessage(this.id)" href="#">${m.messageTitle}</a></td>
				<td width="12%">&nbsp;</td>
				<td>${m.sendTime}</td>
				<td width="12%">&nbsp;</td>
				<td id="me${m.messageId}">${m.haveRead}</td>
				<td><input id="mem${m.messageId}" type="text" value="${m.haveRead}" style="display: none;"/></td>
				</tr>
				<tr height="10%">
				<td>&nbsp;</td>
				</tr>
				</c:forEach>
				<br/>
				</c:when>
				</c:choose>
				</table>
			</div>
			<!-- 消息分页 -->
			 <div id="seprateMessage" style="text-align: center;margin-left: 0; display: none;">  
            <font size="2">第  ${page.pageNow} 页</font> <font size="2">共 ${page.totalPageCount} 页</font>
            <a href="teacherLogin.do?pageNow=1&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">首页</a>  
            <c:choose> 
                <c:when test="${page.pageNow - 1 > 0}">  
                    <a href="teacherLogin.do?pageNow=${page.pageNow - 1}&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">上一页</a>  
                </c:when>  
                <c:when test="${page.pageNow - 1 <= 0}">  
                    <a href="teacherLogin.do?pageNow=1&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">上一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="teacherLogin.do?pageNow=${page.pageNow}&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                    <a href="teacherLogin.do?pageNow=${page.pageNow + 1}&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                    <a href="teacherLogin.do?pageNow=${page.totalPageCount}&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">下一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="teacherLogin.do?pageNow=${page.pageNow}&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">尾页</a>  
                </c:when>  
                <c:otherwise>  
                    <a href="teacherLogin.do?pageNow=${page.totalPageCount}&id=${teacher.teacherMobile}&password=${teacher.teacherPassword}">尾页</a>  
                </c:otherwise>  
            </c:choose>  
        </div>
			<!-- 附属详细消息 -->
			<div id="fushuMessage" style="width: 100%; padding-left: 25%; display: none; margin-top: 5%;">
			<h3 id="messageTitle"></h3>
			<hr/><br/><br/>
			<span id="messageSnder"></span><br/><br/><br/><br/>
			<span id="messageSenderName" style="display: none;"></span>
			<span id="sendTime"></span><br/><br/><br/><br/>
			<span id="forMessageContent">内容<br/></span> <textarea id="messageContent" rows="5" cols="40" readonly="readonly"></textarea><br/><br/>
			<div id="insertCourseDiv" style="display: none;">
			<input type="text" id="MstudentRoNo" style="display: none;"/>
			<input type="text" id="MCourseId" style="display: none;"/>
			<input id="agree" class="layui-btn" onclick="agree()" type="button" value="同意"/>
			<input style="margin-left: 10%;" id="dontCare" onclick="dontCare()" class="layui-btn layui-btn-primary" type="button" value="忽略"/>
			</div>
			</div>
			
			<!-- 新建课程 -->
			<div class="site-text site-block" id="courseShow"
				style="display: none;">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">课程名称</label>
						<div class="layui-input-block">
							<input id="courseName" type="text" name="courseName" required
								lay-verify="required" placeholder="请输入课程名称" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<input type="text" id="teacherMobile" name="teacher.teacherMobile"
						value="${teacher.teacherMobile}" style="display: none;" />
					<div class="layui-form-item">
						<label class="layui-form-label">课程类型</label>
						<div class="layui-input-block">
							<input id="courseType" type="radio" name="courseType" value="必修"
								title="必修" checked> <input id="courseType" type="radio"
								name="courseType" value="选修" title="选修">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">班级容量</label>
						<div class="layui-input-block">
							<input id="classCapacity" type="text" name="classCapacity"
								required lay-verify="required" placeholder="请输入班级容量"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">开始时间</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="startTime" type="text"
									name="startTime" placeholder="yyyy-MM-dd">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">结束时间</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="endTime" type="text"
									name="endTime" placeholder="yyyy-MM-dd">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">当前学年</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="currentYear" type="text"
									name="currentYear" placeholder="yyyy">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">当前学期</label>
						<div class="layui-input-block">
							<select id="schoolTem" name="schoolTem" lay-verify="required">
								<option value=""></option>
								<option value="春季">春季学期</option>
								<option value="夏季">夏季学期</option>
								<option value="秋季">秋季学期</option>
								<option value="冬季">冬季学期</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input id="subButton" class="layui-btn" onclick="addCourse()"
								type="button" value="提交" />
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>

				<script>
					//Demo
					layui.use([ 'form', 'laydate' ], function() {
						var form = layui.form, laydate = layui.laydate;

						//监听提交
						form.on('submit(formDemo)', function(data) {
							layer.msg(JSON.stringify(data.field));
							return false;
						});
						laydate.render({
							elem : '#startTime'
						});
						laydate.render({
							elem : '#endTime'
						});
						laydate.render({
							elem : '#currentYear',
							type : 'year'
						});

					});
				</script>
			</div>

			<!-- 课程信息 -->
			<div class="layui-form sessiontable" id="courseInfo"
				style="margin-top: 5%; ">
				<table class="layui-table" lay-even style="text-align: center;">
					<colgroup>
					    <col width="150">
						<col width="200">
						<col width="200">
						<col width="150">
						<col width="150">
						<col width="300">
					</colgroup>
					<thead>
						<tr>
						    <th style="text-align: center;">课程编码</th>
							<th style="text-align: center;">课程名称</th>
							<th style="text-align: center;">二维码信息</th>
							<th style="text-align: center;">学年</th>
							<th style="text-align: center;">班级</th>
							<th colspan="3" style="text-align: center;">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${! empty courses}">
								<c:forEach items="${courses}" var="r">
									<tr id="abs${r.courseId}">
									<td>${r.courseId}</td>
										<td><a
											href="<%=request.getContextPath()%>/course/forsearchClazz.do?courseId=${r.courseId}">${r.courseName}</a></td>
										<td style="text-align: center;">
											<div class="site-demo-button" id="layerDemo">
												<button id="${r.qrImg}" onclick="showQrImg(this.id)"
													class="layui-btn" data-method="page">获取</button>
											</div>
										</td>
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
										<td>
											<!-- <a href="/course/forChangeCousrInfo.do?courseId=${r.courseId}">修改</a> -->
											<div class="site-demo-button" id="layerDemo"
												style="margin-bottom: 0;">
												<button id="change${r.courseId}" onclick="beforeChangeCourse('${r.courseId}','${r.courseName}','${r.classCapacity}')"
													class="layui-btn">修改</button>
											</div>
										</td>
										<td>
											<div class="site-demo-button" id="layerDemo"
												style="margin-bottom: 0;">
												<button id="${r.courseId}" onclick="forDeleteThis(this.id)"
													class="layui-btn" data-method="notice">删除</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">（空）</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>

				<script>
				layui.use('table', function() {
					var table = layui.table;
				});
			    </script>
			</div>
			
			<!-- 修改课程信息 -->
			<div class="site-text site-block" id="changeCourseinfo"
				style="display: none;">
				<form class="layui-form" action="">
				<input type="text" name="ccourseId" id="ccourseId" value="" readonly="readonly" style="display: none;"/><br />
					<div class="layui-form-item">
						<label class="layui-form-label">课程名称</label>
						<div class="layui-input-block">
							<input id="ccourseName" type="text" name="ccourseName" required
								lay-verify="required" placeholder="请输入课程名称" autocomplete="off"
								class="layui-input">
						</div><br/>
						<p id="listenName"
							style="color: red; display: none; margin-left: 13%;">*课程名不可为空*</p>
					</div>
					<input type="text" id="cteacherMobile"
						name="cteacher.teacherMobile" value="${teacher.teacherMobile}"
						style="display: none;" />
					<div class="layui-form-item">
						<label class="layui-form-label">课程类型</label>
						<div class="layui-input-block">
							<input id="ccourseType" type="radio" name="ccourseType"
								value="必修" title="必修" checked> <input id="ccourseType"
								type="radio" name="ccourseType" value="选修" title="选修">
						</div>
						<p id="listenType"
							style="color: red; display: none; margin-left: 13%;">*课程类型不可为空*</p>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">班级容量</label>
						<div class="layui-input-block">
							<input id="cclassCapacity" type="text" name="cclassCapacity"
								required lay-verify="required" placeholder="请输入班级容量"
								autocomplete="off" class="layui-input">
						</div>
						<p id="listenCapacity"
							style="color: red; display: none; margin-left: 13%;">*班级容量不可为空*</p>
						<p id="listenIfN"
							style="color: red; display: none; margin-left: 13%;">*请输入数字*</p>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">开始时间</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="cstartTime" type="text"
									name="cstartTime" placeholder="yyyy-MM-dd">
							</div>
							<p id="listenStart"
								style="color: red; display: none; margin-left: 13%;">*开始时间不可为空*</p>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">结束时间</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="cendTime" type="text"
									name="cendTime" placeholder="yyyy-MM-dd">
							</div>
							<p id="listenEnd"
								style="color: red; display: none; margin-left: 13%;">*结束时间不可为空*</p>
							<p id="listenMaxOrMin"
								style="color: red; display: none; margin-left: 13%;">*结束时间不可小于开始时间*</p>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">当前学年</label>
							<div class="layui-input-inline">
								<input class="layui-input" id="ccurrentYear" type="text"
									name="ccurrentYear" placeholder="yyyy">
							</div>
							<p id="listenCurrent"
								style="color: red; display: none; margin-left: 13%;">*当前学年不可为空*</p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">当前学期</label>
						<div class="layui-input-block">
							<select id="cschoolTem" name="cschoolTem" lay-verify="required">
								<option value=""></option>
								<option value="春季">春季学期</option>
								<option value="夏季">夏季学期</option>
								<option value="秋季">秋季学期</option>
								<option value="冬季">冬季学期</option>
							</select>
						</div>
						<p id="listenTem"
							style="color: red; display: none; margin-left: 13%;">*当前学期不可为空*</p>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input id="subButton" class="layui-btn"
								onclick="changeCourseInfo()" type="button" value="提交修改" />
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>

				<script>
					//Demo
					layui.use([ 'form', 'laydate' ], function() {
						var form = layui.form, laydate = layui.laydate;

						//监听提交
						form.on('submit(formDemo)', function(data) {
							layer.msg(JSON.stringify(data.field));
							return false;
						});
						laydate.render({
							elem : '#startTime',
							elem : '#cstartTime'
						});
						laydate.render({
							elem : '#endTime',
							elem : '#cendTime'
						});
						laydate.render({
							elem : '#currentYear',
							type : 'year'
						});
						laydate.render({
							elem : '#ccurrentYear',
							type : 'year'
						});

					});
				</script>
			</div>

			<!-- 安全/密码 -->
			<div id="signal"
				style="width: 95%; margin-left: 5%; padding-left: 5%; background-color: #cccc00; height: 3%; display: none; font-family: 微软雅黑;">
				提示：修改邮箱后后请前往原邮箱确认..</div>
				
				<!-- 更改邮箱成功提示信息 -->
	   <div id="changeMailShow" class="site-text site-block"
		style="background-color: #393D49; height: 20%; width: 20%; display:none;
		 z-index: 20; margin-top: 14%; text-align: center; margin-left: 25%; position: absolute;">
		<h3 style="color: white; margin-top: 19%">更新邮箱成功..</h3>
	   </div>

			<div class="site-text site-block" id="doubleHandle"
				style="width: 70%; margin-left: 15%; margin-top: 8%; display: none;">
				<a class="layui-btn layui-btn-primary" href="#" id="changeTeaPass"
					style="float: left; height: 20%; width: 49%; font-size: 1.5em">更改密码</a>
				<a class="layui-btn layui-btn-primary" href="#" id="changeTeaMail"
					style="float: left; height: 20%; width: 49%; font-size: 1.5em">更换邮箱</a>
				<br /> <br />
				<!-- 修改密码 -->
				<form class="layui-form layui-form-pane" id="safe"
					action="<%=request.getContextPath()%>/teacher/updateTeacherPassWord.do"
					style="width: 84%; margin-left: 5%; padding-left: 17%">
					<table>
						<br />
						<tr style="width: 100%;">
							<td><label class="layui-form-label">手机号</label></td>
							<td><input class="layui-input" type="text" readonly="readonly"
								name="teacherMobile" value="${teacher.teacherMobile}"
								id="teacherMobile" style="width: 25em;" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">原密码</label></td>
							<td><input class="layui-input" type="password" name="oldPassword"
								id="teacherPassword" style="width: 25em" /></td>
							<td id="passError"
								style="color: red; margin-left: 1.8em; display: none;">*密码错误*</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">新密码</label></td>
							<td><input class="layui-input" type="password" name="teacherPassword"
								id="newPassword" style="width: 25em" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">确认新密码</label></td>
							<td><input class="layui-input" type="password" name="rePassword" id="rePassword"
								style="width: 25em" /></td>
							<td id="noLike"
								style="color: red; margin-left: 1.8em; display: none;">*两次密码不一致*</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2"><input class="layui-btn" id="ccchangePass" type="button"
								value="申请修改"
								style="width: 70%; margin-left: 15%;" /></td>
						</tr>
					</table>
				</form>

				<!-- 修改邮箱 -->
				<form id="emailsafe"
					action="<%=request.getContextPath()%>/teacher/updateTeacherEmail.do"
					style="width: 84%; margin-left: 5%; padding-left: 17%; display: none;">
					<table>
						<br />
						<tr style="width: 100%;">
							<td><label class="layui-form-label">手机号</label></td>
							<td><input class="layui-input" type="text" readonly="readonly"
								name="teacherMobile" value="${teacher.teacherMobile}"
								id="teacherMobile" style="width: 25em;" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">邮箱</label></td>
							<td><input class="layui-input" type="text" name="oldEmail"
								value="${teacher.teacherEmail}" id="teacherEmail"
								style="width: 25em" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">新邮箱</label></td>
							<td><input class="layui-input" id="mail" type="text" name="teacherEmail"
								required lay-verify="required|email" autocomplete="off"
								style="width: 25em" /></td>
						</tr>

						<tr>
							<td id="emailTypeError"
								style="text-align: right; width: 20em; color: red; display: none;">*格式错误*</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2"><input class="layui-btn" id="changeTeaMailPush" type="button"
								value="申请修改"
								style="width: 70%; margin-left: 15%;" /></td>
						</tr>
					</table>
				</form>
			</div>


		</div>

	</div>



	<script>
	//修改密码
	$('#changeTeaPass').click(function asd() {
		$('#emailsafe').hide();
		$('#safe').show();
	});
	//修改邮箱
    $('#changeTeaMail').click(function asd() {
    	$('#safe').hide();
		$('#emailsafe').show();
	});
	//提交更改邮箱申请
	 $('#changeTeaMailPush').click(function asd() {
    	if(test()){
    		 $('#emailTypeError').hide();
    		 if(pushEmail()){
    			 $('#changeMailShow').show();
    			 setTimeout('yourFunction()',2000); 
    		 }
    	}
	});
	function pushEmail() {
		 //ajax后台更新
		 var result = false;
		 var teacherEmail = $('#mail').val();
		 var teacherMobile  =$('#teacherMobile').val();
		$.ajax({
              type: "GET",
              data: {
            	  "teacherEmail":teacherEmail,
            	  "teacherMobile":teacherMobile
              },
              contentType: "application/json; charset=utf-8",
              async: false,
              dataType: "json",
              url: "<%=request.getContextPath()%>/teacher/changeTeaMail.do",
              success: function (data) {
            	  if(data.result == true){
            		  result = true;
            	  }else{
            		  
            	  }
              },
              error: function (data) {
            	  alert("服务器异常");
              }
          });
		return result;
	}
  //对电子邮箱的验证
    function test(){
     var temp = document.getElementById("mail");
     var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if(!myreg.test(temp.value)){
         $('#emailTypeError').show();
         myreg.focus();
          return false;
      }else{
    	  return true;
      }
     }
	 //修改课程信息 前
	 function beforeChangeCourse(courseId,courseName,classCapacity) {
		 document.getElementById("ccourseId").value = courseId;
		 document.getElementById("ccourseName").value = courseName;
		 document.getElementById("cclassCapacity").value = classCapacity;
		 $('#doubleHandle').hide();
		 $('#signal').hide();
		 $('#courseShow').hide();
		 $('#courseInfo').hide();
		 $('#changeCourseinfo').show();
	}
	 //修改课程信息
	 function changeCourseInfo() {
		if(confirmType()){
			if(pushCourseInfo()){
				$('#changeCourseSuccess').show();
				setTimeout('yourFunction()',2000); 
			}
		}
		
	}
	//刷新当前页面
		function yourFunction() {
		 window.location.reload();
	}
	 
	 //课程信息提交到后台
	 function pushCourseInfo() {
		 var result = false;
		 var teacherMobile = $('#cteacherMobile').val();
		 var courseId = $('#ccourseId').val();
		 var courseName = $('#ccourseName').val();
		 var courseType = $('#ccourseType').val();
		 var classCapacity = $('#cclassCapacity').val();
		 var startTime = $('#cstartTime').val();
		 var endTime = $('#cendTime').val();
		 var currentYear = $('#ccurrentYear').val();
		 var schoolTem = $('#cschoolTem').val();
		$.ajax({
              type: "GET",
              data: {
            	  "teacherMobile":teacherMobile,
                  "courseId": courseId,
                  "courseName":courseName,
                  "courseType":courseType,
                  "classCapacity":classCapacity,
                  "startTime":startTime,
                  "endTime":endTime,
                  "currentYear":currentYear,
                  "schoolTem":schoolTem
              },
              contentType: "application/json; charset=utf-8",
              async: false,
              dataType: "json",
              url: "<%=request.getContextPath()%>/course/changeCourse.do",
              success: function (data) {
            	  if(data.result == true){
            		  result = true;
            	  }else{
            		  $('#listenMaxOrMin').show();
            	  }
              },
              error: function (data) {
            	  alert("服务器异常");
              }
          });
		  return result;
	}
	//点击安全管理
	$('#safeManage').click(function name1() {
		 $('#courseInfo').hide();
		 $('#courseShow').hide();
		 $('#messageShow').hide();
		 $('#fushuMessage').hide();
		 $('#seprateMessage').hide();
		$('#doubleHandle').show();
		$('#signal').show();
	});
	//点击申请修改触发密码验证
	$('#ccchangePass').click(function wannaSubmittt() {
		var password = $('#teacherPassword').val();
		var teacherMobile = $('#teacherMobile').val();
		var newPassword = $('#newPassword').val();
		var rePassword = $('#rePassword').val();
		if(getStuAnwser(password,teacherMobile)){
			$('#passError').hide();
			if(newPassword != null && newPassword != "" && newPassword == rePassword){
				$('#noLike').hide();
				changeTeaPass();					
			}else{
				$('#noLike').show();
			}
		}else {
			$('#passError').show();
		}
	});
	
	//获取教师密码，进行后台比对
	function getStuAnwser(password,teacherMobile) {
		var result = false;
		$.ajax({
              type: "GET",
              data: {
                  "password": password,
                  "teacherMobile":teacherMobile
              },
              contentType: "application/json; charset=utf-8",
              async: false,
              dataType: "json",
              url: "<%=request.getContextPath()%>/teacher/confirmTeacherPassWord.do",
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
	//ajax更改教师密码
	function changeTeaPass() {
		$('#safe').submit();
	}
	
	//url
	 function showQrImg(id) {
	     var url = "/ClassManageSys/qrImg/" + id + ".gif";
		     var imgPre = document.getElementById("target");
		     imgPre.src = url;
	}

	 var tem;
	 function forDeleteThis(courseId) {
		 var courseId = courseId;
		 tem = courseId;
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
						success : function(data) {
							document.getElementById("abs" + tem).style.display = "none";
						},
						error : function(data) {
							alert("出错了！");
						},
						dataType : "json",
					});
			$('#torf').hide();
		}
		//修改课程信息内容输入验证
		function confirmType() {
			var world = false;
			if ($('#ccourseName').val() != null
					&& $('#ccourseName').val() != "") {
				if ($('#ccourseType').val() != null
						&& $('#ccourseType').val() != "") {
					if ($('#cclassCapacity').val() != null
							&& $('#cclassCapacity').val() != "") {
						if (isNaN($('#cclassCapacity').val())) {
							$('#listenIfN').show();
						}
						if ($('#cstartTime').val() != null
								&& $('#cstartTime').val() != "") {
							if ($('#cendTime').val() != null
									&& $('#cendTime').val() != "") {
								if ($('#ccurrentYear').val() != null
										&& $('#ccurrentYear').val() != "") {
									if ($('#cschoolTem').val() != null
											&& $('#cschoolTem').val() != "") {
										//都不为空返回true
										world = true;
									} else {
										$('#listenName').hide();
										$('#listenType').hide();
										$('#listenCapacity').hide();
										$('#listenStart').hide();
										$('#listenEnd').hide();
										$('#listenCurrent').hide();
										$('#listenIfN').hide();
										$('#listenTem').show();
									}
								} else {
									$('#listenName').hide();
									$('#listenType').hide();
									$('#listenCapacity').hide();
									$('#listenEnd').hide();
									$('#listenStart').hide();
									$('#listenIfN').hide();
									$('#listenCurrent').show();
								}
							} else {
								$('#listenName').hide();
								$('#listenType').hide();
								$('#listenCapacity').hide();
								$('#listenStart').hide();
								$('#listenIfN').hide();
								$('#listenEnd').show();
							}
						} else {
							$('#listenName').hide();
							$('#listenType').hide();
							$('#listenCapacity').hide();
							$('#listenIfN').hide();
							$('#listenStart').show();
						}
					} else {
						$('#listenName').hide();
						$('#listenType').hide();
						$('#listenCapacity').show();
					}
				} else {
					$('#listenName').hide();
					$('#listenType').show();
				}
			} else {
				$('#listenName').show();
			}
			return world;
		}

		layui
				.use(
						[ 'element', 'layer' ],
						function() {
							var element = layui.element, $ = layui.jquery, layer = layui.layer;
							//触发事件
							var active = {
								notice : function() {
									//示范一个公告层
									layer
											.open({
												type : 1,
												title : false //不显示标题栏
												,
												closeBtn : false,
												area : '300px;',
												shade : 0.8,
												id : 'LAY_layuipro' //设定一个id，防止重复弹出
												,
												btn : [ '删除', '取消' ],
												yes : function(index, layero) {
													deleteThis();
													layer.closeAll();
												},
												btn2 : function(index, layero) {
													//按钮【按钮二】的回调
												},
												btnAlign : 'c',
												moveType : 1 //拖拽模式，0或者1
												,
												content : '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">确定删除该课程？</div>'
											});
								},
								page : function() {
									layer.open({
										type : 1,
										title : false,
										closeBtn : 0,
										area : '390px',
										skin : 'layui-layer-lan', //没有背景色
										shadeClose : true,
										content : $('#target')
									});
								}

							};

							$('#layerDemo .layui-btn').on(
									'click',
									function() {
										var othis = $(this), method = othis
												.data('method');
										active[method] ? active[method].call(
												this, othis) : '';
									});

							//监听导航点击
							element.on('nav(demo)', function(elem) {
								//console.log(elem)
								layer.msg(elem.text());
							});
						});
	</script>
</body>
</html>