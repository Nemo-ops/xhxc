<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="teach/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TEACH_ID" id="TEACH_ID" value="${pd.TEACH_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学校ID:</td>
								<td><input type="text" name="SCHOOL_ID" id="SCHOOL_ID" value="${pd.SCHOOL_ID}" maxlength="100" placeholder="这里输入学校ID" title="学校ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">志愿者ID:</td>
								<td><input type="text" name="HELPER_ID" id="HELPER_ID" value="${pd.HELPER_ID}" maxlength="100" placeholder="这里输入志愿者ID" title="志愿者ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发起时间:</td>
								<td><input class="span10 date-picker" name="TEACH_DATE" id="TEACH_DATE" value="${pd.TEACH_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="发起时间" title="发起时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学校需求简介:</td>
								<td><input type="text" name="SCHOOL_NEED" id="SCHOOL_NEED" value="${pd.SCHOOL_NEED}" maxlength="255" placeholder="这里输入学校需求简介" title="学校需求简介" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">支教者/支教团体简介:</td>
								<td><input type="text" name="HELPER_INTRO" id="HELPER_INTRO" value="${pd.HELPER_INTRO}" maxlength="255" placeholder="这里输入支教者/支教团体简介" title="支教者/支教团体简介" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学校同意状态:</td>
								<td><input type="number" name="SCHOOL_AGR" id="SCHOOL_AGR" value="${pd.SCHOOL_AGR}" maxlength="32" placeholder="这里输入学校同意状态" title="学校同意状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">志愿者同意状态:</td>
								<td><input type="number" name="HELPER_AGR" id="HELPER_AGR" value="${pd.HELPER_AGR}" maxlength="32" placeholder="这里输入志愿者同意状态" title="志愿者同意状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#SCHOOL_ID").val()==""){
				$("#SCHOOL_ID").tips({
					side:3,
		            msg:'请输入学校ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_ID").focus();
			return false;
			}
			if($("#HELPER_ID").val()==""){
				$("#HELPER_ID").tips({
					side:3,
		            msg:'请输入志愿者ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HELPER_ID").focus();
			return false;
			}
			if($("#TEACH_DATE").val()==""){
				$("#TEACH_DATE").tips({
					side:3,
		            msg:'请输入发起时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEACH_DATE").focus();
			return false;
			}
			if($("#SCHOOL_NEED").val()==""){
				$("#SCHOOL_NEED").tips({
					side:3,
		            msg:'请输入学校需求简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_NEED").focus();
			return false;
			}
			if($("#HELPER_INTRO").val()==""){
				$("#HELPER_INTRO").tips({
					side:3,
		            msg:'请输入支教者/支教团体简介',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HELPER_INTRO").focus();
			return false;
			}
			if($("#SCHOOL_AGR").val()==""){
				$("#SCHOOL_AGR").tips({
					side:3,
		            msg:'请输入学校同意状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCHOOL_AGR").focus();
			return false;
			}
			if($("#HELPER_AGR").val()==""){
				$("#HELPER_AGR").tips({
					side:3,
		            msg:'请输入志愿者同意状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HELPER_AGR").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>