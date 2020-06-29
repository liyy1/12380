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
    <link href="/my/css/report.css" type="text/css" rel="stylesheet" />
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
            <li><a href="/report"  class="current"><b>举报须知</b></a></li>
            <li><a href="/handle"><b>受理介绍</b></a></li>
            <li><a href="/regulations"><b>法规制度</b></a></li>
            <li><a href="/contact_us"><b>意见建议</b></a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="con1"><img src="/my/img/02.gif" alt=""></div>
    <div class="con2">
        <span>您的位置：</span>
        <a href="/index">首页</a>
        &nbsp;&gt;
        <span>举报须知</span>
    </div>
    <div class="clear"></div>
    <div class="main">
        <p>1、本举报网站主要受理反映济宁市任城区各级领导班子和领导干部违反《党政领导干部选拔任用工作条例》及有关法规选人用人问题的举报。如果您反映其它方面的问题，请直接向有关部门反映。</p>
        <p>2、请认真填写举报表单中的各项目。填写“主要问题”一项时，要写清楚问题发生的时间、地点、情节、后果等，字数限定在800字以内。</p>
        <p>3、举报人应实事求是地反映问题。对利用举报捏造事实，进行诬告陷害的，依照有关规定严肃处理；构成犯罪的，移交司法机关处理。</p>
        <p>4、提倡实名举报。进行实名举报的，请详细填写联系电话等项目。</p>
        <p>5、为保障举报人的合法权益，限制恶意重复举报和垃圾信件，提高网上举报的运行效益，举报人计算机每天最多只能提交3件举报。</p>
        <p>6、本网站不提供举报信息反馈查询，如需了解举报的查处情况，可直接与中共济宁市任城区委组织部干部监督科联系。</p>
        <p>7、网上举报只是反映问题的一种途径，还可通过信件或电话等形式进行举报。</p>
        <p> 通讯地址：济宁市任城区委组织部干部监督科，邮政编码：272000</p>
        <p> 联系电话：（0537）2612380</p>
    </div>
    <div class="con_bottom">
        <input type="radio"  name="agree" value="同意">  <lable for="agree">我已阅读并同意上述全部条款</lable>
        <div>
            <button class="report_btn" id="jb_person">我要举报个人</button>
            <button class="report_btn" id="jb_company">我要举报单位</button>
        </div>
    </div>

</div>
<div class="footer">
    <p>中共济宁市任城区委组织部版权所有&nbsp;ICP备xxx号</p>
    <p>本系统由济宁城市云计算有限公司承建</p>
</div>
<script src="/my/js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="/my/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="/my/js/index.js" type="text/javascript"></script>
<script src="/my/layuiadmin/layui/layui.js"></script>
<script type="text/javascript">
    $('#jb_person').click(function () {
        var a=$('input:radio:checked').val();
        console.log(a)
        if(a==''){
            window.location.href="/jb_person";
        }else {
            alert("请先阅读举报须知！")
        }
    })
    $('#jb_company').click(function () {
        var a=$('input:radio[name="agree"]:checked').val();
        console.log(a)
        if(a==''){
            window.location.href="/jb_company";
        }else {
            alert("请先阅读举报须知！")
        }
    })
</script>
<script>
    layui.config({
        base: '/my/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'console']);
</script>
</body>
</html>


