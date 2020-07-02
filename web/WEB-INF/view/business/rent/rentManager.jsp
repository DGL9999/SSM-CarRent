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
    <title>出租单管理数据表</title>
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
                            <label class="layui-form-label">出租单号:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="rentid" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入出租单号" style="height: 30px;border-radius: 10px">
                            </div>
                            <label class="layui-form-label">身份证号:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="identity" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入身份证号" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">开始时间:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="startTime" id="startTime" autocomplete="off" class="layui-input layui-input-inline" readonly="readonly"
                                placeholder="请选择开始时间" style="height: 30px;border-radius: 10px">
                            </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">结束时间:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="endTime" id="endTime" autocomplete="off" class="layui-input layui-input-inline" readonly="readonly"
                                placeholder="请选择结束时间" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>

                        </div>
                        <div class="layui-form-item">
                             <label class="layui-form-label">车牌号:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="carnumber" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入车牌号" style="height: 30px;border-radius: 10px">
                            </div>
                            <label class="layui-form-label">是否归还:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="radio" name="rentflag" value="1"  title="是">
                                <input type="radio" name="rentflag" value="0" title="否">
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
    <table class="layui-hide" id="rentTable" lay-filter="rentTable">
        <script type="text/html" id="rentBar">
              {{#  if(d.rentflag == 1){ }}
              <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="exportRent">导出出租单</a>
              {{#  } else { }}
                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                <a class="layui-btn layui-btn-warm   layui-btn-xs" lay-event="exportRent">导出出租单</a>
              {{#  } }}

        </script>
    </table>
    <%-- 数据表格结束 --%>


    <%-- 添加和修改的弹出层开始 --%>
    <div style="display: none;padding: 50px 75px 30px; " id="saveOrUpdateDiv" >
        <form class="layui-form " lay-filter="dataFrm" id="dataFrm" >
            <div class="layui-form-item">
                <label class="layui-form-label">起租时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="begindate" id="begindate" readonly="readonly" autocomplete="off" class="layui-input">
                </div>

                <label class="layui-form-label">还车时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="returndate" id="returndate" readonly="readonly" autocomplete="off" lay-verify="required" class="layui-input">
                </div>
             </div>
             <div class="layui-form-item">
                <label class="layui-form-label">出租单号:</label>
                <div class="layui-input-block">
                    <input type="text" name="rentid" id="rentid" readonly="readonly" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-block">
                    <input type="text" name="identity" id="identity" readonly="readonly" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">车牌号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="carnumber" id="carnumber" readonly="readonly" autocomplete="off" class="layui-input">
                </div>

                <label class="layui-form-label">出租价格:</label>
                <div class="layui-input-inline">
                    <input type="text" name="price" id="price" lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">操作员:</label>
                <div class="layui-input-inline">
                    <input type="text" name="opername" id="opername" readonly="readonly" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">是否归还:</label>
                    <div class="layui-input-inline" style="padding: 5px">
                        <input type="radio" name="rentflag" value="1"  title="是">
                        <input type="radio" name="rentflag" value="0" title="否">
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
        laydate.render({
            elem:'#begindate',
            type:'datetime'
        })
        laydate.render({
            elem:'#returndate',
            type:'datetime'
        })


        //渲染数据表格
        tableIns=table.render({
            elem: '#rentTable' //渲染的目标对象
            ,url:'${ctx}/rent/loadAllRent' //数据接口
            ,title: '出租单数据表'//数据导出来的标题
            ,height:'auto'
            ,cellMinWidth:100 //设置列的最小默认宽度
            , toolbar: "#checkToolBar"   //表格的工具条
            ,page: true //是否启用分页
            ,cols: [[ //列表数据
                {field:'rentid', title:'出租单号',align:'center',width:'13%'}
                ,{field:'identity', title:'身份证号',align:'center',width:'13%'}
                ,{field:'carnumber', title:'车牌号',align:'center',width:'8%'}
                ,{field:'begindate', title:'起租时间',align:'center',width:'12%'}
                ,{field:'returndate', title:'归还时间',align:'center',width:'12%'}
                ,{field:'price', title:'租金',align:'center',width:'6%'}
                ,{field:'rentflag', title:'是否归还',align:'center',width:'7%',templet:function(d){
                return d.rentflag=='1'?'<font color="blue">是</font>':'<font color="red">否</font>';
                }}
                ,{field:'opername', title:'操作员',align:'center',width:'7%'}
                ,{field:'createtime', title:'创建时间',align:'center',width:'12%'}
                ,{fixed: 'right',title: '操作',toolbar:'#rentBar',align: 'center',width:'10%'}
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
                url:'${ctx}/rent/loadAllRent?'+params,
                page:{curr:1}
            })
        })

              //监听行工具事件
        table.on('tool(rentTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除【'+data.rentid+'】出租单吗', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${ctx}/rent/deleteRent",{rentid: data.rentid},function(res) {
                        layer.msg(res.msg);
                        //数据表单刷新
                        tableIns.reload();
                    })
                });
            }else if(layEvent === 'edit') { //编辑
                openUpdateRent(data)
            }else if (layEvent === 'exportRent'){
                window.location.href = "${ctx}/stat/exportRent?rentid="+data.rentid;
            }
        });

        //提交按钮
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            let params = $("#dataFrm").serialize();
            $.post("${ctx}/rent/updateRent", params, function (obj) {
                layer.msg(obj.msg);
                //刷新数据 表格
                tableIns.reload();
            })
            //提交成功，关闭弹出层
            layer.close(mainIndex);
            });

        let mainIndex;
        //打开修改页面弹出层
        function openUpdateRent(data){
            mainIndex = layer.open({
                type:1,
                title:'修改出租单',
                content:$("#saveOrUpdateDiv"),
                area:['900px','500px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
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
    });
</script>
</body>
</html>