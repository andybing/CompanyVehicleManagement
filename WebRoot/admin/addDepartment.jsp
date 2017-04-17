<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>部门管理</title>

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
function formsubmit(){
	var form=document.getElementById("form1");
	form.submit();
}
</script>
</head>

<body>

	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed');}catch(e){}
						</script>

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">基础信息管理</a></li>
			<li class="active">部门管理</li>
		</ul>
	</div>
		

		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">所有部门信息</div>
                <form action="addDepartment" method="post">
				<div class="table-responsive">
					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th width="20%;">部门ID</th>
								<th width="20%;">部门名称</th>
								<th width="40%;">部门描述</th>
								<th width="20%;">操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${departmentList}" var="department">
							<tr>
								<td style="text-align: center;"><a href="#">${department.id}</a></td>
								<td style="text-align: center;">${department.name}</td>
							
								<td>${department.introduction}</td>
								

								<td style="text-align: center;">
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										
									 <a class="red" href="deleteDepartment?id=${department.id}"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
						<tr><td><input type="number" name="id"/></td>
								<td><input type="text" name="name"/></td>
							
								<td><input width="35%" type="text" name="introduction"/></td>
								

								<td style="text-align: center;">
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										
									<button class="btn btn-app btn-grey btn-xs radius-4" type="submit">		
												添加	
											</button>

									</div>
								</td> </tr>
					</table>
				</div>
				</form>
			</div>
			</div>
</body>
</html>
