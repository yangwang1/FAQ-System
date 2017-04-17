<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

    <form action="registered" method="post">
    <table width="300" height="200" border="0" align="center" >
      <caption align="top">用户注册</caption>
    <tr>
       <td>用&nbsp;户&nbsp;名:</td>
       <td><input type="text" name="username"></td>
    </tr>
    <tr>
       <td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
       <td><input type="password" name="password"></td>
    </tr>
    <tr>
       <td>确认密码:</td>
       <td><input type="password" name="con_password"></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="注册"></td>
    </tr>
    </table>
    </form>

</body>
</html>