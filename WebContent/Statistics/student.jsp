<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
<script type="text/javascript" src="../jquery/jquery.js"></script>
<script type="text/javascript" src="../js/jsapi.js"></script>
	<script type="text/javascript" src="../js/corechart.js"></script>		
	<script type="text/javascript" src="../js/jquery.gvChart-1.0.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.ba-resize.min.js"></script>

<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
		$('#myTable5').gvChart({
			chartType: 'PieChart',
			gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 400,
			height: 250
		}
		
	});
});
</script>

<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
		$('#myTable1').gvChart({
			chartType: 'PieChart',
			gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 400,
			height: 250
		}
		
	});
});
</script>
</head>
<body data-spy="scroll" data-target="#myScrollspy">

	<div class="container">
	<div class="jumbotron" style="height:130px;margin-top:-20px">
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
        <ul class="nav navbar-nav">
            <li><a href="homework.jsp">课程作业情况</a></li>
            <li class="active"><a href="student.html">学生情况</a></li>
			
			 
        </ul>
		
	    <ul class="nav navbar-nav navbar-right">
			<li><a href="#">Link</a></li>      
	    </ul>
     </div>
</div>
</div>

<div style="width:200px;height:250px;margin-left:8%;float:left;text-align:center">
	<img style="width:100px;height:100px;margin-top:20%" src="../img/1.gif" />
	<h3>J2EE与中间件</h3>
</div>

<div style="width:100px;float:left;margin-top:6%">
		<form>
			<select class="form-control" style="margin-top:8%"> 
				<option>作业一</option> 
				<option>作业二</option> 
				<option>作业三</option> 
				<option>作业四</option> 
			</select>
		</form>
</div>
<div style="width:250px;height:250px;margin-left:2%;float:left;">

	   <table id='myTable5'>
					<caption>作业提交<caption>
			<thead>
				<tr>
					<th></th>
					<th>已交</th>
					<th>未交</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					100
					</td>
					<td>
					10
					</td>
					</tr>
			</tbody>
		</table>  
		
	</div>	
	<div style="width:250px;height:250px;margin-left:5%;float:left;">

	   <table id='myTable1'>
					<caption>分数情况<caption>
			<thead>
				<tr>
					<th></th>
					<th>90-100</th>
					<th>80-90</th>
					<th>70-80</th>
					<th>60-70</th>
					<th><60</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					10
					</td>
					<td>
					20
					</td>
					<td>
					25
					</td>
					<td>
					15
					</td>
					<td>
					10
					</td>
					</tr>
			</tbody>
		</table>  
		
	</div>	


<script src="../js/bootstrap.js"></script>

</body>
</html>