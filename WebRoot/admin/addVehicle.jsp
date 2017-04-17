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

<title>添加车辆</title>

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

			<li><a href="#">车辆管理</a></li>
			<li class="active">添加车辆</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
		<form action="addVehicle" method="post">
			<table id="sample-table-2"
				class="table table-striped table-bordered table-hover"
				style="width:70%">
				<tr>
					<td>车牌号</td>
					<td><input type="text" name="vid"/></td>
					<td>生产商</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>型号</td>
					<td><input type="text" name="model" /></td>
					<td>生产日期</td>
					<td><input type="date" name="getday"></td>
				</tr>
				<tr>
					<td>规格</td>
					<td><input  type="text" name="brand"></td>
					<td>所需驾证类型</td>
					
					<td><select name="kind">	
					<option>A1</option>
					<option>A2</option>
					<option>B1</option>
					<option>B2</option>
					<option>C1</option>
					<option>C2</option>									
					</select> </td>
				</tr>
				<tr>
					<td>最大载人数</td>
					<td><input type="number"  name="maxpeople" ></td>
					
					<td>状态</td>
					<td><select name="state">
					<option>不可用</option>
					<option>正在使用</option>
					<option selected="selected">可用</option>
					</select></td>
					
				</tr>
			</table>
			<input class="btn btn-primary" type="submit" value="提交" />
			<input class="btn" type="reset" value="重置" />
			</form>
		</center>

	</div>
</body>
</html>
