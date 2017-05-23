<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限不足</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
 <div class="container">
 <div class="row">
         <div class="col-md-12">
       <table align="center" border="0">
         <tr>
         <td><p class="text-warning">无权访问，请重新登录</p></td>
         </tr>
         <tr>
         <td align="center"><a href="login" class="btn btn-default btn-sm">登录</a></td>
         </tr>
       </table>
 </div>
 </div>
 </div>
</body>
</html>