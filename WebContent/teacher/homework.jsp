<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
         <%@ page language="java" import="edu.nju.model.Course"%>
         <%@ page language="java" import="edu.nju.model.Teacher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mycss.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet">
 <link href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script src="<%=request.getContextPath()%>/jquery/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<title>Insert title here</title>

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
                url:'submitEg',//用于文件上传的服务器端请求地址
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


<script type="text/javascript">
	function check(){
		var ahid = document.getElementById('ahid').value;
		var asddl = document.getElementById('asddl').value;
		var aaddl = document.getElementById('aaddl').value;
		var aformat = document.getElementById('aformat').value;
		var ainfo = document.getElementById('ainfo').value;
		if(ahid==''||assddl==''||aaddl==''||aformat==''||ainfo==''){
			alert('存在输入为空');
			return false;
		}
		return true;
	}
	
	function setId(hid){
		document.getElementById('prid').value=hid;
		document.submitForm.action="checkHw";
		return true;
	}
</script>

</head>
<body>
<div class="container">
	<div class="jumbotron" style="height:130px">
		<h1 style="margin-top:-30px">Teaching Support System</h1>
    </div>
    <%Course c = (Course)request.getAttribute("course"); %><%
			String username = (String) request.getAttribute("username");
	Teacher s = (Teacher) session.getAttribute("tuser");
		%>
<s:form action="/teacher/jumpTeacher" method="post" name='reqForm'>
  <ul class="breadcrumb">
		<li>
			<a href="javascript:document.reqForm.submit();">我的课程</a> <span class="divider">/</span>
		</li>
		<li class="active">
			<%=c.getCname() %>
		</li>
		<li class="dropdown" style="float:right">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户信息 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<%=request.getContextPath()%>/common/tinfo.jsp"><%=username %>
				<img src='<%=getServletContext().getRealPath("/portrait")+"\\"+s.getHpath()%>' style="width:30px;height:30px;margin-top:-5%"></img>
				</a></li>
                <li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a>  </li>
      
              </ul>
            </li>	
	</ul>
</s:form>	
	
	<div class="smallInfo" style="width:20%"><b>Course Navigation</b></div>
	<div style="width:20%;border:1px solid #999999;float:left;">
	<s:form action="teacher/jumpToCourse" method="post" name='toCourse'>
		<ul class="nav nav-pills nav-stacked">
	   <li><a href="javascript:document.toCourse.submit();">课程管理</a></li>
	   <li class="active"><a>作业管理</a></li>
		</ul>
	</s:form> 
	</div>
	
	<div style="width:70%;float:left;margin-left:5%">
			<div style="width:100px;margin-bottom:2%;float:left;">
			<a id="modal3" data-target="#myModal3" role="button" class="btn btn-default" data-toggle="modal" style="margin:1% 3%">新增一次作业</a>
			</div>
			<%int k=0;%>
	   	<s:form method="post" id="submitForm" name="submitForm">
			<input type="hidden" name="shid" id="shid"/>
			<input type="hidden" name="prid" id="prid"/>
	   <s:iterator value="#request.hlist">
		<table class="table  table-bordered">
				<tbody>
					<tr>
						<td>
							作业编号
						</td>
						<td>
							<s:property value="hid" />
						</td>
					
					</tr>
					<tr class="success">
						<td>
							作业提交截止日期
						</td>
						<td>
							<s:property value="sddl" />
						</td>
						
					</tr>
					<tr class="">
						<td>
							助教批改截止日期
						</td>
						<td>
							<s:property value="addl" />
						</td>
						
					</tr>
					<tr>
						<td>
							作业内容
						</td>
						<td>
							<s:property value="info" />
						</td>
					
					</tr>
					<tr>
						<td>
							作业相关
						</td>
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
						<td>	
						上传样例
						</td>
						<td>
						<input type="hidden" id=<%="assidSubmit"+k%> value=<s:property value="assisSubmit" />>
						 <img src="<%=request.getContextPath()%>/img/loading.gif" id='<%="loading"+k %>' style="display: none;"/>
							<input type="text" size="20" name='<%="upfile"+k %>' id='<%="upfile"+k %>' style="border:1px dotted #ccc" readonly>  
							<input type="button" value="上传" class="a-upload" onclick="document.getElementById('<%="file"+k %>').click();" style="border:1px solid #ccc;background:#fff">  
							<input type="file" id=<%="file"+k %> style="display:none" onchange="document.getElementById('<%="upfile"+k %>').value=this.value" name="file">
							<input type="button" class="a-upload" value="提交" onclick="ajaxFileUpload(<s:property value="hid" />,'<%=k%>');">
						</td>
					</tr>
					
					<tr>
					<td>	
						<a href="javascript:document.submitForm.submit();" onclick="return setId(<s:property value="id" />)">审核助教审批</a>
					</td>
					<td>
						<script type="text/javascript">
						var ifSubmit = document.getElementById('<%="assidSubmit"+k%>').value;
						if(ifSubmit==0){
							document.write("<p>助教批改尚未完成</p>");
						}else{
							document.write("<p><b>助教批改完成，请审批</b></p>");
						}
						</script>
					</td>
						
					</tr>
				</tbody>
			</table>
			<%k++; %>
		</s:iterator>
			</s:form>	
		</div>
</div>

<s:form action="/teacher/addHomework" method="post">
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
			
				
				<input type="hidden" name="acid" id="acid" value=<%=c.getId() %>>
			<div style="float:left;width:300px;">
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:16%">编号：</span>
				<input type="text" id="ahid" name="ahid"
				style=" border: 0;border-bottom: thin solid;outline:none;width:125px"></input>
				</div>
				
				<span class="infoTxt" style="float:left;margin-top:1%;">作业分数：</span>
				<input type="text" id="ascore" name="ascore"
				style=" border: 0;border-bottom: thin solid;outline:none;width:125px"></input><br/><br/>
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%;vertical-align:top;display:block;">作业描述：</span>
				<textarea style="width:450px;height:70px" id="ainfo" name="ainfo"></textarea>
				<br/><br/>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">作业难度：</span>
				<div style="float:left;width:130px;">
					<select class="form-control" id="adif" name="adif"> 
						<option value="1">1.0</option> 
						<option value="2">2.0</option> 
						<option value="3">3.0</option> 
						<option value="4">4.0</option> 
						<option value="5">5.0</option> 
					</select>
				</div>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">学生提交ddl：</span>
				 <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"
				style="width:200px;">
                    <input class="form-control" size="16" type="text" name="asddl" id="asddl" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/><br/>
				
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">作业格式：</span>
				<div style="float:left;width:130px;">
					<select class="form-control" id="aformat" name="aformat"> 
						<option value='word'>word</option> 
						<option value='pdf'>pdf</option> 
						<option value='txt'>txt</option> 
						<option value='zip'>zip</option> 
						<option value='不限制'>不限制</option> 
					</select>
				</div>
				<span class="infoTxt" style="float:left;margin-top:1%;margin-left:3%">助教批改ddl：</span>
				 <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"
				style="width:200px;">
                    <input class="form-control" size="16" type="text" name="aaddl" id="aaddl" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
			
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button id="addHomework" type="submit" class="btn btn-primary" onclick="return check()">
						确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
	</s:form>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

	<script type="text/javascript" src="../js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script
		src="<%=request.getContextPath()%>/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">

	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });	
	</script>
</body>
</html>