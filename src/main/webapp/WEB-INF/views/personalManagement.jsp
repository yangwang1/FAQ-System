<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
         <div class="col-sm-12">
         <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">个人中心</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/userCenter?username=${pageContext.request.remoteUser}" 
            target="person">个人信息</a></li>
            <% if(request.isUserInRole("ROLE_USER")){ %>
            <li><a href="${pageContext.request.contextPath}/myAsk?username=${pageContext.request.remoteUser}" target="person">我的提问</a></li>
            <%} %>
            <% if(request.isUserInRole("ROLE_ADMIN")||request.isUserInRole("ROLE_TEACHER")){ %>
            <li><a href="${pageContext.request.contextPath}/myAnswer?username=${pageContext.request.remoteUser}" target="person">我的答疑</a></li>
            <li><a href="${pageContext.request.contextPath}/myAnnounce?username=${pageContext.request.remoteUser}" target="person">发布过的公告</a></li>
            <%} %>
        </ul>
    </div>
    </div>
</nav>
         
</div>
</div>

   <div class="row">
         <div class="col-sm-12">
         <iframe style="width: 99%; height: 400px; border: 0;" name="person" src="${pageContext.request.contextPath}/userCenter?username=${pageContext.request.remoteUser}">
	     </iframe>
    </div>
</div>
</div>
</body>
</html>