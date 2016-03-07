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
	   <li class="active"><a href="assistant.html">作业下载</a></li>
	  <li><a href="score.html">作业评分</a></li>
	 
	  
		</ul>
	</div>

<div style="width:700px;margin:0% 5%;float:left">

	<div class="tree well">
    <ul>
      <li>
        <span><i class="glyphicon glyphicon-folder-open"></i> 作业一</span>
        <ul>
          <li>
            <span><i class="glyphicon glyphicon-leaf"></i> 131250129.zip</span> 
          </li>
          <li>
            <span><i class="glyphicon glyphicon-leaf"></i> 131250181.zip</span> 
          </li>
		    <li>
            <span><i class="glyphicon glyphicon-leaf"></i> 131250001.zip</span> 
          </li>
        </ul>
      </li>
      <li>
        <span><i class="glyphicon glyphicon-folder-open"></i> 作业二</span> <a href=""></a>
        <ul>
          <li>
            <span><i class="glyphicon glyphicon-leaf"></i> 131250181.txt</span> <a href=""></a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</div>
	
</div>

	
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.js"></script>

</body>
</html>