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

<title>填写还车信息</title>

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
				ace.settings.check('breadcrumbs', 'fixed');
			} catch (e) {
			}
		</script>

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">用车申请</a></li>

			<li class="active">归还车辆</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
			<form action="addReturnCar" method="post">
				<table id="sample-table-2"
					class="table table-striped table-bordered table-hover"
					style="width:70%">
					<tr>
					<td>记录单号</td>
					<td>${record.id}<input type="hidden" name="id" value="${record.id}" /></td>
					<td>申请单ID</td>
					<td>${record.application_id}<input type="hidden" name="application_id" value="${record.application_id}" /></td>
					</tr>
					<tr>
					<td>用户ID</td>
					<td>${record.user_id}<input type="hidden" name="user_id" value="${record.user_id}" /></td>
					<td>车辆ID</td>
					<td>${record.car_id}<input type="hidden" name="car_id" value="${record.car_id}" /></td>
					</tr>
					<tr>
					<td>驾驶员ID</td>
					<td>${record.driver_id}<input type="hidden" name="driver_id" value="${record.driver_id}" /></td>
					<td>开始时间</td>
					<td>${record.beginday}<input type="hidden" name="beginday" value="${record.beginday}" /></td>
					</tr>
					<tr>
					<td>结束时间</td>
					<td>${record.endday}<input type="hidden" name="endday" value="${record.endday}" /></td>
					<td>是否归还</td>
					<td><select name="isreturn">
					<option selected="selected">${record.isreturn}</option>
					<option>是</option>
					<option>否</option>
					</select></td>
					</tr>
					<tr>
					<td>归还时间</td>
					<td><input type="date" name="returnday" value="${record.returnday}"></td>
					<td>花费</td>
					<td><input type="number" name="cost" value="${record.cost}"></td>
					</tr>
					<tr>
					<td>异常记录</td>
					<td><textarea rows="3" cols="25" name="notes" value="${record.notes}" ></textarea></td></tr>
				
				</table>
				<input class="btn btn-primary" type="submit" value="提交" /> <input
					class="btn" type="reset" value="重置" />
			</form>
		</center>

	</div>
</body>
</html>
