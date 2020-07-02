<%--
  Created by IntelliJ IDEA.
  User: Deja wu
  Date: 2020/6/27
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公司销售额统计</title>
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
<body style="height: 100%; margin: 0">

    <%-- 搜索条件开始 --%>
    <div class="layui-collapse layui-show" lay-filter="test" lay-accordion="">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">年度销售额统计</h2>
            <div class="layui-colla-content layui-show" id="collaContent">
                <div style="padding: 10px" id="queryDiv" >
                    <form class="layui-form" method="post" id="searchFrm">
                        <div class="layui-container" style="padding-left: 400px">
                        <div class="layui-form-item">
                            <label class="layui-form-label">选择年月份:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" class="layui-input" id="year" readonly="readonly" placeholder="yyyy">
                            </div>
                        </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" style="position: relative;left: 48%;top: 10px">
                                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" id="doSearch">查询 </button>
                            </div>
                        </div>
                    </form>
                    <div id="container" style="height: 100%"></div>
                </div>
            </div>
        </div>
    </div>
   <%-- 搜索条件结束 --%>



    <script type="text/javascript" src="${ctx}/resources/echarts/js/echarts.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">

    let $;
    let layer;
    let form;
    let table;
    let element;
    let laydate;
    let tableIns; //数据表格
    let month;   //转换后的时间格式
    let year;
    let yearSelector;

    layui.use([ 'jquery', 'layer', 'form', 'table','element','laydate'], function() {
        $= layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        laydate = layui.laydate;


        //年月选择器
        yearSelector = laydate.render({
            elem: '#year'
            ,type: 'year'
            ,value:new Date()
            ,done: function(value, date, endDate){
                //再次选择时间后，将选择后的值赋给year
                year = value;
            }
        });


        //页面一初始化 year的数值就为当前年份
        let data = yearSelector.config.value;
        year = data.getFullYear()
        $("#doSearch").click(function () {
            getYear(year);
        })

        //默认加载
        $("#doSearch").click()

        function getYear(year) {
            $.get("${ctx}/stat/loadCompanySaleStat",{year:year},function (data) {
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    title: {
                        text: '公司年度销售额统计',
                        subtext: '真实有效',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    xAxis: {
                        name: '月份',
                        type: 'category',
                        data: data.name
                    },
                    yAxis: {
                        name: '金额',
                        type: 'value'
                    },
                    series: [{
                        name: '销售额（元）',
                        data: data.value,
                        type: 'line'
                    }]
                };
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            });
        }
    })
    </script>
</body>
</html>
