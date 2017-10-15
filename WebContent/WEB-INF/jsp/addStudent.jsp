<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/icon/天网.ico" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<title>学生注册</title>
<script type="text/javascript">
function getPath(obj) {
    if (obj) {
        if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
            obj.select(); return document.selection.createRange().text;
        }
        else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
            if (obj.files) {
                return obj.files.item(0).getAsDataURL();
            }
            return obj.value;
        }
        return obj.value;
    }
} 
/** 
 * 将本地图片 显示到浏览器上 
 */
 function getFileUrl(sourceId) {
     var url;
     url = window.URL.createObjectURL(document.getElementById(sourceId).files.item(0));
     return url;
 }
 function preImg(sourceId, targetId,tct) {
     var fileName = document.getElementById(sourceId).value;
     var fileNamePlus = fileName.substr(12);
     var url = getFileUrl(sourceId);
     var imgPre = document.getElementById(targetId);
     imgPre.style.display = "block";
     imgPre.src = url;
     document.getElementById(tct).value = fileNamePlus;
 }
 
</script>
</head>
<body>
<form id= "uploadForm" 
	action="<%=request.getContextPath()%>/student/insertStudent.do" enctype="multipart/form-data" method="post">
		学号：<input type="text" name="studentRoNo"><br/> 
		密码：<input type="password" name="studentPassword"/><br/>
		手机：<input type="text" name="studentMobile"><br/> 
		邮箱：<input type="text" name="studentEmail"><br/> 
		名字：<input type="text" name="studentName"><br /> 
		性别：<input type="text" name="studentGender"><br/>
		照片：<input type="file" name="file" id="uploadFile" style="" onchange="preImg(this.id, 'imgPre','tct');"><br/> 
			<input id="tct" type="text" name="studentPhoto" value="" style="display: none"/>
			<input type="submit" value="提交"/><br/>
			<img alt="请上传一寸照片"  style="width:100px; height: 140px " id="imgPre" src="">
	</form>
</body>
</html>