<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Teacher"%>
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
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<script src="<%=request.getContextPath()%>/ajaxFile/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajaxFile/ajaxfileupload.js"></script>

</head>
<body style="">
	<%
					Teacher s = (Teacher) session.getAttribute("tuser");
				%>
	<div class="container">
		<div class="jumbotron" style="height: 130px">
			<h1 style="margin-top: -30px">Teaching Support System</h1>
		</div>
		<s:form action="/student/jumpStudent" method="post" name='reqForm'>
			<ul class="breadcrumb">
				<li><a href="javascript:document.reqForm.submit();">我的课程</a> <span
					class="divider">/</span></li>
			</ul>
		</s:form>

		<div
			style="border-top: 1px solid #aaaaab; width: 30%; height: 0px; float: left;">
			<div
				style="background-color: #aaaaab; height: 300px; width: 10px; float: left;"></div>
			<div style="padding-left: 25%; padding-top: 5%">
				<img
					src='<%=getServletContext().getRealPath("/portrait")+"\\"+s.getHpath()%>'
					style="width: 200px; height: 200px;" id="preview"></img><br />
			</div>
			<br />

		</div>

		<div
			style="border-top: 1px solid #aaaaab;; width: 65%; height: 450px; float: left; margin-left: 5%">
			<div
				style="background-color: #aaaaab; height: 300px; width: 10px; float: left;">
			</div>
			<form style="padding-left: 8%">
				<h3>个人资料</h3>
				<table class="table  table-bordered">
					<tbody>
						<tr>
							<td><input type="hidden" value='<%=s.getId()%>' id="id"
								name="id" /> 学号</td>
							<td><input type="text" readonly
								style="border: 0; outline: none;" value='<%=s.getNum()%>'></input>

							</td>

						</tr>

						<tr>
							<td>姓名</td>
							<td><input type="text" readonly
								style="border: 0;; outline: none;" value='<%=s.getUsername()%>'></input>
							</td>
						</tr>
						<tr>
							<td>性别</td>
							<td><input type="text" id="sex" name="sex" readonly
								style="border: 0; outline: none;" value='<%=s.getSex()%>'></input>
							</td>
						</tr>
						<tr>
							<td>出生年月</td>
							<td><input type="text" id="birth" name="birth" readonly
								style="border: 0; outline: none;" value='<%=s.getBirth()%>'></input>
							</td>
						</tr>
						<tr>
							<td>邮箱地址</td>
							<td><input type="text" id="mail" name="mail" readonly
								style="border: 0; outline: none;" value='<%=s.getMail()%>'></input>
							</td>
						</tr>
						<tr>
							<td>手机号码</td>
							<td><input type="text" id="phone" name="phone" readonly
								style="border: 0; outline: none;" value='<%=s.getPhone()%>'></input>
							</td>
						</tr>

					</tbody>
				</table>
				</form>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>