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
    <link href="/my/css/handle.css" type="text/css" rel="stylesheet" />
</head>
<body class="layui-layout-body">
<div class="header">
    <img src="/my/img/head_bg.png"  width="1200" height="220"  />
    <img class="img1" src="/my/img/12380.png"   width="500" height="60"/>
    <img class="img2" src="/my/img/zgjn.png"  width="1000" height="80" />
    <img class="img3" src="/my/img/huabiao1.png"  width="200" />
    <img class="img5" src="/my/img/red_bg.png"  width="600" height="150"/>
    <img class="img6" src="/my/img/line_blue.png"  width="1200" height="80"/>
    <div class="nav">
        <ul>
            <li><a href="/index">首&nbsp;&nbsp;页</a></li>
            <li><a href="/report"><b>举报须知</b></a></li>
            <li><a href="/handle"  class="current"><b>受理介绍</b></a></li>
            <li><a href="/regulations"><b>法规制度</b></a></li>
            <li><a href="/contact_us"><b>意见建议</b></a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="con1"><img src="/my/img/sljs.gif" alt=""></div>
    <div class="con2">
        <span>您的位置：</span>
        <a href="/index">首页</a>
        &nbsp;&gt;
        <span>受理介绍</span>
    </div>
    <div class="clear"></div>
    <div class="main">
        <p>1、本举报网站主要受理反映济宁市任城区各级领导班子和领导干部违反《党政领导干部选拔任用工作条例》及有关法规选人用人问题的举报。如果您反映其它方面的问题，请直接向有关部门反映。</p>
        <p> 2、中共济宁市任城区委组织部干部监督科将本着“态度认真、办理及时、查处严肃”的原则，慎重负责地处理网上举报件。</p>
        <p>3、对受理范围内的举报，根据被举报对象的职级和举报反映的问题，依据有关规定，由中共济宁市任城区委组织部办理或督促有关部门单位承办。其中，对群众反映的性质严重、内容具体、线索清楚的选人用人问题，中共济宁市任城区委组织部进行立项督查，要求承办单位在规定时限内报告查核处理结果。</p>
        <p>4、对经查问题属实的，依据有关规定，坚决纠正、严格问责；严重违反规定、已构成违纪违法的，移交执纪执法机关处理。对经查问题不实且属诬告陷害的，将依法追究举报人的责任。</p>
        <p>5、为了保护举报人，中共济宁市任城区委组织部制定了严格的保密制度，明确规定举报材料由专人管理，严防失密、泄密。对打击报复举报人的行为，将严肃追究有关人员的责任。</p>
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


