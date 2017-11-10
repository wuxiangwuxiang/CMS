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
<title>学生页面</title>
<script type="text/javascript">
	 $(document).ready(function () {
		 //如果pageNow大于1，点击下一页/上一页则显示消息页面
		 if(${page.pageNow} > 1){
			 $('#doubleHandle').hide();
				$('#signal').hide();
			    $('#studentAddCourse').hide();
			     $('#courseInfo').hide();
				 $('#seprateMessage').show();
				 $('#messageShow').show();
		 }
		 //如果是最后一页
		 if(${page.pageNow} == ${page.totalPageCount}){
			 $('#doubleHandle').hide();
				$('#signal').hide();
			    $('#studentAddCourse').hide();
			     $('#courseInfo').hide();
				 $('#seprateMessage').show();
				 $('#messageShow').show();
		 }
		 //每1秒执行一次消息数量的查询
		 setInterval(gggetMessageCount,1000);
		 function gggetMessageCount() {
			 
			 $.ajax({
	             type: "GET",
	             data: {
	            	 "studentRoNo":$('#studentRoNo').val()
	             },
	             contentType: "application/json; charset=utf-8",
	             async: true,
	             //url不加空格！！！！！！！！！！！！！！！！！！！！！！！
	             url: "<%=request.getContextPath()%>/student/gggetMessageCount.do",
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
			
		 //该学生课程信息
		 $('#checkCourseShow').click(function name1() {
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#studentAddCourse').hide();
			 $('#seprateMessage').hide();
			 $('#messageShow').hide();
			 $('#insertCourseDiv').hide();
			 $('#fushuMessage').hide();
			$('#courseInfo').show();
		});
		//点击消息
		  $('#messageButtton').click(function() {
			$('#doubleHandle').hide();
			$('#signal').hide();
		    $('#studentAddCourse').hide();
		     $('#courseInfo').hide();
		     $('#insertCourseDiv').hide();
		     $('#fushuMessage').hide();
			 $('#seprateMessage').show();
			 $('#messageShow').show();
			});
		 //手动添加课程
		 $('#addCourse').click(function name1() {
				$('#courseInfo').hide();
				$('#doubleHandle').hide();
				$('#signal').hide();
				 $('#seprateMessage').hide();
				 $('#messageShow').hide();
				 $('#insertCourseDiv').hide();
				 $('#fushuMessage').hide();
				$('#studentAddCourse').show();
			});
		 //安全管理
			$('#safeManage').click(function name1() {
				$('#courseInfo').hide();
				$('#studentAddCourse').hide();
				$('#doubleHandle').show();
				 $('#seprateMessage').hide();
				 $('#fushuMessage').hide();
				 $('#messageShow').hide();
				 $('#insertCourseDiv').hide();
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
		//学生添加课程
		function studentAddCourse() {
			var courseId = $('#courseId').val();
			var courseName = $('#courseName').val();
			if(confirmInputType(courseId,courseName)){
				if(pushAddCourse(courseId,courseName)){
					$('#addCourseShow').show();
					setTimeout('yourFunction()',2000); 
				}
			}
		}
		//ajax添加课程，后台发送信息给教师
		function pushAddCourse(courseId,courseName) {
			 var result = false;
			 var studentRono = $('#studentRoNo').val();
			$.ajax({
	              type: "GET",
	              data: {
	            	  "courseId":courseId,
	            	  "studentRono":studentRono,
	            	  "courseName":courseName
	              },
	              contentType: "application/json; charset=utf-8",
	              async: false,
	              dataType: "json",
	              url: "<%=request.getContextPath()%>/student/atudentAddCourse.do",
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
		 //刷新当前页面
		function yourFunction() {
		 window.location.reload();
	   }
		 //添加课程输入验证
		function confirmInputType(courseId,courseName) {
			if($('#courseId').val() != null && $('#courseId').val() != ""){
				if(isNaN($('#courseId').val())){
					$('#listenIdEmpty').hide();
					$('#listenId').show();
				}else{
					if(courseName.length >= 100){
						$('#listenIdEmpty').hide();
						$('#listenId').hide();
						$('#listenName').show();
					}else{
						$('#listenIdEmpty').hide();
						$('#listenId').hide();
						$('#listenName').hide();
						return true;
					}
				}
			}else{
				$('#listenIdEmpty').show();
			}
			
		}
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
	            url: "<%=request.getContextPath()%>/student/getMessageByAjax.do",
				success : function(data) {
					if(data.mmm.messageType == 'insertCourse'){
						$('#forMessageContent').hide();
						$('#messageContent').hide();
						$('#seprateMessage').hide();
						$('#insertCourseDiv').show();
						$('#MteacherMobile').val(data.mmm.messageSender);
						$('#MCourseId').val(data.mmm.messageContent);
					}
					$('#messageShow').hide();
					$('#messageTitle').html('标题 <' + data.mmm.messageTitle + '>');
					$('#messageSnder').html('发送人账号 <' + data.mmm.messageSender +'>');
					if(data.teacher != null){
					$('#messageSenderName').html('发送人姓名 <' + data.teacher.teacherName +'><br/><br/><br/><br/>');
					$('#messageSenderName').show();
					  }
					$('#sendTime').html('时间 <' + data.mmm.sendTime +'>');
					$('#messageContent').html(data.mmm.messageContent + '<br/><br/>');
					$('#fushuMessage').show();
				},
				error : function(data) {
					alert("异常");
				},
				dataType : "json",
			});
		}
		//点击忽略某个消息
		function dontCare() {
			$('#doubleHandle').hide();
			$('#signal').hide();
		    $('#studentAddCourse').hide();
		     $('#courseInfo').hide();
			 $('#seprateMessage').show();
			 $('#messageShow').show();
       }
	 
</script>
</head>
<body>

<!-- 更改邮箱成功提示信息 -->
	<div id="changeMailShow"
		style="background-color: #393D49; height: 20%; width: 20%; z-index: 20; position: fixed; margin-top: 20%; text-align: center; margin-left: 75%; display: none;">
		<h3 style="color: white; margin-top: 19%">更新邮箱成功..</h3>
	</div>
	
	<!-- 添加课程成功提示信息 -->
	<div id="addCourseShow"
		style="background-color: #393D49; height: 20%; width: 20%; z-index: 20; position: fixed; margin-top: 30%; text-align: center; margin-left: 35%; display: none;">
		<h3 style="color: white; margin-top: 19%">请求已发送..</h3>
	</div>

	<div class="layui-layout layui-layout-admin" style="">
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
			<!-- 显示消息 -->
			<div class="site-text site-block" id="messageShow"
				style="padding-left: 10%; display: none;">
				<table>
				<c:choose>
				<c:when test="${! empty message}">
				<c:forEach items="${message}" var="m">
				<tr style="margin-top: 3%">
				<td><img alt="图标cms" src="<%=request.getContextPath()%>/icon/cms3.ico" width="40px" height="40px"></td>
				<td width="12%">&nbsp;</td>
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
            <a href="studentLogin.do?pageNow=1&studentRoNo=${student.studentRoNo}&password=${student.studentPassword}">首页</a>  
            <c:choose> 
                <c:when test="${page.pageNow - 1 > 0}">  
                    <a href="studentLogin.do?pageNow=${page.pageNow - 1}&studentRoNo=${student.teacherMobile}&password=${student.studentPassword}">上一页</a>  
                </c:when>  
                <c:when test="${page.pageNow - 1 <= 0}">  
                    <a href="studentLogin.do?pageNow=1&studentRoNo=${student.studentRoNo}&password=${student.studentPassword}">上一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="studentLogin.do?pageNow=${page.pageNow}&studentRoNo=${student.studentRoNo}&password=${student.studentPassword}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                    <a href="studentLogin.do?pageNow=${page.pageNow + 1}&studentRoNo=${student.studentRoNo}&password=${student.studentPassword}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                    <a href="studentLogin.do?pageNow=${page.totalPageCount}&studentRoNo=${student.studentRoNo}&password=${student.studentPassword}">下一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="studentLogin.do?pageNow=${page.pageNow}&studentRoNo=${student.studentRoNo}&password=${student.studentPassword}">尾页</a>  
                </c:when>  
                <c:otherwise>  
                    <a href="studentLogin.do?pageNow=${page.totalPageCount}&studentRoNo=${student.studentRoNo}&password=${student.studentPassword}">尾页</a>  
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
			<input type="text" id="MteacherMoile" style="display: none;"/>
			<input type="text" id="MCourseId" style="display: none;"/>
			<input id="agree" class="layui-btn" onclick="dontCare()" type="button" value="了解"/>
			<input style="margin-left: 10%;" id="dontCare" onclick="dontCare()" class="layui-btn layui-btn-primary" type="button" value="忽略"/>
			</div>
			</div>
			  
			
				<!-- 学生添加课程 -->
			<div class="site-text site-block" id="studentAddCourse"
				style="display: none;">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">课程编码</label>
						<div class="layui-input-block">
							<input id="courseId" type="text" name="courseId" required
								lay-verify="required" placeholder="请输入课程编码" autocomplete="off"
								class="layui-input">
						</div>
				<p id="listenId" style="color: red;display: none; margin-left: 13%;">*课程编码请输入数字*</p>
				<p id="listenIdEmpty" style="color: red;display: none; margin-left: 13%;">*课程编码不可为空*</p>
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">课程名称</label>
						<div class="layui-input-block">
							<input id="courseName" type="text" name="courseName" required
								lay-verify="required" placeholder="请输入课程名称" autocomplete="off"
								class="layui-input">
						</div>
			  <p id="listenName" style="color: red;display: none; margin-left: 13%;">*课程名称请控制在100字以内*</p>
					</div>
				
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input id="AddCourseButton" class="layui-btn" onclick="studentAddCourse()"
								type="button" value="提交申请" />
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
					});
				</script>
			</div>
			
			<!-- 课程信息表 -->
			<table id="courseInfo" border="1" style="text-align: center; width: 80%; margin-left: 8.5%; margin-top: 3%;">
			<tr>
			<th>课程名称</th>
			<th>类型</th>
			<th>开课时间</th>
			<th>结课时间</th>
			<th>学年</th>
			<th>学期</th>
			<th>老师</th>
			<th>联系方式</th>
			<th>操作</th>
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
			<td><a href="#">退出</a></td>
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
			<a href="#" id="changeStuPass" style="float:left; height:20%; width: 49%;border: solid;border-color: red;font-size: 1.5em">更改密码</a>
			<a href="#" id="changeStuMail" style="float:left; height:20%; width: 49%;border: solid;border-color: red;font-size: 1.5em">更换邮箱</a>
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
			
			<!-- 修改邮箱 -->
					<form id="emailsafe"
					action="<%=request.getContextPath()%>/student/updateStudentEmail.do"
					style="width: 84%; margin-left: 5%; border: solid; border-color: red; 
					text-align: center; display: none;">
					<table style="padding-left: 10%;">
						<br/>
						<tr style="width: 100%;">
							<td style="text-align: right; margin-left: 20%;">学号：</td>
							<td><input type="text" readonly="readonly"
								name="studentRoNo" value="${student.studentRoNo}"
								id="studentRoNo" style="width: 19em;" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td style="text-align: right; width: 20em;">原邮箱：</td>
							<td><input type="text" name="oldEmail" value="${student.studentEmail}"
								id="studentEmail" style="width: 19em" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td style="text-align: right;">
							<label class="layui-form-label" for="mail" style="text-align: right; width: 20em;">新邮箱</label></td>
							<td>
					               <input id="mail" type="text" name="studentEmail" required
						          lay-verify="required|email" autocomplete="off" style="width: 19em"/>
				            </td>
						</tr>
						
						<tr>
							<td id="emailTypeError" style="text-align: right; width: 20em; color: red; display: none;">*格式错误*</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2"><input id="changeStuMailPush" type="button"
								value="申请修改"
								style="width: 70%; height: 1.5em; margin-left: 14em;" /></td>
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
		
  <script type="text/javascript">
   //刷新当前页面
		function yourFunction() {
		 window.location.reload();
	}
   //修改密码
 	$('#changeStuPass').click(function asd() {
 		$('#emailsafe').hide();
 		$('#safe').show();
 	});
 	//修改邮箱
     $('#changeStuMail').click(function asd() {
     	$('#safe').hide();
 		$('#emailsafe').show();
 	});
   //提交更改邮箱申请
	 $('#changeStuMailPush').click(function asd() {
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
		 var studentEmail = $('#mail').val();
		 var studentRoNo = $('#studentRoNo').val();
		$.ajax({
              type: "GET",
              data: {
            	  "studentRoNo":studentRoNo,
            	  "studentEmail":studentEmail
              },
              contentType: "application/json; charset=utf-8",
              async: false,
              dataType: "json",
              url: "<%=request.getContextPath()%>/student/changeStuMail.do",
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
     </script>
     
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