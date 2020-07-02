<%--
Created by IntelliJ IDEA.
menu: Deja wu
Date: 2020/6/17
Time: 12:25
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理数据表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="${ctx}/resources/favicon.ico">
    <link rel="stylesheet" href="${ctx}/resources/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx}/resources/css/public.css" media="all" />
    <script type="text/javascript" src="${ctx}/resources/layui/layui.js"></script>
</head>
<body style="margin: 10px">

     <%-- 搜索条件开始 --%>
    <div class="layui-collapse" lay-filter="test">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">条件查询</h2>
            <div class="layui-colla-content">
                <div style="padding: 10px" id="queryDiv" >
                    <form class="layui-form" method="post" id="searchFrm">
                        <div class="layui-container" style="padding-left: 250px">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">用户姓名:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="realname" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入用户名称" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">用户登录名:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="loginname" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入用户名称" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">用户电话:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="phone" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入用户名称" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">用户地址:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="address" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入用户名称" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">身份证号:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="identity" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入用户名称" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">性别:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="radio" name="sex" value="1"  title="男">
                                    <input type="radio" name="sex" value="0" title="女">
                                </div>
                            </div>
                        </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" style="position: relative;left: 43%;top: 20px">
                                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" id="doSearch">查询 </button>
                                <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm">重置 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%-- 搜索条件结束 --%>

    <%-- 数据表格开始 --%>
    <table class="layui-hide" id="userTable" lay-filter="userTable">
        <div style="display: none;" id="userToolBar">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
            <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
        </div>
        <div id="userBar" style="display: none;">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserRole">分配角色</a>
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="reSetPwd">重置密码</a>
        </div>
    </table>
    <%-- 数据表格结束 --%>


    <%-- 添加和修改的弹出层开始 --%>
    <div style="display: none;padding: 50px 75px 30px; " id="saveOrUpdateDiv" >
        <form class="layui-form " lay-filter="dataFrm" id="dataFrm" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户姓名:</label>
                <div class="layui-input-inline">
                    <div style="display: none">
                        <input type="text" name="userid">
                    </div>
                    <input type="text" name="realname" autocomplete="off" lay-verify="required" class="layui-input">
                </div>

                <label class="layui-form-label">用户登录名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="loginname" autocomplete="off" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" autocomplete="off" lay-verify="required" class="layui-input">
                </div>

                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" autocomplete="off" lay-verify="required" class="layui-input">
                </div>

                <label class="layui-form-label">职位:</label>
                <div class="layui-input-inline">
                    <input type="text" name="position" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" checked="checked" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>

                <label class="layui-form-label">是否可用:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="available" value="1" checked="checked" title="是">
                    <input type="radio" name="available" value="0" title="否">
                </div>
            </div>

            <%-- 隐藏提交和重置按钮按钮 --%>
            <div class="layui-form-item layui-hide">
                <div class="layui-inline">
                    <button type="button" class="layui-btn" id="doSubmit" lay-filter="doSubmit" lay-submit="" >提交</button>
		            <button type="reset" class="layui-btn" id="reset">重置</button>
                </div>
            </div>
        </form>
    </div>
<%-- 添加和修改的弹出层结束 --%>

<%--分配菜单的弹出层开始--%>
    <div id="selectUserRoleDiv" style="display: none">
        <div class="layui-container" style="width: 100%">
            <table class="layui-hide" id="roleTable" lay-filter="roleTable">

             </table>
        </div>
    </div>
<%--分配菜单的弹出层结束--%>


<script type="text/javascript">

    let $;
    let layer;
    let form;
    let table;
    let element;
    let tableIns; //数据表格

    layui.use([ 'jquery', 'layer', 'form', 'table','element'], function() {

        $ = layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        
        //渲染数据表格
        tableIns=table.render({
            elem: '#userTable' //渲染的目标对象
            ,url:'${ctx}/user/loadAllUser' //数据接口
            ,title: '用户数据表'//数据导出来的标题
            ,toolbar:"#userToolBar" //表格的工具条
            ,height:'auto'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true //是否启用分页
            ,cols: [[ //列表数据
                {type: 'checkbox', fixed: 'left',width:'3%'}
                ,{field:'userid', title:'ID',align:'center',width:'4%'}
                ,{field:'realname', title:'用户姓名',align:'center',width:'8%'}
                ,{field:'loginname', title:'登录名',align:'center',width:'8%'}
                ,{field:'identity', title:'身份证号',align:'center',width:'15%'}
                ,{field:'position', title:'用户职位',align:'center',width:'8%'}
                ,{field:'phone', title:'用户电话',align:'center',width:'10%'}
                ,{field:'address', title:'用户地址',align:'center',width:'8%'}
                ,{field:'sex', title:'性别',align:'center',width:'6%',templet:function(d){
                return d.sex=='1'?'<font color="blue">男</font>':'<font color="red">女</font>';
                }}
                ,{field:'available', title:'是否可用',align:'center',width:'8%',templet:function(d){
                return d.available=='1'?'<font color="blue">是</font>':'<font color="red">否</font>';
                }}
                ,{fixed: 'right',title: '操作',toolbar:'#userBar',align: 'center',width:'21.5%'}
            ]],
            done:function (data, curr) {
                //不是第一页时，如果当前返回的数据为0那么就返回上一页
                if(data.data.length==0&&curr!=1){
                    tableIns.reload({
                        page:{
                            curr:curr-1
                        }
                    })
                }
            }
        })

         //条件查询
        $("#doSearch").click(function() {
            //搜索表单中的输入信息系列化
            let params = $("#searchFrm").serialize()
            tableIns.reload({
                url:'${ctx}/user/loadAllUser?'+params,
                page:{curr:1}
            })
        })
        
        //监听头部工具栏事件
        table.on("toolbar(userTable)",function(obj){
            switch(obj.event){
                case 'add':
                openAddUser();
                break;
                case 'deleteBatch':
                deleteBatch();
                break;
            };
        })

              //监听行工具事件
        table.on('tool(userTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除【'+data.realname+'】吗', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${ctx}/user/deleteUser",{userid: data.userid},function(res) {
                        layer.msg(res.msg);
                        //数据表单刷新
                        tableIns.reload();
                    })
                });
            }else if(layEvent === 'edit'){ //编辑
                openUpdateUser(data)
            }else if (layEvent === 'selectUserRole'){
                openSelectUserMenu(data)
            }else if (layEvent === 'reSetPwd'){
                layer.confirm('真的要重置【'+data.realname+'】的密码吗', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${ctx}/user/reSetUserPwd",{userid: data.userid},function(res) {
                        layer.msg(res.msg);
                    })
                });
            }
        });

        //提交按钮
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            let params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //刷新数据 表格
                tableIns.reload();
            })
            //提交成功，关闭弹出层
            layer.close(mainIndex);
            });
                
        let url;
        let mainIndex;
        //打开添加页面
        function openAddUser(){
            mainIndex = layer.open({
                type:1,
                title:'添加用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','400px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    //清空表单数据
                    $("#reset").click();
                    url='${ctx}/user/addUser'
                },
                btn:['<div class="layui-icon layui-icon-ok">保存</div>','<div class="layui-icon  layui-icon-refresh">重置</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //调用隐藏提交按钮，提交表格
                    $("#doSubmit").click();
                },
                btn2:function(index, layero) {
                    layer.msg("重置");
                    //调用隐藏重置按钮，重置表格
                    $("#reset").click();
                    //重置成功，不关闭页面
                    return false
                },
                btn3:function(index, layero){
                    layer.msg("关闭");
                    //关闭页面
                    $("#reset").click();
                    return true;
                }
            });
        }

        //打开修改页面弹出层
        function openUpdateUser(data){
            layer.open({
                type:1,
                title:'修改用户',
                content:$("#saveOrUpdateDiv"),
                area:['800px','400px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    url='${ctx}/user/updateUser'
                    //需要修改的信息填入表格
                    form.val("dataFrm",data);
                },
                btn:['<div class="layui-icon layui-icon-ok">修改</div>','<div class="layui-icon  layui-icon-refresh">重置</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //调用隐藏提交按钮，提交表格
                    $("#doSubmit").click();
                },
                btn2:function(index, layero) {
                    layer.msg("重置");
                    //调用隐藏重置按钮，重置表格
                    $("#reset").click();
                    //重置成功，不关闭页面
                    return false
                },
                btn3:function(index, layero){
                    layer.msg("关闭");
                    //关闭页面
                    $("#reset").click();
                    return true;
                }
            });
        }


        //打开分配角色弹出层
        function openSelectUserMenu(data){
            let menuTree;
            mainIndex = layer.open({
                type:1,
                title:'给【'+data.realname+'】分配菜单权限',
                content:$("#selectUserRoleDiv"),
                area:['800px','400px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                table.render({
                    elem: '#roleTable' //渲染的目标对象
                    ,url:'${ctx}/user/initUserRole?userid='+data.userid+'&available=1' //数据接口
                    ,title: '角色数据表'//数据导出来的标题
                    ,height:'auto'
                    ,cellMinWidth:100 //设置列的最小默认宽度
                    ,cols: [[ //列表数据
                        {type: 'checkbox', fixed: 'left'}
                        ,{field:'roleid', title:'ID',align:'center'}
                        ,{field:'rolename', title:'角色名称',align:'center'}
                        ,{field:'roledesc', title:'角色备注',align:'center'}
                    ]]
                })

                },btn:['<div class="layui-icon layui-icon-ok">分配</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //得到选中的数据行
                    let checkStatus = table.checkStatus('roleTable');
                    let roleData=checkStatus.data;
                    let params="userid="+data.userid;
                    $.each(roleData,function (i,item) {
                        params+="&ids="+item.roleid
                    });
                    layer.confirm('您真的要角色给用户【'+data.realname+'】吗', function(index){
                        //向服务端发送删除指令
                        $.post("${ctx}/user/saveRoleUser",params,function(res) {
                            layer.msg(res.msg);
                        })
                    });
                    layer.close(index);
                },
            });
        }


        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            let checkStatus = table.checkStatus('userTable');
            let data=checkStatus.data;
            let params="";
            $.each(data,function (i,item) {
                if (i==0){
                    params+="ids="+item.userid
                }else {
                    params+="&ids="+item.userid
                }
            });
            layer.confirm('真的删除选中的用户吗', function(index){
                layer.close(index);
                //向服务端发送删除指令
                $.post("${ctx}/user/deleteBatchUser",params,function(res) {
                    layer.msg(res.msg);
                    //数据表单刷新
                    tableIns.reload();
                })
            });
        }
    });
</script>
</body>
</html>