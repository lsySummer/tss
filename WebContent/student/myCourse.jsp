<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ page language="java" import="java.text.SimpleDateFormat"%>
    <%@ page language="java" import="java.util.*"%>
      <%@ page language="java" import="edu.nju.model.Term"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mycss.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/jquery/jquery-1.8.3.min.js"></script>

<style type="text/css">
    /* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
</style>
<script  type="text/javascript">
	function setValue(id,i,k){
		document.getElementById('hiddenCourseId').value=id;
		var signal = document.getElementById('ifAs'+i+'_'+k).value;
		if(signal=='0'){
			document.reqForm.action="<%=request.getContextPath()%>/student/aHomework";
		}else{
			document.reqForm.action="<%=request.getContextPath()%>/student/sHomework";
		}
		return true;
	}
</script>
<title>Insert title here</title>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
	<div class="jumbotron" style="height:130px">
		<h1 style="margin-top:-30px">Teaching Support System</h1>
    </div>
<%String username =(String)request.getAttribute("username");  %>
  <ul class="breadcrumb">
		<li  class="active">
			我的课程
		</li>
		<li class="dropdown" style="float:right">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户信息 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="<%=request.getContextPath()%>/common/info.jsp"><%=username %>
				<img src="<%=request.getContextPath()%>/img/portrait.jpg" style="width:30px;height:30px;margin-top:-5%"></img>
				</a></li>
                <li><a href="<%=request.getContextPath()%>/main/main.jsp">退出登陆</a>  </li>
      
              </ul>
            </li>	
	</ul>
	<div class="row">
	<%int j = 1; %>
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
            <s:iterator value="#request.termList" id='carr'>
                <li><a href="#section-<%=j%>"><s:property value="cterm" /></a></li>
                <%j++; %>
             </s:iterator>  
            </ul>
        </div>
         
        <%List<Term> term = (List<Term>)request.getAttribute("termList"); %>
         <div class="col-xs-9">
          <s:form method="post" name="reqForm">
			<input type="hidden" name="hiddenCourseId" id="hiddenCourseId"/>
         <%int k = 1; %>
           <s:iterator value="#request.carr" id='carr'>
          
            <h2 id="section-<%=k%>"><%=term.get(k-1).getCterm() %></h2>
			<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							课程名
						</th>
						<th>
							教师
						</th>
						<th>
							助教
						</th>
						<th>
							状态
						</th>
					</tr>
				</thead>
				<tbody>
					<%int i = 0; %>
						<s:iterator value="#carr" id='clist'>
						<tr>
							<td><s:property value="#clist.cid" /></td>
							
							<td><a href="javascript:document.reqForm.submit();" onclick="return setValue('<s:property value="#clist.id" />',<%=i%>,<%=k%>);"><s:property value="#clist.cname" /></a></td>
							
							<td><s:property value="#clist.tname" /></td>
							
							<td>
							<s:if test="#clist.aname==#request.username">担任助教
							<input type="hidden" id=<%="ifAs"+i+"_"+k %> value=0>
							</s:if>
							<s:else>
							<input type="hidden" id=<%="ifAs"+i+"_"+k %> value=1>
							<s:property value="#clist.aname" /></s:else>
							</td>
							
							<td>
								<input type="hidden" id=<%="startdate"+i+"_"+k %> value='<s:property value="#clist.startDate" />'/>
								<input type="hidden" id=<%="enddate"+i +"_"+k%> value='<s:property value="#clist.endDate" />'/>
								<input type="text" id=<%="st"+i+"_"+k %> style="border:0;" readonly/>
							</td>
						</tr>
							<script type="text/javascript">
						var startDate = document.getElementById('startdate'+'<%=i%>'+'_'+'<%=k%>').value;
						var endDate = document.getElementById('enddate'+'<%=i%>'+'_'+'<%=k%>').value;
						var myDate = new Date();
						var todaytimes = myDate.getTime();
						
					    var arr = startDate.split(" ");
					    var starttime = new Date(arr[0], arr[1]-1, arr[2]);
					    var starttimes = starttime.getTime();
					   
					    var arrs = endDate.split(" ");
					    var endtime = new Date(arrs[0], arrs[1]-1, arrs[2]);
					    var endtimes = endtime.getTime();
						if(todaytimes>=starttimes&&todaytimes<=endtimes){
							document.getElementById('st'+'<%=i%>'+'_'+'<%=k%>').value='开设中';
						
						}else if(todaytimes>endtimes){
							document.getElementById('st'+'<%=i%>'+'_'+'<%=k%>').value='已关闭';
						}else{
							document.getElementById('st'+'<%=i%>'+'_'+'<%=k%>').value='未开始';
							
						}
						</script>
					<%i++; %>
						</s:iterator>
				</tbody>
			</table>
			<hr>
			 <%k++; %>
			 </s:iterator>  
			   </s:form>
        </div>
    </div>
</div>
	
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
	
</body>
</html>