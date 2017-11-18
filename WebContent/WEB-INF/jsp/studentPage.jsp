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
		 //检查入学时间是否为0
		 if(${student.intoSchoolYear} == '0'){
			 $('#innerTime').html("");
		 }
	 
		 //首先检查学生个人信息是否完善
		 if(${empty student.college} || ${empty student.special}||${empty student.intoSchoolYear}
		 ||${empty student.schoolRecord}||${empty student.birthDay}||${empty student.freeStyle}){
			 $('#redSignal').show();
			 $('#signalNow').show();
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
			 $('#messageList').html("课程信息");
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#studentAddCourse').hide();
			 $('#seprateMessage').hide();
			 $('#messageShow').hide();
			 $('#insertCourseDiv').hide();
			 $('#fushuMessage').hide();
			 $('#studentInfoShow').hide();
			 $('#forStudentLogInfo').hide();
			 $('#studentLogInfo').hide();
			 $("#studentLogOfTime").hide();
			 $('#studentWork').hide();
			 $('#courseInfo').show();
		});
		 //个人中心
		 $('#studentInfoCenter').click(function name1() {
			 $('#messageList').html("个人中心");
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#studentAddCourse').hide();
			 $('#seprateMessage').hide();
			 $('#messageShow').hide();
			 $('#insertCourseDiv').hide();
			 $('#fushuMessage').hide();
			 $('#courseInfo').hide();
			 $('#forStudentLogInfo').hide();
			 $('#studentLogInfo').hide();
			 $("#studentLogOfTime").hide();
			 $('#studentWork').hide();
			 $('#studentInfoShow').show();
		 });
		 //点击修改信息
		 $('#updateStudentInfoNow').click(function name1() {
			 $('#messageList').html("修改信息");
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#studentAddCourse').hide();
			 $('#seprateMessage').hide();
			 $('#messageShow').hide();
			 $('#signalNow').hide();
			 $('#insertCourseDiv').hide();
			 $('#fushuMessage').hide();
			 $('#courseInfo').hide();
			 $('#forStudentLogInfo').hide();
			 $('#studentLogInfo').hide();
			 $("#studentLogOfTime").hide();
			 $('#studentWork').hide();
			 $('#studentInfoShow').show();
		 });
		 //点击操作日志
		 $('#studentLog').click(function name() {
			 $('#messageList').html("操作日志");
			 $('#doubleHandle').hide();
			 $('#signal').hide();
			 $('#studentAddCourse').hide();
			 $('#seprateMessage').hide();
			 $('#messageShow').hide();
			 $('#insertCourseDiv').hide();
			 $('#fushuMessage').hide();
			 $('#courseInfo').hide();
			 $('#studentInfoShow').hide();
			 $("#studentLogOfTime").hide();
			 $('#studentWork').hide();
			 $('#forStudentLogInfo').show();
			 $('#studentLogInfo').show();
		});
		 
		//点击消息
		  $('#messageButtton').click(function() {
			 $('#messageList').html("消息列表");
			 $('#doubleHandle').hide();
			 $('#signal').hide();
		     $('#studentAddCourse').hide();
		     $('#courseInfo').hide();
		     $('#insertCourseDiv').hide();
		     $('#fushuMessage').hide();
		     $('#studentInfoShow').hide();
			 $('#seprateMessage').show();
			 $('#forStudentLogInfo').hide();
			 $('#studentLogInfo').hide();
			 $("#studentLogOfTime").hide();
			 $('#studentWork').hide();
			 $('#messageShow').show();
			 layui.use('table', function(){
				  var table = layui.table;
				  table.reload('test', {});
			 });
			}); 
		 //手动添加课程
		 $('#addCourse').click(function name1() {
			 $('#messageList').html("添加课程");
				$('#courseInfo').hide();
				$('#doubleHandle').hide();
				$('#signal').hide();
				 $('#seprateMessage').hide();
				 $('#messageShow').hide();
				 $('#insertCourseDiv').hide();
				 $('#fushuMessage').hide();
				 $('#studentInfoShow').hide();
				 $('#forStudentLogInfo').hide();
				 $('#studentLogInfo').hide();
				 $("#studentLogOfTime").hide();
				 $('#studentWork').hide();
				$('#studentAddCourse').show();
			});
		 //安全管理
			$('#safeManage').click(function name1() {
				$('#messageList').html("修改密码");
				$('#courseInfo').hide();
				$('#studentAddCourse').hide();
				$('#doubleHandle').show();
				 $('#seprateMessage').hide();
				 $('#fushuMessage').hide();
				 $('#messageShow').hide();
				 $('#studentInfoShow').hide();
				 $('#insertCourseDiv').hide();
				 $("#studentLogOfTime").hide();
				 $('#forStudentLogInfo').hide();
				 $('#studentLogInfo').hide();
				 $('#studentWork').hide();
				$('#signal').show();
			});
		 //点击签到记录
			$('#studentWordRecord').click(function wq() {
				$('#messageList').html("签到记录");
				$('#courseInfo').hide();
				$('#studentAddCourse').hide();
				$('#doubleHandle').hide();
				 $('#seprateMessage').hide();
				 $('#fushuMessage').hide();
				 $('#messageShow').hide();
				 $('#studentInfoShow').hide();
				 $('#insertCourseDiv').hide();
				 $("#studentLogOfTime").hide();
				 $('#forStudentLogInfo').hide();
				 $('#studentLogInfo').hide();
				$('#signal').hide();
				$('#studentWork').show();
			});
			//点击完善信息
			$('#perfectButton').click(function wq() {
				$('#messageList').html("完善信息");
				$('#collegeTr').hide();
				$('#reCollegeTr').show();
				$('#specialTr').hide();
				$('#reSpecialTr').show();
				$('#intoSchoolYearTr').hide();
				$('#reIntoSchoolYearTr').show();
				$('#schoolRecordTr').hide();
				$('#reSchoolRecordTr').show();
				$('#signalNow').hide();
				$('#birthDayTr').hide();
				$('#reBirthDayTr').show();
				$('#forSavefectButton').show();
				$('#freeStyleTr').hide();
				$('#reFreeStyleTr').show();
				$('#perfectButton').hide();
				$('#savefectButton').show();
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
	              url: "<%=request.getContextPath()%>/student/confirmStudentPassWord.do",
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
	    //点击保存 后台完善学生信息
	    $('#savefectButton').click(function wannaSubmittt() {
	    	$.ajax({
	              type: "GET",
	              data: {
	            	  "studentRono":$('#studentRoNo').val(),
	            	  "college":$('#college').val(),
	            	  "special":$('#special').val(),
	            	  "intoSchoolYear":$('#intoSchoolYear').val(),
	            	  "schoolRecord":$('#schoolRecord').val(),
	            	  "birthDay":$('#birthDay').val(),
	            	  "freeStyle":$('#freeStyle').val()
	              },
	              contentType: "application/json; charset=utf-8",
	              async: false,
	              dataType: "json",
	              url: "<%=request.getContextPath()%>/student/updateStudentInfoByAjax.do",
	              success: function (data) {
	            	  if(data.result == true){
	            		 $('#updateStudentInfoSuccess').show();
	            		 setTimeout('yourFunction()',2000); 
	            	  }else{
	            		  alert("更新信息失败！");
	            	  }
	              },
	              error: function (data) {
	            	  alert("服务器异常");
	              }
	          });
	    });
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
		var ccclazzName = "";
		function studentAddCourse() {
			var courseId = $('#courseId').val();
			var courseName = $('#courseName').val();
			ccclazzName = $('#clazzName').val();
			if(confirmInputType(courseId,courseName)){
				if(searchIfExistCourse()){
				if(ccclazzName != "" ){
				if(pushAddCourse(courseId,courseName,ccclazzName)){
					$('#addCourseShow').show();
					setTimeout('yourFunction()',2000); 
				   }
					}else{
						$('#listenClss').show();
					}
				}else{
					
				}
			}
		}
		//ajax添加课程，后台发送信息给教师
		function pushAddCourse(courseId,courseName,ccclazzName) {
			 var result = false;
			 var studentRono = $('#studentRoNo').val();
			$.ajax({
	              type: "GET",
	              data: {
	            	  "clazzId":ccclazzName,
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
	            	  }else if(data.result == false){
	            		  $('#listenClssExit').show();
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
					$('#listenClssExit').hide();
					$('#listenId').show();
				}else{
					if(courseName.length >= 100){
						$('#listenIdEmpty').hide();
						$('#listenId').hide();
						$('#listenClssExit').hide();
						$('#listenName').show();
					}else{
						$('#listenIdEmpty').hide();
						$('#listenId').hide();
						$('#listenClssExit').hide();
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
		     $('#studentInfoShow').hide();
		     $('#studentLogInfo').hide();
		     $('#fushuMessage').hide();
			 $('#seprateMessage').show();
			 $('#messageShow').show();
       }
		//根据时间查询操作日志
		function searchStudentLogByTime() {
			if($('#logDate').val() != "" || $('#CoreKey').val() != ""){
			 $.ajax({
		         type: "GET",
		         data: {
		        	 "logDate": $('#logDate').val(),
		        	 "coreKey":$('#CoreKey').val(),
		        	 "studentRono":$('#studentRoNo').val()
		         },
		         contentType: "application/json; charset=utf-8",
		         dataType: "json",
		         async: true,
		         url: "<%=request.getContextPath()%>/student/searchStudentLogByTime.do",
		         success: function (data) {
		        	 $('#studentLogInfo').hide();
		        	    var dataObj = data.logEntities, //返回的data为json格式的数据
		        	    con =  '\
		        				<tr>\
		        					<th>学号</th>\
		        					<th>活动</th>\
		        					<th>Ip</th>\
		        					<th>时间</th>\
		        					<th>结果</th>\
		        				</tr>\
		        				';
		        	    $.each(dataObj, function (index, item) {
		        	        con += "<tr>";
		        	        con += "<td>" + item.userId + "</td>";
		        	        con += "<td>" + item.method + "</td>";
		        	        con += "<td>" + item.ip + "</td>";
		        	        con += "<td>" + item.date + "</td>";
		        	        con += "<td>" + item.result + "</td>";
		        	        con += "<tr/>";
		        	    });
		        	        //可以在控制台打印一下看看，这是拼起来的标签和数据
		        	        //把内容入到这个div中即完成
		        	    $("#studentLogOfTime").html(con);
		        	    $("#studentLogOfTime").show();
		         },
		         error: function (data) {
		             alert("暂时无法获取");
		         },
		     });
			}else{
				alert("请至少输入一项吧大侠？");
			}
		}
		//验证课程有效性
		function searchIfExistCourse() {
			var result = false;
			var courseId = $('#courseId').val();
			if(courseId != null && courseId != ""){
			$.ajax({
	            type: "GET",
	            data: { 
			         "courseId": courseId
	            },
	            contentType: "application/json; charset=utf-8",
	            dataType : "json",
	            async: false,
	            url: "<%=request.getContextPath()%>/course/searchIfExistCourse.do",
				success : function(data) {
					var dataObj = data.clazzs;
					if(data.result == true && data.clazzs != null){
						var con = "";
						con = "<option value=''>" + "请选择" + " </option>";
						$.each(dataObj, function (index, item) {
		        	        con += "<option value=\"" + item.clazzId + "\" >" + item.clazzName + "</option>";
						});
					$('#clazzName').html(con);
					$('#listenEmpty').hide();
					$('#listenClazzs').hide();
					$('#clazzDiv').show();
					result = true;
					}else if (data.result == true && data.clazzs == null) {
						$('#clazzDiv').hide();
						$('#listenEmpty').hide();
						$('#listenClazzs').show();
					}else {
						$('#clazzDiv').hide();
						$('#listenEmpty').show();
						$('#listenIdEmpty').hide();
						$('#listenClazzs').hide();
					}
				},
				error : function(data) {
					alert("异常");
				},
			});
			return result;
			}else{
			$('#clazzDiv').hide();
			$('#listenEmpty').show();
			$('#listenIdEmpty').hide();
			$('#listenClazzs').hide();
			}
		}
		function exitLogin() {
			 $.ajax({
	             type: "GET",
	             data: {
	            	 "studentRoNo":$('#studentRoNo').val()
	             },
	             contentType: "application/json; charset=utf-8",
	             async: false,
	             //url不加空格！！！！！！！！！！！！！！！！！！！！！！！
	             url: "<%=request.getContextPath()%>/student/exitLogin.do",
				success : function(data) {
					
				},
				error : function(data) {
				},
				dataType : "json",
			});
		}
</script>

</head>
<body>

	<!-- 更改邮箱成功提示信息 -->


	<!-- 添加课程成功提示信息 -->
	<div id="addCourseShow"
		style="background-color: #393D49; height: 20%; width: 20%; z-index: 20; position: fixed; margin-top: 30%; text-align: center; margin-left: 35%; display: none;">
		<h3 style="color: white; margin-top: 19%">请求已发送..</h3>
	</div>

	<!-- 完善个人信息成功提示信息 -->
	<div id="updatePersonInfoShow"
		style="background-color: #393D49; height: 20%; width: 20%; z-index: 20; position: fixed; margin-top: 30%; text-align: center; margin-left: 35%; display: none;">
		<h3 style="color: white; margin-top: 19%">信息更新成功..</h3>
	</div>

	<div class="layui-layout layui-layout-admin" style="">
		<!-- 头部导航 -->
		<div class="layui-header header header-demo">
			<div class="layui-main">
				<a class="CMSlogo" href="/"><span
					style="color: white; font-size: 25px;">CMS</span></a>

				<ul class="layui-nav">
					<li class="layui-nav-item"><a id="messageButtton" href="#">
					<i class="layui-icon bbbbb" style="font-size: 20px; color: #d2d2d2">&#xe63a;</i> <span
							id="TmessageCount" class="layui-badge" style="margin-left: 43%;">${messageCount}</span></a></li>
					<li class="layui-nav-item"><a id="studentInfoCenter" href="#">
					<i class="layui-icon bbbbb" style="font-size: 20px; color: #d2d2d2">&#xe612;</i><span
							id="redSignal" style="display: none;" class="layui-badge-dot"></span></a></li>
					<%-- <li class="layui-nav-item"
						style="padding: 0; margin: 0; text-align: right;"><img
						height="45em" width="40em"
						src="/ClassManageSys/studentPhoto/${student.studentPhoto}"
						class="layui-circle"></li> --%>
					<li class="layui-nav-item"><a href="#">${student.studentName}</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="updateStudentInfoNow" href="#">修改信息</a>
							</dd>
							<dd>
								<a id="safeManage" href="#">安全管理</a>
							</dd>
							<dd>
								<a onclick="exitLogin()"
									href="<%=request.getContextPath()%>/index.jsp">注销</a>
							</dd>
						</dl></li>
				</ul>

			</div>
		</div>
		<!-- 左侧垂直导航 -->
		<div class="layui-side layui-bg-black" style="position: absolute;">
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
								<a id="studentWordRecord" href="#">签到记录</a>
							</dd>
							<dd>
								<a id="studentLog" href="#">操作日志</a>
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

		<!-- 内容显示 -->
		<div class="layui-body site-demo"
			style="padding-top: 4%; overflow: auto;">
			<span id="messageList"
				style="margin-left: 5%; color: #c2c2c2; font-style: oblique;">课程信息</span>
			<hr class="layui-bg-cyan">

			<!-- 课程信息模块 -->
			<div id="courseInfo"
				style="margin: 5px 5% auto; padding-top: 10px; padding-left: 20px; padding-right: 20px;">
				<table lay-filter="courseInfo">
					<thead>
						<tr>
							<th lay-data="{field:'courseName', width:100, sort:true}">课程名称</th>
							<th lay-data="{field:'courseType', width:100, sort:true}">类型</th>
							<th lay-data="{field:'startTime', width:130, sort:true}">开课时间</th>
							<th lay-data="{field:'stopTime', width:130, sort:true}">结课时间</th>
							<th lay-data="{field:'courseYear', width:100, sort:true}">学年</th>
							<th lay-data="{field:'courseDate', width:100, sort:true}">学期</th>
							<th lay-data="{field:'courseTeacher', width:100, sort:true}">老师</th>
							<th lay-data="{field:'courseTeacherMobile', width:123}">联系方式</th>
							<th lay-data="{field:'courseOption', width:100}">操作</th>
						</tr>
					</thead>
					<tbody>
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
									<td colspan="9">(暂无课程)</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<script>
			layui.use([ 'element', 'layer' ,'table'], function() {
				var element = layui.element, $ = layui.jquery,table = layui.table;
				//转换静态表格
				table.init('courseInfo', {
				  //设置高度
				  //支持所有基础参数
				});
				table.init('signRecord',{
					
				});
			});
			</script>


			<!-- 学生添加课程模块 -->
			<div class="site-text site-block" id="studentAddCourse"
				style="display: none;">
				<form class="" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">课程编码</label>
						<div class="layui-input-block">
							<input id="courseId" type="text" name="courseId" required
								lay-verify="required" onchange="searchIfExistCourse()"
								placeholder="请输入课程编码" autocomplete="off" class="layui-input">
						</div>
						<p id="listenEmpty"
							style="color: red; display: none; margin-left: 13%;">*课程为空*</p>
						<p id="listenId"
							style="color: red; display: none; margin-left: 13%;">*课程编码请输入数字*</p>
						<p id="listenIdEmpty"
							style="color: red; display: none; margin-left: 13%;">*课程编码不可为空*</p>
						<p id="listenClazzs"
							style="color: red; display: none; margin-left: 13%;">*暂无班级可供选择*</p>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">课程名称</label>
						<div class="layui-input-block">
							<input id="courseName" type="text" name="courseName" required
								lay-verify="required" placeholder="请输入课程名称" autocomplete="off"
								class="layui-input">
						</div>
						<p id="listenName"
							style="color: red; display: none; margin-left: 13%;">*课程名称请控制在100字以内*</p>
					</div>

					<div id="clazzDiv" style="display: none;">
						<label class="layui-form-label">选择班级</label> <select
							id="clazzName" name="clazzName"
							style="height: 2.3em; width: 20%;">

						</select> <br />
					</div>
					<p id="listenClss"
						style="color: red; display: none; margin-left: 13%;">*班级不可为空*</p>

					<p id="listenClssExit"
						style="color: red; display: none; margin-left: 13%;">*您已在该班级*</p>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input id="AddCourseButton" class="layui-btn"
								onclick="studentAddCourse()" type="button" value="提交申请" />
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>

				<script>
					//Demo
					layui.use([ 'form'], function() {
						var form = layui.form;
						//监听提交
						form.on('submit(formDemo)', function(data) {
							layer.msg(JSON.stringify(data.field));
							return false;
						});
					});
				</script>
			</div>


			<!-- 签到记录 -->
			<div id="studentWork" style="display: none;">
				<table lay-filter="signRecord" style="text-align: center;">
					<thead>
						<tr>
							<th lay-data="{field:'stuCourseID', width:120}">课程编码</th>
							<th lay-data="{field:'stuCourseName', width:130, sort:true}">课程名称</th>
							<th lay-data="{field:'stuCourseYear', width:130, sort:true}">学年</th>
							<th lay-data="{field:'stuCourseDate', width:130, sort:true}">学期</th>
							<th lay-data="{field:'stuCourseSign', width:120, sort:true}">签到</th>
							<th lay-data="{field:'stuCourseLate', width:120, sort:true}">迟到</th>
							<th lay-data="{field:'stuCourseEarly', width:120, sort:true}">早退</th>
							<th
								lay-data="{field:'stuCourseAbsenteeism', width:120, sort:true}">旷课</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${! empty studentInfos}">
								<c:forEach items="${studentInfos}" var="s">
									<tr>
										<td>${s.course.courseId}</td>
										<td>${s.course.courseName}</td>
										<td>${s.course.currentYear}</td>
										<td>${s.course.schoolTem}</td>
										<td>${s.signIn}</td>
										<td>${s.comeLate}</td>
										<td>${s.leaveEarlier}</td>
										<td>${s.absenteeism}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">(暂无信息)</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<!-- 显示消息 -->
			<div id="messageShow"
				style="margin-left: 5%; margin-right: 5%; display: none;">
				<table class="layui-table"
					lay-data="{page:true,height:485,width:1070, url:'<%=request.getContextPath() %>/student/getSeperratePage.do',
			 id:'test', where:{messageAcpter:'${student.studentRoNo}'}, limit:10}"
					lay-filter="test" style="width: 100%;">
					<thead>
						<tr>
							<th lay-data="{field:'messageSender', width:200, sort: true}">发送方</th>
							<th
								lay-data="{field:'messageTitle', width:500,templet: '#titleTpl'}">标题</th>
							<th
								lay-data="{field:'haveRead', width:200, sort: true,templet: '#status'}">状态</th>
							<th
								lay-data="{fixed: 'right', width:160, align:'center', toolbar: '#barDemo'}"></th>
						</tr>
					</thead>
				</table>
			</div>
			<script type="text/html" id="barDemo">
  			<a class="layui-btn layui-btn-primary layui-btn-mini" lay-event="detail">查看</a>
  			<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
			</script>
			<script type="text/html" id="titleTpl">
     		<a href="#" class="layui-table-link">{{d.messageTitle}}</a>
   			</script>
			<script>
        	layui.use('table', function(){
        		var table = layui.table;
        		table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            		var data = obj.data; //获得当前行数据
            		var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            		var tr = obj.tr; //获得当前行 tr 的DOM对象      
            		if(layEvent === 'detail'){ //查看
             			getMessage(data.messageId);
           			} else if(layEvent === 'del'){ //删除
              			layer.confirm('真的删除行么', function(index){
               				//向服务端发送删除指令
          					$.ajax({
                     			type: "GET",
                     			data: {
                    				"messageId":data.messageId
                     			},
                     			contentType: "application/json; charset=utf-8",
                     			async: false,
                     			//url不加空格！！！！！！！！！！！！！！！！！！！！！！！
                     			url: "<%=request.getContextPath()%>/student/deleteMessage.do",
        						success : function(data) {
        							if(data.result == true){
        								obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
        			            		layer.close(index);
        							}else{
        								alert("删除失败");
        							}
        						},
        						error : function(data) {		
        						},
        						dataType : "json",
        					});
              			});
            		} 
            		obj.update({
                		haveRead: '已读'
					});
				});
			});        
			</script>

			<!-- 附属详细消息 -->
			<div id="fushuMessage"
				style="width: 100%; padding-left: 25%; display: none; margin-top: 5%;">
				<h3 id="messageTitle"></h3>
				<hr />
				<br /> <br /> <span id="messageSnder"></span><br /> <br /> <br />
				<br /> <span id="messageSenderName" style="display: none;"></span>
				<span id="sendTime"></span><br /> <br /> <br /> <br /> <span
					id="forMessageContent">内容<br /></span>
				<textarea id="messageContent" rows="5" cols="40" readonly="readonly"></textarea>
				<br /> <br />
				<div id="insertCourseDiv" style="display: none;">
					<input type="text" id="MteacherMoile" style="display: none;" /> <input
						type="text" id="MCourseId" style="display: none;" /> <input
						id="agree" class="layui-btn" onclick="dontCare()" type="button"
						value="了解" /> <input style="margin-left: 10%;" id="dontCare"
						onclick="dontCare()" class="layui-btn layui-btn-primary"
						type="button" value="忽略" />
				</div>
			</div>




			<!-- 学生操作日志表 -->
			<div id="forStudentLogInfo" class="site-text site-block"
				style="text-align: center; height: 3em; margin-top: 0.1%; display: none;">
				<form class="layui-form" action="">
					<div class="layui-form-item" style="width: 80%; margin-left: 7%;">
						<div style="height: 100%; float: left;">
							<label class="layui-form-label" style="">输入日期</label>
							<div class="layui-input-block" style="">
								<input id="logDate" type="text" lay-verify="logDate"
									placeholder="yyyy-MM-dd" autocomplete="on" class="layui-input"
									style="width: 60%; float: left;">
							</div>
						</div>
						<div style="height: 100%; width: 49%; float: left;">
							<label class="layui-form-label" style="">输入关键字</label>
							<div class="layui-input-block" style="">
								<input id="CoreKey" type="text" lay-verify="CoreKey"
									placeholder="如  '登录'" autocomplete="off" class="layui-input"
									style="width: 60%; float: left;"> <input
									class="layui-btn" lay-submit type="button"
									onclick="searchStudentLogByTime()" value="查询"
									style="float: left;" />
							</div>
						</div>
					</div>
				</form>
			</div>
			<script>
					//Demo
					layui.use([ 'form', 'laydate' ], function() {
						var form = layui.form, laydate = layui.laydate;
						laydate.render({
							elem : '#logDate'
						});
						
						form.verify({
							logDate:[/\S/,'日期不可为空']
						});
					});
			</script>

			<table id="studentLogOfTime" border="1"
				style="display: none; text-align: center; width: 80%; margin-left: 9.5%;">
			</table>

			<table id="studentLogInfo" border="1"
				style="text-align: center; width: 80%; margin-left: 9.5%; display: none;">
				<tr>
					<th>学号</th>
					<th>活动</th>
					<th>Ip</th>
					<th>时间</th>
					<th>结果</th>
				</tr>
				<c:choose>
					<c:when test="${! empty logEntity}">
						<c:forEach items="${logEntity}" var="s">
							<tr>
								<td>${s.userId}</td>
								<td style="text-align: left; padding-left: 10%;">${s.method}</td>
								<td>${s.ip}</td>
								<td>${s.date}</td>
								<td>${s.result}</td>
								<!--  <td colspan="8"></td>-->
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">(暂无信息)</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>



			<!-- 个人中心 -->
			<div id="studentInfoShow"
				style="background-color: white; margin-left: 13%; margin-right: 20%; width: 100%; padding-left: 5%; padding-top: 2%; padding-bottom: 500px; display: none;">

				<!-- 更新信息成功显示的Div -->
				<div id="updateStudentInfoSuccess" class="site-text site-block"
					style="background-color: #393D49; height: 20%; width: 20%; display: none; z-index: 20; margin-top: 14%; text-align: center; margin-left: 15%; position: absolute;">
					<h3 style="color: white; margin-top: 19%">更新信息成功..</h3>
				</div>

				<table style="float: left; width: 40%; text-align: center;"
					class="layui-form layui-form-pane">
					<tr>
						<td class="layui-form-label">学号</td>
						<td style="text-align: left;">${student.studentRoNo}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="layui-form-label">手机</td>
						<td style="text-align: left;">${student.studentMobile}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="layui-form-label">邮箱</td>
						<td style="text-align: left;">${student.studentEmail}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="layui-form-label">姓名</td>
						<td style="text-align: left;">${student.studentName}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="layui-form-label">性别</td>
						<td style="text-align: left;">${student.studentGender}</td>
					</tr>
					<tr id="forCollege" style="">
						<td>&nbsp;</td>
					</tr>

					<tr id="collegeTr" style="">
						<td class="layui-form-label">学院</td>
						<td style="text-align: left;">${student.college}</td>
					</tr>

					<tr id="reCollegeTr" style="display: none;">
						<td class="layui-form-label">学院</td>
						<td style="text-align: left;"><input required
							style="width: 60%;" class="layui-input" type="text"
							value="${student.college}" id="college" name="college" /></td>
					</tr>

					<tr id="forSpecial" style="">
						<td>&nbsp;</td>
					</tr>

					<tr id="specialTr" style="">
						<td class="layui-form-label">专业</td>
						<td style="text-align: left;">${student.special}</td>
					</tr>
					<tr id="reSpecialTr" style="display: none;">
						<td class="layui-form-label">专业</td>
						<td style="text-align: left;"><input required
							style="width: 60%;" class="layui-input" type="text"
							value="${student.special}" id="special" name="special" /></td>
					</tr>

					<tr id="forSavefectButton" style="display: none;">
						<td>&nbsp;</td>
					</tr>
					<tr id="savefectButton" style="display: none;">
						<td colspan="2" style="text-align: left;">
							<button style="margin-left: 0;" class="layui-btn">保存信息</button>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left;"><button
								id="perfectButton" style="margin-left: 0;" class="layui-btn">完善信息</button>
							<span id="signalNow"
							style="color: red; margin-left: 20%; display: none;">*请尽快完善信息*</span>
						</td>
					</tr>

				</table>

				<!-- 补充信息 -->
				<div class="layui-upload-list"
					style="width: 50%; heigh: 120px; float: left; margin-left: 10px;">
					<img class="layui-upload-img"
						src="/ClassManageSys/studentPhoto/${student.studentPhoto}"
						style="width: 100px; heigh: 120px; margin-left: -100px;"
						id="imgPre">
					<p id="demoText"></p>
					<table style="margin-left: -110px; width: 70%"
						class="layui-form layui-form-pane">
						<tr id="forintoSchool" style="">
							<td>&nbsp;</td>
						</tr>

						<tr id="intoSchoolYearTr" style="">
							<td class="layui-form-label" style="text-align: left;">入学时间</td>
							<td id="innerTime" style="text-align: left; width: 47%;">${student.intoSchoolYear}</td>
						</tr>
						<tr id="reIntoSchoolYearTr" style="display: none;">
							<td class="layui-form-label" valign="2017"
								style="text-align: left;">入学时间</td>
							<td style="text-align: left; width: 47%;"><input
								lay-verify="requirevalidate" required style="width: 60%;"
								class="layui-input" type="text"
								value="${student.intoSchoolYear}" id="intoSchoolYear"
								name="intoSchoolYear" /></td>
						</tr>

						<tr id="forschoolRecord" style="">
							<td>&nbsp;</td>
						</tr>

						<tr id="schoolRecordTr" style="text-align: left;">
							<td class="layui-form-label" style="text-align: left;">当前学历</td>
							<td style="text-align: left; width: 47%;">${student.schoolRecord}</td>
						</tr>
						<tr id="reSchoolRecordTr" style="display: none;">
							<td class="layui-form-label" style="text-align: left;" required>当前学历</td>
							<td style="text-align: left; width: 47%;"><select
								id="schoolRecord">
									<option value="本科" selected="selected">本科</option>
									<option value="硕士">硕士</option>
									<option value="博士">博士</option>
									<option value="海归">海归</option>
							</select>
						</tr>

						<tr id="forBirthDay" style="">
							<td>&nbsp;</td>
						</tr>

						<tr id="birthDayTr" style="">
							<td class="layui-form-label" style="text-align: left;">出生日期</td>
							<td style="text-align: left; width: 47%;">${student.birthDay}</td>
						</tr>
						<tr id="reBirthDayTr" style="display: none;">
							<td class="layui-form-label" style="text-align: left;">出生日期</td>
							<td style="text-align: left; width: 47%;"><input required
								style="width: 60%;" class="layui-input" type="text"
								value="${student.birthDay}" id="birthDay" name="birthDay" /></td>
						</tr>

						<tr id="forFreeStyle" style="">
							<td>&nbsp;</td>
						</tr>

						<tr id="freeStyleTr" style="">
							<td class="layui-form-label" style="text-align: left;">freeStyle</td>
							<td style="text-align: left;">${student.freeStyle}</td>
						</tr>
						<tr id="reFreeStyleTr" style="display: none;">
							<td class="layui-form-label" style="text-align: left;">freeStyle</td>
							<td style="text-align: left; width: 47%;"><input
								style="width: 60%;" class="layui-input" type="text"
								value="${student.freeStyle}" id="freeStyle" name="freeStyle" /></td>
						</tr>
					</table>
				</div>

			</div>
			<script>
					//Demo
					layui.use([ 'form', 'laydate' ], function() {
						var form = layui.form, laydate = layui.laydate;
						laydate.render({
							elem : '#birthDay'
						});
						laydate.render({
							elem : '#intoSchoolYear',
							type : 'year',
							value: '2017'
						});
					});
					layui.use('form', function() {
						var form = layui.form;
					form.verify({
						requirevalidate: [/\S/,'必填项不可为空']
					});
					});
				</script>


			<!-- 安全/密码 -->
			<div id="signal"
				style="width: 95%; margin-left: 5%; padding-left: 5%; z-index: 1; background-color: #cccc00; height: 3%; display: none; font-family: 微软雅黑;">
				提示：修改邮箱后后请前往原邮箱确认..</div>
			<!-- 更改邮箱成功提示信息 -->
			<div id="changeMailShow" class="site-text site-block"
				style="background-color: #393D49; height: 20%; width: 20%; display: none; z-index: 20; margin-top: 14%; text-align: center; margin-left: 25%; position: absolute;">
				<h3 style="color: white; margin-top: 19%">更新邮箱成功..</h3>
			</div>

			<div class="site-text site-block" id="doubleHandle"
				style="width: 70%; margin-left: 15%; margin-top: 4%; display: none;">
				<a class="layui-btn layui-btn-primary" href="#" id="changeStuPass"
					style="float: left; height: 20%; width: 49%; font-size: 1.5em">更改密码</a>
				<a class="layui-btn layui-btn-primary" href="#" id="changeStuMail"
					style="float: left; height: 20%; width: 49%; font-size: 1.5em">更换邮箱</a>
				<br /> <br />
				<form class="layui-form layui-form-pane" id="safe"
					action="<%=request.getContextPath()%>/student/updateStudentPassWord.do"
					style="width: 84%; margin-left: 5%; padding-left: 17%">
					<table>
						<br />
						<tr style="width: 100%;">
							<td><label class="layui-form-label">学号</label></td>
							<td><input class="layui-input" type="text"
								readonly="readonly" name="studentRoNo"
								value="${student.studentRoNo}" id="studentRoNo"
								style="width: 25em;" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">原密码</label></td>
							<td><input class="layui-input" type="password"
								name="oldPassword" id="studentPassword" style="width: 25em" /></td>
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
							<td><input class="layui-input" type="password"
								name="studentPassword" id="newPassword" style="width: 25em" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">确认新密码</label></td>
							<td><input class="layui-input" type="password"
								name="rePassword" id="rePassword" style="width: 25em" /></td>
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
							<td colspan="2"><input class="layui-btn" id="ccchangePass"
								type="button" value="申请修改" style="width: 70%; margin-left: 15%;" /></td>
						</tr>
					</table>
				</form>

				<!-- 修改邮箱 -->
				<form id="emailsafe" class="layui-form layui-form-pane"
					action="<%=request.getContextPath()%>/student/updateStudentEmail.do"
					style="width: 84%; margin-left: 5%; padding-left: 17%; display: none;">
					<table style="">
						<br />
						<tr style="width: 100%;">
							<td><label class="layui-form-label">学号</label></td>
							<td><input class="layui-input" type="text"
								readonly="readonly" name="studentRoNo"
								value="${student.studentRoNo}" id="studentRoNo"
								style="width: 25em;" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">原邮箱</label></td>
							<td><input class="layui-input" type="text" id="oldEmail"
								name="oldEmail" value="${student.studentEmail}"
								id="studentEmail" style="width: 25em" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label class="layui-form-label">新邮箱</label></td>
							<td><input class="layui-input" id="mail" type="text"
								name="studentEmail" required lay-verify="required|email"
								autocomplete="off" style="width: 19em" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
						<tr>
							<td colspan="2" id="emailTypeError"
								style="text-align: right; width: 20em; color: red; display: none; padding-left: 20%;">*格式错误*</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2"><input class="layui-btn"
								id="changeStuMailPush" type="button" value="申请修改"
								style="width: 70%; margin-left: 15%;" /></td>
						</tr>
					</table>
				</form>

			</div>



		</div>

	</div>


	<div
		style="height: 100px; margin-top: 42.6%; background-color: #000011; text-align: center; padding-top: 5px">
		<div class="navbar-header"
			style="text-align: center; width: 100%; margin-top: 3%; color: white; z-index: 3">

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
 		$('#messageList').html("修改密码");
 		$('#emailsafe').hide();
 		$('#safe').show();
 	});
 	//修改邮箱
     $('#changeStuMail').click(function asd() {
    	 $('#messageList').html("修改邮箱");
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
    		 }else {
				alert("抱歉，服务器拥挤请稍后再试..");
			}
    	}else {
    		$('#waitChangeMailShow').hide();
		}
	});
   //后台更新邮箱及通知原邮箱
	function pushEmail() {
		 //ajax后台更新
		 var result = false;
		 var studentEmail = $('#mail').val();
		 var oldEmail = $('#oldEmail').val();
		 var studentRoNo = $('#studentRoNo').val();
		$.ajax({
              type: "GET",
              data: {
            	  "studentRoNo":studentRoNo,
            	  "studentEmail":studentEmail,
            	  "oldEmail":oldEmail
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