<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/cms2.ico" media="screen" />
<title>超级管理员</title>
</head>
<body>
<div style=" width: 70%; height:500px; overflow: auto;">
	<table border="1" style="width: 100%">
		<caption>用户操作日志</caption>
		<tr height="10px">
			<th>账号</th>
			<th>用户</th>
			<th>ip地址</th>
			<th colspan="3">方法</th>
			<th>日期</th>
			<th>响应时间</th>
			<th width="30px" style="width: 40px; overflow: auto;">结果</th>
		</tr>
		<c:choose>
		<c:when test="${! empty logEntities}">
		<c:forEach items="${logEntities}" var="s">
		<tr height="10px">
		<td>${s.userId}</td>
		<td>${s.module}</td>
		<td>${s.ip}</td>
		<td colspan="3">${s.method}</td>
		<td>${s.date}</td>
		<td>${s.reponseTime}</td>
		<td style="width: 40px; overflow: auto;">${s.result}</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		<td colspan="7">(空)</td>
		</tr>
		</c:otherwise>
		</c:choose>
   </table>
    <div style="text-align: center;margin-left: 0">  
            <font size="2">第  ${page.pageNow} 页</font> <font size="2">共 ${page.totalPageCount} 页</font>
            <a href="adminLogin.do?pageNow=1">首页</a>  
            <c:choose>
                <c:when test="${page.pageNow - 1 > 0}">  
                    <a href="adminLogin.do?pageNow=${page.pageNow - 1}">上一页</a>  
                </c:when>  
                <c:when test="${page.pageNow - 1 <= 0}">  
                    <a href="adminLogin.do?pageNow=1">上一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="adminLogin.do?pageNow=${page.pageNow}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 < page.totalPageCount}">  
                    <a href="adminLogin.do?pageNow=${page.pageNow + 1}">下一页</a>  
                </c:when>  
                <c:when test="${page.pageNow + 1 >= page.totalPageCount}">  
                    <a href="adminLogin.do?pageNow=${page.totalPageCount}">下一页</a>  
                </c:when>  
            </c:choose>  
            <c:choose>  
                <c:when test="${page.totalPageCount==0}">  
                    <a href="adminLogin.do?pageNow=${page.pageNow}">尾页</a>  
                </c:when>  
                <c:otherwise>  
                    <a href="adminLogin.do?pageNow=${page.totalPageCount}">尾页</a>  
                </c:otherwise>  
            </c:choose>  
        </div>
   </div>
</body>
</html>
