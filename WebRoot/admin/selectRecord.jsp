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

<title>查看记录</title>

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
			<li><i class="icon-home home-icon"></i> <a href="#">审批管理</a></li>

			
			<li class="active">查看申请</li>
		</ul>
		<!-- .breadcrumb -->

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="selectRecord" id="form1" method="post">
				<span class="input-icon"> <input type="text" name="search" style="width: 300px"
					placeholder="车辆ID、用户ID、驾驶员ID、是否归还" class="nav-search-input"
					id="nav-search-input" autocomplete="off" /> <a
					class="icon-search nav-search-icon" onclick="formsubmit()"></a>
				</span>
			</form>
		</div>
		<!-- #nav-search -->
	</div>
		

		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">查找"${resultRecord.search}"结果   共${resultRecord.count}条记录</div>

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
								<th class="hidden-480">是否归还</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${resultRecord.list}" var="Record">
							<tr>
								<td><a>${Record.application_id}</a></td>
								<td><a href="viewUser?id=${Record.user_id}&&state=view"">${Record.user_id}</a></td>
								<td><a href="viewVehicle?vid=${Record.car_id}&&state=view">${Record.car_id}</a></td>
								<td><a href="viewDriver?id=${Record.driver_id}&&state=view">${Record.driver_id}</a></td>
								<td class="hidden-480"><span
									class="label label-sm label-warning">${Record.beginday}</span></td>
								<td class="hidden-480"><span
									class="label label-sm label-warning">${Record.endday}</span></td>
                               <td class="hidden-480"><span
									class="label label-sm label-warning">${Record.isreturn}</span></td>                            
                               
								<td>
								
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="green" href="viewRecord?id=${Record.id}"> 
										 查看详细</a>
										
									</div>
				
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<center><a href="rchagePagenow?pagenow=less">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<label>当前 ${resultRecord.pagenow}/ ${resultRecord.pagecount}页</label> 
					&nbsp;&nbsp;&nbsp; <a href="rchagePagenow?pagenow=more">下一页</a></center>
				</div>
			</div>
			</div>
</body>
</html>
