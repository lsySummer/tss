<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<script src="../jquery/jquery-1.8.3.min.js"></script>
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
	   <li class="active"><a href="course.html">课程管理</a></li>
	   <li><a href="homework.html">作业管理</a></li>
	 
	  
		</ul>
	</div>
	
	<div class="bigInfo"><b>Course Infomation</b></div>
	<div style="width:750px;border:1px solid #999999;padding:1% 1%;margin-top:-20px;margin-left:5%;float:left">
	<br/>
		<span class="infoTxt"><b>编号：</b></span>
		<span class="infoTxt">C1011</span><br/><br/>
		<span class="infoTxt"><b>课程名：</b></span>
		<span class="infoTxt">J2EE与中间件</span><br/><br/>
		<span class="infoTxt"><b>教师：</b></span>
		<span class="infoTxt">王浩然</span><br/><br/>
		<span class="infoTxt" style="float:left;display:block"><b>助教：</b></span>
		<span class="infoTxt" style="float:left;display:block">暂无</span>
		<div style="float:left;height:40px;margin-top:-10px;margin-left:2%">
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
			  <input type="text" class="form-control" placeholder="Search">
			</div>
			<a id="modal3" data-target="#myModal3" role="button" class="btn btn-default" data-toggle="modal">查找</a>
		</form>
		</div>

		<div style="width:800px;float:left;margin-top:2%">
		<span class="infoTxt" style="vertical-align:top;height:60px;display:block;float:left"><b>课程简介：</b></span>
		<textarea name="word" style="width:550px;height:70px"></textarea>
		</div>
		
		<div style="width:800px;float:left;margin-top:2%">
		<span class="infoTxt"  style=""><b>参考书目：</b></span>	
		<input type="text"  style="width:550px;border:0;border-bottom:1px solid #a9a9a9;outline:medium;"/>
		</div>
	
		<div style="width:800px;float:left;margin-top:2%">
		<span class="infoTxt" style="float:left"><b>选课学生：</b></span>
		 <div class="panel panel-default" style="float:left;width:500px">
			<div class="panel-heading">
			  <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				  href="#collapseOne">
				  点击查看选课同学，再次点击进行折叠
				</a>
			  </h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse">
			  <div class="panel-body">
					<span>13125001</span>&nbsp
					<span>13125002</span>&nbsp
					<span>13125003</span>&nbsp
					<div style="float:left;height:40px;margin-top:3%;">
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
							  <input type="text" class="form-control" placeholder="请输入学号">
							</div>
							<a id="modal3" data-target="#myModal2" role="button" class="btn btn-default" data-toggle="modal">查找</a>
						</form>
					</div>
			  </div>
			</div>
		  </div>
		</div>
		
		<div style="width:800px;float:left;margin-top:1%">
			<span class="infoTxt" ><b>学期总结：</b></span>
			<span class="infoTxt">尚未生成</span><br/>
		</div>
	</div>
	
	
	
</div>

	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<input type="hidden" value="" name="acId" id="acId">
		<div class="modal-dialog" style="width:500px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<span class="infoTxt">学号：</span>
					<span class="infoTxt">131250129</span><br/><br/>
					<span class="infoTxt">姓名：</span>
					<span class="infoTxt">131250129</span><br/><br/>
					
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-block" data-dismiss="modal">选择其为助教</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<input type="hidden" value="" name="acId" id="acId">
		<div class="modal-dialog" style="width:500px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<span class="infoTxt">学号：</span>
					<span class="infoTxt">131250129</span><br/><br/>
					<span class="infoTxt">姓名：</span>
					<span class="infoTxt">131250129</span><br/><br/>
					
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-block" data-dismiss="modal">将其加入到此课程中</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.js"></script>
	
</body>
</html>