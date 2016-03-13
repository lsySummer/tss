<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mycss.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/jquery/jquery-1.8.3.min.js"></script>
<title>myHomework</title>
</head>
<body>
	<div class="container">
		<%
			Course c = (Course) request.getAttribute("course");
		%>
		<div class="jumbotron" style="height: 130px">
			<h1 style="margin-top: -30px">Teaching Support System</h1>
		</div>
		<%
			String username = (String) request.getAttribute("username");
		%>
		<s:form action="/student/jumpStudent" method="post" name='reqForm'>
			<ul class="breadcrumb">
				<li><a href="javascript:document.reqForm.submit();">我的课程</a> <span
					class="divider">/</span></li>
				<li class="active"><%=c.getCname()%></li>
				<li class="dropdown" style="float: right"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">用户信息 <span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="../common/user.html"><%=username%> <img
								src="<%=request.getContextPath()%>/img/portrait.jpg"
								style="width: 30px; height: 30px; margin-top: -5%"></img> </a></li>
						<li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a>
						</li>

					</ul></li>
			</ul>
		</s:form>


		<div class="smallInfo">
			<b>Course Navigation</b>
		</div>
		<div style="width: 20%; border: 1px solid #999999;; float: left">

			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a>课程介绍</a></li>
			</ul>
			<s:form action="student/jumpToHomework" method="post" name='toHomework'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.toHomework.submit();">作业提交</a></li>
				</ul>
			</s:form>
			<s:form action="student/jumpToComment" method="post" name='toComment'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.toComment.submit();">教师点评</a></li>
				</ul>
			</s:form>

		</div>

		<div class="bigInfo">
			<b>Course Infomation</b>
		</div>
		<div
			style="width: 75%; border: 1px solid #999999; padding: 1% 1%; margin-top: -20px; margin-left: 5%; float: left">
			<br /> <span class="infoTxt"><b>编号：</b></span> <span class="infoTxt"><%=c.getCid()%></span><br />
			<br /> <span class="infoTxt"><b>课程名：</b></span> <span
				class="infoTxt"><%=c.getCname()%></span><br /> <br /> <span
				class="infoTxt"><b>教师：</b></span> <span class="infoTxt"><%=c.getTname()%></span><br />
			<br /> <span class="infoTxt"><b>助教：</b></span> <span class="infoTxt"><%=c.getAname()%></span><br />
			<br /> <span class="infoTxt"><b>简介：</b></span> <span class="infoTxt"><%=c.getInfo()%></span>
			<br /> <br /> <span class="infoTxt"><b>参考书目：</b></span> <span
				class="infoTxt"><%=c.getBook()%></span><br /> <br />
		</div>



	</div>


	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>