<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>邮件发送</title>
<meta name="keywords"
	content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
<meta name="description"
	content="<spring:message code="sys.site.description" arguments="${platformName}"/>">

<link rel="shortcut icon" href="favicon.ico">
<html:css name="bootstrap,font-awesome,animate,iCheck,Validform,simditor" />
<link href="${staticPath}/common/css/style.css?v=4.1.0" rel="stylesheet">
<link href="${staticPath}/iCheck/custom.css" rel="stylesheet">
<html:js name="jquery,bootstrap" />
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
                <div class="col-sm-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>邮件发送(邮件內容方式发送)</h5>
							<div class="ibox-tools">
								<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
								</a> <a class="close-link"> <i class="fa fa-times"></i>
								</a>
							</div>
						</div>
						<div class="ibox-content">
							<form:form id="emailForm"
								action="${adminPath}/email/send/sendEmailByContent" method="post"
								class="form-horizontal">
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label"><font color="red">*</font>邮件：</label>
									<div class="col-sm-10">
										<form:input path="email" class="form-control" nested="false"
											datatype="*" placeholder="邮件，多个以英文逗号“,”隔开"
											htmlEscape="false" />
									</div>
								</div>
								
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">主题：</label>
									<div class="col-sm-10">
										<form:input path="subject" class="form-control" nested="false"
											datatype="*" placeholder="请填写主题"
											htmlEscape="false" />
									</div>
								</div>
	
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label"><font color="red">*</font>发送内容：</label>
									<div class="col-sm-10">
										  <form:editor  editorType="simditor"  path="content" defaultValue="" nested="false" />
									</div>
								</div>
	
								<div class="form-group">
									<div class="col-sm-10 col-sm-offset-1 text-right">
										<button class="btn btn-primary" type="submit">发送</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<div class="col-sm-12">
				    <div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>邮件发送(模版方式发送)</h5>
							<div class="ibox-tools">
								<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
								</a> <a class="close-link"> <i class="fa fa-times"></i>
								</a>
							</div>
						</div>
						<div class="ibox-content">
							<form:form id="emailTemplateEmailForm"
								action="${adminPath}/email/send/sendEmailByCode" method="post"
								class="form-horizontal">
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label"><font color="red">*</font>邮件：</label>
									<div class="col-sm-10">
										<form:input path="email" class="form-control" nested="false"
											datatype="*" placeholder="邮件，多个以英文逗号“,”隔开"
											htmlEscape="false" />
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label"><font color="red">*</font>发送模版编码：</label>
									<div class="col-sm-10">
										<form:input path="code" class="form-control" nested="false"
											datatype="*" placeholder="这里的编码需要在模版配置中能找到" htmlEscape="false" />
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">发送内容：</label>
									<div class="col-sm-10">
										<form:input path="data" class="form-control" nested="false"  placeholder="多内容用英文逗号分割“,”" htmlEscape="false" />
									</div>
								</div>
	
								<div class="form-group">
									<div class="col-sm-10 col-sm-offset-1 text-right">
										<button class="btn btn-primary" type="submit">发送</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		 


	<!-- 全局js -->
	<html:js name="iCheck,Validform,simditor" />

	<!-- 自定义js -->
	<script src="${staticPath}/common/js/content.js?v=1.0.0"></script>

	<script type="text/javascript">
		//初始化表单
		var validateForm;
		$(document).ready(function() {
			validateForm = $("#emailTemplateEmailForm").Validform({
				tiptype : 3,
				ajaxPost : true,
				callback : function(result) {
					$.Hidemsg();
					if (result.ret == 0) {
						top.layer.alert(result.msg, {
							icon : 0,
							title : '提示'
						});
					} else {
						top.layer.alert(result.msg, {
							icon : 0,
							title : '警告'
						});
					}
				}
			});
		});

		//初始化表单
		var validateHyForm;
		$(document).ready(function() {
			validateHyForm = $("#emailForm").Validform({
				tiptype : 3,
				ajaxPost : true,
				callback : function(result) {
					$.Hidemsg();
					if (result.ret == 0) {
						top.layer.alert(result.msg, {
							icon : 0,
							title : '提示'
						});
					} else {
						top.layer.alert(result.msg, {
							icon : 0,
							title : '警告'
						});
					}
				}
			});
		});
	</script>

</body>

</html>
