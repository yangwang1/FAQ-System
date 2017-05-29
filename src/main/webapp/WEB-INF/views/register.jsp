<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">  
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#username").change(function(){
			var val = $(this).val();
			val = $.trim(val);
			$(this).val(val);
			
			var url = "${pageContext.request.contextPath }/ajaxValidateUsername";
			var args = {"username":val,"date":new Date()};
			
			$.post(url, args, function(data){
				if(data == "0"){
					alert("用户名可用!");
				}else if(data == "1"){
					alert("用户名不可用!");
				}else{
					alert("网络或程序出错. ");
				}
			});
		});
	})
</script>

</head>
<body>
   <div class="container">
     <div class="row">
         <div class="col-md-12">

    <form action="${pageContext.request.contextPath}/registered" method="post" role="form">
    <table width="300" height="200" border="0" align="center" >
      <tbody>
    <tr>
       <td><label for="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label></td>
       <td><input type="text" name="username" id="username" class="form-control" placeholder="输入用户名"></td>
    </tr>
    <tr>
       <td><label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label></td>
       <td><input type="password" name="password" id="password" class="form-control" placeholder="输入密码"></td>
    </tr>
    <tr>
       <td><label for="con_password">确认密码</label></td>
       <td><input type="password" name="con_password" id="con_password" class="form-control" placeholder="再次输入"></td>
    </tr>
    <tr>
       <td><label for="mailbox">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label></td>
       <td><input type="text" name="mailbox" id="mailbox" class="form-control" placeholder="输入邮箱"></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="注册" class="btn btn-default btn-sm"></td>
    </tr>
      </tbody>
    </table>
    </form>
</div>
</div>
</div>
</body>
</html>