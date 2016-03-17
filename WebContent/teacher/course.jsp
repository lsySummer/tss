<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
<%@ page language="java" import="edu.nju.model.Teacher"%>
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
  function ajaxSend(cname){
	  location.href="courseDownload.action?cname="+cname;
  }
</script>

<script type="text/javascript">
	$(function() {
		$("#tj")
				.click(
						function() {

							//提交的参数，name和inch是和struts action中对应的接收变量
							var params = {
								asid : $("#asid").val(),
							};
							$
									.ajax({
										type : "POST",
										url : "searchAssis",
										data : params,
										dataType : "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
										success : function(json) {
											var obj = $.parseJSON(json); //使用这个方法解析json
											var state_value = obj.username; //result是和action中定义的result变量的get方法对应的
											document.getElementById('sid').innerText = document
													.getElementById('asid').value;
											document.getElementById('username').innerText = state_value;
											document.getElementById('seleceAs').value = '选择其为助教';
											document.getElementById('uname').value = state_value;
										},
										error : function(json) {
											document.getElementById('sid').innerText = document
													.getElementById('asid').value;
											;
											document.getElementById('username').innerText = '该用户不存在';
											document.getElementById('seleceAs').value = '确定';
											return false;
										}
									});
						});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#seleceAs")
				.click(
						function() {
							//提交的参数，name和inch是和struts action中对应的接收变量
							var params = {
								sid : $("#asid").val(),
								sname : $("#uname").val(),
								cid : $("#courseId").val()
							};
							$
									.ajax({
										type : "POST",
										url : "addAssis",
										data : params,
										dataType : "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
										success : function(json) {
											document
													.getElementById('assistant').innerText = document
													.getElementById('username').innerText;
											document.getElementById('asid').value = '';
										},
										error : function(json) {
											alert('添加失败！助教不能为选课学生！');
											return false;
										}
									});
						});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#save").click(function() {

			//提交的参数，name和inch是和struts action中对应的接收变量
			var params = {
				courseInfo : $("#courseInfo").val(),
				refer : $("#refer").val(),
				cid : $("#courseId").val()
			};
			$.ajax({
				type : "POST",
				url : "save",
				data : params,
				dataType : "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
				success : function(json) {
					alert('已保存！');
				},
				error : function(json) {
					return false;
				}
			});
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#tj2")
				.click(
						function() {

							//提交的参数，name和inch是和struts action中对应的接收变量
							var params = {
								selectName : $("#selectName").val(),
								cid : $("#courseId").val()
							};
							$
									.ajax({
										type : "POST",
										url : "addSelect",
										data : params,
										dataType : "text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
										success : function(json) {
											var addName = document
													.getElementById('selectName').value;
											var addDiv = '<div style="width:100px;float:left">'
													+ addName + '</div>&nbsp';
											$("#numDiv").append(addDiv);
											document
													.getElementById('selectName').value = '';
										},
										error : function(json) {
											alert('学号不存在！');
											return false;
										}
									});
						});
	});
</script>
</head>
<body>
	<div class="container">
		<%
			Course c = (Course) request.getAttribute("course");
		%>
		<%
			String username = (String) request.getAttribute("username");
			Teacher s = (Teacher) session.getAttribute("tuser");
		%>
		<div class="jumbotron" style="height: 130px">
			<h1 style="margin-top: -30px">Teaching Support System</h1>
		</div>

		<s:form action="/teacher/jumpTeacher" method="post" name='reqForm'>
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
			<s:form action="/teacher/jumpHomework" method="post"
				name='toHomework'>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a>课程管理</a></li>
					<li><a href="javascript:document.toHomework.submit();">作业管理</a></li>
				</ul>
			</s:form>
		</div>

		<div class="bigInfo">
			<b>Course Infomation</b>
		</div>

		<div
			style="width: 75%; border: 1px solid #999999; padding: 1% 1%; margin-top: -20px; margin-left: 5%; float: left">
			<br /> <input type="hidden" id="courseId" value='<%=c.getId()%>' />
			<input type="hidden" id="endD" value='<%=c.getEndDate()%>' /> <input
				type="hidden" id="uname" /> <span class="infoTxt"><b>编号：</b></span>
			<span class="infoTxt"><%=c.getCid()%></span><br />
			<br /> <span class="infoTxt"><b>课程名：</b></span> <span class="infoTxt"><%=c.getCname()%></span><br />
			<br /> <span class="infoTxt"><b>课程教师：</b></span> <span
				class="infoTxt"><%=c.getTname()%></span><br />
			<br /> <span class="infoTxt" style="float: left; display: block"><b>课程助教：</b></span>
			<span class="infoTxt" style="float: left; display: block"
				id='assistant'><%=c.getAname()%></span>
			<div
				style="float: left; height: 40px; margin-top: -10px; margin-left: 2%">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search By Id"
							id='asid'>
					</div>
					<input type="button" class="btn btn-default"
						data-target="#myModal3" data-toggle="modal" id="tj" value="查找" />
				</form>
			</div>
			<%
				String info;
				if (c.getInfo() == null) {
					info = "暂无";
				} else {
					info = c.getInfo();
				}
			%>
			<div style="width: 800px; float: left; margin-top: 2%">
				<span class="infoTxt"
					style="vertical-align: top; height: 60px; display: block; float: left"><b>课程简介：</b></span>
				<textarea name="word" style="width: 550px; height: 70px"
					id="courseInfo"><%=info%></textarea>
			</div>

			<div style="width: 800px; float: left; margin-top: 2%">
				<span class="infoTxt"
					style="vertical-align: top; display: block; float: left"><b>参考书目：</b></span>
				<textarea style="width: 550px; height: 40px" id="refer"><%=c.getBook()%></textarea>
			</div>

			<div style="width: 800px; float: left; margin-top: 2%">
				<span class="infoTxt" style="float: left"><b>选课学生：</b></span>
				<div class="panel panel-default" style="float: left; width: 500px">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne"> 点击查看选课同学，再次点击进行折叠 </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse">
						<div class="panel-body">
							<div id="numDiv">
								<s:iterator value="#request.sidList">
									<div style="width: 100px; float: left">
										<s:property value="sid" />
									</div>&nbsp
					</s:iterator>
							</div>
							<div style="float: left; height: 40px; margin-top: 3%;">
								<form class="navbar-form navbar-left" role="search">
									<div class="form-group">
										<input type="text" class="form-control" id="selectName"
											placeholder="请输入学号">
									</div>
									<input type="button" class="btn btn-default" id="tj2"
										value="加入课程" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div style="width: 800px; float: left; margin-top: 1%">
				<span class="infoTxt"><b>学期总结：</b></span> <span class="infoTxt">
				<a id='clickDown' onclick="ajaxSend('<%=c.getCname()%>')">点击下载</a>
					<script type="text/javascript">
						var endDate = document.getElementById('endD').value;
						var myDate = new Date();
						var todaytimes = myDate.getTime();

						var arrs = endDate.split(" ");
						var endtime = new Date(arrs[0], arrs[1] - 1, arrs[2]);
						var endtimes = endtime.getTime();
						if(endtimes<todaytimes){
						}else{
							document.write("学期总结尚未生成");
							document.getElementById('clickDown').innerHTML ="";
						}
					</script>
				</span><br />
			</div>

			<div
				style="width: 800px; float: left; margin-top: 1%; text-align: center">
				<button class="btn btn-info" id="save">保存修改</button>
			</div>
		</div>



	</div>

	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<input type="hidden" value="" name="acId" id="acId">
		<div class="modal-dialog" style="width: 500px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<span class="infoTxt">学号：</span> <span class="infoTxt" id='sid'></span><br />
					<br /> <span class="infoTxt">姓名：</span> <span class="infoTxt"
						id='username'></span><br />
					<br />


				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default btn-block"
						data-dismiss="modal" id='seleceAs' value='选择其为助教' />
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>