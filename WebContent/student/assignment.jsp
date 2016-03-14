<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Course"%>
 <%@ page language="java" import="edu.nju.model.Showok"%>
 <%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mycss.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/jquery/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<script type="text/javascript">
    function ajaxFileUpload(hid,k)
    {
    	document.getElementById('shid').value=hid;
    	var file = "file"+k;
    	var loading = "loading"+k;
    	$(document)
        .ajaxStart(function(){
            $("#loading").show();
        })//开始上传文件时显示一个图片
        .ajaxComplete(function(){
            $("#loading").hide();
        });//文件上传完成将图片隐藏起来
        
        var params = {
             shid : $("#shid").val(),
          };
        $.ajaxFileUpload
        (
            {
                url:'submitHw',//用于文件上传的服务器端请求地址
                secureuri:false,//一般设置为false
                data:params,
                fileElementId:file,//文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function (data, status)  //服务器成功响应处理函数
                {
                    //从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
                    alert('上传 成功!');
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                }
            }
        )
    }
    </script>
</head>
<body>
	<div class="container">
		<%
			Course c = (Course) request.getAttribute("course");
		%>
		<div class="jumbotron" style="height: 130px">
			<h1 style="margin-top: -30px">Teaching Support System</h1>
		</div>
		<%
			String username = (String) request.getAttribute("username");
		%>

		<s:form action="/student/jumpStudent" method="post" name='reqForm'>
			<ul class="breadcrumb">
				<li><a href="javascript:document.reqForm.submit();">我的课程</a> <span
					class="divider">/</span></li>
				<li class="active"><%=c.getCname()%></li>
				<li class="dropdown" style="float: right"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">用户信息 <span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="../common/user.html"><%=username%> <img
								src="<%=request.getContextPath()%>/img/portrait.jpg"
								style="width: 30px; height: 30px; margin-top: -5%"></img> </a></li>
						<li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a>
						</li>

					</ul></li>
			</ul>
		</s:form>


		<div class="smallInfo">
			<b>Course Navigation</b>
		</div>
		<div style="width: 20%; border: 1px solid #999999;; float: left">

			<s:form action="student/jumpToInfo" method="post" name='toHomework'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.toHomework.submit();">课程介绍</a></li>
				</ul>
			</s:form>
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a>作业提交</a></li>
			</ul>
			<s:form action="student/jumpToComment" method="post" name='toComment'>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="javascript:document.toComment.submit();">教师点评</a></li>
				</ul>
			</s:form>

		</div>
<%String signal="0"; %>
<%int leftHw=(int)request.getAttribute("leftHw"); %>
		<div style="width: 70%; margin-left:5%; float: left">
			<script type="text/javascript">
			document.write('<div class="alert alert-warning alert-dismissable"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> 注意！您有<%=leftHw%>个作业尚未提交！</div>');
			</script>

			<%
				int k = 0;
			String sid=(String)request.getAttribute("userId");
			List<Showok> showokList=(List<Showok>)request.getAttribute("showokList");
			%>
			<s:form method="post" id="submitForm" name="submitForm">
				<input type="hidden" name="shid" id="shid" />
				<input type="hidden" name="prid" id="prid" />
				<s:iterator value="#request.hlist">
				<%Showok sh = showokList.get(k); %>
					<table class="table  table-bordered">
						<tbody>
							<tr>
								<td>作业编号</td>
								<td><s:property value="hid" /></td>

							</tr>
							<tr class="success">
								<td>截止日期</td>
								<td><s:property value="sddl" /></td>

							</tr>
							<tr>
								<td>作业内容</td>
								<td><s:property value="info" /></td>

							</tr>
							<tr>
								<td>作业相关</td>
								<td>
								<b>总分</b>
							<span><s:property value="score" /></span>
							<b>分&nbsp&nbsp&nbsp难度</b>
							<span><s:property value="dif" /></span>
							&nbsp&nbsp&nbsp
							<b>作业格式</b>
							<span><s:property value="format" /></span>
								</td>

							</tr>
							<tr class="warning">
								<td>作业评分</td>
								<td><%=sh.getpScore() %></td>

							</tr>

							<tr>
								<td>作业评价</td>
								<td><%=sh.getReview() %></td>

							</tr>
							<tr>
								<td>提交作业</td>
								
								<td>
								<input type="hidden" id=<%="sddl"+k %> value='<s:property value="sddl" />'/>
								
							<img src="<%=request.getContextPath()%>/img/loading.gif" id='<%="loading"+k %>' style="display: none;"/>
							<input type="text" size="20" name='<%="upfile"+k %>' id='<%="upfile"+k %>' style="border:1px dotted #ccc" readonly>  
							<input type="button" id=<%="up"+k %> value="上传" class="a-upload" onclick="document.getElementById('<%="file"+k %>').click();" style="border:1px solid #ccc;background:#fff">  
							<input type="file" id=<%="file"+k %> style="display:none" onchange="document.getElementById('<%="upfile"+k %>').value=this.value" name="file">
							<input type="button" id=<%="button"+k %> class="a-upload" value="提交" onclick="ajaxFileUpload(<s:property value="hid" />,'<%=k%>');">
							<script type="text/javascript">
						var ddl = document.getElementById('sddl'+'<%=k%>').value;
						var myDate = new Date();
						var todaytimes = myDate.getTime();
						
					    var arr = ddl.split(" ");
					    var starttime = new Date(arr[0], arr[1]-1, arr[2]);
					    var starttimes = starttime.getTime();
					   
						if(todaytimes>=starttimes){
							document.getElementById('<%="upfile"+k %>').value='已截止';
							document.getElementById('<%="up"+k %>').style.display="none";
							document.getElementById('<%="button"+k %>').style.display="none";
						}else{
						}
						</script>
						</td>
							</tr>
					
						</tbody>
					</table>
					<%
						k++;
					%>
				</s:iterator>
			</s:form>
		</div>


	</div>


	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>