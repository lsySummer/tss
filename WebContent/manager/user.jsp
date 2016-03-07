<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
     <%@ taglib prefix="stock" uri="/WEB-INF/tlds/userInfo.tld" %>
       <%@ taglib prefix="teaInfo" uri="/WEB-INF/tlds/teacherInfo.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/mycss.css" rel="stylesheet">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<script src="../jquery/jquery-1.8.3.min.js"></script>
<script language="javascript" type="text/javascript">

function check(){
	var num=document.getElementById("rnum").value;
	var name = document.getElementById("rname").value;
	var pass = document.getElementById("rpass").value;
	if(num==''||name==''||pass==''){
		window.alert('存在输入为空！');
		return false;
		}
	return true;
}

	 function setValue(num){
			var hid = document.getElementById('acId');
			hid.value=num;
	 }
	 
	 function modify(id,num,username,password){
		 document.getElementById('sid').value=id;
		 document.getElementById("snum").value=num;
		 document.getElementById("sname").value=username;
		 document.getElementById("spass").value=password;
		 document.getElementById("snum").setAttribute("placeholder",num);
		 document.getElementById("sname").setAttribute("placeholder",username);
		 document.getElementById("spass").setAttribute("placeholder",password);
	 }
	 
	 function settValue(num){
			var hid = document.getElementById('tId');
			hid.value=num;
	 }
	 
	 function tmodify(id,num,username,password){
		 document.getElementById('tid').value=id;
		 document.getElementById("tnum").value=num;
		 document.getElementById("tname").value=username;
		 document.getElementById("tpass").value=password;
		 document.getElementById("tnum").setAttribute("placeholder",num);
		 document.getElementById("tname").setAttribute("placeholder",username);
		 document.getElementById("tpass").setAttribute("placeholder",password);
	 }
	</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="jumbotron" style="height:130px">
		<h1 style="margin-top:-30px">Teaching Support System</h1>
    </div>
<div class="navbar navbar-inverse">

    <div class="navbar-header" >
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
         <s:form action="/manager/teaching" method="post" name='reqForm'>
        <ul class="nav navbar-nav">
            <li class="active"><a href="">用户管理</a></li>
          <li><a href='javascript:document.reqForm.submit();'>教学管理</a></li>
        </ul>
          </s:form>
		
	
     </div>
</div>
</div>
	<div class="userblock" style="margin-left:15%;">
		<h3>注册一个新用户</h3>
		<s:form action="/manager/register" method="post" enctype="multipart/form-data">
			<div style="float:left;width:800px;">
				<span class="infoTxt">学号：</span>
				<input type="text" id="rnum" name="num" 
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				
				<span class="infoTxt">姓名：</span>
				<input type="text" id="rname" name="name" 
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				
				<span class="infoTxt">密码：</span>
				<input type="text" id="rpass" name="pass" 
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				
				<span class="infoTxt">身份：</span>
					<select name="select"> 
						<option value=0>学生</option> 
						<option value=1>教师</option> 
					</select>
				<br/><br/>
				<input type="submit" class="btn-info" onclick="return check()" style="width:120px;margin-left:6%">
			</div>
		</s:form>
		</div>
		
		<div class="userblock" style="margin-left:3%;">
			<h3 style="margin-top:10%">批量导入注册数据</h3>
			<h4 style="margin-top:5%">(支持txt，excel格式的文件导入)</h4>
			<s:form action="/manager/fileHandler" method="post" enctype="multipart/form-data">
			<span class="infoTxt">学生：</span>
			<input type="text" size="20" name="upfile" id="upfile" style="border:1px dotted #ccc" readonly>
			<input type="button" value="选择" class="a-upload" onclick="path.click()" style="margin-left:5px;margin-right:5px">  
			<input type="file" id="path" multiple style="display:none" onchange="upfile.value=this.value" name="upload">
			<input type="submit" class="btn-info"><br/><br/>
			</s:form>
			<s:form action="/manager/teacherRegister" method="post" enctype="multipart/form-data">
			<span class="infoTxt">教师：</span>
			<input type="text" size="20" name="upfile" id="upfile" style="border:1px dotted #ccc" readonly>  
			<input type="button" value="选择" class="a-upload" onclick="path1.click()" style="margin-left:5px;margin-right:5px">  
			<input type="file" id="path1" multiple style="display:none" onchange="upfile.value=this.value" name="tupload">
			<input type="submit" class="btn-info"><br/><br/>
			</s:form>
		</div>

<div class="tabbable" id="tabs-237644" style="margin:1% 15%;float:left">
	<ul class="nav nav-tabs">
		<li class="active">
			<a href="#panel-770889" data-toggle="tab">学生</a>
		</li>
		<li>
			<a href="#panel-924025" data-toggle="tab">教师</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="panel-770889">
		
	
		<jsp:useBean id="stuList"
			type="java.util.List"
			scope="request"></jsp:useBean>
		
		<div style="width:1000px;margin-top:1%;float:left">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>
							学号
						</th>
						<th>
							姓名
						</th>
						<th>
							密码
						</th>
						<th>
							状态
						</th>
						
					</tr>
				</thead>
				<tbody>
					<stock:userInfo/>
				</tbody>
			</table>
		</div>
	</div>
		
		<jsp:useBean id="teaList"
			type="java.util.List"
			scope="request"></jsp:useBean>
			
		
		<div class="tab-pane" id="panel-924025">
		<div style="width:1000px;margin-top:1%;float:left">
		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>
							工号
						</th>
						<th>
							姓名
						</th>
						<th>
							密码
						</th>
						<th>
							状态
						</th>
					</tr>
				</thead>
				<tbody>
					<teaInfo:teacherInfo/>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>

<s:form class="form-horizontal" action="/manager/modifyTea" method="post">
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				<input type="hidden" value="" name="tid" id="tid">
					<span class="infoTxt">工号：</span>
				<input type="text" id="tnum" name="tnum"
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				
				<span class="infoTxt">姓名：</span>
				<input type="text" id="tname" name="tname"
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				
				<span class="infoTxt">密码：</span>
				<input type="text" id="tpass" name="tpass"
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary" >
						确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
</s:form>

<s:form class="form-horizontal" action="/manager/modifyStu" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				<input type="hidden" value="" name="sid" id="sid">
					<span class="infoTxt">学号：</span>
				<input type="text" id="snum" name="snum"
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				
				<span class="infoTxt">姓名：</span>
				<input type="text" id="sname" name="sname"
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				
				<span class="infoTxt">密码：</span>
				<input type="text" id="spass" name="spass"
				style=" border: 0;border-bottom: thin solid;outline:none;"></input><br/><br/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary" >
						确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
</s:form>
	<s:form class="form-horizontal"  action="/manager/deleteUser" method="post">
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
	  <input type="hidden" value="" name="acId" id="acId">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">确定删除该用户？</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary" >
						确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
	</s:form>


<s:form class="form-horizontal"  action="/manager/deleteTea" method="post">
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
	  <input type="hidden" value="" name="tId" id="tId">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">确定删除该用户？</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" class="btn btn-primary" >
						确定</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-fade -->
	</s:form>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.js"></script>
	
</body>
</html>