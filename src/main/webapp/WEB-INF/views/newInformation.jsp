<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/information/save" method="post">
        <table width="300" height="200" border="0" align="center" >
      <caption align="top">新建问题</caption>
    <tr>
       <td>问题:</td>
       <td><input type="text" name="title" id="title"></td>
    </tr>
    <tr>
       <td>内容:</td>
       <td><input type="text" name="content" height="100" width="200"></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="新建"></td>
    </tr>
    </table>
    </form>
</body>
</html>