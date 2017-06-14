<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提问成功</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container-fluid">
     <div class="row">
        
         <div class="col-md-12" align="center" style="width: 800px;">
            <h3 class="text-primary" align="center">提问成功，请等待老师回答</h3>
        </div>
   
   </div>
   <div class="row">
   <div class="col-md-12">
   <c:if test="${empty page.content}">
          <h3 class="text-primary" align="center">系统中无类似问题</h3>
   </c:if>
            <c:if test="${not empty page.content}">
         <table class="table table-bordered table-striped table-hover">
		    <caption>系统中相似问题如下</caption>
			<thead><tr>
              <th>问题</th>
              <th>查看内容</th>
			</tr></thead>
            <tbody>
			<c:forEach items="${page.content }" var="information">
				<tr>
                    <td>${information.title.title}</td>
                    <td><a href = "${pageContext.request.contextPath}/information/watch/${information.id}" class="btn btn-info btn-sm" role="button">查看内容</a></td>
				</tr>
			</c:forEach>
			    <tr>
				<td colspan="4">
				第${page.number + 1}页
				<a href="?pageNo=${page.number + 1 - 1}&&title=${title}">上一页</a>
				<a href="?pageNo=${page.number + 1 + 1}&&title=${title}">下一页</a>
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