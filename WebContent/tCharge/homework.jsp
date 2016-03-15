<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/Statistics/css/graph.css">
<meta name="robots" content="noindex,follow" />
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
      <a class="navbar-brand" href="#">welcome，管理员</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="active"><a href="">课程作业情况</a></li>
            <li><a href="student.html">学生情况</a></li>
        </ul>
		
	    <ul class="nav navbar-nav navbar-right">
			<li><a href="#">Link</a></li>      
	    </ul>
     </div>
</div>
<div class="kePublic">
<!--效果html开始-->
<div id="graph-wrapper">
	<div class="graph-info">
		<a href="javascript:void(0)" class="visitors">Visitors</a>
		<a href="javascript:void(0)" class="returning">Returning Visitors</a>
		<a href="#" id="bars">bars<span></span></a>
		<a href="#" id="lines" class="active">lines<span></span></a></div>
	<div class="graph-container">
		<div id="graph-lines">
		</div>
		<div id="graph-bars">
		</div>
	</div>
</div>
<!-- end Graph HTML -->
<script src="../Statistics/js/jquery.min.js"></script>
<script src="../Statistics/js/jquery.flot.min.js"></script>
<script>
$(document).ready(function () {

	// Graph Data ##############################################
	var graphData = [{
			// Visits
			data: [ [6, 1300], [7, 1600], [8, 1900], [9, 2100], [10, 2500], [11, 2200], [12, 2000], [13, 1950], [14, 1900], [15, 2000] ],
			color: '#71c73e'
		}, {
			// Returning Visits
			data: [ [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], [13, 850], [14, 830], [15, 1000] ],
			color: '#77b7c5',
			points: { radius: 4, fillColor: '#77b7c5' }
		}
	];

	// Lines Graph #############################################
	$.plot($('#graph-lines'), graphData, {
		series: {
			points: {
				show: true,
				radius: 5
			},
			lines: {
				show: true
			},
			shadowSize: 0
		},
		grid: {
			color: '#646464',
			borderColor: 'transparent',
			borderWidth: 20,
			hoverable: true
		},
		xaxis: {
			tickColor: 'transparent',
			tickDecimals: 2
		},
		yaxis: {
			tickSize: 1000
		}
	});

	// Bars Graph ##############################################
	$.plot($('#graph-bars'), graphData, {
		series: {
			bars: {
				show: true,
				barWidth: .9,
				align: 'center'
			},
			shadowSize: 0
		},
		grid: {
			color: '#646464',
			borderColor: 'transparent',
			borderWidth: 20,
			hoverable: true
		},
		xaxis: {
			tickColor: 'transparent',
			tickDecimals: 2
		},
		yaxis: {
			tickSize: 1000
		}
	});

	// Graph Toggle ############################################
	$('#graph-bars').hide();

	$('#lines').on('click', function (e) {
		$('#bars').removeClass('active');
		$('#graph-bars').fadeOut();
		$(this).addClass('active');
		$('#graph-lines').fadeIn();
		e.preventDefault();
	});

	$('#bars').on('click', function (e) {
		$('#lines').removeClass('active');
		$('#graph-lines').fadeOut();
		$(this).addClass('active');
		$('#graph-bars').fadeIn().removeClass('hidden');
		e.preventDefault();
	});

	// Tooltip #################################################
	function showTooltip(x, y, contents) {
		$('<div id="tooltip">' + contents + '</div>').css({
			top: y - 16,
			left: x + 20
		}).appendTo('body').fadeIn();
	}

	var previousPoint = null;

	$('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
		if (item) {
			if (previousPoint != item.dataIndex) {
				previousPoint = item.dataIndex;
				$('#tooltip').remove();
				var x = item.datapoint[0],
					y = item.datapoint[1];
					showTooltip(item.pageX, item.pageY, y + ' visitors at ' + x + '.00h');
			}
		} else {
			$('#tooltip').remove();
			previousPoint = null;
		}
	});

});
</script>
		
</div>
</div>


<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
</body>
</html>