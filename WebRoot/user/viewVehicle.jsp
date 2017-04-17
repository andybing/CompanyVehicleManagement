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

<title>查看车辆详细</title>

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
			<li><i class="icon-home home-icon"></i> <a href="#">基础信息管理</a></li>

			<li><a href="#">车辆管理</a></li>
			<li class="active">查看车辆</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
		<form action="updateVehicle" method="post">
			<table id="sample-table-2"
				class="table table-striped table-bordered table-hover"
				style="width:70%">
				<tr>
					<td>车牌号</td>
					<td>${vehicle.vid}</td>
					<td>生产商</td>
					<td>${vehicle.name}</td>
				</tr>
				<tr>
					<td>型号</td>
					<td>${vehicle.model}</td>
					<td>生产日期</td>
					<td>${vehicle.getday}</td>
				</tr>
				<tr>
					<td>规格</td>
					<td>${vehicle.brand}</td>
					<td>所需驾照类型</td>					
					<td>${vehicle.kind}</td>
				</tr>
				<tr>
					<td>最大载人数</td>
					<td>${vehicle.maxpeople}</td>
					
					<td>状态</td>
					<td>${vehicle.state}</td>
					
				</tr>
			</table>
			
			<input class="btn" type="button" value="返回" onclick="history.go(-1)" />
			</form>
		</center>

	</div>
</body>
</html>
