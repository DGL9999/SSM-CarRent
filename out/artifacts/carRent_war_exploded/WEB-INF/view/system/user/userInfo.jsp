<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2020/6/30
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title>个人资料</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx}/resources/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-row" lay-filter="userFrm" id="userFrm">
	<div class="layui-col-md3 layui-col-xs12 user_right">
		<div class="layui-upload-list">
			<img class="layui-upload-img layui-circle userFaceBtn userAvatar" id="userFace">
			<input type="hidden" name="userimg" id="userimg">
			<input type="hidden" name="userid" id="userid">
		</div>
		<button type="button" class="layui-btn layui-btn-primary userFaceBtn"><i class="layui-icon">&#xe67c;</i> 掐指一算，我要换一个头像了</button>
	</div>
	<div class="layui-col-md6 layui-col-xs12">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" name="loginname" id="loginname" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户组</label>
			<div class="layui-input-block">
				<input type="text" name="type" id="type" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">真实姓名</label>
			<div class="layui-input-block">
				<input type="text" name="realname"  id="realname" placeholder="请输入真实姓名" lay-verify="required" class="layui-input realName">
			</div>
		</div>
		<div class="layui-form-item" pane="">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block userSex">
				<input type="radio" name="sex" value="1" title="男" checked="checked">
				<input type="radio" name="sex" value="2" title="女">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号码</label>
			<div class="layui-input-block">
				<input type="tel" name="phone" id="phone"  placeholder="请输入手机号码" lay-verify="phone" class="layui-input userPhone">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">家庭住址</label>
			<div class="layui-input-block">
				<input type="text" name="address" id="address" placeholder="请输入家庭住址" class="layui-input userAddress">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="changeUser">立即提交</button>
				<button type="button" class="layui-btn layui-btn-primary" id="doReset">重置</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script type="application/javascript">




    let form, $,areaData;
	layui.use(['form','layer','upload'],function(){
    form = layui.form;
    $ = layui.jquery;
    let layer = parent.layer === undefined ? layui.layer : top.layer,
        upload = layui.upload;

	let userimg = "${sessionScope.user.userimg}";
	let userid = "${sessionScope.user.userid}";

    initUserInfo();
	initUserImage();
    function initUserInfo(){
    	$.get("${ctx}/user/initUserInfo?userid="+userid,function (obj) {
    	let data = obj.data;
    	//初始化用户信息
		form.val("userFrm",data)
		$("#type").val(data.type==1?"超级管理员":"普通用户")
		//初始化用户头像
		})
	}
	function initUserImage() {
    	if (userimg==""){
    		userimg = "images/defaultUserImage.PNG";
			console.log(userimg);
		}
		$('#userFace').attr('src',"${ctx}/file/downloadShowFile?path="+userimg);
		$('#userimg').val(userimg);
	}


    //上传头像
    upload.render({
        elem: '.userFaceBtn',
        url: '${ctx}/file/userUploadFile',
        method : "post",
		acceptMime:'image/*',
        field:'mf',
        done: function(res, index, upload){
			$('#userFace').attr('src',"${ctx}/file/downloadShowFile?path="+res.data.src);
            $('#userimg').val(res.data.src);
            console.log(res);
        }
    });


    //提交个人资料
    form.on("submit(changeUser)",function(data){
        let index = layer.msg('提交中，请稍候',{icon: 16,time:false,shade:0.8});
        let params = $("#userFrm").serialize();
        $.post("${ctx}/user/updateUser",params,function (obj) {
            layer.msg(obj.msg);
        })
		//刷新数据 表格
		initUserInfo();
		form.render();
		userimg = $("#userimg").val();
		$('#userFace').attr('src',"${ctx}/file/downloadShowFile?path="+userimg);
		layer.close(index);
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    })

	//监听重置按钮
	$("#doReset").click(function() {
		$("#realname").val("")
		$("#phone").val("")
		$("#address").val("")
	});
})
</script>
</body>
</html>