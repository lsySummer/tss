<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
<%@ page language="java" import="edu.nju.model.Student"%>
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

<script type="text/javascript">
　　$(function(){
  　　$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
  　　$('.tree li.parent_li > span').on('click', function (e) {
    　　 var children = $(this).parent('li.parent_li').find(' > ul > li');
    　　if (children.is(":visible")) {
      　　children.hide('fast');
      　　$(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
    　　} else {
      　　children.show('fast');
      　　$(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
    　　}
    　　e.stopPropagation();
  　　});
　　});
  </script>
  
  <script type="text/javascript">
  
  function ajaxSend(egpath){
	  location.href="hwDownload.action?egpath="+egpath;
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

		<s:form action="student/jumpScore" method="post" name='score'>
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a>作业下载</a></li>
				<li><a href="javascript:document.score.submit();">作业评分</a></li>
			</ul>
		</s:form>
		</div>

		<div style="width: 70%; margin: 0% 5%; float: left">

			<div class="tree well">
				<ul>
					<li>
					<span><i class="glyphicon glyphicon-folder-open"></i>
							作业</span>
						<ul>
						<s:iterator value="#request.fileName">
							<li><span><i class="glyphicon glyphicon-leaf"></i>
									<a onclick="ajaxSend('<s:property/>')"><s:property/></a></span></li>
						</s:iterator>
						</ul>
					</li>
				</ul>
			</div>
		</div>

	</div>


	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>