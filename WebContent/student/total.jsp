<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
 <%@ page language="java" import="edu.nju.model.Student"%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
  function ajaxSend(egpath){
	  location.href="fileDownload.action?egpath="+egpath;
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
		Student s = (Student) session.getAttribute("suser");
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
					<li><a href="<%=request.getContextPath()%>/common/info.jsp"><%=username%> <img
								src='<%=getServletContext().getRealPath("/portrait")+"\\"+s.getHpath()%>'
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

			<s:form action="student/jumpToInfo" method="post" name='toComment'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.toComment.submit();">课程介绍</a></li>
				</ul>
			</s:form>
			<s:form action="student/jumpToHomework" method="post"
				name='toHomework'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.toHomework.submit();">作业提交</a></li>
				</ul>
			</s:form>
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a>教师点评</a></li>
			</ul>

		</div>

		<div style="width: 70%; margin: 0% 5%; float: left">
			<input type="hidden" id="cidHid" /> <input type="hidden" id="hidHid" />
			<input type="hidden" id="kHid" />
			<%int k=0; %>
			<s:iterator value="#request.hlist">
				<table class="table  table-bordered">
					<tbody>
						<tr>
							<td>作业编号</td>
							<td><s:property value="hid" /></td>

						</tr>
						<tr class="success">
							<td>作业内容</td>
							<td><s:property value="info" /></td>

						</tr>
						<tr>
							<td>作业点评</td>
							<td>
							<script type="text/javascript">
							if('<s:property value="comment" />'==''){
								document.write("教师尚未上传");
							}else{
								document.write('<s:property value="comment" />');
							}
							</script>
							</td>

						</tr>
						<tr>
							<td>作业样例</td>
							<td>
							<a id=<%="toDown"+k %> onclick="ajaxSend('<s:property value="egfilepath" />')">提供下载</a>
							<script type="text/javascript">
							if('<s:property value="egfilepath" />'==''){
								document.write('教师尚未上传');
								var did = 'toDown'+<%=k%>;
								document.getElementById(did).innerHTML ="";
							}
							</script>
								</td>

						</tr>

					</tbody>
				</table>
			</s:iterator>
		</div>


	</div>


	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</body>
</html>