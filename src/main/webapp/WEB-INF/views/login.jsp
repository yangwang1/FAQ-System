<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/login.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script language="javascript" type="text/javascript">
	if (top.location != self.location)
		top.location = self.location;
</script>
</head>
<body>
	<div class="page">
		<div class="loginwarrp">
			<div class="logo">用户登陆</div>
			<div class="login_form">
				<c:url value="/login" var="loginUrl" />
				<form action="${loginUrl}" method="post" id="Login" name="Login">
					<!-- 一个POST请求到/login用来验证用户 -->
					<c:if test="${param.error != null}">
						<!-- 如果参数有错误，验证尝试失败  -->
						<p align="center" class="text-danger">用户名或密码不正确,请重新登陆。</p>
					</c:if>
					<c:if test="${param.logout != null}">
						<!-- 如果请求参数logout存在则登出   -->
						<p align="center" class="text-success">您已经注销，请重新登陆。</p>
					</c:if>
					<ul>
						<li class="login-item"><span>用户名：</span> <input type="text"
							name="username" id="username" class="login_input"> <span
							id="count-msg" class="error"></span></li>
						<li class="login-item"><span>密 码：</span> <input
							type="password" id="password" name="password" class="login_input">
							<span id="password-msg" class="error"></span></li>
					</ul>
					<ul style="margin-left: 20px;">
						<li class="login-sub" style="float: left;"><input type="submit" name="Submit"
							value="登录" style="width: 120px;"></li>
							
						<li class="login-sub"><input type="button" name="Reset"
							onclick="window.location.href='register'" value="注册" style="width: 120px;" /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload = function() {
			var config = {
				vx : 4,
				vy : 4,
				height : 2,
				width : 2,
				count : 100,
				color : "121, 162, 185",
				stroke : "100, 200, 180",
				dist : 6000,
				e_dist : 20000,
				max_conn : 10
			}
			CanvasParticle(config);
		}
	</script>
	<script type="text/javascript" src="js/canvas-particle.js"></script>
</body>
</html>