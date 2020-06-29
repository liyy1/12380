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
    <div class="main_detail">
        <p class="title1">中国共产党纪律处分条例</p>
        <p class="title2"> 第一编 总 则</p>
        <p class="title2">第一章 指导思想、原则和适用范围</p>
        <p class="main_text">
            第一条 中国共产党纪律处分条例，以马克思列宁主义、毛泽东思想、邓小平理论和“三个代表”重要思想为指导，
            依据党章和宪法、法律，结合党的建设的实践制定。 第二条 本条例的任务，是维护党的章程和其他党内法规，严肃党的纪律，
            纯洁党的组织，保障党员民主权利，教育党员遵纪守法，维护党的团结统一，保证党的路线、方针、政策、决议和国家法律、法规的贯彻执行。
        </p>
        <p class="main_text">
            第二条 本条例的任务，是维护党的章程和其他党内法规，严肃党的纪律，纯洁党的组织，保障党员民主权利，教育党员遵纪守法，维护党的团结统一，保证党的路线、方针、政策、决议和国家法律、法规的贯彻执行。
        </p>
        <p class="main_text">
            第三条 坚持党要管党、从严治党的原则。党的各级组织和全体党员应当遵守和维护党的纪律。对于违犯党纪的党组织和党员，必须严肃处理。
        </p>
        <p class="main_text">第四条 坚持党员在党纪面前人人平等的原则。党内不允许有任何不受纪律约束的党组织和党员。凡是违犯党纪的行为，都必须受到追究；应当受到党纪处分的，必须给予相应的处分。</p>
        <p class="main_text">第五条 坚持实事求是的原则。对党组织和党员违犯党纪的行为，应当以事实为依据，以党章、其他党内法规和国家法律、法规为准绳，准确地认定违纪性质，区别不同情况，恰当地予以处理。</p>
        <p class="main_text">第六条 坚持民主集中制的原则。实施党纪处分，应当按照规定程序经党组织集体讨论决定，不允许任何个人或者少数人决定和批准。上级党组织对违犯党纪的党组织和党员作出的处理决定，下级党组织必须执行。</p>
        <p class="main_text">第七条 坚持惩前毖后、治病救人的原则。处理违犯党纪的党组织和党员，应当实行惩戒与教育相结合，做到宽严相济。</p>
        <p class="main_text">第八条 本条例适用于违犯党纪应当受到党纪追究的党组织和党员。</p>
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


