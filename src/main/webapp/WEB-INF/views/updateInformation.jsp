<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
     <form:form action="${pageContext.request.contextPath}/information/save/${information.id}" method="POST" modelAttribute="information">
         <form:hidden path="id"/>
         <input type="hidden" name="_method" value="PUT"/> 
    
    <table width="300" height="200" border="0" align="center" >
      <caption align="top"></caption>
    <tr>
       <td>问题:</td>
       <td><form:input path="title" id="username" disabled="true"/></td>
    </tr>
    <tr>
       <td>答案:</td>
       <td><form:input path="content"/></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="修改"></td>
    </tr>
    </table>
    </form:form>
</body>
</html>