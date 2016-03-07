<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<script src="../jquery/jquery-1.8.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron" style="height: 130px">
			<h1 style="margin-top: -30px">Teaching Support System</h1>
		</div>
		<div class="navbar navbar-inverse">
			<div class="navbar-header">
				<!-- 自适应隐藏导航展开按钮 -->
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- 导航条LOGO -->
				<a class="navbar-brand" href="#">welcome，管理员</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<s:form action="/manager/user" method="post" name='userForm'>
					<s:form action="/manager/teaching" method="post" name='reqForm'>
						<ul class="nav navbar-nav">
							<li><a
								href='javascript:document.userForm.submit();'>用户管理</a></li>
							<li><a href='javascript:document.reqForm.submit();'>教学管理</a></li>
						</ul>
					</s:form>
				</s:form>

			</div>
		</div>
		<h2>添加失败！学号重复！</h2>
	</div>
</body>
</html>