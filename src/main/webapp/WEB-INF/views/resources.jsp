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
    <c:if test="${page == null || page.numberOfElements == 0}">
                 没有资源
    </c:if>
	<c:if test="${page != null && page.numberOfElements > 0}">
		<table class="table table-striped table-hover">
		 <caption>资料列表</caption>
			<thead><tr>
              <th>资料名</th>
              <th>下载</th>
			</tr></thead>
            <tbody>
			<c:forEach items="${page.content}" var="resources">
				<tr>
                    <td>${resources.name}</td>
                    <td><a href = "${resources.src}" class="btn btn-info btn-sm" role="button">下载</a></td>
                    </td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="2">
				第${page.number + 1}页
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
