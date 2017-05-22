<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
 <div class="container">
     <div class="row">
         <div class="col-md-12">

<c:url value="/login" var="loginUrl"/>
    <form action="${loginUrl}" method="post" role="form">   <!-- 一个POST请求到/login用来验证用户 -->
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
        <table align="center" border="0" width="250" height="100">
            <tr>
            <td><label for="username">用户名</label></td>
            <td><input type="text" id="username" name="username" class="form-control"/></td><!-- 登录名参数必须被命名为username  -->
            </tr>
            <tr>
            <td><label for="password">密码</label></td>
            <td><input type="password" id="password" name="password" class="form-control"/></td><!-- 密码参数必须被命名为password  -->  
            </tr>
            <tr>
            <td align="right"><input id="remember_me" name="remember_me" type="checkbox"/></td>
            <td align="left"><label for="remember_me" class="inline">记住密码</label></td>
            </tr>
            <tr>
            <td>
              <input type="hidden" 
                 name="${_csrf.parameterName}"
                 value="${_csrf.token}"/><!-- CSRF（跨站请求伪造）参数  -->
            </td>
            </tr>
            <tr>
                <td><button type="submit" class="btn btn-default btn-sm">登录</button></td>
                <td><button type="button" onclick="window.location.href='register'" class="btn btn-default btn-sm">注册</button>
            </tr>
        </table>
    </form>
</div>
</div>
</div>
</body>
</html>