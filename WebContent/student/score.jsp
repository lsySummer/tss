<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
<%@ page language="java" import="edu.nju.model.Showok"%>
<%@ page language="java" import="edu.nju.model.Chowok"%>
<%@ page language="java" import="java.util.*"%>
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
<script type="text/javascript">
var msg = "${requestScope.tipMessage}";
if (msg != "") {
	alert(msg);
}
</script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%
			Course c = (Course) request.getAttribute("course");
		Student s = (Student) session.getAttribute("suser");
		%>
		<div class="jumbotron" style="height: 130px">
			<h1 style="margin-top: -30px">Teaching Support System</h1>
		</div>
		<%
			String username = (String) request.getAttribute("username");
			List<Showok> asList = (List<Showok>) request.getAttribute("asList");
			Chowok ch = (Chowok) request.getAttribute("asChowok");
			int ifPass = ch.getIfpass();
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
			<s:form action="student/jumpDownload" method="post" name='download'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.download.submit();">作业下载</a></li>
				</ul>
			</s:form>
			<s:form action="student/jumpScore" method="post" name='score'>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a  href="javascript:document.score.submit();">作业评分</a></li>
				</ul>
			</s:form>
		</div>

		<s:form action="/student/sendScore" method="post">
			<div style="width: 70%; margin: 0% 5%; float: left">
			<script type="text/javascript">
			if(<%=ifPass%>==0){
				document.write('<span class="label label-info" style="font-size: 14px;">教师尚未审批！</span><br /> <br />');
			}else if(<%=ifPass%>==1){
				document.write('<span class="label label-success" style="font-size: 14px;">教师审批通过！</span><br /> <br />');
			}else if(<%=ifPass%>==2){
				<%String failReason=ch.getFailReason();%>
				document.write('<span class="label label-warning" style="font-size: 14px;">教师审批未通过！原因：<%=failReason%></span><br /> <br />');
			}
				
			</script>
				<table class="table  table-bordered"
					style="width: 50%; margin-left: 25%">
					<thead>
						<tr>
							<th>学号</th>
							<th>成绩</th>
							<th>点评</th>

						</tr>
					</thead>
					<tbody>
						<%
							int k = 0;
						%>
						<s:iterator value="#request.asList">
							<tr>
								<td><s:property value="sid" /></td>
								<td><textarea cols="2" rows="10" id=<%="score" + k%>
										name=<%="score" + k%> style="width: 50px; height: 30px;"
										><s:property value="score"/></textarea></td>
								<td><textarea cols="3" rows="10" id=<%="review" + k%>
										name=<%="review" + k%>
										style="width: 600px; height: 60px"><s:property value="review" /></textarea></td>
							</tr>
							<%
								k++;
							%>
						</s:iterator>
					</tbody>
				</table>

				<div style="float: left; width: 70%; text-align: center">
					<button class="btn btn-primary" type="submit"
						style="margin-left: 5%">发送给老师</button>
				</div>
			</div>
		</s:form>
	</div>


	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</body>
</html>