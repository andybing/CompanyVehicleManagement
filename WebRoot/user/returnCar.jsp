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

<title>还车</title>

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
			<li><i class="icon-home home-icon"></i> <a href="#">用车申请</a></li>

			<li class="active">车辆归还</li>
		</ul>
		
	</div>
		

		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">未归还记录列表</div>

				<div class="table-responsive">
					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>申请单ID</th>
								<th>申请人ID</th>
								<th>申请车辆ID</th>
								<th>驾驶员ID</th>
								<th class="hidden-480">开始时间</th>
								<th class="hidden-480">结束时间</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${recordList}" var="record">
							<tr>
								<td><a>${record.application_id}</a></td>
								<td><a href="viewUser?id=${record.user_id}&&state=view">${record.user_id}</a></td>
								<td><a href="viewVehicle?vid=${record.car_id}&&state=view">${record.car_id}</a></td>
								<td><a href="viewDriver?id=${record.driver_id}&&state=view">${record.driver_id}</a></td>
								<td class="hidden-480"><span
									class="label label-sm label-warning">${record.beginday}</span></td>
								<td class="hidden-480"><span
									class="label label-sm label-warning">${record.endday}</span></td>                     
           
								<td>
								
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="red" href="viewRecord?id=${record.id}">还车
										</a>
									</div>
									
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</div>
</body>
</html>
