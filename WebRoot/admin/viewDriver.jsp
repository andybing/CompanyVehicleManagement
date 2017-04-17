<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>更新驾驶员信息</title>

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
select {
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
			<li><i class="icon-home home-icon"></i> <a href="#">基础信息管理</a></li>

			<li><a href="#">驾驶员管理</a></li>
			<li class="active">更新驾驶员信息</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
				<table id="sample-table-2"
					class="table table-striped table-bordered table-hover"
					style="width:70%">
					<tr>
						<td>驾驶员ID</td>
						<td>${driver.id}</td>
						<td>身份证号</td>
						<td>${driver.peopleID}</td>
					</tr>
					<tr>
						<td>姓名</td>
						<td>${driver.name}</td>
						<td>性别</td>
						<td>${driver.sex}</td>
					</tr>
					<tr>
						<td>出生年月</td>
						<td>${driver.birthday}</td>
						<td>籍贯</td>
						<td>${driver.place}</td>
					</tr>
					<tr>
						<td>驾证</td>
						<td>${driver.kind}</td>
						<td>联系电话</td>
						<td>${driver.phone}</td>
					</tr>
					<tr>
						<td>状态</td>
						<td>${driver.state}</td>
					</tr>
				</table>
				<input class="btn btn-primary" type="button" value="修改"
					onclick="window.location.href='viewDriver?id=${driver.id}&&state=update'" />
				<input class="btn " type="button" value="返回"
					onclick="history.go(-1)" />
		</center>

	</div>
</body>
</html>
