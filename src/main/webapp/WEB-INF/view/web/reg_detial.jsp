<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>12380</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

    <link href="/my/css/common.css" type="text/css" rel="stylesheet" />
    <link href="/my/css/regulations.css" type="text/css" rel="stylesheet" />
</head>
<body class="layui-layout-body">
<div class="header">
    <img src="/my/img/head_bg.png"  width="1200" height="220"  />
    <img class="img1" src="/my/img/12380.png"   width="500" height="60"/>
    <img class="img2" src="/my/img/zgjn.png"  width="1000" height="80" />
    <img class="img3" src="/my/img/huabiao1.png"  width="200" />
    <img class="img5" src="/my/img/red_bg.png"  width="600" height="150"/>
   <img class="img6" src="/my/img/line_blue.png"  width="1200" height="50"/>
    <img class="img7" src="/my/img/line_bg.png"  width="1200" height="50"/>
    <div class="nav">
        <ul>
            <li><a href="/index">首&nbsp;&nbsp;页</a></li>
            <li><a href="/report"><b>举报须知</b></a></li>
            <li><a href="/handle"><b>受理介绍</b></a></li>
            <li><a href="/regulations" class="current"><b>法规制度</b></a></li>
            <li><a href="/contact_us"><b>意见建议</b></a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="con1"><img src="/my/img/03.gif" alt=""></div>
    <div class="con2">
        <span>您的位置：</span>
        <a href="/index">首页</a>
        &nbsp;&gt;
        <a href="/regulations">法规制度</a>
        &nbsp;&gt;
        <span>法规详情</span>
    </div>
    <div class="clear"></div>
    <div class="main_detail" id="main_detail">
        <div class="main_detail" style="width: 95%"> ${law.content}</div>
    </div>
</div>
<div class="footer">
    <p>中共济宁市任城区委组织部版权所有&nbsp;ICP备xxx号</p>
    <p>本系统由济宁城市云计算有限公司承建</p>
</div>

<script src="/my/layuiadmin/layui/layui.js"></script>
<script>
    window.onload=function(){
        $('#main_detail').html('asdsad');
    }
    layui.config({
        base: '/my/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'console']);
</script>
</body>
</html>


