<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>查看用户详细</title>

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
			<li class="active">查看用户详细</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
			<table id="sample-table-2"
				class="table table-striped table-bordered table-hover"
				style="width:70%">
				<tr>
					<td>员工号</td>
					<td>${user.id}</td>
					<td>姓名</td>
					<td>${user.name}</td>
				</tr>
				<tr>
					<td>性别</td>
					<td>${user.sex}</td>
					<td>出生年月</td>
					<td>${user.birthday}</td>
				</tr>
				<tr>
					<td>籍贯</td>
					<td>${user.place}</td>
					<td>所属部门</td>
					<td>${user.department}</td>
				</tr>
				<tr>
					<td>联系电话</td>
					<td>${user.phone}</td>
					<td>电子邮箱</td>
					<td>${user.email}</td>
				</tr>
				<tr>
					<td>权限</td>
					<td>${user.root}</td>
					<td>密码</td>
					<td>${user.pwd}</td>
				</tr>
			</table>
			<input class="btn btn-primary" type="button" value="修改" onclick="window.location.href='viewUser?id=${user.id}&&state=update'" />
					<input  class="btn " type="button" value="返回" onclick="history.go(-1)" />
		</center>

	</div>
</body>
</html>
