<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1 align="center">欢迎来到主界面。</h1>
    <div align="center">
    <form action="${pageContext.request.contextPath}/PersonalInformation" method="POST" >
       <input type="hidden" name="username" value="${pageContext.request.remoteUser}"/>
       <input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/><!-- CSRF（跨站请求伪造）参数  -->
       <input type="submit" value="个人信息"/>
    </form>
    </div>
    <div align="center">
    <c:url var="logoutUrl" value="/logout"/>
    <form class="form-inline" action="${logoutUrl}" method="post">
      <input type="submit" value="Log out" />
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    </div>
</body>
</html>