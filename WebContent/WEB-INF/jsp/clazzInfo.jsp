<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>班级信息</title>
<script type="text/javascript">
function aClick(clazzId) {
	  document.getElementById("asd"+clazzId).submit()
}
//修改班级信息
function changeWhenClick(clazzId) {
	 var clazzIdpre = clazzId.substring(3, );
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
	var clazzId = clazzid.substring(3,);
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
        	 var t2 = window.setTimeout("hello()",7000);//7s后刷新随机数
         },
         error: function (data) {
             alert("服务器异常！");
         },
     });
	 window.setTimeout("closeValidateCode()",13000);
	} 
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
        	 alert(url);
        	 var imgPre = document.getElementById("qrImg");
        	 imgPre.style.display = "block";
             imgPre.src = url;
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
             alert("!!!!!!");
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
         success: function (data) {
        	 alert(data.message);
        	 window.location.reload();
         },
         error: function (data) {
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
	<div
		style="width: 49%; heigh: 600px; border: solid;; border-color: red; float: left;">
		<h3>课程：${course.courseName}</h3>
		<input type="text" value="${course.courseId}" style="display: none;" />
		<br/> 
		<a id="qrHref" onclick="showQrImg()" href="#">点名签到</a><br/> <br/> 
		
		<a href="#" onclick="submitSignIn()">提交签到表</a><br/><br/> 
		
		<a href="#">补签</a><br /> <br/> 
		
		<a href="#" onclick="getRecord()">签到记录</a><br/><br/>
			<input type="text" id="cccourseId"
			value="${course.courseId}" style="display: none;" /> <input
			type="text" id="teacherMobile" value="${teacher.teacherMobile}"
			style="display: none;" />

<a href="<%=request.getContextPath()%>/clazz/forAddClazz.do?courseId=${course.courseId}">+添加班级</a><br />
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
		<br />
		<br />
	</div>

	<div
		style="width: 49%; heigh: 600px; border: solid;; border-color: red; float: left; overflow: auto;">
		<form id="clazzForm" style="display: none">
			<input type="text" id="courseId" name="courseId"
				value="${course.courseId}" /><br /> <input type="text"
				id="preclazzId" name="preclazzId"><br /> 班级名称：<input
				type="text" id="preclazzName" name="preclazzName"><br /> <input
				onclick="saveChange()" type="button" value="提交修改" />
		</form>
		<a href="#">发布公告</a><br /> <a href="#">上传资料</a><br />
		<div id="validateCode" style="width: 100%; height: 30px; font-size: 25px;
		 text-align: center; border: solid;border-bottom-color: red;"></div>

		<div
			style="width: 100%; height: 20%; border: solid; border-color: blue; text-align: center;">
			<img id="qrImg" alt="签到二维码" src="">
		</div>
		<br />

		<table width="100%" border="1" id = "showStudents">
			
			
		</table>
		
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
</body>
</html>