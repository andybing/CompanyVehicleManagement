<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加用户</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>
<style type="text/css">
select{
width: 160px;
}
input {
width: 160px;
}
</style>
</head>

<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">系统设置</a></li>

			<li><a href="#">用户管理</a></li>
			<li class="active">添加用户</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
		<form action="addUser" method="post">
			<table id="sample-table-2"
				class="table table-striped table-bordered table-hover"
				style="width:70%">
				<tr>
					<td>员工号</td>
					<td><input type="number" name="id"/></td>
					<td>姓名</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><select name="sex">
					<option selected="selected">${user.sex}</option>
					<option>男</option>
					<option>女</option>
					</select> </td>
					<td>出生年月</td>
					<td><input type="date" name="birthday"></td>
				</tr>
				<tr>
					<td>籍贯</td>
					<td><input  type="text" name="place"></td>
					<td>所属部门</td>
					
					<td><select name="department">
					<c:forEach items="${departmentList}" var="department">
					<option> ${department.name}</option>
					</c:forEach>					
					</select> </td>
				</tr>
				<tr>
					<td>联系电话</td>
					<td><input type="tel" pattern="^\d{11}$" name="phone" ></td>
					<td>电子邮箱</td>
					<td><input type="email" name="email" ></td>
				</tr>
				<tr>
					<td>权限</td>
					<td><select name="root">
			
					<option>管理员</option>
					<option selected="selected">普通用户</option>
					</select></td>
					<td>密码</td>
					<td><input type="text" name="pwd""></td>
				</tr>
			</table>
			<input class="btn btn-primary" type="submit" value="提交" />
			<input class="btn" type="reset" value="重置" />
			</form>
		</center>

	</div>
</body>
</html>
