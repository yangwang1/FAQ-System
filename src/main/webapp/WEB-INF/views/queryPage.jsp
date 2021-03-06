<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
	$(function(){
		$("#title").change(function(){
			var val = $(this).val();
			val = $.trim(val);
			$(this).val(val);
			
			var url = "${pageContext.request.contextPath }/getTitle";
			var args = {"title":val,"date":new Date()};
			
			$.post(url, args, function(data){
				
			});
		});
	})
</script>
</head>
<body>
     <form action="" method="POST" id="_form">
        <input type="hidden" id="_method" name="_method"/>
    </form>
    <div class="container-fluid">
     <div class="row">
         <div class="col-md-12">
         
 <nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
	<div class="navbar-header">
		<a class="navbar-brand" href="#">问题答疑</a>
	</div>
	<div>
		<form class="navbar-form navbar-left" role="search" 
		action="${pageContext.request.contextPath}/query/query" method="get">
			<div class="form-group">
			<c:if test="${empty title}">
				<input type="text" name="title" id="title" class="form-control" placeholder="请输入" size="70px">
			</c:if>
			<c:if test="${not empty title}">
			    <input type="text" name="title" id="title" class="form-control" value="${title }" size="70px">
			</c:if>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>
	</div>
	</div>
</nav>
</div>
</div>
      
      <div class="row">
         <div class="col-md-12">
         <c:if test="${empty informations}">
         <strong>常见问题：</strong><br>
         <p class="text-primary">Java的三大特性是什么？</p>
         <p class="text-primary">Java容易学吗？</p>
         <p class="text-primary">为什么我照着书上写的代码会报错？</p>
         <p class="text-primary">java和c++哪个用的多？</p>
         <p class="text-primary">什么是FAQ？</p>
         <p class="text-primary">Scanf常见错误</p>
         <p class="text-primary">在编译器提示出错的语句中，我找不着错误，该怎么办？</p>
         <p class="text-primary">我在Web页面上可以运行一个有用的程序，我能脱离浏览器独立运行它吗？</p>
         <p class="text-primary">我的计算机在网页中运行java程序，是否会带来病毒？</p>
         <p class="text-primary">所有传递给应用程序的参数都必须是字符串吗？</p>
         </c:if>
      
         <c:if test="${not empty informations}">
         <table class="table table-bordered table-striped table-hover">
		    <caption>搜索结果</caption>
			<thead><tr>
              <th>问题</th>
              <th>查看内容</th>
              <% if(request.isUserInRole("ROLE_ADMIN")){ %>
              <th>删除</th>
              <%   }  %>
			</tr></thead>
            <tbody>
			<c:forEach items="${informations }" var="information">
				<tr>
                    <td>${information.title.title}</td>
                    <td><a href = "${pageContext.request.contextPath}/information/watch/${information.id}" class="btn btn-info btn-sm" role="button">查看内容</a></td>
                    <% if(request.isUserInRole("ROLE_ADMIN")){ %>
                    <td><a href = "${pageContext.request.contextPath}/information/delete/${information.id}" class="delete btn btn-danger btn-sm" role="button">删除</a>
                    <%   }  %>
                    </td>
				</tr>
			</c:forEach>
            </tbody>
		</table>
         </c:if>
      </div>
     </div>
</div>
</body>
</html>