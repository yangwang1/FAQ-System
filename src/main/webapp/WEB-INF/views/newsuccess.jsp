<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}
#footer {  
position: absolute;  
bottom: 0;  
padding: 10px 0;  
background-color: #AAA;  
width: 100%;  
}  
</style>
<title>智能答疑系统</title>
</head>
<body>
	<div>
		<h1>智能答疑系统</h1>
		<div style="float: right;margin-top: -70px;margin-right: 10px">
		    zhangsan 
			<input type="button" value="注销">
		</div>
	</div>
	<table style="width: 14%; float: left;" border="0">
		<tr>
			<td><a href="information/main" target="newmain">主界面</a></td>
		</tr>
		<tr>
			<td><a href="back" target="newmain">后台管理界面</a></td>
		</tr>
		<tr>
			<td><a href="queryPage" target="newmain">查询界面</a></td>
		</tr>

	</table>
	<table style="width: 84%; height: 100%; float: right;" border="0">
		<tr>
			<td><iframe style="width: 99%; height: 100%;" name="newmain">
				</iframe></td>
		</tr>
	</table>

<div style="margin-bottom: 10px;">
     <img alt="" src="#">
</div>
</body>
</html>