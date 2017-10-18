<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>教师门户</title>
 <script type="text/javascript">
	 $(document).ready(function () {
		 $('#createCourse').click(function() {
			$('#courseShow').toggle();
		});
	 });
	 function showQrImg(id) {
		     var url = "/ClassManageSys/qrImg/" + id + ".gif";
		     var imgPre = document.getElementById("target");
		     imgPre.style.display = "block";
		     imgPre.src = url;
		}
	</script>
</head>
<body>
<h1>${teacher.teacherName}老师</h1><br/>
<a id="createCourse" href="#">新建课程</a><br/>

<form id="courseShow" style="display: none;" action="<%=request.getContextPath()%>/course/insertCourse.do" method="post">
课程名称：<input type="text" name="courseName"/><br/>
<input type="text" name="teacher.teacherMobile" value="${teacher.teacherMobile}" style="display: none;"/>
课程类型：&nbsp;&nbsp;&nbsp;<input type="radio" name="courseType" value="必修" checked="checked"/>必修
<input type="radio" name="courseType" value="选修"/>选修&nbsp;<br/>
班级容量：<input type="text" name="classCapacity"/><br/>
开始时间：<input type="date" name="startTime"/><br/>
结束时间：<input type="date" name="endTime"/><br/>
当前学年：<input type="text" name="currentYear">年<br/>
当前学期：<select name="schoolTem">
<option selected="selected" value="春季">春季学期</option>
<option value="夏季">夏季学期</option>
<option value="秋季">秋季学期</option>
<option value="冬季">冬季学期</option>
</select>
<input type="submit" value="提交"/>
</form>
  <table border="1" style="width:50%;line-height: 3em; margin-left: 10em; margin-top: 5em; background: #cccccc">
            <tr onmouseover="this.style.backgroundColor = '#ffff66';" onmouseout="this.style.backgroundColor = '#d4e3e5';">
                <th style="width:4em">课程名称</th>
                <th>二维码信息</th>
                <th>学年</th>
                <th>班级</th>
                <th colspan="3">操作</th>
            </tr>
            <c:choose>
            <c:when test="${! empty courses}">
            <c:forEach items="${courses}" var="r">
                <tr onmouseover="this.style.backgroundColor = '#ffff66';" onmouseout="this.style.backgroundColor = '#d4e3e5';">
                    <td><a href="#">${r.courseName}</a></td>
                    <td style="text-align: center;"><a id="${r.qrImg}" onclick="showQrImg(this.id)" href="#">获取</a></td>
                    <td style="text-align: center;">${r.currentYear}</td>
                    <td style="text-align: center;">
                    <c:choose>
                    <c:when test="${! empty r.clazz}">
                    <c:forEach items="${r.clazz}" var="c">
                     <a href="#">${c.clazzName}</a>
                     <br/>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    <a >（空）</a>
                    </c:otherwise>
                    </c:choose>
                    </td>
                    <td><a href="<%=request.getContextPath()%>/course/forsearchClazz.do?courseId=${r.courseId}">查看</a></td>
                    <td><a href="#">修改</a></td>
                    <td><a href="#">删除</a></td>
                </tr>
            </c:forEach>
                </c:when>
            <c:otherwise>
                <tr><td colspan="1">（空）</td></tr>
            </c:otherwise>
                </c:choose>
        </table>
        
        <div>
        <img id="target" style="width: 150px; height: 140px;" alt="课程二维码" src=""/>
        </div>
</body>
</html>