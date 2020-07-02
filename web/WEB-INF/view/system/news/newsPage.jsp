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
    <title>公告查看</title>
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
                        <div class="layui-container" style="padding-left: 210px">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">公告标题:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="title" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入公告标题" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">操作人:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="opername" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入操作人" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">开始时间:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="startTime" id="startTime" readonly="readonly" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入开始时间" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">结束时间:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="endTime" id="endTime" readonly="readonly" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入结束时间" style="height: 30px;border-radius: 10px">
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
    <table class="layui-hide" id="newsTable" lay-filter="newsTable">
        <div id="newsBar" style="display: none;">
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="viewNews">查看</a>
        </div>
    </table>
    <%-- 数据表格结束 --%>
</div>

<%--查看公告的div开始--%>
    <div id="viewNewsDiv" style="padding: 10px;display: none">
        <h2 id="view_title" align="center"></h2>
        <hr>
        <div style="text-align: right">
            发布人:<span id="view_opername"></span>
            <span style="display: inline-block;width: 20px"></span>
            发布时间:<span id="view_createtime"></span>
        </div>
        <hr>
        <div id="view_content"></div>
    </div>
<%--查看公告的div结束--%>

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


        //渲染数据表格
        tableIns=table.render({
            elem: '#newsTable' //渲染的目标对象
            ,url:'${ctx}/news/loadAllNews' //数据接口
            ,title: '公告数据表'//数据导出来的标题
            ,height:'auto'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true //是否启用分页
            ,cols: [[ //列表数据
                {field:'id', title:'ID',align:'center'}
                ,{field:'title', title:'公告标题',align:'center'}
                ,{field:'createtime', title:'创建时间',align:'center'}
                ,{field:'opername', title:'操作人',align:'center'}
                ,{fixed: 'right',title: '操作',toolbar:'#newsBar',align: 'center'}
            ]],
        })

        //条件查询
        $("#doSearch").click(function() {
            //搜索表单中的输入信息系列化
            let params = $("#searchFrm").serialize()
            tableIns.reload({
                url:'${ctx}/news/loadAllNews?'+params,
                page:{curr:1}
            })
        })

        //监听行工具事件
        table.on('tool(newsTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'viewNews'){
                openViewNews(data);
            }
        });

         //打开查看公告页面弹出层
        function openViewNews(data) {
            layer.open({
                type: 1,
                title: '查看公告',
                content: $("#viewNewsDiv"),
                area: ['1000px', '600px'],
                btnAlign: 'c',
                success: function (index) {
                    $("#view_title").html(data.title);
                    $("#view_opername").html(data.opername);
                    $("#view_createtime").html(data.createtime);
                    $("#view_content").html(data.content);
                },
            })
        }
    });
</script>
</body>
</html>