<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>系统界面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    
  <div class="container">
     <div class="row">
         <div class="col-md-12">
         <img alt="Cinque Terre" src="${pageContext.request.contextPath}/image/top.png" class="img-responsive">
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
                <li><a href="register" target="newmain"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                <li><a href="login" target="newmain"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
              </ul>
              </div>
             </nav>
          </div>
     </div>
     <div class="row">
         <div class="col-md-3" style="max-height: 500px">
             <ul class="nav nav-pills nav-stacked" style="max-width: 260px;">
	            <li class="active"><a href="#">首页</a></li>
	            <li><a href="information/main" target="newmain">信息浏览</a></li>
	            <li><a href="queryPage" target="newmain">答疑查询</a></li>
	            <li><a href="back" target="newmain">后台管理</a></li>
	            <li><a href="PersonalInformation" target="newmain" >用户中心</a></li>
             </ul>
         </div>
         <div class="col-md-9">
			    <iframe style="width: 99%; height: 400px; border: 0;" name="newmain">
				</iframe>
         </div>
     </div>
     <div class="row">
         <div class="col-md-12">
         <img alt="" src="#">
         </div>
     </div>
 </div>  
</body>
</html>