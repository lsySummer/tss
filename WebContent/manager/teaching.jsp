<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="<%=request.getContextPath()%>/css/mycss.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<script src="<%=request.getContextPath()%>/jquery/jquery-1.8.3.min.js"></script>

<head>
<script type="text/javascript">
	var msg = "${requestScope.tipMessage}";
	if (msg != "") {
		alert(msg);
	}

	var cmsg = "${requestScope.courseMessage}";
	if (cmsg != "") {
		alert(cmsg);
	}
	
	var dmsg = "${requestScope.deleteMessage}";
	if (dmsg != "") {
		alert(dmsg);
	}
	
	var mmsg = "${requestScope.modifyMessage}";
	if (mmsg != "") {
		alert(mmsg);
	}

	function checkTerm() {
		var num = document.getElementById("addt").value;
		if (num == '') {
			window.alert('存在输入为空！');
			return false;
		}
		return true;
	}

	function checkCourse() {
		var cid = document.getElementById("cid").value;
		var cname = document.getElementById("cname").value;
		var begin = document.getElementById("beginDate").value;
		var end = document.getElementById("endDate").value;
		if (cid == '' || cname == '' || begin == '' || end == '') {
			window.alert('存在输入为空！');
			return false;
		}
		return true;
	}
	
	 function setValue(num){
			var hid = document.getElementById('courseId');
			hid.value=num;
	 }
	 
	 function setmValue(num){
			var hid = document.getElementById('mcourseId');
			hid.value=num;
	 }
	 
	 function modify(id,cid,cterm,cname,tname,startDate,endDate){
		 document.getElementById('mid').value=id;
		 document.getElementById('mcid').innerHTML=cid;
		 document.getElementById('mterm').innerHTML=cterm;
		 document.getElementById('mcname').value=cname;
		 document.getElementById("mteacher").value=tname;
		 document.getElementById("mbeginDate").value=startDate;
		 document.getElementById("mendDate").value=endDate;
	 }
	 
</script>
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
				<s:form action="/manager/user" method="post" name='reqForm'>
					<ul class="nav navbar-nav">
						<li><a href='javascript:document.reqForm.submit();'>用户管理</a></li>
						<li class="active"><a>教学管理</a></li>
					</ul>
				</s:form>
 <ul class="nav navbar-nav navbar-right">
			<li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a></li>      
	    </ul>
		
			</div>
		</div>
	</div>
	<div style="margin: 1% 10%; height: 550px;">
		<div class="common" style="margin-left: 6%">
			<s:form action="manager/byTerm" method="post">
				<select class="form-control" name="termSelect" onchange="submit();" id="termSelect"
					style="margin-top: 1%; width: 150px; float: left">
					<option value=0>全部</option>
					<s:iterator value="#request.termList">
						<option value='<s:property value="cterm" />'><s:property value="cterm" /></option>
					</s:iterator>
				</select>
			</s:form>
		</div>
		<a id="modal3" data-target="#myModal2" role="button"
			class="btn btn-default" data-toggle="modal" style="margin: 1% 3%">新增学期</a>
		<a id="modal3" data-target="#myModal3" role="button"
			class="btn btn-default" data-toggle="modal" style="margin: 1% 3%">新增一门课程</a>
		</br>

		<s:iterator value="#request.courseList" id='clist'>
			<input type="hidden" id="mcourseId" name="mcourseId"/>
			<div class="courseblock">
				<div class="courseInfo">Course Infomation</div>
				<div style="width: 150px; float: left;">
					<img src="<%=request.getContextPath()%>/img/0.jpg"
						style="width: 100px; height: 100px; margin: 15%" />
				</div>
				<div
					style="width: 700px; float: left; margin-left: 2%; ">
					<div class="courseline">
						<span class="infoTxt"><b>编号：</b></span> 
						<span class="infoTxt"><s:property value="cid" /></span>
					</div>
					<div class="courseline">
						<span class="infoTxt"><b>学期：</b></span>
						<span class="infoTxt" ><s:property value="term" /></span>
					</div>
					<div class="courseline">
						<span class="infoTxt"><b>课程：</b></span> 
						<span class="infoTxt" ><s:property value="cname" /></span>
					</div>
					<div class="courseline">
						<span class="infoTxt"><b>教师：</b></span>
						<span class="infoTxt" ><s:property value="tname" /></span>
					</div>
					<div class="courseline">
						<span class="infoTxt""><b>开课：</b></span>
					<span class="infoTxt" ><s:property value="startDate" /></span>
					</div>
					<div class="courseline">
						<span class="infoTxt"><b>结课：</b></span>
						<span class="infoTxt" ><s:property value="endDate" /></span>
					</div>
					<div class="courseline" style="margin-left:30%;margin-top:2%">
						<button class="btn" type="button"  data-toggle='modal'
							data-target='#myModal' onclick="setValue(<s:property value="id" />)">删除</button>
						<button class="btn btn-primary" type="submit" 
							style="margin-left: 30%" data-toggle='modal'
							data-target='#myModal4' onclick="modify(<s:property value="id" />,'<s:property value="cid" />','<s:property value="term" />','<s:property value="cname" />','<s:property value="tname" />','<s:property value="startDate" />','<s:property value="endDate" />')">修改</button>
					</div>
				</div>
			</div>
	
		</s:iterator>
	</div>



	<s:form class="form-horizontal" id="addTerm" action="/manager/addTerm"
		method="post">
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<input type="hidden" value="" name="acId" id="acId">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">

						<span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%">学期：</span> <input
							type="text" id="addt" name="addt"
							style="border: 0; border-bottom: thin solid; outline: none; width: 125px"></input>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消
						</button>
						<button type="submit" class="btn btn-primary"
							onclick="return checkTerm()">确定</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-fade -->
	</s:form>

	<s:form class="form-horizontal" action="/manager/deleteCourse" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
				<input type="hidden" id="courseId" name="courseId"/>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">确定删除该课程？</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消
						</button>
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-fade -->
	</s:form>
	
	<s:form class="form-horizontal" id="modifyCourse"
		action="/manager/modifyCourse" method="post">
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<input type="hidden" value="" name="mid" id="mid">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">

					<div class="modalline">
						<span class="infoTxt"><b>编号：</b></span> 
						<span class="infoTxt" id="mcid"></span>
					</div>
					<div class="modalline" style="margin-left:10%">
						<span class="infoTxt"><b>学期：</b></span>
						<span class="infoTxt"  id="mterm"><s:property value="term" /></span>
					</div>
					
					<div class="modalline">
						<span class="infoTxt"><b>课程：</b></span> 
							<input
							type="text" id="mcname" name="mcname"
							style="border: 0; border-bottom: thin solid; outline: none; width: 125px"></input>

					</div>

					<div class="modalrline">
							<span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%"><b>开课日期：</b></span>
						<div class="input-group date form_date col-md-5" data-date=""
							data-date-format="yyyy MM dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd" style="width: 200px;">
							<input class="form-control" size="16" type="text"
								name="mbeginDate" id="mbeginDate" readonly> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" />
					</div>
					<div class="modalline">
						<span class="infoTxt"
							style="float: left; margin-top: 1%;"><b>教师：</b></span>
						<div style="float: left; width: 135px;">
							<select class="form-control" id="mteacher" name="mteacher">
								<s:iterator value="#request.teaList">
									<option><s:property value="username" /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="modalrline">
						<span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%"><b>结课日期：</b></span>
						<div class="input-group date form_date col-md-5" data-date=""
							data-date-format="yyyy MM dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd" style="width: 200px;">
							<input class="form-control" size="16" type="text" name="mendDate"
								id="mendDate" readonly> <span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" />
					</div>




					</div>
					<div class="modal-footer">
					<div class="modalline" style="margin-left:20%">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消
						</button>
						<button type="submit" class="btn btn-primary"
							 style="margin-left:30%">确定</button>
					</div>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-fade -->
	</s:form>

	<s:form class="form-horizontal" id="addCourse"
		action="/manager/addCourse" method="post">
		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<input type="hidden" value="" name="acId" id="acId">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">



						<span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%">编号：</span> <input
							type="text" id="cid" name="cid"
							style="border: 0; border-bottom: thin solid; outline: none; width: 125px"></input>

						<span class="infoTxt" style="margin-left: 6%">课程名：</span> <input
							type="text" id="cname" name="cname"
							style="border: 0; border-bottom: thin solid; outline: none; width: 125px"></input><br />
						<br />
						<br /> <span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%">学期：</span>
						<div style="float: left; width: 135px;">
							<select class="form-control" id="term" name="term">
								<s:iterator value="#request.termList">
									<option><s:property value="cterm" /></option>
								</s:iterator>
							</select>
						</div>
						<span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%">开课日期：</span>
						<div class="input-group date form_date col-md-5" data-date=""
							data-date-format="yyyy MM dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd" style="width: 200px;">
							<input class="form-control" size="16" type="text"
								name="beginDate" id="beginDate" readonly> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" /><br />
						<br /> <span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%">教师：</span>
						<div style="float: left; width: 135px;">
							<select class="form-control" id="teacher" name="teacher">
								<s:iterator value="#request.teaList">
									<option><s:property value="username" /></option>
								</s:iterator>
							</select>
						</div>
						<span class="infoTxt"
							style="float: left; margin-top: 1%; margin-left: 3%">结课日期：</span>
						<div class="input-group date form_date col-md-5" data-date=""
							data-date-format="yyyy MM dd" data-link-field="dtp_input2"
							data-link-format="yyyy-mm-dd" style="width: 200px;">
							<input class="form-control" size="16" type="text" name="endDate"
								id="endDate" readonly> <span class="input-group-addon"><span
								class="glyphicon glyphicon-remove"></span></span> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
						<input type="hidden" id="dtp_input2" value="" /><br /> <br />
						<br />




					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消
						</button>
						<button type="submit" class="btn btn-primary"
							onclick="return checkCourse()">确定</button>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-fade -->
	</s:form>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script
		src="<%=request.getContextPath()%>/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$('.form_date').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>
<script type="text/javascript">
var termS = "${requestScope.termSelect}";
	document.getElementById('termSelect').value=termS;
</script>
</body>
</html>