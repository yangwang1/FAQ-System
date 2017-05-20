<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <table border="0" cellpadding="4" cellspacing="0" align="center">
			<tr>
			  <th>id</th>
              <th>问题</th>
              <th>查看内容</th>
              <% if(request.isUserInRole("ROLE_ADMIN")){ %>
              <th>删除</th>
              <%   }  %>
			</tr>

			<c:forEach items="${informations }" var="information">
				<tr>
					<td>${information.id}</td>
                    <td>${information.title}</td>
                    <td><a href = "${pageContext.request.contextPath}/information/watch/${information.id}">查看内容</a></td>
                    <% if(request.isUserInRole("ROLE_ADMIN")){ %>
                    <td><a href = "${pageContext.request.contextPath}/information/delete/${information.id}" class="delete">删除</a>
                    <%   }  %>
                    </td>
				</tr>
			</c:forEach>

		</table>
</body>
</html>