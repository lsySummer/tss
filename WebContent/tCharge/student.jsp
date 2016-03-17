<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ page language="java" import="edu.nju.model.Course"%>
      <%@ page language="java" import="edu.nju.model.ChartModel"%>
    <%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="../js/Chart.js"></script>


</head>
<body data-spy="scroll" data-target="#myScrollspy">

	<div class="container">
		<div class="jumbotron" style="height: 130px; margin-top: -20px">
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
				<a class="navbar-brand" href="#">welcome，教学负责人</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<s:form action="/tCharge/selectMonth" method="post" name='reqForm'>
					<input type="hidden" name="sMonth" id="sMonth" value=3>
				<ul class="nav navbar-nav">
					<li><a href="javascript:document.reqForm.submit();">课程作业情况</a></li>
					<li class="active"><a href="#">学生情况</a></li>
				</ul>
				</s:form>
				<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a></li>    
				</ul>
			</div>
		</div>
	<% 
	List<String> cnameList =(List<String>)request.getAttribute("cnameList");
	%>
	<script>
		var cname=new Array();
		var data=new Array();
	</script>
	<%List<ArrayList<Integer>> submitList = (List<ArrayList<Integer>>)request.getAttribute("submit");
	List<ChartModel> modelList=(List<ChartModel>)request.getAttribute("chartList");
	%>
	<%for(int k=0;k<submitList.size();k++){
		ArrayList<Integer> subArr = submitList.get(k);
		for(int s=0;s<subArr.size();s++){
		%>	
		<script>
		 data[<%=s%>] = '<%=subArr.get(s)%>';
		 <%int ss=s+1;%>
		 cname[<%=s%>] = '<%="作业"+ss%>';
		</script>
		<%} %>
		<div style="float:left;margin-left:6%;width:90%">
		<h2><%=cnameList.get(k) %></h2>
			<div style="float:left;">
			<h3>提交人数</h3>
			<canvas id='<%="line"+k %>' width="550" height="250"></canvas>
			</div>
			<div style="float:left;margin-left:10%;">
			<h3>分数情况</h3>
			<%ChartModel model = modelList.get(k);%>
			<canvas id='<%="area"+k %>' width="240" height="240"></canvas>
			</div>
		</div>
		<script>
	
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
					data : data
				}
			]

		};
	
	var pieData = [
					{
						value: <%=model.getL1()%>,
						color:"#F7464A",
						highlight: "#FF5A5E",
						label: "<60"
					},
					{
						value: <%=model.getL2()%>,
						color: "#46BFBD",
						highlight: "#5AD3D1",
						label: "60-69"
					},
					{
						value: <%=model.getL3()%>,
						color: "#FDB45C",
						highlight: "#FFC870",
						label: "70-79"
					},
					{
						value: <%=model.getL4()%>,
						color: "#949FB1",
						highlight: "#A8B3C5",
						label: "80-89"
					},
					{
						value: <%=model.getL5()%>,
						color: "#4D5360",
						highlight: "#616774",
						label: "90-100"
					}

				];
	
	
	
	var ctx2 = document.getElementById('<%="line"+k %>').getContext("2d");
	var myNewChart = new Chart(ctx2).Line(lineChartData);
	
	var ctx2 = document.getElementById('<%="area"+k %>').getContext("2d");
	var myNewChart1 = new Chart(ctx2).Pie(pieData);
	</script>
		<%}; %>
	</div>


	<script src="../js/bootstrap.js"></script>

</body>
</html>