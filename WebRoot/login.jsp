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
<title>员工登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<script type="text/javascript">
	function checkform() {
		var form = document.getElementById("myform");
		for (var index = 0; index < form.length; index++) {
			if (form[index].value == "") {
				alert("Empty input");
				return false;
			}

		}

	}
</script>


<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />



<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
</head>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="icon-leaf green"></i> <span class="red">企业车辆管理系统</span>
								<span class="white"></span>
							</h1>
							<h4 class="blue">&copy; andy</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> 用户登录
										</h4>

										<div class="space-6"></div>

										<form action="login" method="post" id="myform"
											onsubmit="return checkform() ">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" name="id" class="form-control"
														placeholder="员工号" /> <i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="pwd" class="form-control"
														placeholder="密码" /> <i class="icon-lock"></i>
												</span>
												</label>
												<!-- <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> -->
												<select name="root" class="form-control">
													<option selected="selected" >普通用户</option>
													<option >管理员</option>
												</select>



												<div class="space"></div>

												<div class="clearfix">
													<label class="inline"> <input type="checkbox"
														class="ace" /> <span class="lbl"> 记住用户名</span>
													</label> <input type="submit"
														class="width-35 pull-right btn btn-sm btn-primary"
														value="登录">
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>
									<!-- /-->

									<div class="toolbar clearfix">
										<div>
											<a href="#" onclick="show_box('forgot-box'); return false;"
												class="forgot-password-link"> <i class="icon-arrow-left"></i>
												忘记密码
											</a>
										</div>

									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="icon-key"></i> 找回密码
										</h4>

										<div class="space-6"></div>
										<p>输入邮箱</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" class="form-control" placeholder="Email" />
														<i class="icon-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button"
														class="width-35 pull-right btn btn-sm btn-danger">
														<i class="icon-lightbulb"></i> 发送
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /widget-main -->

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;"
											class="back-to-login-link"> 返回登录 <i
											class="icon-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /forgot-box -->


							<!-- /position-relative -->
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
		</div>
		<!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script
			src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery
					|| document
							.write("<script src='assets/js/jquery-2.0.3.min.js'>"
									+ "<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			
		</script>

		<script type="text/javascript">
			if ("ontouchend" in document)
				document
						.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
								+ "<"+"/script>");
		</script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			function show_box(id) {
				jQuery('.widget-box.visible').removeClass('visible');
				jQuery('#' + id).addClass('visible');
			}
		</script>
		<div style="display:none">
			<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
				language='JavaScript' charset='gb2312'></script>
		</div>
</body>
</html>
</html>
