<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="edu.nju.model.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<link href="<%=request.getContextPath()%>/css/mycss.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/ajaxFile/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajaxFile/ajaxfileupload.js"></script>
<script type="text/javascript">
	function ajaxFileUpload() {

		$("#loading").ajaxStart(function() {
		})//开始上传文件时显示一个图片
		.ajaxComplete(function() {
		});//文件上传完成将图片隐藏起来

		$.ajaxFileUpload({
			url : 'smodPortrait',//用于文件上传的服务器端请求地址
			secureuri : false,//一般设置为false
			fileElementId : 'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
			dataType : 'json',//返回值类型 一般设置为json
			success : function(data, status) //服务器成功响应处理函数
			{
				//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
				alert("已保存");
			},
			error : function(data, status, e)//服务器响应失败处理函数
			{
				alert(e);
			}
		})
	}
</script>
<script language="javascript">
	var msg = "${requestScope.tipMessage}";
	if (msg != "") {
		alert(msg);
	}

	function test1(event) {
		if (event.keyCode<48 || event.keyCode>57) {
			window.alert("Not Number");
			/*window.event.returnValue=false;*/
			return false;
		}
	}

	function setPotrait() {
		var docObj = document.getElementById("file");

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '200px';
			imgObjPreview.style.height = '200px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小
			localImagId.style.width = "200px";
			localImagId.style.height = "200px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>
</head>
<body style="">
<%
					Student s = (Student) session.getAttribute("suser");
				%>
	<div class="container">
		<div class="jumbotron" style="height: 130px">
			<h1 style="margin-top: -30px">Teaching Support System</h1>
		</div>

	<s:form action="/student/jumpStudent" method="post" name='reqForm'>
			<ul class="breadcrumb">
				<li><a href="javascript:document.reqForm.submit();">我的课程</a> <span
					class="divider">/</span></li>
			</ul>
		</s:form>

		<div
			style="border-top: 1px solid #aaaaab; width: 30%; height: 0px; float: left;">
			<div
				style="background-color: #aaaaab; height: 300px; width: 10px; float: left;"></div>
			<div style="padding-left: 25%; padding-top: 5%">
				<img src='<%=getServletContext().getRealPath("/portrait")+"\\"+s.getHpath()%>' style="width: 200px; height: 200px;"
					id="preview"></img><br />
			</div>
			<form action="" method="post" enctype="multipart/form-data">
				<div style="float: left; margin-left: 25%">
					<a href="" class="a-upload">修改头像 <input type="file" name="file"
						id="file" onchange="return setPotrait();">
					</a>
				</div>
				<div style="float: left; margin-left: 5%">
						<input type="button" value='保存' class="a-upload"
						onclick="ajaxFileUpload()">
				</div>
			</form>
			<br />

		</div>
		<div
			style="border-top: 1px solid #aaaaab;; width: 65%; height: 450px; float: left; margin-left: 5%">
			<div
				style="background-color: #aaaaab; height: 450px; width: 10px; float: left;">
			</div>
			<s:form action="infoAction" method="post" style="padding-left: 8%">
				<h3>个人资料修改</h3>
				<br />
				<table class="table  table-bordered">
					<tbody>
						<tr>
							<td><input type="hidden" value='<%=s.getId()%>' id="id"
								name="id" /> 学号</td>
							<td><input type="text" id="num" name="num" readonly
								style="border: 0; outline: none;" value='<%=s.getNum()%>'></input>

							</td>

						</tr>

						<tr>
							<td>姓名</td>
							<td><input type="text" id="name" name="name" readonly
								style="border: 0;; outline: none;" value='<%=s.getUsername()%>'></input>
							</td>
						</tr>
						<tr>
							<td>性别</td>
							<td><input type="text" id="sex" name="sex"
								style="border: 0; outline: none;" value='<%=s.getSex()%>'></input>
							</td>
						</tr>
						<tr>
							<td>出生年月</td>
							<td><input type="text" id="birth" name="birth"
								style="border: 0; outline: none;" value='<%=s.getBirth()%>'></input>
							</td>
						</tr>
						<tr>
							<td>邮箱地址</td>
							<td><input type="text" id="mail" name="mail"
								style="border: 0; outline: none;" value='<%=s.getMail()%>'></input>
							</td>
						</tr>
						<tr>
							<td>手机号码</td>
							<td><input type="text" id="phone" name="phone"
								style="border: 0; outline: none;" value='<%=s.getPhone()%>'></input>
							</td>
						</tr>

					</tbody>
				</table>
				<button class="btn btn-primary"
					style="margin-left: 30%; width: 80px" id="save" name="save">保存</button>
			</s:form>
		</div>
	</div>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		document.getElementById('selectPlace').value = place;
		document.getElementById('birthdate').value = birth;
	</script>

</body>
</html>