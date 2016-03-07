<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
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
		<li>
			<a href="homework.html">J2EE与中间件</a><span class="divider">/</span>
		</li>
		<li class="active">
			提交作业
		</li>
		<a href="../common/user.html" style="float:right">lsy13
		<img src="../img/portrait.jpg" style="width:30px;height:30px;margin-top:-5%"></img>
		</a>
	</ul>
	
	
	<div class="smallInfo" style="width:200px"><b>Course Infomation</b></div>
	<div style="width:200px;border:1px solid #999999;;float:left">
	
		<ul class="nav nav-pills nav-stacked">
	   <li><a href="course.html">课程管理</a></li>
	   <li class="active"><a href="homework.html">作业管理</a></li>
	 
	  
		</ul>
	</div>
	<div style="width:800px;margin-left:5%;float:left">
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
							截止日期
						</td>
						<td>
							2016/02/29 23:59:59
						</td>
						
					</tr>
					<tr class="error">
						<td>
							提交历史
						</td>
						<td>
							131250129.txt
						</td>
					
					</tr>
					<tr class="warning">
						<td>
							上传样例
						</td>
						<td>
							<input type="text" size="20" name="upfile" id="upfile" style="border:1px dotted #ccc" readonly>  
							<input type="button" value="上传" class="a-upload" onclick="path.click()" style="border:1px solid #ccc;background:#fff">  
							<input type="file" id="path" multiple style="display:none" onchange="upfile.value=this.value" name="file[]">
							<input type="submit" class="a-upload">
						</td>
					
					</tr>
			
				</tbody>
			</table>
	</div>
</div>

	
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.js"></script>
	
</body>
</html>