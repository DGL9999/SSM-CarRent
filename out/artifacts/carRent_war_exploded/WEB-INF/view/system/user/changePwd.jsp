<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2020/6/30
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改密码</title>
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
<form class="layui-form layui-row changePwd" id="changePwdFrm" method="post">
	<div class="layui-col-xs12 layui-col-sm6 layui-col-md6">
		<div class="layui-input-block layui-red pwdTips">请输入旧密码，新密码必须两次输入一致才能提交</div>
		<div class="layui-form-item">
			<label class="layui-form-label">登录名</label>
			<div class="layui-input-block">
				<input type="text" name="loginname"  value="${user.loginname}" disabled class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">旧密码</label>
			<div class="layui-input-block">
				<input type="password" name="oldPwd" value="" id="oldPwd" placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-block">
				<input type="password" name="newPwd" id="newPwd" placeholder="请输入新密码" lay-verify="required|newPwd"  class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" name="confirmPwd" id="confirmPwd" placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="changePwd" id="changePwd">立即修改</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="doReset">重置</button>
			</div>
		</div>
	</div>
</form>


<script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
<script src="${ctx}/resources/js/md5.js" type="text/javascript"></script>
<script type="text/javascript">
    layui.use(['form','layer'],function(){
    var form = layui.form,
        $ = layui.jquery;
		layer = layui.layer;




    //添加验证规则
    form.verify({
        oldPwd : function(value, item){
        	let old = hex_md5(value);
			let userPwd = "${user.pwd}";
            if(old != userPwd){
                return "密码错误，请重新输入！";
            }
        },
        newPwd : function(value, item){
            if(value.length < 6){
                return "密码长度不能小于6位";
            }
            if (value == $("#oldPwd").val()){
				return "新密码与旧密码相同，请重新输入！";
			}
        },
        confirmPwd : function(value, item){
            if(!new RegExp($("#newPwd").val()).test(value)){
                return "两次输入密码不一致，请重新输入！";
            }
        }
    })

    //监听提交
	form.on('submit(changePwd)', function(data){
		let params = $("#changePwdFrm").serialize()
		alert(params)
		$.post("${ctx}/user/changePwd",params,function (obj) {})
		window.parent.document.location.reload();
		return true;
	});

    // 控制表格编辑时文本的位置【跟随渲染时的位置】
    $("body").on("click",".layui-table-body.layui-table-main tbody tr td",function(){
        $(this).find(".layui-table-edit").addClass("layui-"+$(this).attr("align"));
    });

})
</script>
</body>
</html>