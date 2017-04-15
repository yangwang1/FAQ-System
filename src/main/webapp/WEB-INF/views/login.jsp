<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:url value="/login" var="loginUrl"/>
    <form action="${loginUrl}" method="post">   <!-- 一个POST请求到/login用来验证用户 -->
        <c:if test="${param.error != null}">     <!-- 如果参数有错误，验证尝试失败  -->
            <p>
                Invalid username and password.
            </p>
        </c:if>
        <c:if test="${param.logout != null}">    <!-- 如果请求参数logout存在则登出   -->
            <p>
                You have been logged out.
            </p>
        </c:if>
        <p>
            <label for="username">Username</label>
            <input type="text" id="username" name="username"/><!-- 登录名参数必须被命名为username  -->
        </p>
        <p>
            <label for="password">Password</label>
            <input type="password" id="password" name="password"/><!-- 密码参数必须被命名为password  -->  
        </p>
        <p>
            <input id="remember_me" name="remember_me" type="checkbox"/>
            <label for="remember_me" class="inline">Remember me</label>
        </p>
        <input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/><!-- CSRF（跨站请求伪造）参数  -->
        <button type="submit" class="btn">Log in</button>
    </form>

</body>
</html>