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
    <title>车辆管理数据表</title>
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
                                <label class="layui-form-label">车牌号:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="carnumber" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入车牌号" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">车辆类型:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="cartype" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入车辆类型" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">车辆颜色:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="color" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入车辆颜色" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">车辆描述:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="text" name="description" autocomplete="off" class="layui-input layui-input-inline"
                                    placeholder="请输入车辆描述" style="height: 30px;border-radius: 10px">
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                        <div class="layui-inline">
                                <label class="layui-form-label">是否出租:</label>
                                <div class="layui-input-inline" style="padding: 5px">
                                    <input type="radio" name="isrenting" value="1"  title="是">
                                    <input type="radio" name="isrenting" value="0" title="否">
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
    <table class="layui-hide" id="carTable" lay-filter="carTable">
        <div style="display: none;" id="carToolBar">
            <button type="button" class="layui-btn layui-btn-sm" lay-event="add">增加</button>
            <button type="button" class="layui-btn layui-btn-sm" lay-event="deleteBatch">批量删除</button>
        </div>
        <div id="carBar" style="display: none;">
            <a class="layui-btn layui-btn-xs" lay-event="edit" id="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="viewImage" id="viewImage">查看大图</a>
        </div>
    </table>
   <%-- 数据表格结束 --%>


   <%-- 添加和修改的弹出层开始 --%>
    <div style="display: none;padding: 20px; " id="saveOrUpdateDiv" >
        <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
            <div class="layui-col-md12 layui-col-xs12">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md9 layui-col-xs7">
                        <div class="layui-form-item magt3">
                            <label class="layui-form-label">车牌号</label>
                            <div class="layui-input-block">
                                <input type="text" name="carnumber" id="carnumber" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">车辆类型</label>
                            <div class="layui-input-block">
                                <input type="text" name="cartype" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">车辆颜色</label>
                            <div class="layui-input-block">
                                <input type="text" name="color" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                    </div>
                    <%--   车辆图片上传  --%>
                    <div class="layui-col-md3 layui-col-xs5">
                        <div class="layui-upload-list thumbBox mag0 magt3" id="carImageDiv" >
                            <%--  显示图片--%>
                            <img class="layui-upload-img thumbImg" id="showCarImage">
                            <%--  保存文件在数据中的地址--%>
                            <input type="hidden" name="carimg" id="carimg">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item magb0">
                    <div class="layui-inline">
                        <label class="layui-form-label">车辆价格</label>
                            <div class="layui-input-block">
                                <input type="text" name="price" class="layui-input" lay-verify="required">
                            </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">出租价格</label>
                            <div class="layui-input-block">
                                <input type="text" name="rentprice" class="layui-input" lay-verify="required|number">
                            </div>
                    </div>
                    <div class="layui-inline" style="float: right">
                        <label class="layui-form-label">保证金</label>
                        <div class="layui-input-block">
                            <input type="text" name="deposit" class="layui-input" lay-verify="required|number">
                        </div>
                    </div>
                </div>
                <div style="height: 12px"></div>

                <div class="layui-form-item magb0">
                    <div class="layui-block">
                        <label class="layui-form-label">车辆描述</label>
                        <div class="layui-input-block">
                            <input type="text" name="description" class="layui-input" lay-verify="required">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-hide magb0">
                    <div class="layui-inline">
                        <button type="button" class="layui-btn" id="doSubmit" lay-filter="doSubmit" lay-submit="" >提交</button>
                        <button type="reset" class="layui-btn" id="reset">重置</button>
                    </div>
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
    let upload;
    let tableIns; //数据表格

    layui.use([ 'jquery', 'layer', 'form', 'table','element','upload'], function() {

        $= layui.jquery;
        layer = layui.layer;
        form = layui.form;
        table = layui.table;
        element = layui.element;
        upload = layui.upload;

        //渲染数据表格
        tableIns=table.render({
            elem: '#carTable' //渲染的目标对象
            ,url:'${ctx}/car/loadAllCar' //数据接口
            ,title: '车辆数据表'//数据导出来的标题
            ,toolbar:"#carToolBar" //表格的工具条
            ,height:'auto'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true //是否启用分页
            ,cols: [[ //列表数据
                {type: 'checkbox', fixed: 'left',width:'3%'}
                ,{field:'carnumber', title:'车牌号',align:'center',width:'8%'}
                ,{field:'cartype', title:'车辆类型',align:'center',width:'8%'}
                ,{field:'color', title:'车辆颜色',align:'center',width:'8%'}
                ,{field:'price', title:'车辆价格',align:'center',width:'8%'}
                ,{field:'description', title:'车辆描述',align:'center',width:'8%'}
                ,{field:'rentprice', title:'租金',align:'center',width:'7%'}
                ,{field:'deposit', title:'保证金',align:'center',width:'7%'}
                ,{field:'isrenting', title:'是否出租',align:'center',width:'7%',templet:function(d){
                return d.isrenting=='1'?'<font color="blue">是</font>':'<font color="red">否</font>';
                }}
                ,{field:'carimg', title:'缩略图',align:'center',width:'8%',templet:function(d){
                return '<img width="40" height="40" src="${ctx}/file/downloadShowFile?path='+d.carimg+'"/>';
                }}
                ,{field:'createtime', title:'创建时间',align:'center',width:'12%'}
                ,{fixed: 'right',title: '操作',toolbar:'#carBar',align: 'center',width:'15.5%'}
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
                url:'${ctx}/car/loadAllCar?'+params,
                page:{curr:1}
            })
        })

        //监听头部工具栏事件
        table.on("toolbar(carTable)",function(obj){
            switch(obj.event){
                case 'add':
                openAddCar();
                break;
                case 'deleteBatch':
                deleteBatch();
                break;
            };
        })


        //监听行工具事件
        table.on('tool(carTable)', function(obj){
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除车牌号【'+data.carnumber+'】的车辆吗', function(index){
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("${ctx}/car/deleteCar",{carnumber: data.carnumber},function(res) {
                        layer.msg(res.msg);
                        //数据表单刷新
                        tableIns.reload();
                    })
                });
            }else if(layEvent === 'edit') { //编辑
                openUpdateCar(data)
            }else if (layEvent === 'viewImage'){
                openShowCarImage(data)
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
        function openAddCar(){
            mainIndex = layer.open({
                type:1,
                title:'添加车辆',
                content:$("#saveOrUpdateDiv"),
                area:['1000px','450px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    //清空表单数据
                    $("#reset").click();
                    //将车牌号只读去除
                    $("#carnumber").removeAttr("readonly")
                    //设置默认图片
                    $('#showCarImage').attr("src","${ctx}/file/downloadShowFile?path=images/defaultCarImage.jpg");
                    $('#carimg').val("images/defaultCarImage.jpg");
                    url='${ctx}/car/addCar'
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
                    //表单中默认图片的地址不要重置
                    $('#carimg').val("images/defaultCarImage.jpg");
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
        function openUpdateCar(data){
            let tempData = data;  //将对象暂存
            mainIndex = layer.open({
                type:1,
                title:'修改车辆',
                content:$("#saveOrUpdateDiv"),
                area:['1000px','450px'],
                btnAlign:'c',
                closeBtn:0,
                success:function(index){
                    url='${ctx}/car/updateCar'
                    //需要修改的信息填入表格
                    form.val("dataFrm",data);
                    //将数据库中的图片地址填入
                    $('#showCarImage').attr('src',"${ctx}/file/downloadShowFile?path="+data.carimg);
                    //因为车牌是主键，主键不能修改
                    $("#carnumber").attr("readonly","readonly")
                },
                btn:['<div class="layui-icon layui-icon-ok">修改</div>','<div class="layui-icon  layui-icon-refresh">重置</div>','<div class="layui-icon layui-icon-close">关闭</div>'],
                yes:function(index, layero){
                    //调用隐藏提交按钮，提交表格
                    $("#doSubmit").click();
                },
                btn2:function(index, layero) {      //弹出层中的重置按钮
                    layer.msg("重置");
                    $("#showCarImage").removeAttr("src")     //将图片重置
                    //调用隐藏重置按钮，重置表格
                    $("#reset").click();
                    //图片重置后，跳转到默认图片
                    $('#showCarImage').attr("src","${ctx}/file/downloadShowFile?path=images/defaultCarImage.jpg");
                    $('#carimg').val("images/defaultCarImage.jpg");
                    //因为车牌是主键，主键不能重置
                    $("#carnumber").val(tempData.carnumber);
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



    //打开查看大图弹出层
    function openShowCarImage(data){
        //首先将地址改成当前车辆的图片地址
        $("#view_carImage").attr("src","${ctx}/file/downloadShowFile?path="+data.carimg)
        $("#view_carImage").attr("alt","车辆【"+data.carnumber+"】的大图")
        //然后渲染图片
        layer.photos({
            photos: '#viewCarImage',
        });
        $("#view_carImage").click();    //这个地方出了bug   layui作者应该也没想到会有这种情况
        layer.closeAll();               //经过多次测试， 如果只每次页面的第一次查看大图和第二次会重复，其他次数不会
        $("#view_carImage").click();    //因此第一次直接忽略，从第二次开始算。之后的查看大图没有bug
    }

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            let checkStatus = table.checkStatus('carTable');
            let data=checkStatus.data;
            let params="";
            $.each(data,function (i,item) {
                if (i==0){
                    params+="carnumbers="+item.carnumber
                }else {
                    params+="&carnumbers="+item.carnumber
                }
            });
            layer.confirm('真的删除选中的车辆吗', function(index){
                layer.close(index);
                //向服务端发送删除指令
                $.post("${ctx}/car/deleteBatchCar",params,function(res) {
                    layer.msg(res.msg);
                    //数据表单刷新
                    tableIns.reload();
                })
            });
        }




    //上传图片
    //上传缩略图
    upload.render({
        elem: '#carImageDiv',
        url: '${ctx}/file/carUploadFile',
        method : "post",
        acceptMime:'image/*',
        field:'mf',
        done: function(res, index, upload){
            $('#showCarImage').attr('src',"${ctx}/file/downloadShowFile?path="+res.data.src);
            $('#carimg').val(res.data.src);
            $('#carImageDiv').css("background","#fff");
        }
    });
});

</script>
</body>
</html>