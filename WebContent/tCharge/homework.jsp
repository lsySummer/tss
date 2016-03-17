<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ page language="java" import="edu.nju.model.Course"%>
    <%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/Chart.js"></script>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mycss.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet">
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
      <a class="navbar-brand" href="#">welcome，教学负责人</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <s:form action="/tCharge/stuSta" method="post" name='reqForm'>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">课程作业情况</a></li>
            <li><a href="javascript:document.reqForm.submit();">学生情况</a></li>
        </ul>
    </s:form>
		
	    <ul class="nav navbar-nav navbar-right">
			<li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a></li>     
	    </ul>
     </div>
	</div>
</div>

<div style="width:50%;margin-left:10%;">
<s:form action="/tCharge/selectMonth" method="post">
	<span class="largeTxt"><b>选择月份</b></span>
	<select style="width:120px;height:30px;margin-left:5%" name="sMonth" id="sMonth" onchange="submit();">
		<option value=3>3月</option>
		<option value=4>4月</option>
		<option value=5>5月</option>
		<option value=6>6月</option>
	</select>
</s:form>

<script type="text/javascript">
var termS = "${requestScope.monSelect}";
	document.getElementById('sMonth').value=termS;
</script>

</div>

	<div style="width:30%;float:left;margin-left:10%">
		<h2>课程作业数</h2>
			<canvas id="radar" height="300" width="300"></canvas>
		</div>
		<div style="width:30%;margin-left:5%;float:left">
		<h2>课程作业平均分</h2>
		<canvas id="line" height="300" width="600"></canvas>
		</div>
		<div style="float:left;width:800px;height:300px;margin-top:5%;margin-left:10%">
			<h2>助教批改情况</h2>
			<canvas id="chart-area" height="300" width="800"></canvas>
			
		</div>
		<%List<Course> cList =(List<Course>)request.getAttribute("cList"); 
		List<String> cnameList =(List<String>)request.getAttribute("cnameList");
		List<Integer> hwNumList =(List<Integer>)request.getAttribute("hwNumList");
		List<Integer> aveScoreList =(List<Integer>)request.getAttribute("aveScoreList");
		List<Float> passList =(List<Float>)request.getAttribute("passList");
		List<Float> onTimeList =(List<Float>)request.getAttribute("onTimeList");
		%>
		<script>
		var cname=new Array();
		var num = new Array();
		var ave = new Array();
		var pass = new Array();
		var onTime = new Array();
		<%
		
		for(int j=0;j<cnameList.size();j++)
		{%>
		    cname[<%=j%>] = '<%=cnameList.get(j)%>';
		    num[<%=j%>] = '<%=hwNumList.get(j)%>';
		    ave[<%=j%>] = '<%=aveScoreList.get(j)%>';
		    pass[<%=j%>] = '<%=passList.get(j)%>';
		    onTime[<%=j%>] = '<%=onTimeList.get(j)%>';
		<%}
		%>
		var radarChartData = {
		labels: cname,
		datasets: [
			{
				label: "My First dataset",
				fillColor: "rgba(151,187,205,0.5)",
				strokeColor: "rgba(151,187,205,1)",
				pointColor: "rgba(151,187,205,1)",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(220,220,220,1)",
				data: num
			}
		]
	};
	
	
		var lineChartData = {
			labels : cname,
			datasets : [
				{
					label: "My First dataset",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : ave
				}
			]

		};
		
			var lineChartData2 = {
			labels : ["J2EE与中间件","LINUX系统基础","软件测试","人机交互","May","June","July"],
			datasets : [
				{
					label: "批改准时率%",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : onTime
				},{
					label: "批改通过率%",
					fillColor : "rgba(151,187,205,0.2)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : pass
				}
			]

		}

	
	var ctx = document.getElementById("radar").getContext("2d");
	var myNewChart = new Chart(ctx).Radar(radarChartData);
	var ctx2 = document.getElementById("line").getContext("2d");
	var myNewChart = new Chart(ctx2).Line(lineChartData);
	var ctx3 = document.getElementById("chart-area").getContext("2d");
	var myNewChart = new Chart(ctx3).Line(lineChartData2);
	</script>


<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</body>
</html>