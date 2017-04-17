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

<title>查看驾驶员</title>

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
			<li><i class="icon-home home-icon"></i> <a href="#">基本信息管理</a></li>

			<li><a href="#">驾驶员管理</a></li>
			<li class="active">查看驾驶员</li>
		</ul>
		<!-- .breadcrumb -->

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="selectDriver" id="form1" method="post">
				<span class="input-icon"> <input type="text" name="user" style="width: 300px"
					placeholder="ID，身份证号、姓名。性别 、状态" class="nav-search-input"
					id="nav-search-input" autocomplete="off" /> <a
					class="icon-search nav-search-icon" onclick="formsubmit()"></a>
				</span>
			</form>
		</div>
		<!-- #nav-search -->
	</div>
		

		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">查找"${resultDriver.search}"结果   共${resultDriver.count}条记录</div>

				<div class="table-responsive">
					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>员工号</th>
								<th>姓名</th>
								<th class="hidden-480">性别</th>
								<th>身份证号</th>
								<th class="hidden-480">状态</th>

								<th>操作</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${resultDriver.list}" var="driver">
							<tr>
								<td><a href="#">${driver.id}</a></td>
								<td>${driver.name}</td>
								<td class="hidden-480">${driver.sex}</td>
								<td>${driver.peopleID}</td>

								<td class="hidden-480"><span
									class="label label-sm label-warning">${driver.state}</span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="viewDriver?id=${driver.id}&&state=view"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="viewDriver?id=${driver.id}&&state=update"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="deleteDriver?id=${driver.id}"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<center><a href="dchagePagenow?pagenow=less">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<label>当前 ${resultDriver.pagenow}/ ${resultDriver.pagecount}页</label> 
					&nbsp;&nbsp;&nbsp; <a href="dchagePagenow?pagenow=more">下一页</a></center>
				</div>
			</div>
			</div>
</body>
</html>
