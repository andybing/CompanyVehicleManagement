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

<title>查看驾驶员信息</title>

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
			<li class="active">查看驾驶员信息</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
			<form action="updateDriver" method="post">
				<table id="sample-table-2"
					class="table table-striped table-bordered table-hover"
					style="width:70%">
					<tr>
						<td>驾驶员ID</td>
						<td><input type="number" name="id" value="${driver.id}" /></td>
						<td>身份证号</td>
						<td><input type="text" name="peopleID"
							value="${driver.peopleID}" /></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input type="text" name="name" value="${driver.name}" /></td>
						<td>性别</td>
						<td><select name="sex">
								<option selected="selected">${driver.sex}</option>
								<option>男</option>
								<option>女</option>
						</select></td>
					</tr>
					<tr>
						<td>出生年月</td>
						<td><input type="date" name="birthday"
							value="${driver.birthday}"></td>

						<td>籍贯</td>
						<td><input type="text" name="place" value="${driver.place}"></td>
					</tr>
					<tr>
						<td>驾证</td>
						<td><select name="kind">
								<option selected="selected">${driver.kind}</option>
								<option>A1</option>
								<option>A2</option>
								<option>B1</option>
								<option>B2</option>
								<option>C1</option>
								<option>C2</option>
						</select></td>


						<td>联系电话</td>
						<td><input type="tel" pattern="^\d{11}$" name="phone"
							value="${driver.phone}"></td>
					</tr>
					<tr>
						<td>状态</td>
						<td><select name="state">
								<option selected="selected">${driver.state}</option>
								<option>空闲</option>
								<option>忙碌</option>
						</select></td>
					</tr>
				</table>
				<input class="btn btn-primary" type="submit" value="提交" /> <input
					class="btn" type="reset" value="重置" />
			</form>
		</center>

	</div>
</body>
</html>
