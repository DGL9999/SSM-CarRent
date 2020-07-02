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
    <title>公告管理数据表</title>
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
        <div style="display: none;" id="newsToolBar">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
            <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
        </div>
        <div id="newsBar" style="display: none;">
            <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="viewNews">查看</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </div>
    </table>
    <%-- 数据表格结束 --%>
</div>

    <%-- 添加和修改的弹出层开始 --%>
    <div style="display: none; padding: 50px 30px 10px 10px;" id="saveOrUpdateDiv" >
        <form class="layui-form " lay-filter="dataFrm" id="dataFrm" >
            <div class="layui-form-item">
                <label class="layui-form-label">公告标题:</label>
                <div class="layui-input-block ">
                    <div style="display: none">
                        <input type="text" name="id">
                    </div>
                    <input type="text" name="title" autocomplete="off" lay-verify="required" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">公告内容:</label>
                <div class="layui-input-block">
                    <textarea name="content" id="content" lay-verify="content" class="layui-textarea layui-hide" ></textarea>
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
    let layedit;

    let tableIns; //数据表格
    let editIndex; //公告内容富文本编辑器

    layui.use([ 'jquery', 'layer', 'form', 'table','element','laydate','layedit'], function() {

        $ = layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        laydate = layui.laydate;
        layedit = layui.layedit;
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
            ,toolbar:"#newsToolBar" //表格的工具条
            ,height:'auto'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true //是否启用分页
            ,cols: [[ //列表数据
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID',align:'center'}
                ,{field:'title', title:'公告标题',align:'center'}
                // ,{field:'content', title:'公告内容',align:'center'}
                ,{field:'createtime', title:'创建时间',align:'center'}
                ,{field:'opername', title:'操作人',align:'center'}
                ,{fixed: 'right',title: '操作',toolbar:'#newsBar',align: 'center'}
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
                url:'${ctx}/news/loadAllNews?'+params,
                page:{curr:1}
            })
        })

        //监听头部工具栏事件
        table.on("toolbar(newsTable)",function(obj){
            switch(obj.event){
                case 'add':
                openAddNews();
                break;
                case 'deleteBatch':
                deleteBatch();
                break;
            };
        })

        //监听行工具事件
        table.on('tool(newsTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除【'+data.title+'】这个公告吗', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${ctx}/news/deleteNews",{id:data.id},function(res) {
                        layer.msg(res.msg);
                        //数据表单刷新
                        tableIns.reload();
                    })
                });
            }else if(layEvent === 'edit'){ //编辑
                openUpdateNews(data);
            }else if(layEvent === 'viewNews'){
                openViewNews(data);
            }
        });

         //提交按钮
        form.on("submit(doSubmit)", function (obj) {
            layedit.sync(editIndex); //把富文本中的数据同步到textarea
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

        //重置按钮，重置富文本
        $("#reset").click(function () {
            layedit.setContent(editIndex,"");
        });


        let url;
        let mainIndex;
        //打开添加页面
        function openAddNews(){
            mainIndex = layer.open({
                type:1,
                title:'添加公告',
                content:$("#saveOrUpdateDiv"),
                area:['1000px','600px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    //建立富文本编辑器
                    editIndex = layedit.build('content',{height: 310})
                    //清空表单
                    $("#reset").click();
                    url='${ctx}/news/addNews'
                },
                btn:['<div class="layui-icon layui-icon-ok">保存</div>','<div class="layui-icon  layui-icon-refresh">重置</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //调用隐藏提交按钮，提交表格
                    $("#doSubmit").click();
                    $("#reset").click();
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
        function openUpdateNews(data){
            mainIndex = layer.open({
                type:1,
                title:'修改公告',
                content:$("#saveOrUpdateDiv"),
                area:['1000px','600px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    //建立富文本编辑器
                    editIndex = layedit.build('content',{height: 310})
                    url='${ctx}/news/updateNews'
                    //需要修改的信息填入表格
                    form.val("dataFrm",data);
                    //将后端查询出来的内容显示在富文本上
                    layedit.setContent(editIndex,data.content)
                },
                btn:['<div class="layui-icon layui-icon-ok">修改</div>','<div class="layui-icon  layui-icon-refresh">重置</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //调用隐藏提交按钮，提交表格
                    $("#doSubmit").click();
                    //修改成功关闭弹出层
                    layer.close(index);
                    $("#reset").click();
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

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            let checkStatus = table.checkStatus('newsTable');
            let data=checkStatus.data;
            let params="";
            $.each(data,function (i,item) {
                if (i==0){
                    params+="ids="+item.id
                }else {
                    params+="&ids="+item.id
                }
            });
            layer.confirm('真的删除选中的公告吗', function(index){
                layer.close(index);
                //向服务端发送删除指令
                $.post("${ctx}/news/deleteBatchNews",params,function(res) {
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