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

 <script type="text/javascript">
　　$(function(){
  　　$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
  　　$('.tree li.parent_li > span').on('click', function (e) {
    　　 var children = $(this).parent('li.parent_li').find(' > ul > li');
    　　if (children.is(":visible")) {
      　　children.hide('fast');
      　　$(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
    　　} else {
      　　children.show('fast');
      　　$(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
    　　}
    　　e.stopPropagation();
  　　});
　　});
  </script>
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
			批改作业
		</li>
		<a href="../common/user.html" style="float:right">lsy13
		<img src="../img/portrait.jpg" style="width:30px;height:30px;margin-top:-5%"></img>
		</a>
	</ul>
	
	
	<div class="smallInfo"><b>Course Navigation</b></div>
	<div style="width:200px;border:1px solid #999999;;float:left">
	<ul class="nav nav-pills nav-stacked">
	  <li><a href="assistant.html">作业下载</a></li>
	  <li  class="active"><a href="score.html">作业评分</a></li>
	   
	</ul>
	</div>

	
<div style="width:700px;margin:0% 5%;float:left">
	<div style="width:100px;margin-bottom:2%;margin-top:-20px;float:left;">
		<form>
			<select class="form-control" style="margin-top:8%"> 
				<option>作业三</option> 
				<option>作业二</option>  
				<option>作业一</option>  
			</select>
		</form>
	</div>
	 <span class="label label-success" style="margin-left:5%;font-size:14px;">教师审批通过！</span><br/><br/>
	<div class="alert alert-success  alert-dismissable" style="margin-top:2%">
	   <button type="button" class="close" data-dismiss="alert" 
		  aria-hidden="true">
		  &times;
	   </button>
	   您已完成了60%的评分
	</div>
	
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
							<textarea  name="word" cols="2" rows="10" style="width:50px;height:30px;"></textarea>
						</td>
						<td>
							<textarea  name="word" cols="3" rows="10" style="width:600px;height:60px"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							13125002
						</td>
						<td>
							<textarea  name="word" cols="3" rows="10" style="width:50px;height:30px"></textarea>
						</td>
						<td>
							<textarea  name="word" cols="3" rows="10" style="width:600px;height:60px"></textarea>
						</td>
						
					</tr>
					
			
				</tbody>
			</table>
		
		<div style="float:left;width:800px;text-align:center">
			 <button class="btn" type="button">保存</button>
			  <button class="btn btn-primary" type="button" style="margin-left:5%">发送给老师</button>
		</div>
	</div>
</div>
	
</div>

	
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.js"></script>
</body>
</html>