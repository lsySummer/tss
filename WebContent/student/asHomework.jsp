<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
<%@ page language="java" import="edu.nju.model.Showok"%>
<%@ page language="java" import="java.util.*"%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function setValue(prid){
		document.getElementById('prid').value=prid;
	}
</script>
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

		<s:form action="/student/jumpStudent" method="post" name='reqForm' id='reqForm'>
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

			<s:form action="student/jumpDownload" method="post" name='score'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.score.submit();">作业下载</a></li>
					<li class="active"><a>作业评分</a></li>
				</ul>
			</s:form>

		</div>
		<%
			String signal = "0";
		%>
		<div style="width: 70%; margin-left: 5%; float: left">


			<%
				int k = 0;
				String sid = (String) request.getAttribute("userId");
				List<Showok> showokList = (List<Showok>) request.getAttribute("showokList");
			%>
			<s:form action="/student/giveScore" method="post" id="reqForm2" name="reqForm2">
				<input type="hidden" name="prid" id="prid" />
				<s:iterator value="#request.hlist">
					<table class="table  table-bordered">
						<tbody>
							<tr>
								<td>作业编号</td>
								<td><s:property value="hid" /></td>

							</tr>
							<tr class="success">
								<td>截止日期</td>
								<td><s:property value="sddl" /></td>

							</tr>
							<tr>
								<td>作业内容</td>
								<td><s:property value="info" /></td>

							</tr>
							<tr>
								<td>作业相关</td>
								<td><b>总分</b> <span><s:property value="score" /></span> <b>分&nbsp&nbsp&nbsp难度</b>
									<span><s:property value="dif" /></span> &nbsp&nbsp&nbsp <b>作业格式</b>
									<span><s:property value="format" /></span></td>

							</tr>
							<tr>
								<td>
								<input type="hidden" id=<%="assidSubmit"+k%> value=<s:property value="ifpass" />>
								<a href="javascript:document.reqForm2.submit();" onclick="setValue(<s:property value="id" />)">批改作业</a></td>

								<td>
								<script type="text/javascript">
						var ifSubmit = document.getElementById('<%="assidSubmit"+k%>').value;
						if(ifSubmit==0){
							document.write("<p>教师尚未审批</p>");
						}else if(ifSubmit==1){
							document.write("<p><b>教师审批通过</b></p>");
						}else if(ifSubmit==2){
							document.write("<p><b>教师审批未通过</b></p>");
						}
						</script>
								</td>
							</tr>

						</tbody>
					</table>
					<%
						k++;
					%>
				</s:iterator>
			</s:form>
		</div>


	</div>


	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>