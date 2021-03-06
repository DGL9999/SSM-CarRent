<%--
  Created by IntelliJ IDEA.
  User: Deja wu
  Date: 2020/6/17
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>菜单管理树</title>
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
<body  style="overflow-x: hidden">

    <ul id="menuTree" class="dtree" data-id="0"></ul>


<script type="text/javascript" src="${ctx}/resources/layui_ext/dist/dtree.js"></script>
<script type="text/javascript">
    let $;
    let layer;
    let form;
    let dtree;
    let menuTree;

    layui.extend({
        dtree:'${ctx}/resources/layui_ext/dist/dtree'
    }).use(["jquery","layer","form",'dtree'], function() {

        $ = layui.jquery;
        layer = layui.layer;
        form = layui.form;
        dtree=layui.dtree;

        // 初始化树
        menuTree = dtree.render({
            elem: "#menuTree",
            dataStyle: "layuiStyle",  //使用layui风格的数据格式
            response:{message:"msg",statusCode:0},  //修改response中返回数据的定义
            dataFormat: "list",  //配置data的风格为list
            url: "${ctx}/menu/loadMenuMangerLeftTreeJson?spread=1" // 使用url加载（可与data加载同时存在）
        });

            //监听树的节点单击事件
        dtree.on("node(menuTree)",function(obj) {
            let id = obj.param.nodeId;
            window.parent.right.reloadTable(id);
        })

    });


</script>
</body>
</html>