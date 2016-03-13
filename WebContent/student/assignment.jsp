<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

			<s:form action="student/jumpToInfo" method="post" name='toHomework'>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="javascript:document.toHomework.submit();">课程介绍</a></li>
			</ul>
			</s:form>
				<ul class="nav nav-pills nav-stacked">
					<li  class="active"><a>作业提交</a></li>
				</ul>
			<s:form action="student/jumpToComment" method="post" name='toComment'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.toComment.submit();">教师点评</a></li>
				</ul>
			</s:form>

		</div>

		<div style="width: 70%; margin: 0% 5%; float: left">
			<div
				style="width: 100px; margin-bottom: 2%; margin-top: -20px; float: left;">
				<form>
					<select class="form-control" style="margin-top: 8%">
						<option>未截止</option>
						<option>全部</option>
					</select>
				</form>
			</div>
			<div class="alert alert-warning alert-dismissable"
				style="margin-top: 5%">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				注意！您有一个作业将在3天内截止！
			</div>
			<table class="table  table-bordered">
				<tbody>
					<tr>
						<td>作业编号</td>
						<td>1</td>

					</tr>
					<tr class="success">
						<td>截止日期</td>
						<td>2016/02/29 23:59:59</td>

					</tr>
					<tr>
						<td>作业内容</td>
						<td>1、简述Linux系统的应用领域。 2、简述Linux系统的特点。</td>

					</tr>
					<tr>
						<td>作业相关</td>
						<td>总分 <span>10</span> 分&nbsp&nbsp&nbsp难度 <span>5.0</span>
							&nbsp&nbsp&nbsp 作业格式 <span>zip</span>
						</td>

					</tr>
					<tr class="warning">
						<td>作业评分</td>
						<td>未提交</td>

					</tr>

					<tr>
						<td>作业评价</td>
						<td>未评分</td>

					</tr>
					<tr>
						<td><a href="submit.html">提交作业</a></td>
						<td></td>

					</tr>
				</tbody>
			</table>
		</div>


	</div>


	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>