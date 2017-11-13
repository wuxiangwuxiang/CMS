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
<title>班级信息</title>
 


<script type="text/javascript">
function aClick(clazzId) {
	  document.getElementById("asd"+clazzId).submit()
}
//修改班级信息
function changeWhenClick(clazzId) {
	 var clazzIdpre = clazzId.substring(3);
	 document.getElementById("preclazzId").value = clazzIdpre;
	$('#clazzForm').toggle();	
}
function saveChange() {
	 $.ajax({
         type: "GET",
         data: {
        	 "clazzId": $('#preclazzId').val(),
        	 "clazzName": $('#preclazzName').val()
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/clazz/changeClazzByAjax.do",
         success: function (data) {
        	 alert(data.message);
        	 window.location.reload();
         },
         error: function (data) {
             alert("修改失败！");
         },
     });
}
//ajax删除clazz,本质上是修改clazz的外键courseId为null
function deleteClazzByAjax(clazzid) {
	var clazzId = clazzid.substring(3);
	 $.ajax({
         type: "GET",
         data: {
        	 "clazzId": clazzId
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/clazz/deleteClazzById.do",
         success: function (data) {
        	 alert(data.message);
        	 window.location.reload();
         },
         error: function (data) {
             alert("删除失败！");
         },
     });
}
//隐藏正在滚动刷新的验证码
function closeValidateCode() {
	$("#validateCode").hide();
}
//二维码要用到的随机数
function hello(){ 
	 $.ajax({
         type: "GET",
         data: {
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/student/getVertifyCode.do",
         success: function (data) {
        	 $("#validateCode").html(data.code);
        	 var t2 = window.setTimeout("hello()",15000);//15s后刷新随机数
         },
         error: function (data) {
             alert("服务器异常！");
         },
     });
	 window.setTimeout("closeValidateCode()",30000);
	} 
//倒计时
var maxtime = 10;
function CountDown(){  
		if(maxtime>=0){   
			 seconds = maxtime;  
			 msg = "签到码还有"+seconds+"秒刷新";  
			 document.all["timer"].innerHTML=msg;   
			 --maxtime;  
		}else{  
		clearInterval(timer);    
		}  
}  
//timer = setInterval("CountDown()",1000); 	
//显示签到二维码
function showQrImg() {
	 $.ajax({
         type: "GET",
         data: {
        	 "courseId": $('#cccourseId').val(),
        	 "teacherMobile":$('#teacherMobile').val()
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/course/getQrImg.do",
         success: function (data) {
        	 var url = "/ClassManageSys/qrImg/" + data.url + ".gif";
        	 var imgPre = document.getElementById("qrImg");
//         	 imgPre.style.display = "block";
             imgPre.src = url;
             setInterval("CountDown()",1000);
             //5s刷新
             setInterval('YesConfirm()', 5000);
             var t1 = window.setTimeout("hello()",10000); //10s后显示随机数
            // window.clearTimeout(t1);//去掉定时器             
         },
         error: function (data) {
             alert("服务器异常！");
         },
     });
}
//获取签到成功学生列表
function YesConfirm() {
	 $.ajax({
         type: "GET",
         data: {
        	 "courseId": $('#cccourseId').val()
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: true,
         url: "<%=request.getContextPath()%>/student/getTemStudent.do",
         success: function (data) {
        	    var dataObj = data.students, //返回的data为json格式的数据
        	    con =  '\
        	    		<caption>实时签到</caption>\
        				<tr>\
        					<th>学号</th>\
        					<th>姓名</th>\
        					<th>班级</th>\
        				</tr>\
        				';
        	    $.each(dataObj, function (index, item) {
        	        con += "<tr>";
        	        con += "<td>" + item.studentRoNo + "</td>";
        	        con += "<td>" + item.studentName + "</td>";
        	        con += "<td>" + item.clazz.clazzName + "</td>";
        	        con += "<tr/>";
        	    });
        	        //可以在控制台打印一下看看，这是拼起来的标签和数据
        	        //把内容入到这个div中即完成
        	    $("#showStudents").html(con);
         },
         error: function (data) { 
             console.log(data);
             alert("服务器异常！");
         },
     });
}
//提交签到表
function submitSignIn() {
	 $.ajax({
         type: "GET",
         data: {
        	 "courseId": $('#cccourseId').val(),
         },
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         async: false,
         url: "<%=request.getContextPath()%>/student/submitSignIn.do",
			success : function(data) {
				alert(data.message);
				window.location.reload();
			},
			error : function(data) {
				alert("服务器异常！");
			},
		});
	}
	//获取所有签到记录
	function getRecord() {
		$('#scoreTable').toggle();
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
					<li class="layui-nav-item"><a href="#">${teacher.teacherName}老师</a>
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
						href="javascript:;">签到</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="checkCourseShow" href="#">点名签到</a>
							</dd>
							<dd>
								<a id="createCourse" href="#">补签</a>
							</dd>
							<dd>
								<a href="#">签到记录</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="#">解决方案</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="#">移动模块</a>
							</dd>
							<dd>
								<a href="#">后台模版</a>
							</dd>
							<dd>
								<a href="#">电商平台</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="#">产品</a></li>
					<li class="layui-nav-item"><a href="#">大数据</a></li>
				</ul>
			</div>
		</div>

		<!-- 内容 -->
		<div class="layui-body site-demo">

			<div style="width: 100%;border: solid;border-color: black;overflow:hidden">
				<!-- 签到模块 -->
				<div
					style="border: solid; border-color: blue; width: 49%; float: right;">
					<!-- 二维码模块 -->
					<div
						style="width: 98%; height: 20%; border: solid; border-color: yellow; text-align: center;">
						<!-- 签到数字 -->
						<div id="validateCode"
							style="width: 98; height: 30px; font-size: 25px; text-align: center; border: solid; border-color: green;">
							<span id="timer">签到码</span>
						</div>
						<!-- 签到二维码 -->
						<div
							style="border: solid; border-color: red; padding: 10px; width: auto; text-align: center;">
							<img style="border: solid; border-color: black;" id="qrImg"
								alt="签到二维码" src="">
						</div>
					</div>
					<!-- 签到操作 -->
					<div style="border: solid; border-color: red;">
						<input type="text" value="${course.courseId}"
							style="display: none;" /> <br /> <a id="qrHref"
							class="layui-btn layui-btn-normal" onclick="showQrImg()" href="#">开始签到</a>
						<a class="layui-btn layui-btn-danger" href="#"
							onclick="submitSignIn()">提交签到表</a><br />
						<br />
					</div>
				</div>
				<div style="float: right;width: 2%;height: 100%;text-align: center;">
					<hr style="width:2px;height:200px;background-color: black; "></hr>
				</div>
				<!-- 签到状况模块 -->
				<div style="width: 49%; border: solid; border-color: yellow;">
					<table class="layui-table" width="99%" border="1" id="showStudents">

					</table>
				</div>
			</div>
			<script>
				// 				var maxtime = 10 //按秒计算(10s)  
				// 				function CountDown(){  
				// 			  		if(maxtime>=0){   
				// 			   			 seconds = maxtime;  
				// 			   			 msg = "签到码还有"+seconds+"秒刷新";  
				// 			   			 document.all["timer"].innerHTML=msg;   
				// 			   			 --maxtime;  
				// 			 		}else{  
				// 			    		clearInterval(timer);    
				// 			  		}  
				// 				}  
				// 				timer = setInterval("CountDown()",1000);
			</script>

			<div
				style="width: 49%; heigh: 600px; border: solid;; border-color: red; overflow: auto;">
				<form id="clazzForm" style="display: none">
					<input type="text" id="courseId" name="courseId"
						value="${course.courseId}" /><br /> <input type="text"
						id="preclazzId" name="preclazzId"><br /> 班级名称：<input
						type="text" id="preclazzName" name="preclazzName"><br />
					<input onclick="saveChange()" type="button" value="提交修改" />
				</form>
				<a href="#">发布公告</a><br /> <a href="#">上传资料</a><br />



			</div>



			<div
				style="width: 49%; heigh: 600px; border: solid;; border-color: red;">
				<h3>课程：${course.courseName}</h3>

				<a href="#">补签</a><br /> <br /> <a href="#" onclick="getRecord()">签到记录</a><br />
				<br /> <input type="text" id="cccourseId"
					value="${course.courseId}" style="display: none;" /> <input
					type="text" id="teacherMobile" value="${teacher.teacherMobile}"
					style="display: none;" /> <a
					href="<%=request.getContextPath()%>/clazz/forAddClazz.do?courseId=${course.courseId}">+添加班级</a><br />
				<table border="1">
					<tr>
						<th>班级</th>
						<th>学年</th>
						<th colspan="3">操作</th>
					</tr>

					<c:choose>
						<c:when test="${! empty course.clazz }">
							<c:forEach items="${course.clazz}" var="c">
								<tr>
									<td>${c.clazzName}</td>
									<td>${c.currentYear}</td>
									<td>
										<form id="asd${c.clazzId}"
											action="<%=request.getContextPath()%>/student/selectStudentByClazzId.do"
											method="post">
											<input name="clazzId" style="display: none;"
												value="${c.clazzId}" /> <a id="${c.clazzId}"
												onclick="aClick(this.id)" href="#">查看</a>
										</form>
									</td>
									<td><a id="zxc${c.clazzId}"
										onclick="changeWhenClick(this.id)" href="#">修改</a></td>
									<td><a id="del${c.clazzId}"
										onclick="deleteClazzByAjax(this.id)" href="#">删除</a></td>
								</tr>
								<br />
							</c:forEach>
						</c:when>
						<c:otherwise>
							<a>(空)</a>
						</c:otherwise>
					</c:choose>
				</table>
				<br /> <br />
			</div>


			<br />



			<table id="scoreTable" border="1" style="display: none;">
				<caption>本学期签到汇总</caption>
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>签到</th>
					<th>迟到</th>
					<th>早退</th>
					<th>旷课</th>
				</tr>
				<c:choose>
					<c:when test="${! empty studentInfo}">
						<c:forEach items="${studentInfo}" var="s">
							<tr>
								<td>${s.student.studentRoNo}</td>
								<td>${s.student.studentName}</td>
								<td>${s.signIn}</td>
								<td>${s.comeLate}</td>
								<td>${s.leaveEarlier}</td>
								<td>${s.absenteeism}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>



		</div>

	</div>

	<script>
		layui.use([ 'element', 'layer' ], function() {
			var element = layui.element, $ = layui.jquery;
			//监听导航点击
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});
		});
	</script>

</body>
</html>