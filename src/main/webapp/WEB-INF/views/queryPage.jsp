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
         <nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<a class="navbar-brand" href="#">问题答疑</a>
	</div>
	<div>
		<form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/query/query" method="get">
			<div class="form-group">
				<input type="text" name="title" class="form-control" placeholder="Search">
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" class="btn btn-default">提交</button>
		</form>
	</div>
	</div>
</nav>
         </div>
      </div>
     </div>
</body>
</html>