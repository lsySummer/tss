<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://www.phpddt.com/usr/themes/dddefault/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
</head>
<script>
jQuery(function(){   
  $("#buttonUpload").click(function(){     
     //加载图标   
     /* $("#loading").ajaxStart(function(){
        $(this).show();
     }).ajaxComplete(function(){
        $(this).hide();
     });*/
      //上传文件
    $.ajaxFileUpload({
        url:'upload.php',//处理图片脚本
        secureuri :false,
        fileElementId :'fileToUpload',//file控件id
        dataType : 'json',
        success : function (data, status){
            if(typeof(data.error) != 'undefined'){
                if(data.error != ''){
                    alert(data.error);
                }else{
                    alert(data.msg);
                }
            }
        },
        error: function(data, status, e){
            alert(e);
        }
})
return false;
  }) 
})
</script>
    <body>
        <input id="fileToUpload" type="file" size="20" name="fileToUpload" class="input">
        <button id="buttonUpload">上传</button>
    </body>
</html>