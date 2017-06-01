<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回答问题</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
         <div class="col-md-12">
     <form:form action="${pageContext.request.contextPath}/answer/save/${information.id}" method="POST" modelAttribute="information">
         <form:hidden path="id"/>
<!--          <input type="hidden" name="_method" value="PUT"/>  -->
    
    
    <table width="300" height="200" border="0" align="center" >
      <caption align="top"></caption>
    <tr>
       <td>问题:</td>
       <td><form:input path="title.title" id="title" disabled="true" class="form-control"/></td>
    </tr>
    <tr>
       <td>答案:</td>
       <td><form:textarea path="content.content" class="form-control"/></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
       <td><input type="hidden" name="username" value="${pageContext.request.remoteUser}"></td>
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="提交"></td>
    </tr>
    </table>
    </form:form>
   </div>
  </div>
</div>
</body>
</html>