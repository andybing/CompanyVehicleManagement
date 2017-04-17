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
<script type="text/javascript">
	function config() {
		var pwd=document.getElementById("pwd");
		var older = document.getElementById("olderpwd");
		var newpwd = document.getElementById("newpwd");
		var new1pwd = document.getElementById("new1pwd");

		if (older.value==""||newpwd.value==""|| new1pwd.value=="") {
			alert("输入不能为空！");
			return false;
		}else if(older.value!=pwd.value){
			alert("密码输入错误！");
			return false;
		}
		else if (newpwd.value != new1pwd.value) {
			alert("两次输入密码不一致！");
			return false;
		}else {
			alert("修改成功！");
			return true;
		}
		
	}
	</script>
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
			<li><i class="icon-home home-icon"></i> <a href="#">个人设置</a></li>
			<li class="active">修改个人信息</li>
		</ul>
		<!-- .breadcrumb -->

	</div>

	<div class="row">
		<center>
			<form action="changePwd" method="post" onsubmit=" return config() ">
				<table id="sample-table-2"
					class="table table-striped table-bordered table-hover"
					style="width:70%">
					<tr>
						<td>输入原密码</td>
						<td><input id="olderpwd" type="password" name="olderpwd">
						<input type="hidden"
						 id="pwd"	value="${userSession.pwd}"></td>
					</tr>
					<tr>
						<td>输入新密码</td>
						<td><input id="newpwd" type="password" name="newpwd"></td>
					</tr>
					<tr>
						<td>确认新密码</td>
						<td><input id="new1pwd" type="password" name="new1pwd"></td>
					</tr>

				</table>
				<input class="btn btn-primary" type="submit" value="提交" /> <input
					class="btn" type="button" value="返回" onclick="history.go(-1)" />
			</form>
		</center>

	</div>
</body>
</html>

