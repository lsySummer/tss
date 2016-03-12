<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
     <%@ page language="java" import="edu.nju.model.Course"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<script src="../jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function setForm(info){
		if(info==1){
		document.reqForm.action="jumpTeacher";
		}else{
			document.reqForm.action="jumpToCourse";
		}
	return true;
}
</script>
</head>
<body>
<div class="container">
	<div class="jumbotron" style="height:130px">
		<h1 style="margin-top:-30px">Teaching Support System</h1>
    </div>
     <%Course c = (Course)request.getAttribute("course");
    	String hid = (String)request.getAttribute("shid");
    %>
<s:form  method="post" name='reqForm'>
  <ul class="breadcrumb">
		<li>
			<a href="javascript:document.reqForm.submit();" onclick="setForm(1)">我的课程</a> <span class="divider">/</span>
		</li>
		<li>
			<a href="javascript:document.reqForm.submit();" onclick="setForm(2)"><%=c.getCname() %>></a><span class="divider">/</span>
		</li>
		<li class="active">
			审核助教审批
		</li>
		<li class="dropdown" style="float:right">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户信息 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="../common/user.html">haoran Wang
				<img src="../img/portrait.jpg" style="width:30px;height:30px;margin-top:-5%"></img>
				</a></li>
                <li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a>  </li>
      
              </ul>
            </li>	
	</ul>
	</s:form>
	
	
	<div class="smallInfo"><b>Course Navigation</b></div>
	<div style="width:20%;border:1px solid #999999;;float:left">
	<s:form action="teacher/jumpToCourse" method="post" name='toCourse'>
	<ul class="nav nav-pills nav-stacked">
	   <li><a href="javascript:document.toCourse.submit();">课程管理</a></li>
	</ul>
	</s:form>
	<s:form action="/teacher/jumpHomework" method="post" name='toHomework'>
	<ul class="nav nav-pills nav-stacked">
	   <li class="active"><a href="javascript:document.toHomework.submit();">作业管理</a></li>
	 </ul>
	</s:form>
	</div>

	
<div style="width:70%;margin-left:5%;float:left">
	
	
	<div style="margin-top:2%;float:left;width:800px">
		
		<table class="table  table-bordered">
			<thead>
					<tr>
						<th>
							学号
						</th>
						<th>
							成绩
						</th>
						<th>
							点评
						</th>
				
					</tr>
				</thead>
				<tbody>
				  <s:iterator value="#request.selectList" >
					<tr>
						<td>
							<s:property value="sid" />
						</td>
						<td>
							90
						</td>
						<td>
							在vipabc学习一年会有什么改变？看Barbie 用流利口语“秒杀”成人，立即免费体验
						</td>
					</tr>
					</s:iterator>
					
					
			
				</tbody>
			</table>
		
		<div style="float:left;width:800px;text-align:center">
			
			 <button class="btn" data-target="#myModal3" type="button" data-toggle="modal">审批不通过</button>
			  <button class="btn btn-primary" type="button" style="margin-left:5%" data-target="#myModal2" type="button" data-toggle="modal">审批通过</button>
		</div>
	</div>
</div>
	
</div>

<form class="form-horizontal" id="formAction" action="" method="post">
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
	
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%;vertical-align:top;display:block;">理由：</span>
				<textarea name="word" style="width:450px;height:70px"></textarea>
			
				
				<input type="hidden" id="dtp_input2" value="" /><br/>
			
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary" >
						发送给助教</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
</form>

<form class="form-horizontal" id="formAction" action="" method="post">
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
	
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%;vertical-align:top;display:block;">总体点评：</span>
				<textarea name="word" style="width:450px;height:70px"></textarea>
			
				
				<input type="hidden" id="dtp_input2" value="" /><br/>
			
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary" >
						发布成绩</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
</form>
	
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.js"></script>
	
</body>
</html>