<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告详情</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".delete").click(function() {
			var flag = confirm("确定要删除吗？");
			if (flag) {
				var url = $(this).attr("href");

				$("#_form").attr("action",url);
				$("#_method").val("GET");
				$("#_form").submit();
			}
			return false;
		});
	});
</script>
</head>
<body>
<div class="container-fluid">

      <form action="" method="POST" id="_form">
        <input type="hidden" id="_method" name="_method"/>
        <input type="hidden" name = "id" value="${announcement.id}"/>
    </form>
    <div class="row">
         <div class="col-md-12">
         <div class="panel panel-success">
         <div class="panel-heading">
          <h3 class="panel-title">${announcement.title}</h3>
          </div>
          <div class="panel-body" style="width: 99%; height: 200px;">
          ${announcement.content}
          </div>
          </div>
		</div>
	</div>
		
	<div class="row">
    <div class="col-md-12">	
		<% if(request.isUserInRole("ROLE_ADMIN")){ %>
		<div align="center">
		  <a href="${pageContext.request.contextPath}/announce/delete/${announcement.id}" class="delete btn btn-danger btn-sm pull-right" role="button">删除</a>
		  <a href="${pageContext.request.contextPath}/announce/update/${announcement.id}" class="btn btn-info btn-sm pull-right" role="button">修改</a>
		</div>
		<% } %>
	</div>
	</div>
	
</div>
</body>
</html>