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
    <title>日志管理数据表</title>
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


<div class="layui-container" style="align-content: center;height: 100%">
     <%-- 搜索条件开始 --%>
    <div class="layui-collapse" lay-filter="test">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">条件查询</h2>
            <div class="layui-colla-content">
                <div style="padding: 10px" id="queryDiv" >
                    <form class="layui-form" method="post" id="searchFrm">
                        <div class="layui-container" style="padding-left: 200px">
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">登录名:</label>
                                    <div class="layui-input-inline" style="padding: 5px">
                                        <input type="text" name="loginname" autocomplete="off" class="layui-input layui-input-inline"
                                        placeholder="请输入登录名" style="height: 30px;border-radius: 10px">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">登录IP:</label>
                                    <div class="layui-input-inline" style="padding: 5px">
                                        <input type="text" name="loginip" autocomplete="off" class="layui-input layui-input-inline"
                                        placeholder="请输入登录IP" style="height: 30px;border-radius: 10px">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">开始时间:</label>
                                    <div class="layui-input-inline" style="padding: 5px">
                                        <input type="text" name="startTime" id="startTime" autocomplete="off" class="layui-input layui-input-inline" readonly="readonly"
                                        placeholder="请选择开始时间" style="height: 30px;border-radius: 10px">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">结束时间:</label>
                                    <div class="layui-input-inline" style="padding: 5px">
                                        <input type="text" name="endTime" id="endTime" autocomplete="off" class="layui-input layui-input-inline" readonly="readonly"
                                        placeholder="请选择结束时间" style="height: 30px;border-radius: 10px">
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

<%--    --%>
    
    <%-- 数据表格开始 --%>
    <table class="layui-hide" id="loginTable" lay-filter="loginTable">
        <div style="display: none;" id="loginToolBar">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
        </div>
        <div id="loginBar" style="display: none;">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </div>
    </table>
    <%-- 数据表格结束 --%>
</div>

<script type="text/javascript">

    let $;
    let layer;
    let form;
    let table;
    let element;
    let laydate;
    let tableIns; //数据表格

    layui.use([ 'jquery', 'layer', 'form', 'table','element','laydate'], function() {

        $ = layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        laydate = layui.laydate;

        //渲染时间
        laydate.render({
            elem:'#startTime',
            type:'datetime'
        })
        laydate.render({
            elem:'#endTime',
            type:'datetime'
        })

        //条件查询
        $("#doSearch").click(function() {
            //搜索表单中的输入信息系列化
            let params = $("#searchFrm").serialize()
            tableIns.reload({
                url:'${ctx}/loginInfo/loadAllLoginInfo?'+params,
                page:{curr:1}
            })
        })

        //渲染数据表格
        tableIns=table.render({
            elem: '#loginTable' //渲染的目标对象
            ,url:'${ctx}/loginInfo/loadAllLoginInfo' //数据接口
            ,title: '日志数据表'//数据导出来的标题
            ,toolbar:"#loginToolBar" //表格的工具条
            ,height:'auto'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true //是否启用分页
            ,cols: [[ //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID',align:'center'}
                ,{field:'loginname', title:'登录名',align:'center'}
                ,{field:'loginip', title:'登录IP',align:'center'}
                ,{field:'logintime', title:'登录时间',align:'center'}
                ,{fixed: 'right',title: '操作',toolbar:'#loginBar',align: 'center'}
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

        //监听头部工具栏事件
        table.on("toolbar(loginTable)",function(obj){
            switch(obj.event){
                case 'deleteBatch':
                deleteBatch();
                break;
            };
        })

        //监听行工具事件
        table.on('tool(loginTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除【'+data.loginname+'】吗', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${ctx}/loginInfo/deleteLoginInfo",{id: data.id},function(res) {
                        layer.msg(res.msg);
                        //数据表单刷新
                        tableIns.reload();
                    })
                });
            }
        });

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            let checkStatus = table.checkStatus('loginTable');
            let data=checkStatus.data;
            let params="";
            $.each(data,function (i,item) {
                if (i==0){
                    params+="ids="+item.id
                }else {
                    params+="&ids="+item.id
                }
            });
            layer.confirm('真的删除选中的日志吗', function(index){
                layer.close(index);
                //向服务端发送删除指令
                $.post("${ctx}/loginInfo/deleteBatchLoginInfo",params,function(res) {
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