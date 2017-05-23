<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".delete").click(function() {
			var label = $(this).next(":hidden").val();
			var flag = confirm("确定要删除" + label + "的信息吗？");
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
    <form action="" method="POST" id="_form">
        <input type="hidden" id="_method" name="_method"/>
    </form>
<div class="container-fluid">
<div class="row">
         <div class="col-md-12">

    <c:if test="${page == null || page.numberOfElements == 0}">
                  没有用户
    </c:if>
	<c:if test="${page != null && page.numberOfElements > 0}">
		<table class="table table-bordered table-striped table-hover">
		<caption>用户表</caption>
			<thead><tr>
              <th>用户名</th>
              <th>密码</th>
              <th>邮箱</th>
              <th>是否可用</th>
              <th>权限类型</th>
              <th>修改</th>
              <th>删除</th>
			</tr></thead>
             <tbody>
			<c:forEach items="${page.content}" var="user">
				<tr>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.mailbox}</td>
                     <td>${user.enabled}</td>
                     <td>${user.userrole.rolename}</td>
                     <td><a href = "${pageContext.request.contextPath}/update/${user.id}" class="btn btn-primary btn-sm" role="button">修改</a></td>
                     <td><a href = "${pageContext.request.contextPath}/delete/${user.id}" class="delete btn btn-danger btn-sm" role="button">删除</a>
                     <input type="hidden" value="${user.username}"/></td>
				</tr>
			</c:forEach>
            
			<tr>
				<td colspan="8">
				共${page.totalElements}条记录
				 共${page.totalPages}页
				当前${page.number + 1}页
				<a href="?pageNo=${page.number + 1 - 1}">上一页</a>
				<a href="?pageNo=${page.number + 1 + 1}">下一页</a>
				</td>
			</tr>
          </tbody>
		</table>
	</c:if>
	</div>
	</div>
</div>
</body>
</html>