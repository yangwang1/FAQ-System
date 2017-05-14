<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
     $(function(){
         $("#username").change(function(){
             var val = $(this).val();
             val = $.trim(val);
             $(this).val(val);

             var url = "${pageContext.request.contextPath}/ajaxValidateLastName";
             var args = {"username":val,"date":new Date()};

             $.post(url,args,function(data){
                 if(data == "0"){
                     alert("用户名可用");
                     }else if(data == "1"){
                         alert("用户已存在");
                         }else{
                             alert("网络或程序出错");
                             }
                 });
             });
         })
</script>
</head>
<body>

    <form action="${pageContext.request.contextPath}/registered" method="post">
    <table width="300" height="200" border="0" align="center" >
      <caption align="top">用户注册</caption>
    <tr>
       <td>用&nbsp;户&nbsp;名:</td>
       <td><input type="text" name="username" id="username"></td>
    </tr>
    <tr>
       <td>密&nbsp;&nbsp;&nbsp;码:</td>
       <td><input type="password" name="password"></td>
    </tr>
    <tr>
       <td>确认密码&nbsp;:</td>
       <td><input type="password" name="con_password"></td>
    </tr>
    <tr>
       <td>邮&nbsp;&nbsp;&nbsp;箱:</td>
       <td><input type="text" name="mailbox"></td>
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