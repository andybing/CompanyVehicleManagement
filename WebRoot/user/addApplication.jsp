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
			<li><i class="icon-home home-icon"></i> <a href="#">车辆申请</a></li>
			<li class="active">填写申请单</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
			<form action="addApplicaton" method="post">
				<table id="sample-table-2"
					class="table table-striped table-bordered table-hover"
					style="width:70%">
					<tr>
						<td>员工号</td>
						<td>${userSession.id}<input type="hidden" name="user_id"
							value="${userSession.id}"></td>
						<td>车牌号</td>
						<td>${vid}<input type="hidden" name="car_id"
							value="${vid}"></td>
					</tr>
					<tr>
						<td>开始时间</td>
						<td><input type="date" name="beginday"
							></td>
							<td>结束时间</td>
						<td><input type="date" name="endday"
							></td>
					</tr>
					<tr>
					<td>驾驶员</td>
						<td><select name="driver_id">
						<c:forEach items="${driverList}" var="driver">
						<option value="${driver.id}">${driver.name}&nbsp;&nbsp;${driver.kind}</option>
						</c:forEach>
						</select></td>
						<td>申请理由</td>
						<td><textarea rows="3" cols="25" name="reason"></textarea></td>
					</tr>
				
				</table>
				<input class="btn btn-primary" type="submit" value="提交" /> <input
					class="btn" type="button" value="返回" onclick="history.go(-1)" />
			</form>
		</center>

	</div>
</body>
</html>
