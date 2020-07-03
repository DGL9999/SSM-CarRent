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
    <title>车辆入库管理数据表</title>
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
            <div class="layui-colla-content layui-show" id="query_collaContent">
                <div style="padding: 10px" id="queryDiv" >
                    <form class="layui-form" method="post" id="searchFrm">
                        <div class="layui-container" style="padding-left: 400px">
                        <div class="layui-form-item">
                            <label class="layui-form-label">出租单号:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="serch_rentid" id="serch_rentid" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入出租单号" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" style="position: relative;left: 45%;top: 20px">
                                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" id="query_doSearch">查询 </button>
                                <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" id="query_doReset">重置 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <%-- 搜索条件结束 --%>

    <%-- 检查单开始 --%>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">检查单表单</h2>
            <div class="layui-colla-content layui-hide" id="check_collaContent">
                <div style="padding: 10px" id="checkDiv" >
                    <form class="layui-form " method="post" id="checkFrm" lay-filter="checkFrm">
                        <div class="layui-container " id="check_content" style="padding-left: 100px">
                        <div class="layui-form-item">
                            <label class="layui-form-label">检查单号:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="checkid"  readonly="readonly" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入检查单号" style="height: 30px;border-radius: 10px">
                            </div>
                            <label class="layui-form-label">出租单号:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="rentid" readonly="readonly" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入检查时间" style="height: 30px;border-radius: 10px">
                            </div>
                            <label class="layui-form-label">检查时间:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="checkdate" id="checkdate" readonly="readonly" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入检查时间" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">存在问题:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="problem" id="problem" lay-verify="required" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入存在问题" style="height: 30px;border-radius: 10px">
                            </div>
                            <label class="layui-form-label">赔付金额:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="paymoney" id="paymoney" lay-verify="required|number" value="0" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入赔付金额" style="height: 30px;border-radius: 10px">
                            </div>
                            <label class="layui-form-label">操作人:</label>
                            <div class="layui-input-inline" style="padding: 5px">
                                <input type="text" name="opername" readonly="readonly" autocomplete="off" class="layui-input layui-input-inline"
                                placeholder="请输入操作人" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">问题描述:</label>
                            <div class="layui-input-inline" style="padding: 5px; width: 830px">
                               <textarea placeholder="请输入问题描述" name="checkdesc" id="checkdesc" lay-verify="required" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" style="position: relative;left: 38%;top: 20px">
                                <button type="button" lay-submit="" lay-filter="doSubmit" class="layui-btn layui-btn-normal layui-icon layui-icon-release layui-btn-radius layui-btn-sm" id="doSubmit">保存 </button>
                                <button type="button" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" id="doReset">重置 </button>
                            </div>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
            <%-- 出租单，车辆，客户信息展开  开始 --%>
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">出租单——车辆——客户信息</h2>
            <div class="layui-colla-content layui-hide" id="info_collaContent">
                <div style="padding: 10px; background-color: #F2F2F2;">
                    <div class="layui-row layui-col-space8">
                        <div class="layui-col-md4">
                            <div class="layui-card" style="height: 550px">
                                <div class="layui-card-header">车辆信息</div>
                                <div class="layui-card-body" id="car_carnumber"></div>
                                <div class="layui-card-body" id="car_cartype"></div>
                                <div class="layui-card-body" id="car_color"></div>
                                <div class="layui-card-body" id="car_price"></div>
                                <div class="layui-card-body" id="car_rentprice"></div>
                                <div class="layui-card-body" id="car_deposit"></div>
                                <div class="layui-card-body" id="car_description"></div>
                                <div class="layui-card-body">
                                    车辆图片：<img src="" width="250" height="180" id="car_carimg">
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md4">
                            <div class="layui-card" style="height: 550px">
                            <div class="layui-card-header">出租单信息</div>
                                <div class="layui-card-body" id="rent_rentid"></div>
                                <div class="layui-card-body" id="rent_price"></div>
                                <div class="layui-card-body" id="rent_begindate"></div>
                                <div class="layui-card-body" id="rent_returndate"></div>
                                <div class="layui-card-body" id="rent_opername"></div>
                            </div>
                        </div>
                        <div class="layui-col-md4">
                            <div class="layui-card" style="height: 550px">
                            <div class="layui-card-header">客户信息</div>
                                <div class="layui-card-body" id="customer_identity"></div>
                                <div class="layui-card-body" id="customer_custname"></div>
                                <div class="layui-card-body" id="customer_sex"></div>
                                <div class="layui-card-body" id="customer_address"></div>
                                <div class="layui-card-body" id="customer_phone"></div>
                                <div class="layui-card-body" id="customer_career"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%-- 出租单，车辆，客户信息展开  结束 --%>
    </div>
    <%-- 检查单结束 --%>

<script type="text/javascript">

    let $;
    let layer;
    let form;
    let table;
    let element;
    let laydate;
    let tableIns; //数据表格
    let rentid;

    layui.use([ 'jquery', 'layer', 'form', 'table','element','laydate'], function() {

        $= layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        laydate = layui.laydate;


         //条件查询
        $("#query_doSearch").click(function() {
            //搜索表单中的输入信息系列化
            rentid = $("#serch_rentid").val()
            $.post("${ctx}/check/checkRentExist",{rentid:rentid},function (obj) {
                if (obj === ""){
                    layer.msg("出租单号不存在");
                    //当查询未成功时 ，其他两栏隐藏，且收起
                    $("#check_collaContent").addClass('layui-hide');
                    $("#info_collaContent").addClass('layui-hide');
                    $("#check_collaContent").removeClass('layui-show');
                    $("#info_collaContent").removeClass('layui-show');
                }else {
                    if (obj.rentflag ==1 ){
                        layer.msg("您输入的出租单号相关车辆已经归还");
                         //当查询未成功时 ，其他两栏隐藏，且收起
                        $("#check_collaContent").addClass('layui-hide');
                        $("#info_collaContent").addClass('layui-hide');
                        $("#check_collaContent").removeClass('layui-show');
                        $("#info_collaContent").removeClass('layui-show');
                    }else {
                        initCheckFormData();

                        //当查询成功时 ，其他两栏显示，且展开。 查询栏收起
                        $("#check_collaContent").removeClass('layui-hide');
                        $("#info_collaContent").removeClass('layui-hide');
                        $("#check_collaContent").addClass('layui-show');
                        $("#info_collaContent").addClass('layui-show');
                        $("#query_collaContent").removeClass('layui-show');
                    }
                }
            })
        })

        //重置按钮
        $("#doReset").click(function() {
            $("#problem").val("");
            $("#paymoney").val("");
            $("#checkdesc").val("");
        })

        //保存
        form.on("submit(doSubmit)",function () {
            let params = $("#checkFrm").serialize();
            $.post("${ctx}/check/saveCheck",params,function (obj) {
                layer.msg(obj.msg);
                //保存成功后，将内容隐藏，两栏收起
                $("#check_collaContent").addClass('layui-hide');
                $("#info_collaContent").addClass('layui-hide');
                $("#check_collaContent").removeClass('layui-show');
                $("#info_collaContent").removeClass('layui-show');
            })
            return false;
        })

        //加载表单数据和卡片面板数据
        function initCheckFormData() {
            $.post("${ctx}/check/initCheckFormData",{rentid:rentid},function (obj) {
                //检查单
                let check=obj.check;
                form.val("checkFrm",check);

                //客户
                let customer = obj.customer;
                $("#customer_identity").html("身份证号: "+customer.identity);
                $("#customer_custname").html("客户姓名: "+customer.custname);
                $("#customer_sex").html("客户性别: "+(customer.sex==1?'男':'女'));
                $("#customer_address").html("客户地址: "+customer.address);
                $("#customer_phone").html("客户电话: "+customer.phone);
                $("#customer_career").html("客户职业: "+customer.career);
                //出租单
                let rent = obj.rent;
                $("#rent_rentid").html("出租单号: "+rent.rentid);
                $("#rent_price").html("出租价格: "+rent.price);
                $("#rent_begindate").html("起租时间: "+rent.begindate);
                $("#rent_returndate").html("还车时间: "+rent.returndate);
                $("#rent_opername").html("操作员: "+rent.opername);
                //车辆信息
                let car = obj.car;
                $("#car_carnumber").html("车辆号牌: "+car.carnumber);
                $("#car_cartype").html("车辆类型: "+car.cartype);
                $("#car_color").html("车辆颜色: "+car.color);
                $("#car_price").html("购买价格: "+car.price);
                $("#car_rentprice").html("出租价格: "+car.rentprice);
                $("#car_deposit").html("出租押金: "+car.deposit);
                $("#car_description").html("车辆描述: "+car.description);
                $("#car_carimg").attr("src","${ctx}/file/downloadShowFile.action?path="+car.carimg);

            })
        }
    })
</script>
</body>
</html>