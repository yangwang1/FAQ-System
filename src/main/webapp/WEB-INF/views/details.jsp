<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
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
      <table border="0" cellpadding="4" cellspacing="0" align="center">
			<tr>
			  <th>id</th>
              <th>${information.id}</th>
			</tr>
			<tr>
			  <th>问题</th>
              <th>${information.title}</th>
			</tr>
			<tr>
			  <th>答案</th>
              <th>${information.content}</th>
			</tr>
		</table>
		
		<% if(request.isUserInRole("ROLE_ADMIN")){ %>
		<div align="center">
		  <a href="${pageContext.request.contextPath}/information/get/${information.id}">修改</a>
		  <a href="${pageContext.request.contextPath}/information/delete/${information.id}" class="delete">删除</a>
		</div>
		<% } %>
		
		<div align="center">
		    <form action="${pageContext.request.contextPath}/reply/save" method="post">
		     <input type="text" name="content"/>
		     <input type="hidden" name="replyName" value="${pageContext.request.remoteUser}"/>
		     <input type="hidden" name="id" value="${information.id }"/>
		     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		     <input type="submit" value="评论">
		    </form>
		</div>
		
		<div align="center">
		<c:forEach items="${information.reply }" var="reply">
		回复人：&nbsp;${reply.replyName }
		回复时间：&nbsp;${reply.replyTime }
		<br>
		回复内容：&nbsp;${reply.content }
		<br>
		</c:forEach>
		</div>

</body>
</html>