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
    <title>角色管理数据表</title>
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
<%-- dtree引用了layui，所以要将layui.js放在dtree相关文件的上方，否则报错--%>

    <link rel="stylesheet" href="${ctx}/resources/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${ctx}/resources/layui_ext/dtree/font/dtreefont.css">
</head>
<body style="margin: 10px">


<div class="layui-container" style="align-content: center;height: 100%">
     <%-- 搜索条件开始 --%>
    <div class="layui-collapse" lay-filter="test">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">条件查询</h2>
            <div class="layui-colla-content">
                <div style="padding: 10px" id="queryDiv" >
                    <form class="layui-form" method="post" id="searchFrm">
                            <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">角色名称:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="rolename" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入角色名称" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">角色备注:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="roledesc" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入角色名称" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">是否可用:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="radio" name="available" value="1" title="是">
                                    <input type="radio" name="available" value="0" title="否">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" style="position: relative;left: 40%;top: 20px">
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
    <table class="layui-hide" id="roleTable" lay-filter="roleTable">
        <div style="display: none;" id="roleToolBar">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
            <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
        </div>
        <div id="roleBar" style="display: none;">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectRoleMenu">分配菜单</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </div>
    </table>
    <%-- 数据表格结束 --%>
</div>



    <%-- 添加和修改的弹出层开始 --%>
    <div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
        <form class="layui-form " lay-filter="dataFrm" id="dataFrm" >

            <div class="layui-form-item">
                <label class="layui-form-label">角色名称:</label>
                <div class="layui-input-block">
                    <div style="display: none">
                        <input type="text" name="roleid">
                    </div>
                    <input type="text" name="rolename" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">角色备注:</label>
                <div class="layui-input-block">
                    <input type="text" name="roledesc" autocomplete="off"
                class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-input-inline">
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
<div id="selectRoleMenuDiv" style="display: none">
     <ul id="menuTree" class="dtree" data-id="0"></ul>
</div>
<%--分配菜单的弹出层结束--%>

<script type="text/javascript" src="${ctx}/resources/layui_ext/dist/dtree.js"></script>
<script type="text/javascript">

    let $;
    let layer;
    let form;
    let table;
    let dtree;
    let element;
    let tableIns; //数据表格

    layui.extend({
        dtree:'${ctx}/resources/layui_ext/dist/dtree'
    }).use([ 'jquery', 'layer', 'form', 'table','dtree','element'], function() {

        $ = layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        dtree = layui.dtree;
        element = layui.element;

        //渲染数据表格
        tableIns=table.render({
            elem: '#roleTable' //渲染的目标对象
            ,url:'${ctx}/role/loadAllRole' //数据接口
            ,title: '角色数据表'//数据导出来的标题
            ,toolbar:"#roleToolBar" //表格的工具条
            ,height:'auto'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true //是否启用分页
            ,cols: [[ //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'roleid', title:'ID',align:'center'}
                ,{field:'rolename', title:'角色名称',align:'center'}
                ,{field:'roledesc', title:'角色备注',align:'center'}
                ,{field:'available', title:'是否可用',align:'center',templet:function(d){
                return d.available=='1'?'<font color="blue">是</font>':'<font color="red">否</font>';
                }}
            ,{fixed: 'right',title: '操作',toolbar:'#roleBar',align: 'center'}
            ]],
            done:function (data, curr) {
                //不是第一页时，如果当前返回的数据为0那么就返回上一页
                if(data.data.length==0&&curr!=1){
                    tableIns.reload({
                        page:{curr:curr-1}
                    })
                }
            }
        })

         //条件查询
        $("#doSearch").click(function() {
            //搜索表单中的输入信息系列化
            let params = $("#searchFrm").serialize()
            tableIns.reload({
                url:'${ctx}/role/loadAllRole?'+params,
            })
        })

        //监听头部工具栏事件
        table.on("toolbar(roleTable)",function(obj){
            switch(obj.event){
                case 'add':
                openAddRole();
                break;
                case 'deleteBatch':
                deleteBatch();
                break;
            };
        })

        //监听行工具事件
        table.on('tool(roleTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除【'+data.rolename+'】吗', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${ctx}/role/deleteRole",{roleid: data.roleid},function(res) {
                        layer.msg(res.msg);
                        //数据表单刷新
                        tableIns.reload();
                    })
                });
            } else if(layEvent === 'edit'){ //编辑
                openUpdateRole(data)
            }else if (layEvent === 'selectRoleMenu'){
                openSelectRoleMenu(data)
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
        function openAddRole(){
            mainIndex = layer.open({
                type:1,
                title:'添加角色',
                content:$("#saveOrUpdateDiv"),
                area:['500px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    url='${ctx}/role/addRole'
                    //每次打开前重置数据
                    $("#reset").click();
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
        function openUpdateRole(data){
            mainIndex = layer.open({
                type:1,
                title:'修改角色',
                content:$("#saveOrUpdateDiv"),
                area:['500px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    url='${ctx}/role/updateRole'
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


        //打开分配菜单弹出层
        function openSelectRoleMenu(data){
            let menuTree
            layer.open({
                type:1,
                title:'给【'+data.rolename+'】分配菜单权限',
                content:$("#selectRoleMenuDiv"),
                area:['300px','500px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    // 初始化树
                    menuTree = dtree.render({
                        elem: "#menuTree",
                        dataStyle: "layuiStyle",  //使用layui风格的数据格式
                        response:{message:"msg",statusCode:0},  //修改response中返回数据的定义
                        dataFormat: "list",  //配置data的风格为list
                        checkbar: true,
                        checkbarType: "all", // 默认就是all，其他的值为： no-all  p-casc   self  only\
                        checkbarData: "choose" ,
                        url: "${ctx}/role/initRoleMenuTreeJson?roleid="+data.roleid // 使用url加载（可与data加载同时存在）
                    });
                },btn:['<div class="layui-icon layui-icon-ok">分配</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //获取复选框选中的节点对象
                    let nodes = dtree.getCheckbarNodesParam("menuTree");
                    //获取当前节点角色id
                    let roleid = data.roleid;
                    //生成角色菜单关系字符串
                    let params = "roleid="+roleid;
                    $.each(nodes,function (i,item) {
                        params += "&ids=" + item.nodeId
                    });
                    //保存角色菜单关系
                    $.post("${ctx}/role/saveRoleMenu",params,function (obj) {
                        layer.msg(obj.msg);
                    })
                    layer.msg("保存")
                    layer.close(index)
                },
            });
        }

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            let checkStatus = table.checkStatus('roleTable');
            let data=checkStatus.data;
            let params="";
            $.each(data,function (i,item) {
                if (i==0){
                    params+="ids="+item.roleid
                }else {
                    params+="&ids="+item.roleid
                }
            });
            layer.confirm('真的删除选中的角色吗', function(index){
                layer.close(index);
                //向服务端发送删除指令
                $.post("${ctx}/role/deleteBatchRole",params,function(res) {
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