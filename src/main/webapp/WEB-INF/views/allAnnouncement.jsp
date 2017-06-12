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
    <div class="container-fluid">
    <form action="" method="POST" id="_form">
        <input type="hidden" id="_method" name="_method"/>
    </form>
    
   <div class="row">
         <div class="col-md-12">
    <% if(request.isUserInRole("ROLE_ADMIN")||request.isUserInRole("ROLE_TEACHER")){ %>
    <a href="${pageContext.request.contextPath}/announce/announce" class="btn btn-default btn-sm pull-right">发布公告</a>
    <%   }  %>
    </div>
    </div>
    
    <div class="row">
    <div class="col-md-12">
    <c:if test="${accouncePage == null || accouncePage.numberOfElements == 0}">
                 没有公告
    </c:if>
	<c:if test="${accouncePage != null && accouncePage.numberOfElements > 0}">
		<table class="table table-bordered table-striped table-hover">
		 <caption>公告列表</caption>
			<thead><tr>
              <th>公告标题</th>
              <th>查看内容</th>
              <% if(request.isUserInRole("ROLE_ADMIN")||request.isUserInRole("ROLE_TEACHER")){ %>
              <th>删除</th>
              <%   }  %>
			</tr></thead>
            <tbody>
			<c:forEach items="${accouncePage.content}" var="announce">
				<tr>
                    <td>${announce.title}</td>
                    <td><a href = "${pageContext.request.contextPath}/announce/get/${announce.id}" class="btn btn-info btn-sm" role="button">查看内容</a></td>
                    <% if(request.isUserInRole("ROLE_ADMIN")||request.isUserInRole("ROLE_TEACHER")){ %>
                    <td><a href = "${pageContext.request.contextPath}/announce/delete/${announce.id}" class="delete btn btn-danger btn-sm" role="button">删除</a>
                    <%   }  %>
                    </td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="3">
				第${accouncePage.number + 1}页
				<a href="?accouncePageNo=${accouncePage.number + 1 - 1}">上一页</a>
				<a href="?accouncePageNo=${accouncePage.number + 1 + 1}">下一页</a>
				</td>
			</tr>
          </tbody>
		</table>
	</c:if>
   </div>
   </div>
    </div>
</body>
