<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
 <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script src="../jquery/jquery-1.8.3.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	<div class="jumbotron" style="height:130px">
		<h1 style="margin-top:-30px">Teaching Support System</h1>
    </div>
<div class="navbar navbar-inverse">
    <div class="navbar-header">
      <!-- 自适应隐藏导航展开按钮 -->
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- 导航条LOGO -->
      <a class="navbar-brand" href="#">welcome，管理员</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <s:form action="/manager/user" method="post" name='reqForm'>
        <ul class="nav navbar-nav">
            <li><a href='javascript:document.reqForm.submit();'>用户管理</a></li>
            <li class="active"><a href="">教学管理</a></li>
        </ul>
        </s:form>
 
    </div>
</div>
</div>
<div style="margin:1% 10%;height:550px;">
	<div class="common">
		<form>
			<select class="form-control" style="margin-top:1%;width:150px;float:left"> 
				<option>2015-2016</option> 
				<option>2014-2015</option> 
				<option>2013-2014</option> 
				<option>2012-2013</option> 
			</select>
		</form>
	</div>
		<a id="modal3" data-target="#myModal3" role="button" class="btn btn-default" data-toggle="modal" style="margin:1% 3%">新增一门课程</a>
	</br>
	
	
	<div class="courseblock">
	<div class="courseInfo">Course Infomation</div>
		<div style="width:150px;float:left;">
			<img src="../img/0.jpg" style="width:100px;height:100px;margin:15%"/>
		</div>
		<div style="width:300px;float:left;margin-left:2%;padding-top:3%">
		
		<span class="infoTxt">编号：</span>
			<span class="infoTxt" >C1012</span><br/><br/>
			<span class="infoTxt">学期：</span>
			<span class="infoTxt" >2016 Spring</span><br/><br/>
			<span class="infoTxt">课程：</span>
			<span class="infoTxt" contenteditable="true"  style="text-decoration:underline">J2EE与中间件</span><br/><br/>
			
			<span class="infoTxt" style="float:left;margin-top:1%">教师：</span>
			<div style="float:left;width:120px;">
				<form>
				<select class="form-control"> 
					<option>王浩然</option> 
					<option>刘封</option> 
					<option>司马懿</option> 
					<option>刘嘉</option> 
					</select>
				</form>
			</div>
			<br/><br/>
			<div style="margin-left:15%;margin-top:1%">
			<button class="btn" type="button" onclick="" data-toggle='modal' data-target='#myModal'>删除</button>
			<button class="btn btn-primary" type="button" onclick="" style="margin-left:3%">保存</button>
			</div>
		</div>	
	</div>
	
		
</div>
<s:form class="form-horizontal"  action="" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
	  <input type="hidden" value="" name="acId" id="acId">
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
					<button type="submit" class="btn btn-primary" >
						确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
	</s:form>
	
<form class="form-horizontal" id="formAction" action="" method="post">
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true" >
		<input type="hidden" value="" name="acId" id="acId">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
			
				
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">编号：</span>
				<input type="text" id="cid" name="cid"
				style=" border: 0;border-bottom: thin solid;outline:none;width:125px"></input>
				
				<span class="infoTxt" style="margin-left:6%">课程名：</span>
				<input type="text" id="cname" name="cname"
				style=" border: 0;border-bottom: thin solid;outline:none;width:125px"></input><br/><br/><br/>
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">学期：</span>
				<div style="float:left;width:130px;">
					<select class="form-control" id="term" name="term"> 
						<option>2015-2016</option> 
						<option>2014-2015</option> 
						<option>2013-2014</option> 
					</select>
				</div>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">开课日期：</span>
				 <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"
				style="width:200px;">
                    <input class="form-control" size="16" type="text" name="begindate" id="begindate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/><br/>
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">教师：</span>
				<div style="float:left;width:130px;">
					<select class="form-control" id="teacher" name="teacher"> 
						<option>xiaowang</option> 
						<option>xiali</option> 
						<option>cylong</option> 
						<option>lsy</option> 
					</select>
				</div>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">结课日期：</span>
				 <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"
				style="width:200px;">
                    <input class="form-control" size="16" type="text" name="endDate" id="endDate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
				
				<br/><br/>
				
				
				
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary" >
						确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
</form>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.js"></script>

	<script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript">

	$('.form_date').datetimepicker({
        language:  'en',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });	
	</script>
	
</body>
</html>