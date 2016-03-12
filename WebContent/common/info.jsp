<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link href="../css/bootstrap.css" rel="stylesheet">
     <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

    <link href="../css/mycss.css" rel="stylesheet">
   
	<script language="javascript">
	function test1(event){
		if(event.keyCode<48 || event.keyCode>57){
			window.alert("Not Number");
			/*window.event.returnValue=false;*/
			return false;
		}
	}

	function setPotrait(){
		var docObj=document.getElementById("doc");
		 
		var imgObjPreview=document.getElementById("preview");
		if(docObj.files &&docObj.files[0])
		{
		//火狐下，直接设img属性
		imgObjPreview.style.display = 'block';
		imgObjPreview.style.width = '200px';
		imgObjPreview.style.height = '200px';
		//imgObjPreview.src = docObj.files[0].getAsDataURL();
		 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		}
		else
		{
		//IE下，使用滤镜
		docObj.select();
		var imgSrc = document.selection.createRange().text;
		var localImagId = document.getElementById("localImag");
		//必须设置初始大小
		localImagId.style.width = "200px";
		localImagId.style.height = "200px";
		//图片异常的捕捉，防止用户修改后缀来伪造图片
		try{
		localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
		localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		}
		catch(e)
		{
		alert("您上传的图片格式不正确，请重新选择!");
		return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
		}
		return true;
	}
	
	function save(){
		return true;
	}
	</script>
</head>
<body>
<div class="container">
	<div class="jumbotron" style="height:130px">
		<h1 style="margin-top:-30px">Teaching Support System</h1>
    </div>
	
	<div style="border-top:1px solid #aaaaab;width:300px;height:0px;float:left;margin-left:50px;">
	<div style="background-color:#aaaaab; height:300px; width:10px;float:left;" ></div>
	<div style="padding-left:25%;padding-top:5%">
		<img src="../img/portrait.jpg" style="width:200px;height:200px;" id="preview"></img><br/>
	</div>
 <form action="" method="post" enctype="multipart/form-data">
    <div style="float:left;margin-left:30%">
      <a href="" class="a-upload" >修改头像
    <input type="file" name="file" id="doc" onchange="return setPotrait();">
    </a>
    </div>
    <div style="float:left;margin-left:5%">
    <input type="submit" class="a-upload" onclick="">
    </div>
	</form>
	<br/>

	</div>
   
   <div style="border-top:1px solid #aaaaab;;width:600px;height:450px;float:left;margin-left:40px">
		<div style="background-color:#aaaaab; height:450px; width:10px;float:left;" >
		</div>
		<form action="" method="post" style="padding-left:8%">
		<h3>个人资料修改</h3>
		<br/>
			<table class="table  table-bordered">
				<tbody>
					<tr>
						<td>
							学号
						</td>
						<td>
							<input type="text" id="time" name="time" 
							style=" border: 0;outline:none;"></input>
				
						</td>
						
					</tr>
					
					<tr>
						<td>
							姓名
						</td>
						<td>
							<input type="text" id="time" name="time" 
							style=" border: 0;;outline:none;"></input>
						</td>
					</tr>
					<tr>
						<td>
							性别
						</td>
						<td>
							<input type="text" id="time" name="time" 
							style=" border: 0;outline:none;"></input>
						</td>
					</tr>
					<tr>
						<td>
							出生年月
						</td>
						<td>
							<input type="text" id="time" name="time" 
							style=" border: 0;outline:none;"></input>
						</td>
					</tr>
					<tr>
						<td>
							邮箱地址
						</td>
						<td>
							<input type="text" id="time" name="time" 
							style=" border: 0;outline:none;"></input>
						</td>
					</tr>
					<tr>
						<td>
							手机号码
						</td>
						<td>
							<input type="text" id="time" name="time" 
							style=" border: 0;outline:none;"></input>
						</td>
					</tr>
			
				</tbody>
			</table>
			<button class="btn btn-primary" style= "margin-left:30%;width:80px">保存</button>
		</form>
	</div>
</div>
	
			<script type="text/javascript" src="../jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
			<script type="text/javascript" src="../js/bootstrap.min.js"></script>
		
<script type="text/javascript">
document.getElementById('selectPlace').value=place;
document.getElementById('birthdate').value=birth;
</script>
       
</body>
</html>