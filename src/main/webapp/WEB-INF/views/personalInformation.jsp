<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

   <div class="container">
     <div class="row">
         <div class="col-md-12">
         
      <form:form action="${pageContext.request.contextPath}/update" method="POST" modelAttribute="user" role="form">
         <form:hidden path="id"/>
         <input type="hidden" name="_method" value="PUT"/> 
      <table width="300" height="200" border="0" align="center" >
      <caption align="top"></caption>
    <tr>
       <td><label for="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label></td>
       <td><form:input path="username" id="username" disabled="true" class="form-control"/></td>
    </tr>
    <tr>
       <td><label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label></td>
       <td><form:input path="password" id="password" class="form-control"/></td>
    </tr>
    <tr>
       <td><label for="mailbox">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label></td>
       <td><form:input path="mailbox" id="mailbox" class="form-control"/></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="修改" class="btn btn-default btn-sm"></td>
    </tr>
    </table>
    </form:form>
  </div>
  </div>
  </div>
</body>
</html>