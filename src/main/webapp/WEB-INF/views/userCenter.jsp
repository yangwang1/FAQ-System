<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户中心</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
         
<table class="table table-striped">
  <caption>个人信息</caption>
  <tbody>
    <tr>
      <td>用户名</td>
      <td>${user.username}</td>
    </tr>
    <tr>
      <td>密码</td>
      <td>${user.password}</td>
    </tr>
    <tr>
      <td>邮箱</td>
      <td>${user.mailbox}</td>
    </tr>
  </tbody>
</table>

         </div>
     </div>
     
     <div class="row">
         <div class="col-md-12">
      <form action="${pageContext.request.contextPath}/PersonalInformation" method="POST" >
       <input type="hidden" name="username" value="${pageContext.request.remoteUser}"/>
       <input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/><!-- CSRF（跨站请求伪造）参数  -->
       <input type="submit" value="修改" class="btn btn-default btn-sm" />
    </form>
</div>
</div>
         
</div>
</body>
</html>