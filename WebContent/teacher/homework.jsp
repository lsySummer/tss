<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
 <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script src="../jquery/jquery-1.8.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="jumbotron" style="height:130px">
		<h1 style="margin-top:-30px">Teaching Support System</h1>
    </div>

  <ul class="breadcrumb">
		<li>
			<a href="myCourse.html">我的课程</a> <span class="divider">/</span>
		</li>
		<li class="active">
			J2EE与中间件
		</li>
		<a href="../common/user.html" style="float:right">haoran Wang
		<img src="../img/portrait.jpg" style="width:30px;height:30px;margin-top:-5%"></img>
		</a>
	</ul>
	
	
	<div class="smallInfo"><b>Course Navigation</b></div>
	<div style="width:200px;border:1px solid #999999;;float:left">
	
		<ul class="nav nav-pills nav-stacked">
	   <li><a href="course.html">课程管理</a></li>
	   <li class="active"><a href="homework.html">作业管理</a></li>
	 
	  
		</ul>
	</div>
	
	<div style="width:700px;margin:0% 5%;float:left">
		<div style="width:100px;float:left;">
			<form>
				<select class="form-control"> 
					<option>未截止</option> 
					<option>全部</option>  
				</select>
			</form>
		</div>
			<div style="width:100px;margin-bottom:2%;margin-left:5%;float:left;">
			<a id="modal3" data-target="#myModal3" role="button" class="btn btn-default" data-toggle="modal" style="margin:1% 3%">新增一门课程</a>
			</div>
		<table class="table  table-bordered">
				<tbody>
					<tr>
						<td>
							作业编号
						</td>
						<td>
							1
						</td>
					
					</tr>
					<tr class="success">
						<td>
							作业提交截止日期
						</td>
						<td>
							2016/02/29 23:59:59
						</td>
						
					</tr>
					<tr class="">
						<td>
							助教批改截止日期
						</td>
						<td>
							2016/02/29 23:59:59
						</td>
						
					</tr>
					<tr>
						<td>
							作业内容
						</td>
						<td>
							1、简述Linux系统的应用领域。
							2、简述Linux系统的特点。
						</td>
					
					</tr>
					<tr>
						<td>
							作业相关
						</td>
						<td>
							总分
							<span>10</span>
							分&nbsp&nbsp&nbsp难度
							<span>5.0</span>
							&nbsp&nbsp&nbsp
							作业格式
							<span>zip</span>
						</td>
					
					</tr>
				
					<tr>
						<td>	
							<a href="submit.html">上传作业样例</a>
						</td>
						<td>
							已上传
						</td>
							
						</tr>
					<tr>
					<td>	
						<a href="score.html">审核助教审批</a>
					</td>
					<td>
						助教批改完成，请审批
					</td>
						
					</tr>
				</tbody>
			</table>
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
			
				
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">编号：</span>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">2</span>
			
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:30%">作业分数：</span>
				<input type="text" id="time" name="time"
				style=" border: 0;border-bottom: thin solid;outline:none;width:125px"></input><br/><br/>
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%;vertical-align:top;display:block;">作业描述：</span>
				<textarea name="word" style="width:450px;height:70px"></textarea>
				<br/><br/>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">作业难度：</span>
				<div style="float:left;width:130px;">
					<form>
					<select class="form-control"> 
						<option>1.0</option> 
						<option>2.0</option> 
						<option>3.0</option> 
						<option>4.0</option> 
						<option>5.0</option> 
					</select>
				</form>
				</div>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">学生提交ddl：</span>
				 <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"
				style="width:200px;">
                    <input class="form-control" size="16" type="text" name="datePicker" id="birthdate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/><br/>
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">作业格式：</span>
				<div style="float:left;width:130px;">
					<form>
					<select class="form-control"> 
						<option>word</option> 
						<option>pdf</option> 
						<option>txt</option> 
						<option>zip</option> 
						<option>不限制</option> 
					</select>
				</form>
				</div>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">助教批改ddl：</span>
				 <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"
				style="width:200px;">
                    <input class="form-control" size="16" type="text" name="datePicker" id="birthdate" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
			
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