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
</head>
<body>
    <h1 align="center">欢迎来到主界面。</h1>
    
    <div align="center">
    <form action="${pageContext.request.contextPath}/PersonalInformation" method="POST" >
       <input type="hidden" name="username" value="${pageContext.request.remoteUser}"/>
       <input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/><!-- CSRF（跨站请求伪造）参数  -->
       <input type="submit" value="个人信息"/>
    </form>
    </div>
    
    <% if(request.isUserInRole("ROLE_ADMIN")){ %>
    <div align="center"><a href="${pageContext.request.contextPath}/information/create">新建问题</a></div>
    <%   }  %>
    
    <c:if test="${page == null || page.numberOfElements == 0}">
                  没有用户
    </c:if>
	<c:if test="${page != null && page.numberOfElements > 0}">
		<table border="0" cellpadding="4" cellspacing="0" align="center">
			<tr>
			  <th>id</th>
              <th>问题</th>
              <th>查看内容</th>
              <% if(request.isUserInRole("ROLE_ADMIN")){ %>
              <th>删除</th>
              <%   }  %>
			</tr>

			<c:forEach items="${page.content}" var="information">
				<tr>
					<td>${information.id}</td>
                    <td>${information.title}</td>
                    <td><a href = "${pageContext.request.contextPath}/information/watch/${information.id}">查看内容</a></td>
                    <% if(request.isUserInRole("ROLE_ADMIN")){ %>
                    <td><a href = "${pageContext.request.contextPath}/information/delete/${information.id}" class="delete">删除</a>
                    <%   }  %>
                    <input type="hidden" value="${information.title}"/></td>
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

		</table>
	</c:if>
    
    <div align="center">
    <c:url var="logoutUrl" value="/logout"/>
    <form class="form-inline" action="${logoutUrl}" method="post">
      <input type="submit" value="Log out" />
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    </div>
</body>
<%-- <div> username : <sec:authentication property="authorities[0]"/></div> --%>
