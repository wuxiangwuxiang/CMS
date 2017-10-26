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
         url: "http://localhost:8080/ClassManageSys/clazz/changeClazzByAjax.do",
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
         url: "http://localhost:8080/ClassManageSys/clazz/deleteClazzById.do",
         success: function (data) {
        	 alert(data.message);
        	 window.location.reload();
         },
         error: function (data) {
             alert("删除失败！");
         },
     });
}

</script>
</head>
<body>

	<h3>课程：${course.courseName}</h3>
	<input type="text" value="${course.courseId}" style="display: none;" />
	<a href="<%=request.getContextPath()%>/clazz/forAddClazz.do?courseId=${course.courseId}">+添加班级</a>
	<table  border="1">
		<tr>
			<th>班级</th>
			<th>学年</th>
			<th>人数</th>
			<th colspan="3">操作</th>
		</tr>

		<c:choose>
			<c:when test="${! empty course.clazz }">
				<c:forEach items="${course.clazz}" var="c">
					<tr>
						<td>${c.clazzName}</td>
						<td>${c.currentYear}</td>
						<td></td>
						<td>
						<form id="asd${c.clazzId}" action="<%=request.getContextPath()%>/student/selectStudentByClazzId.do" method="post">
									<input name="clazzId" style="display: none;" value="${c.clazzId}"/>
									<a id="${c.clazzId}" onclick="aClick(this.id)"
							href="#">查看</a>
									</form>
									</td>
						<td><a id="zxc${c.clazzId}" onclick="changeWhenClick(this.id)" href="#">修改</a></td>
						<td><a id="del${c.clazzId}" onclick="deleteClazzByAjax(this.id)" href="#">删除</a></td>
					</tr>
					<br />
				</c:forEach>
			</c:when>
			<c:otherwise>
				<a>(空)</a>
			</c:otherwise>
		</c:choose>
	</table>
	<br/><br/>
<form id="clazzForm" style="display: none">
<input type="text" id="courseId" name="courseId" value="${course.courseId}"/><br/>
<input type="text" id="preclazzId" name="preclazzId"><br/>
班级名称：<input type="text" id="preclazzName" name="preclazzName"><br/>
<input onclick="saveChange()" type="button" value="提交修改"/>
</form>
<a href="#">发布公告</a><br/>
<a href="#">上传资料</a><br/>
</body>
</html>