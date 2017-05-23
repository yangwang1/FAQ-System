<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录过期</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

    <table align="center" border="0">
         <tr>
         <td><p class="text-warning">登录已过期，请重新登录</p></td>
         </tr>
         <tr>
         <td align="center"><a href="login" class="btn btn-default btn-sm">登录</a></td>
         </tr>
     </table>
</body>
</html>