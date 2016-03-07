<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
		<li>
			<a href="homework.html">J2EE与中间件</a><span class="divider">/</span>
		</li>
		<li class="active">
			审核助教审批
		</li>
		<a href="../common/user.html" style="float:right">lsy13
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
					<tr>
						<td>
							13125001
						</td>
						<td>
							90
						</td>
						<td>
							在vipabc学习一年会有什么改变？看Barbie 用流利口语“秒杀”成人，立即免费体验
						</td>
					</tr>
					<tr>
						<td>
							13125002
						</td>
						<td>
							92
						</td>
						<td>
							加油啊，体系结构！
						</td>
						
					</tr>
					
			
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