<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext['request'].contextPath}"/>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>HTTP-${status}</title>
    <link rel="stylesheet" href="${ctx}/webjars/bootstrap/3.3.6/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${ctx}/webjars/jquery/2.2.4/dist/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/webjars/bootstrap/3.3.6/dist/js/bootstrap.min.js"></script>
    <style>
        .container {
            background-color: #FAFAFA;
            text-align: center;
        }

        .number {
            color: #7BBBD6;
            display: inline-block;
            font-size: 128px;
            font-weight: 300;
            letter-spacing: -10px;
            line-height: 128px;
            text-align: right;
        }

        .message {
            display: inline-block;
            margin-left: 40px;
            text-align: left;
        }

        .message .page-error-btn {
            cursor: pointer;
        }

        .message h3 {
            font-weight: 800;
        }

        .details {
            padding-left: 40px;
            text-align: left;
            display: none;
        }
    </style>
    <script type="text/javascript" charset="utf-8">
        var _toggleErrorInfo = function () {
            jQuery('#details').toggle();
            jQuery('#toggleErrorInfo').toggleClass("glyphicon-circle-arrow-down glyphicon-circle-arrow-up");
        }
    </script>
</head>

<body>
<div class="container error-page ">
        <div class="number">
            ${status}
        </div>

        <div class="message">
            <h3>出错啦!</h3>
            <div>
                <c:choose>
                    <c:when test="${status == 500}">
                        无法正常显示页面，发生了服务器内部错误。
                    </c:when>
                    <c:when test="${status == 404}">
                        您访问的页面不存在......
                    </c:when>
                    <c:when test="${status  == 403}">
                        抱歉，您没有权限，请联系管理员......
                    </c:when>
                </c:choose>
                <br/>
                访问时间：<fmt:formatDate value="${timestamp}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
                页面路径：${path} <br/>
                错误信息：${error} <br/>
                提示消息：${fn:escapeXml(message)}<br/>
                <a class="page-error-btn" href="${ctx}"><i class="glyphicon glyphicon-home"
                                                           style="margin-right: 2px;">首页</i></a>
                <a class="page-error-btn" href="javascript:window.history.go(-1)"><i
                        class="glyphicon glyphicon-backward" style="margin-right: 2px;">返回</i></a>
                <a class="page-error-btn" href="javascript:_toggleErrorInfo()">
                    <i id="toggleErrorInfo" class="glyphicon glyphicon-circle-arrow-down"
                       style="margin-right: 2px;"></i>详细信息</a>
            </div>
        </div>

        <div id="details" class="details">
            <div>
                localAddr: ${pageContext.request.localAddr} <br/>
                localName: ${pageContext.request.localName} <br/>
                localPort: ${pageContext.request.localPort} <br/>
                remoteAddr: ${pageContext.request.remoteAddr}<br/>
                remoteHost: ${pageContext.request.remoteHost}<br/>
                remotePort: ${pageContext.request.remotePort}<br/>
                remoteUser: ${pageContext.request.remoteUser}<br/>
            </div>
            <div>
                param:
                <ul>
                    <c:forEach var="item" items="${param.entrySet()}" varStatus="status">
                        <li>${item.key} = ${item.value}</li>
                    </c:forEach>
                </ul>
            </div>
            <div>
                header:
                <ul>
                    <c:forEach var="item" items="${header.entrySet()}" varStatus="status">
                        <li>${item.key} = ${item.value}</li>
                    </c:forEach>
                </ul>
            </div>
            <div>
                exception:
                <div style="padding-left: 10px">
                    <%
                        Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
                        if (exception != null) {
                           exception.printStackTrace(new PrintWriter(out){
                               public void write(String s, int off, int len) {
                                   s = org.apache.taglibs.standard.functions.Functions.escapeXml(s);
                                   super.write(s,off,len);
                               }
                           });
                        }
                    %>
                </div>
            </div>
        </div>
</div>
</body>
</html>