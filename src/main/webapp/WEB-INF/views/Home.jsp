<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
<div class="row">

<% if(request.isUserInRole("ROLE_ADMIN")||request.isUserInRole("ROLE_TEACHER")){ %>
         <div class="col-sm-6">
             <c:if test="${titlePage == null || titlePage.numberOfElements == 0}">
                  没有学生提问
    </c:if>
	<c:if test="${titlePage != null && titlePage.numberOfElements > 0}">
		<table class="table table-striped table-hover">
		 <caption>最新学生提问</caption>
            <tbody>
			<c:forEach items="${titlePage.content}" var="information">
				<tr>
                    <td><a href = "${pageContext.request.contextPath}/answer/answerQuestion/${information.id}">
                    ${information.title.title}</a></td>
                    <td>${information.title.time}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="1">
				第${titlePage.number + 1}页
				<a href="?titlePageNo=${titlePage.number + 1 - 1}">上一页</a>
				<a href="?titlePageNo=${titlePage.number + 1 + 1}">下一页</a>
				</td>
			</tr>
          </tbody>
		</table>
	 </c:if>
         </div>
 <%} %>        
 <% if(request.isUserInRole("ROLE_USER")){ %>
              <div class="col-sm-6">
             <c:if test="${contentPage == null || contentPage.numberOfElements == 0}">
                  没有答疑
    </c:if>
	<c:if test="${contentPage != null && contentPage.numberOfElements > 0}">
		<table class="table table-striped table-hover">
		 <caption>最新答疑</caption>
            <tbody>
			<c:forEach items="${contentPage.content}" var="information">
				<tr>
                    <td><a href = "${pageContext.request.contextPath}/information/watch/${information.id}">
                    ${information.title.title}</a></td>
                    <td>${information.title.time}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="1">
				第${contentPage.number + 1}页
				<a href="?contentPageNo=${contentPage.number + 1 - 1}">上一页</a>
				<a href="?contentPageNo=${contentPage.number + 1 + 1}">下一页</a>
				</td>
			</tr>
          </tbody>
		</table>
	 </c:if>
         </div>    
 <%} %>        
         
         <div class="col-sm-6">
             <c:if test="${accouncePage == null || accouncePage.numberOfElements == 0}">
                  没有公告
    </c:if>
	<c:if test="${accouncePage != null && accouncePage.numberOfElements > 0}">
		<table class="table table-striped table-hover">
		 <caption>最新公告</caption>
            <tbody>
			<c:forEach items="${accouncePage.content}" var="accounce">
				<tr>
                    <td><a href = "${pageContext.request.contextPath}/announce/watch/${accounce.id}">${accounce.title}</a></td>
				    <td>${accounce.creatTime}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="1">
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
</html>