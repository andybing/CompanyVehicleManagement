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

<title>查看借阅详细</title>

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
			<li><i class="icon-home home-icon"></i> <a href="#">车辆申请</a></li>

		
			<li class="active">查看借阅</li>
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
					<td>申请人ID</td>
					<td>${VRecord.user_id}</td>
					<td>车辆ID</td>
					<td>${VRecord.car_id}</td>
				</tr>
				<tr>
					<td>开始时间</td>
					<td>${VRecord.beginday}</td>
					<td>结束时间</td>
					<td>${VRecord.endday}</td>
				</tr>
				<tr>
					<td>驾驶员ID</td>
					<td>${VRecord.driver_id}</td>
					<td>申请蛋ID</td>					
					<td>${VRecord.application_id}</td>
				</tr>
				<tr>
					<td>是否归还</td>
					<td>${VRecord.isreturn}</td>
					<td>归还日期</td>					
					<td>${VRecord.returnday}</td>
				</tr>
				<tr>
					<td>花费</td>
					<td>${VRecord.cost}</td>
					<td>异常记录</td>					
					<td>${VRecord.notes}</td>
				</tr>
				
			</table>
			
			<input class="btn" type="button" value="返回" onclick="history.go(-1)" />
			</form>
		</center>

	</div>
</body>
</html>
