<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
    <div class="container">
    <form action="" method="POST" id="_form">
        <input type="hidden" id="_method" name="_method"/>
    </form>
    
   <div class="row">
         <div class="col-md-12">
    <% if(request.isUserInRole("ROLE_ADMIN")){ %>
    <a href="${pageContext.request.contextPath}/information/create" class="btn btn-default btn-sm pull-right">新建问题</a>
    <%   }  %>
    </div>
    </div>
    
    <c:if test="${page == null || page.numberOfElements == 0}">
                  没有用户
    </c:if>
	<c:if test="${page != null && page.numberOfElements > 0}">
		<table class="table table-bordered table-striped table-hover">
		 <caption>信息浏览</caption>
			<thead><tr>
              <th>问题</th>
              <th>查看内容</th>
              <% if(request.isUserInRole("ROLE_ADMIN")){ %>
              <th>删除</th>
              <%   }  %>
			</tr></thead>
            <tbody>
			<c:forEach items="${page.content}" var="information">
				<tr>
                    <td>${information.title}</td>
                    <td><a href = "${pageContext.request.contextPath}/information/watch/${information.id}" class="btn btn-info btn-sm" role="button">查看内容</a></td>
                    <% if(request.isUserInRole("ROLE_ADMIN")){ %>
                    <td><a href = "${pageContext.request.contextPath}/information/delete/${information.id}" class="delete btn btn-danger btn-sm" role="button">删除</a>
                    <%   }  %>
                    </td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="4">
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
    
    <div align="center">
    <c:url var="logoutUrl" value="/logout"/>
    <form class="form-inline" action="${logoutUrl}" method="post">
      <input type="submit" value="Log out" />
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    </div>
    </div>
</body>
