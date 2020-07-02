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
    <title>车辆出租管理数据表</title>
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
    <div class="layui-collapse layui-show" lay-filter="test">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">条件查询</h2>
            <div class="layui-colla-content layui-show" id="collaContent">
                <div style="padding: 10px" id="queryDiv" >
                    <form class="layui-form" method="post" id="searchFrm">
                        <div class="layui-container" style="padding-left: 400px">
                        <div class="layui-form-item">
                            <label class="layui-form-label">身份证号:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="identity" id="search_Identity" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入身份号" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" style="position: relative;left: 43%;top: 20px">
                                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" id="doSearch">查询 </button>
                                <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" id="doReset">重置 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

   <%-- 搜索条件结束 --%>

   <%-- 数据表格开始 --%>
    <div id="content" style="display: none">
         <table  id="carTable" lay-filter="carTable">
        <div id="carBar" style="display: none;">
            <a class="layui-btn layui-btn-xs" lay-event="rentCar" id="rentCar">出租汽车</a>
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="viewImage" id="viewImage">查看大图</a>
        </div>
        </table>
    </div>

   <%-- 数据表格结束 --%>


   <%-- 添加和修改的弹出层开始 --%>
    <div style="display: none;padding: 20px; " id="rentCarDiv" >
        <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
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
                    <input type="text" name="carnumber" id="carnumber" autocomplete="off" class="layui-input">
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

<%-- 查看大图的弹出层开始--%>
    <div id="viewCarImage" style="display: none; text-align: center" class=" layui-layer-photos">
        <img  id="view_carImage">
    </div>


<%-- 查看大图的弹出层结束--%>
<script type="text/javascript">

    let $;
    let layer;
    let form;
    let table;
    let element;
    let laydate;
    let tableIns; //数据表格

    layui.use([ 'jquery', 'layer', 'form', 'table','element','laydate'], function() {

        $= layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        laydate = layui.laydate;

        //渲染时间选择器
        laydate.render({
            elem:'#begindate',
            type:'datetime',
        })
        laydate.render({
            elem:'#returndate',
            type:'datetime',
        })

        function initCarData(){
                //渲染数据表格
            tableIns=table.render({
                elem: '#carTable' //渲染的目标对象
                ,url:'${ctx}/car/loadAllCar?isrenting=0' //数据接口
                ,title: '车辆数据表'//数据导出来的标题
                ,height:'auto'
                ,cellMinWidth:100 //设置列的最小默认宽度
                ,toolbar: "#checkToolBar"   //表格的工具条
                ,page: true //是否启用分页
                ,cols: [[ //列表数据
                    {field:'carnumber', title:'车牌号',align:'center',width:'9%'}
                    ,{field:'cartype', title:'出租类型',align:'center',width:'9%'}
                    ,{field:'color', title:'出租颜色',align:'center',width:'8%'}
                    ,{field:'price', title:'出租价格',align:'center',width:'8%'}
                    ,{field:'description', title:'出租描述',align:'center',width:'9%'}
                    ,{field:'rentprice', title:'租金',align:'center',width:'8%'}
                    ,{field:'deposit', title:'保证金',align:'center',width:'8%'}
                    ,{field:'isrenting', title:'是否出租',align:'center',width:'7%',templet:function(d){
                    return d.isrenting=='1'?'<font color="blue">是</font>':'<font color="red">否</font>';
                    }}
                    ,{field:'carimg', title:'缩略图',align:'center',width:'8%',templet:function(d){
                    return '<img width="40" height="40" src="${ctx}/file/downloadShowFile?path='+d.carimg+'"/>';
                    }}
                    ,{field:'createtime', title:'创建时间',align:'center',width:'12%'}
                    ,{fixed: 'right',title: '操作',toolbar:'#carBar',align: 'center',width:'13.5%'}
                ]],
            })
        }


         //条件查询
        $("#doSearch").click(function() {
            //搜索表单中的输入信息系列化
            let params = $("#searchFrm").serialize()
            identity = params.substr(9,params.length)
            $.post("${ctx}/rent/checkCustomerExist",params,function (obj) {
                if (obj.code >= 0){
                    $("#content").show();
                    initCarData();
                    $("#collaContent").removeClass("layui-show");
                }else {
                    layer.msg("客户身份证号不存在");
                    //隐藏数据表格
                    $("#content").hide();
                }
            })
        })


        //监听行工具事件
        table.on('tool(carTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'rentCar'){ //租车
                openRentCar(data);
            }else if (layEvent === 'viewImage'){
                openShowCarImage(data)
            }
        });

        //提交按钮
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            let params = $("#dataFrm").serialize();
            $.post("${ctx}/rent/saveRent", params, function (obj) {
                layer.msg(obj.msg);
                $("#content").hide();
            })
            //提交成功，关闭弹出层
            layer.close(mainIndex);
        });

        let identity; //从查询中取出来的身份证号
        let mainIndex;
        //打开租车页面
        function openRentCar(data){
            mainIndex = layer.open({
                type:1,
                title:'汽车出租',
                content:$("#rentCarDiv"),
                area:['700px','450px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    //清空表单数据
                    $("#reset").click();
                    //请求数据
                    $.get("${ctx}/rent/initRentFrom",{
                        identity: identity,
                        price: data.rentprice,
                        carnumber: data.carnumber
                    },function (obj) {  //obj返回的是rentVo
                        //表单赋值
                        form.val("dataFrm",obj);
                    })
                },
                btn:['<div class="layui-icon layui-icon-ok">保存</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //调用隐藏提交按钮，提交表格
                    $("#doSubmit").click();
                },
                btn2:function(index, layero){
                    layer.msg("关闭");
                    //关闭页面
                    $("#reset").click();
                    return true;
                }
            });
        }

        //打开查看大图弹出层
        function openShowCarImage(data){
            //首先将地址改成当前出租的图片地址
            $("#view_carImage").attr("src","${ctx}/file/downloadShowFile?path="+data.carimg)
            $("#view_carImage").attr("alt","出租【"+data.carnumber+"】的大图")
            //然后渲染图片
            layer.photos({
                photos: '#viewCarImage',
            });
            $("#view_carImage").click();    //这个地方出了bug   layui作者应该也没想到会有这种情况
            layer.closeAll();               //经过多次测试， 如果只每次页面的第一次查看大图和第二次会重复，其他次数不会
            $("#view_carImage").click();    //因此第一次直接忽略，从第二次开始算。之后的查看大图没有bug
        }
    });

</script>
</body>
</html>