<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/mycss.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teaching Support System</title>
<script type="text/javascript">
	var msg = "${requestScope.error}";
	if (msg != "") {
		alert(msg);
	}
</script>
</head>
<body style="background-image: url('../img/main3.jpg'); background-size: cover; background-repeat: no-repeat; width: 100%; height: 100%; background-attachment: fixed;">
	<div id="d1">
	<div style="margin-top:1%;float:left;width:800px">
		<h3 style="text-align:center;">
					<font face="微软雅黑"> Welcome to Teaching Support System!
					</font>
				</h3>
	</div>
		<div class="row-fluid">
			<div style="width:30%;float:left">
				<img src="../img/njusw.jpg" style="width:180px;margin-left:20%"/>
			
			</div>
			<div style="width:50%;float:left;margin-left:10%">
				<s:form class="form-horizontal" id="formAction"
					action="login" method="post">

					<div class="control-group">
						<label class="control-label" for="username">用户名</label>
						<div class="controls">
							<input type="text" name="username" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">密码</label>
						<div class="controls">
							<input id="password" type="password" name="password" />
						</div>
					</div>

					<div class="control-group" style="margin-top: 3%">
						<div class="controls">
							<button type="submit" class="btn" name="submit" value="login" onclick="return login()">登陆</button>
							<button type="reset" class="btn" style="margin-left: 5%">重置</button>
						</div>
					</div>

				</s:form>
			</div>
		</div>
	</div>
</body>
</html>