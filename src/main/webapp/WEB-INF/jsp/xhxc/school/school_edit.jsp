<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 加载config配置文件 -->
<fmt:setBundle basename="project" var="ngConfig" />
<!-- 读取配置值nginxUrl，并赋值给变量NginxUrl -->
<fmt:message key="nginxUrl" var="NginxUrl" bundle="${ngConfig}" />

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<input id="basePath" type="text" hidden value="<%=basePath%>">

	<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<%--自定义样式--%>
<link rel="stylesheet" href="static/web/css/school.css" />
	<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
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
								<form action="school/${msg }.do" name="userForm" id="userForm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户名:</td>
											<td><input type="text" name="USERNAME" id="loginname" value="${pd.USERNAME }" maxlength="32" placeholder="这里输入用户名" title="用户名" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">密码:</td>
											<td><input type="password" name="PASSWORD" id="password"  maxlength="32" placeholder="输入密码" title="密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">确认密码:</td>
											<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">校名:</td>
											<td><input type="text" name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入校名" title="校名" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">所在省/自治区/直辖市:</td>
											<td><input type="text" name="PROVINCE" id="province"  value="${pd.PROVINCE }"  maxlength="32" placeholder="这里输入所在省/自治区/直辖市" title="所在省/自治区/直辖市" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">所在地（市/县）:</td>
											<td><input type="text" name="CITY" id="city"  value="${pd.CITY }" maxlength="32" placeholder="这里输入所在地（市/县）" title="所在地（市/县）"  style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">详细地址:</td>
											<td><input type="text" name="ADDRESS" id="address"value="${pd.ADDRESS }" placeholder="这里输入详细地址" maxlength="64" title="详细地址" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 9%;">照片:</td>
											<td style="width: 60%">
												<div class="item" style="">
													<c:if test="${msg=='saveU' || (pd.PHOTO=='' || pd.PHOTO==null)}">
														<img class="addImg" onclick="clickImg(this);" src="<%=basePath%>static/images/addImg.png" />
													</c:if>
													<c:if test="${msg=='editU' && pd.PHOTO!='' && pd.PHOTO!=null}">
														<img class="addImg" style="cursor:default;" src="${NginxUrl}/${pd.PHOTO}"/>
													</c:if>
													<input id="photo" name="PHOTO" type="file" class="upload_input" onchange="change(this)"/>
													<div class="preBlock">
														<img class="preview" alt="" name="pic" width="190" height="190" />
													</div>
													<img <c:if test="${msg=='editU' && pd.PHOTO!='' && pd.PHOTO!=null}">style="display: block" </c:if> class="delete" onclick="deleteImg(this,'${msg}')" src="<%=basePath%>static/images/delete.png"/>
												</div>
											</td>
											<input type="hidden" id="deleteFlag" name="deleteFlag" value="false">
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	//保存
	function save(){
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}

		if($("#user_id").val()=="" && $("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#chkpwd").focus();
			return false;
		}
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'请输入校名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#name").focus();
			return false;
		}
        if($("#province").val()==""){
            $("#province").tips({
                side:3,
                msg:'请输入所在省/自治区/直辖市',
                bg:'#AE81FF',
                time:2
            });
            $("#province").focus();
            return false;
        }

        if($("#city").val()==""){
            $("#city").tips({
                side:3,
                msg:'请输入所在地（市/县）',
                bg:'#AE81FF',
                time:3
            });
            $("#city").focus();
            return false;
        }

        if($("#address").val()==""){
            $("#address").tips({
                side:3,
                msg:'请输入详细地址',
                bg:'#AE81FF',
                time:2
            });
            $("#address").focus();
            return false;
        }

		if($("#user_id").val()==""){
			hasU();
		}else{
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#loginname").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#loginname").css("background-color","#D16E6C");
					setTimeout("$('#loginname').val('此用户名已存在!')",500);
				 }
			}
		});
	}
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});

    //点击
    var clickImg = function(obj){
        $(obj).parent().find('.upload_input').click();
    }
    //删除
    var deleteImg = function(obj,msg){
        if(msg == 'saveU') {
            $(obj).parent().find('input').val('');
            $(obj).parent().find('img.preview').attr("src", "");
            //IE9以下
            $(obj).parent().find('img.preview').css("filter", "");
            $(obj).hide();
            $(obj).parent().find('.addImg').show();
        }else if(msg == 'editU'){
			$("#deleteFlag").val("true");
            $(obj).parent().find('.addImg').attr('src',$("#basePath").val()+"static/images/addImg.png");
            $(obj).parent().find('.addImg').attr('onclick','clickImg(this)');
            $(obj).parent().find('.addImg').css('cursor','pointer');
            $(obj).parent().find('input').val('');
            $(obj).parent().find('img.preview').attr("src", "");
            //IE9以下
            $(obj).parent().find('img.preview').css("filter", "");
            $(obj).hide();
            $(obj).parent().find('.addImg').show();
        }
    }
    //选择图片
    function change(file) {
        //预览
        var pic = $(file).parent().find(".preview");
        //添加按钮
        var addImg = $(file).parent().find(".addImg");
        //删除按钮
        var deleteImg = $(file).parent().find(".delete");

        var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();

        // gif在IE浏览器暂时无法显示
        if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
            if (ext != '') {
                alert("图片的格式必须为png或者jpg或者jpeg格式！");
            }
            return;
        }
        //判断IE版本
        var isIE = navigator.userAgent.match(/MSIE/)!= null,
            isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
        isIE10 = navigator.userAgent.match(/MSIE 10.0/)!= null;
        if(isIE && !isIE10) {
            file.select();
            var reallocalpath = document.selection.createRange().text;
            // IE6浏览器设置img的src为本地路径可以直接显示图片
            if (isIE6) {
                pic.attr("src",reallocalpath);
            }else{
                // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
                pic.css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + reallocalpath + "\")");
                // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
                pic.attr('src','data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
            }
            addImg.hide();
            deleteImg.show();
        }else {
            html5Reader(file,pic,addImg,deleteImg);
        }
    }
    //H5渲染
    function html5Reader(file,pic,addImg,deleteImg){
        var file = file.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            pic.attr("src",this.result);
        }
        addImg.hide();
        deleteImg.show();
    }
</script>
</html>