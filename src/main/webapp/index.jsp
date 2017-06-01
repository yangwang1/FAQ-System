<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>答疑系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

       <c:url var="logoutUrl" value="/logout"/>
    <form class="form-inline" action="${logoutUrl}" method="post" id="form2">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>

        <form action="${pageContext.request.contextPath}/userCenter" method="GET" id="form1" target="newmain">
       <input type="hidden" name="username" value="${pageContext.request.remoteUser}"/>
       <input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/><!-- CSRF（跨站请求伪造）参数  -->
       </form>
  <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
         <img alt="Cinque Terre" src="${pageContext.request.contextPath}/image/logo2.png" 
         class="img-rounded" style="width: 100%;height: 70px;">
         </div>
     </div>
     <div class="row">
         <div class="col-md-12">
              <nav class="navbar navbar-default" role="navigation">
              <div class="container-fluid">
              <div class="navbar-header">
                <a class="navbar-brand" href="#">答疑系统</a>
              </div>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> ${pageContext.request.remoteUser}</a></li>
                <li><a href="#" onclick="document.getElementById('form2').submit();"><span class="glyphicon glyphicon-log-in"></span> 注销</a></li>
              </ul>
              </div>
             </nav>
          </div>
     </div>
     <div class="row">
         <div class="col-md-3" style="max-height: 500px">
             <ul class="nav nav-pills nav-stacked" style="max-width: 260px;">
	            <li class="active"><a href="Home/home" target="newmain">首页</a></li>
	            <li><a href="information/main" target="newmain">信息浏览</a></li>
	            <li><a href="queryPage" target="newmain">答疑查询</a></li>
	            <li><a href="ask/ask" target="newmain">学生提问</a></li>
	            <% if(request.isUserInRole("ROLE_ADMIN")||request.isUserInRole("ROLE_TEACHER")){ %>
	            <li><a href="answer/answer" target="newmain">教师答疑</a></li>
	            <%} %>
	            <li><a href="#" onclick="document.getElementById('form1').submit();">用户中心</a></li>
	            <% if(request.isUserInRole("ROLE_ADMIN")){ %>
	            <li><a href="back" target="newmain">后台管理</a></li>
	            <%} %>
	            <% if(request.isUserInRole("ROLE_ADMIN")||request.isUserInRole("ROLE_TEACHER")){ %>
	            <li><a href="announce/getAll" target="newmain">公告管理</a></li>
	            <%} %>
	            <li><a href="${pageContext.request.contextPath}/image/1303霍甜甜.docx" target="newmain">资源下载</a></li>
             </ul>
         </div>
         <div class="col-md-9">
			    <iframe style="width: 99%; height: 400px; border: 0;" name="newmain" src="Home/home">
				</iframe>
         </div>
     </div>
 </div>  
</body>
</html>