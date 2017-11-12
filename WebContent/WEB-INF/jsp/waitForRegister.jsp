<%-- 
    Document   : waitForRegister
    Created on : 2017-6-8, 17:33:13
    Author     : Juin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3;URL=<%=request.getContextPath() %>/student/exchangeStudent.do?studentRoNo=${student.studentRoNo}">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/icon/cms2.ico" media="screen" />
	
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/layui/css/layui.css">
<script src="<%=request.getContextPath()%>/layui/layui.js "></script>

<title>等待跳转..</title>
</head>

<body onload="shownum()" style="background-color: #393D49">
<div style="background-color: rgba(0, 0, 0, 0.1); margin: 10% 33% auto;height: 150px ;padding: 150px 10px 100px;">
		<h1 style="color: #5FB878; font-size: 20px">
			数据加载中，<span id="time">3</span>s后自动跳转..
		</h1>
		<div class="layui-progress layui-progress-big"  lay-filter="demo1" lay-showPercent="true">
			<div class="layui-progress-bar" lay-percent="0%"></div>
		</div>
	</div>

	<script>
		layui.use('element', function() {
			var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
			
			var n =0,timer = setInterval(function() {
				n=n+17;
				if(n>100){
					n=100;
					clearInterval(timer);
				}
				element.progress('demo1',n+'%');
			},460)
					
		});
	</script>
</body>
</html>
