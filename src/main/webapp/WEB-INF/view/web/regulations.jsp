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
    <img class="img6" src="/my/img/line_bg.png"  width="1200" />
    <div class="nav">
        <ul>
            <li><a href="/index">首&nbsp;&nbsp;页</a></li>
            <li><a href="/report"><b>举报须知</b></a></li>
            <li><a href="/handle"><b>受理介绍</b></a></li>
            <li><a href="/regulations"  class="current"><b>法规制度</b></a></li>
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
        <span>法规制度</span>
    </div>
    <div class="clear"></div>
    <div class="main">
        <ul class="main_ul">
            <li><a href="/reg_detial">中华人民共和国宪法（节选）</a></li>
            <li><a href="/reg_detial">中国共产党章程</a></li>
            <li><a href="/reg_detial">中国共产党党内监督条例（试行）</a></li>
            <li><a href="/reg_detial">中国共产党纪律处分条例</a></li>
            <li><a href="/reg_detial">党政领导干部选拔任用工作条例</a></li>
            <li><a href="/reg_detial">中华人民共和国地方各级人民代表大会和地方各级人民政府组织法</a></li>
            <li><a href="/reg_detial">中华人民共和国全国人民代表大会和地方各级人民代表大会选举法</a></li>
            <li><a href="/reg_detial">中华人民共和国公务员法</a></li>
            <li><a href="/reg_detial">中华人民共和国刑法（节选）</a></li>
            <li><a href="/reg_detial">全国人大常委会关于维护互联网安全的决定</a></li>
            <li><a href="/reg_detial">关于严肃换届纪律保证换届风清气正的通知</a></li>
            <li><a href="/reg_detial">举报须知</a></li>
            <li><a href="/reg_detial">受理介绍</a></li>
            <li><a href="/reg_detial">干部选拔任用工作四项监督制度</a></li>
            <li><a href="/reg_detial">省市县三级组织部门全部开通"12380"短信举报 积极打造"四位一体"举报受理平台
            </a></li>

        </ul>
    </div>
</div>
<div class="footer">
    <p>中共济宁市任城区委组织部版权所有&nbsp;ICP备xxx号</p>
    <p>本系统由济宁城市云计算有限公司承建</p>
</div>


<script src="/my/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '/my/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'console']);
</script>
</body>
</html>


