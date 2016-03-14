<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mycss.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/jquery/jquery-1.8.3.min.js"></script>


<title>Insert title here</title>
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
				<li class="active">批改作业</li>
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
			<s:form action="student/jumpDownload" method="post" name='download'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.download.submit();">作业下载</a></li>
					<li class="active"><a>作业评分</a></li>
				</ul>
			</s:form>
		</div>


		<div style="width: 70%; margin: 0% 5%; float: left">
			<div
				style="width: 100px; margin-bottom: 2%; margin-top: -20px; float: left;">
				<form>
					<select class="form-control" style="margin-top: 8%">
						<s:iterator value="#request.hlist">
							<option value=<s:property value="hid"/>>作业
								<s:property value="hid" /></option>
						</s:iterator>
					</select>
				</form>
			</div>
			<span class="label label-success"
				style="margin-left: 5%; font-size: 14px;">教师审批通过！</span><br /> <br />
			<div class="alert alert-success  alert-dismissable"
				style="margin-top: 2%">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				您已完成了60%的评分
			</div>

			<div style="margin-top: 2%; float: left; width: 800px">
				<s:form action="/student/giveScore" method="post">
					<table class="table  table-bordered">
						<thead>
							<tr>
								<th>学号</th>
								<th>成绩</th>
								<th>点评</th>

							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.selectSidList">
								<tr>
									<td><s:property value="sid" /></td>
									<td><textarea name="word" cols="2" rows="10"
											style="width: 50px; height: 30px;"></textarea></td>
									<td><textarea name="word" cols="3" rows="10"
											style="width: 600px; height: 60px"></textarea></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</s:form>

				<div style="float: left; width: 800px; text-align: center">
					<button class="btn btn-primary" type="button"
						style="margin-left: 5%">发送给老师</button>
				</div>
			</div>
		</div>

	</div>


	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</body>
</html>