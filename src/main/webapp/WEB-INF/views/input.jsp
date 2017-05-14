<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

    <c:set value="${pageContext.request.contextPath}/save" var="url"></c:set>
    <c:if test="${user.id != null }">
    <c:set value="${pageContext.request.contextPath}/save/${user.id}" var="url"></c:set>
    </c:if>
    <form:form action="${url }" method="POST" modelAttribute="user">
      
      <c:if test="${user.id != null }">
         <input type="hidden" id = "_oldUsername" value="${user.username}">
         <form:hidden path="id"/>
         <input type="hidden" name="_method" value="PUT"/> 
      </c:if>
    
    <table width="300" height="200" border="0" align="center" >
      <caption align="top"></caption>
    <tr>
       <td>用&nbsp;户&nbsp;名:</td>
       <td><form:input path="username" id="username"/></td>
    </tr>
    <tr>
       <td>密&nbsp;&nbsp;&nbsp;码:</td>
       <td><form:input path="password"/></td>
    </tr>
    <tr>
       <td>邮&nbsp;&nbsp;&nbsp;箱:</td>
       <td><form:input path="mailbox"/></td>
    </tr>
    <tr>
       <td><input type="hidden" 
            name="${_csrf.parameterName}"
            value="${_csrf.token}"/></td><!-- CSRF（跨站请求伪造）参数  -->
    </tr>
    <tr>
       <td colspan="2" align="center"><input type="submit" value="修改"></td>
    </tr>
    </table>
    </form:form>

</body>
</html>