<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生提问</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
<div class="row">

      <div class="col-md-12" style="width: 90%; height: 40;">
      <form role="form" action="${pageContext.request.contextPath}/ask/question" method="post" >
         <div class="form-group">
           <label for="name" class="text-info">提问</label>
            <textarea class="form-control" name="title" rows="3" placeholder="请输入问题"></textarea>
         </div>
         <div align="center">
           <input type="hidden" name="username" value="${pageContext.request.remoteUser}"/>
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
           <input type="submit" value="提问" class="btn btn-default btn-sm">
         </div>
      </form> 
      </div>
      
 </div>
</div>
</body>
</html>