<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=0;">
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
		<li class="active">
			我的作业
		</li>
		<a href="../common/user.html" style="float:right">lsy13
		<img src="../img/portrait.jpg" style="width:30px;height:30px;margin-top:-5%"></img>
		</a>
	</ul>
	
	
	<div class="smallInfo" style="width:250px"><b>Course Infomation</b></div>
	<div style="width:250px;border:1px solid #999999;padding:1% 1%;float:left">
	
		<span class="infoTxt"><b>编号：</b></span>
		<span class="infoTxt">C1011</span><br/><br/>
		<span class="infoTxt"><b>课程名：</b></span>
		<span class="infoTxt">J2EE与中间件</span><br/><br/>
		<span class="infoTxt"><b>教师：</b></span>
		<span class="infoTxt">王浩然</span><br/><br/>
		<span class="infoTxt"><b>助教：</b></span>
		<span class="infoTxt">liuJing</span><br/><br/>
		<span class="infoTxt"><b>简介：</b></span>
		<span class="infoTxt">J2EE是一套全然不同于传统应用开发的技术架构，包含许多组件，主要可简化且规范应用系统的开发与部署，进而提高可移植性、安全与再用价值</span>
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
							提交作业
						</td>
						<td>
							<input type="text" size="20" name="upfile" id="upfile" style="border:1px dotted #ccc" readonly>  
							<input type="button" value="上传作业" class="a-upload" onclick="path.click()" style="border:1px solid #ccc;background:#fff">  
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