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
    <title>业务员销售额统计</title>
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
            <div class="layui-colla-content" id="year_collaContent">
                <div style="padding: 10px" id="year_queryDiv" >
                    <form class="layui-form" method="post" id="year_searchFrm">
                        <div class="layui-container" style="padding-left: 400px">
                        <div class="layui-form-item">
                            <label class="layui-form-label">选择年月份:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" class="layui-input" id="year" readonly="readonly" placeholder="yyyy-MM">
                            </div>
                        </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" style="position: relative;left: 48%;top: 10px">
                                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" id="year_doSearch">查询 </button>
                            </div>
                        </div>
                    </form>
                    <div id="year_container" style="height: 100%"></div>
                </div>
            </div>
        </div>


        <div class="layui-colla-item">
            <h2 class="layui-colla-title">月度销售额统计</h2>
            <div class="layui-colla-content layui-show" id="collaContent">
                <div style="padding: 10px" id="queryDiv" >
                    <form class="layui-form" method="post" id="searchFrm">
                        <div class="layui-container" style="padding-left: 400px">
                        <div class="layui-form-item">
                            <label class="layui-form-label">选择年月份:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" class="layui-input" id="yearMonth" readonly="readonly" placeholder="yyyy">
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
    let dateSelect;  //时间选择器
    let month;   //转换后的时间格式
    let year;

    layui.use([ 'jquery', 'layer', 'form', 'table','element','laydate'], function() {
        $= layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        laydate = layui.laydate;

        //年月选择器
        dateSelect = laydate.render({
            elem: '#yearMonth'
            ,type: 'month'
            ,value:new Date()
            ,done: function(value, date, endDate){
                //再次选择时间后，将选择后的值赋给month
                month = value;
            }
        });

        //将从时间选择器中获得的时间戳转换成年月格式
        function dateFormat(data) {
          let date = new Date(data)
          let Y = date.getFullYear() + '-'
          let M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1)
          return Y + M
        }

        //在页面一加载时，将时间选择器初始值转换为年月格式赋值给month
        month = dateFormat(dateSelect.config.value.getTime());
        $("#doSearch").click(function () {
            //将年月格式传给后台， 让后台去加载此年月份的业务员销售额数据
            getYearMonth(month);
        })
        //默认加载
        $("#doSearch").click()


        function getYearMonth(month){
            $.get("${ctx}/stat/loadOpernameSaleStat",{month:month},function (data) {
            var dom = document.getElementById("container");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;
            option = {
                title: {
                    text: '业务员月份销售额',
                    subtext: '真实有效',
                    left: 'center'
                        },
                color: ['#3398DB'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
                    {
                        name: '姓名',
                        type: 'category',
                        data: data.name,
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis: [
                    {
                        name: '金额',
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '销售额（元）',
                        type: 'bar',
                        barWidth: '60%',
                        data: data.value
                    }
                ]
            };

            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
            })
        }


        let yearSelector;
        //年月选择器
        yearSelector = laydate.render({
            elem: '#year'
            ,type: 'year'
            ,value:new Date()
        });

        $("#year_doSearch").click(function () {
            year = yearSelector.config.dateTime.year
            console.log(year);
            getYear(year);
        })

        function getYear(year) {
            $.get("${ctx}/stat/loadOpernameYearGradeStatJson",{year:year},function (data) {
                var dom = document.getElementById("year_container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                app.title = '坐标轴刻度与标签对齐';
                option = {
                    title:{
                        text:'业务员年度销售额统计',
                        x:'center'
                    },
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        top:'20%',
                        left: '3%',
                        right: '4%',
                        bottom: '1%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            name: '姓名',
                            type : 'category',
                            data : data.name,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis : [
                        {
                            name: '金额',
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'销售额(元)',
                            type:'bar',
                            barWidth: '30%',
                            data:data.value
                        }
                    ]
                };
                ;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            });
        }

    })

    </script>
</body>
</html>
