<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container">
   <div class="row">
         <div class="col-md-12">
    <form action="${pageContext.request.contextPath}/information/save" method="post" role="form">
        <table width="400" height="200" border="0" align="center" >
      <caption align="top">新建问题</caption>
    <tr>
       <td><label for="title">问题</label></td>
       <td><input type="text" name="title" id="title" class="form-control"></td>
    </tr>
    <tr>
       <td><label for="content">内容</label></td>
       <td><textarea name = "content" id="content" class="form-control" rows="3" placeholder="输入内容"></textarea></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="新建" class="btn btn-default btn-sm"></td>
    </tr>
    </table>
    </form>
    </div>
    </div>
    </div>
</body>
</html>