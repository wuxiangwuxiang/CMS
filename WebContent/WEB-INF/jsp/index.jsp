<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/mycss.css">

<script type="text/javascript">
$(document).ready(function() {
	$('#lll').click(function() {
		$('#loginForm').toggle();
	});
	$('#sss').click(function() {
		$('#sss').css("background-color", "rgba(0,0,0,1)");
		$('#ttt').css("background-color", "rgba(0,0,0,0)");
		$('#studentForm').show();
		$('#teacherForm').hide();
	});
	$('#ttt').click(function() {
		$('#sss').css("background-color", "rgba(0,0,0,0)");
		$('#ttt').css("background-color", "rgba(0,0,0,1)");
		$('#studentForm').hide();
		$('#teacherForm').show();
	});
});
</script>
</head>

<body
	style="background-image: url('<%=request.getContextPath()%>/lib/timg (1).jpg'); background-repeat: no-repeat; background-size: cover;">


	<div style="width: 100%; height: 1000px">
		<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">CMS</a>
			</div>

			<div id="navbar" class="navbar-collapse collapse">

				<form class="navbar-form navbar-right">
					<a href="#" id="lll" type="submit" style="width: 100px;" class="btn btn-primary">${student.studentName}</a>
				</form>
			</div>
		</div>
		</nav>


		<div
			style="background-color: rgba(0, 0, 0, 0.6); height: 100%; background-size: cover;">
			<div class="container"></div>
		</div>
         
         
         
         <div style="background-color: #222; height: 100px">
            <div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">copyright by CMS team</a>
         </div>



	</div>

</body>
</html>