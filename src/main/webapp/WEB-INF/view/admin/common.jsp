<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>12380后台管理系统</title>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

<%--layuiAdmin--%>
<link rel="stylesheet" href="/my/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="/my/layuiadmin/style/admin.css" media="all">
<script src="/my/layuiadmin/layui/layui.js"></script>

<script>
    var layer;
    layui.config({
        base: '/my/layuiadmin/' //静态资源所在路径
    }).use(['layer'], function(){
        layer = layui.layer
    })
</script>

<%--easyui--%>
<link rel="stylesheet" href="/my/easyui/themes/insdep/easyui.css" media="all">
<link rel="stylesheet" href="/my/easyui/themes/insdep/icon.css" type="text/css">
<link rel="stylesheet" href="/my/easyui/themes/insdep/insdep_theme_default.css" media="all">
<script src="/my/easyui/jquery.min.js"></script>
<script src="/my/easyui/jquery.easyui.min.js"></script>
<script src="/my/easyui/themes/insdep/jquery.insdep-extend.min.js"></script>

<%--自定义JS--%>
<script src="/my/js/my/jquery.extends.js"></script>
<script src="/my/js/my/easyui.extends.js"></script>
<script src="/my/js/my/formatter.js"></script>
<script src="/my/js/my/easyui.form.js"></script>
<script src="/my/js/my/utils.js"></script>

<%--umeditor--%>
<link href="/my/js/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript">var webUrl = "${sessionScope.web_url}";</script>
<script type="text/javascript" src="/my/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" src="/my/js/umeditor/umeditor.js"></script>
<script type="text/javascript" src="/my/js/umeditor/lang/zh-cn/zh-cn.js"></script>


