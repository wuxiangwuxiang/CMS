<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/cms2.ico" media="screen" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>超管登录</title>
<script type="text/javascript">
//点击登录进行账号密码分别验证流程
function wannaLogin() {
	var adminId = $('#adminId').val();
	var adminPassword = $('#adminPassword').val();
	if(confirmCount(adminId,adminPassword)){
			$('#adminForm').submit();
	}else {
		alert("账号或密码错误..");
	}
}
//验证超管账号
function confirmCount(adminId,adminPassword) {
	var result = false;
	$.ajax({
          type: "GET",
          data: {
              "adminId": adminId,
              "adminPassword":adminPassword
          },
          contentType: "application/json; charset=utf-8",
          async: false,
          dataType: "json",
          url: "<%=request.getContextPath() %>/admin/ConfirmAdminCount.do",
          success: function (data) {
        	  if(data.result == true){
        		  result = true;
        	  }
          },
          error: function (data) {
        	  alert("服务器异常..");
          }
      });
	  return result;
}
</script>
</head>
<body>
	<form id="adminForm"
		action="<%=request.getContextPath()%>/admin/adminLogin.do"
		method="post">
		<input type="text" name="repageNow" value="1" style="display: none;"/>
		<h3>管理员登录</h3>
		账号：<input type="password" id="adminId" name="adminId" /><br /> 密码：<input
			type="password" id="adminPassword" name="adminPassword" /><br /> <input
			id="tryLogin" type="button" onclick="wannaLogin()" value="强势登录" />
	</form>
</body>
</html>