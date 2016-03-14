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

<script type="text/javascript">
	function ajaxFileUpload() {

		$("#loading").ajaxStart(function() {
		})//开始上传文件时显示一个图片
		.ajaxComplete(function() {
		});//文件上传完成将图片隐藏起来

		$.ajaxFileUpload({
			url : 'fileAction.action',//用于文件上传的服务器端请求地址
			secureuri : false,//一般设置为false
			fileElementId : 'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
			dataType : 'json',//返回值类型 一般设置为json
			success : function(data, status) //服务器成功响应处理函数
			{
				//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
				alert(data.message);
			},
			error : function(data, status, e)//服务器响应失败处理函数
			{
				alert(e);
			}
		})
	}
</script>
</head>
<body>

	<input type="file" id="file" name="file" />
	<br />
	<input type="button" value="上传" onclick="ajaxFileUpload();">

	<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>

</body>
</html>