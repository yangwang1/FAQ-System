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
	<h1 align="center">智能答疑系统</h1>
	<table align="center" border="0">
	<tr>
	    <td align="center"><a href="information/main">主界面</a></td>
	</tr>
	<tr>
	    <td align="center"><a href="back">后台管理界面</a></td>
	</tr>
	<tr>
	    <td align="center"><a href="queryPage" >查询界面</a></td>
	</tr>
	</table>
	<div align="center">
	<c:url var="logoutUrl" value="/logout"/>
    <form class="form-inline" action="${logoutUrl}" method="post">
      <input type="submit" value="注销" />
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
	</div>
</body>
</html>