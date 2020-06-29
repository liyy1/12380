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

  <link rel="stylesheet" href="/my/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="/my/layuiadmin/style/admin.css" media="all">
  <script src="/my/js/jquery-3.3.1.js" type="text/javascript"></script>
  <script src="/my/js/jquery-3.3.1.min.js" type="text/javascript"></script>
  <link href="/my/css/common.css" type="text/css" rel="stylesheet" />
  <link href="/my/css/index.css" type="text/css" rel="stylesheet" />
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
      <li><a class="current" href="/index">首&nbsp;&nbsp;页</a></li>
      <li><a href="/report"><b>举报须知</b></a></li>
      <li><a href="/handle"><b>受理介绍</b></a></li>
      <li><a href="/regulations"><b>法规制度</b></a></li>
      <li><a href="/contact_us"><b>意见建议</b></a></li>
    </ul>
  </div>
</div>
<div class="content">
  <div class="con_next">
    <div class="banner">
      <ul class="myimg">
        <li>
          <a href="/regulations">
            <img src="/my/img/banner1.jpg"  width="500" height="280"/>
            <span>中华人民共和国宪法</span></a>
        </li>
        <li>
          <a href="/regulations">
            <img src="/my/img/banner2.jpg" width="500" height="280"/>
            <span>中国共产党党内监督条例</span></a>
        </li>
        <li>
          <a href="/regulations">
            <img src="/my/img/banner3.jpg" width="500" height="280"/>
            <span>关于严肃换届纪律保证换届风清气正的通知</span></a>
        </li>
      </ul>
      <ol class="btn">
        <li><a class="mycurrent">1</a></li>
        <li><a>2</a></li>
        <li><a>3</a></li>
      </ol>
    </div>
  </div>
  <div class="con_next" id="con_left">
    <ul>
      <li><a href="/regulations">	中华人民共和国宪法（节选）</a></li>
      <li><a href="/regulations">	中国共产党党内监督条例</a></li>
      <li><a href="/regulations">中国共产党章程</a></li>
      <li><a href="/regulations">党政领导干部选拔任用工作条例</a></li>
      <li><a href="/regulations">中华人民共和国地方各级人民代表大会和地方各级人民政府组织法</a></li>
      <li><a href="/regulations">中华人民共和国全国人民代表大会和地方各级人民代表大会选举法</a></li>
      <li><a href="/regulations">中华人民共和国公务员法</a></li>
      <li><a href="/regulations">中华人民共和国刑法（节选）</a></li>
      <li><a href="/regulations">全国人大常委会关于维护互联网安全的决定</a></li>
      <li><a href="/regulations">关于严肃换届纪律保证换届风清气正的通知</a></li>
    </ul>
  </div>
  <div class="clear"></div>
  <div class="report">
    <div class="report_son">
      <p>欢迎进入济宁市任城区委组织部“12380”举报网站</p>
      <p>本举报网站主要受理反映济宁市人称区各级领导班子和领导干部违反《党政领导干部选拔任用工作条例》
        及有关法规选人用人问题举报</p>
      <p>感谢您对我们的信任和支持</p>
      <button class="report_btn">我要举报</button>
    </div>
  </div>
</div>
<div class="footer">
  <p>中共济宁市任城区委组织部版权所有&nbsp;ICP备xxx号</p>
  <p>本系统由济宁城市云计算有限公司承建</p>
</div>
<script src="/my/js/index.js" type="text/javascript"></script>
<script src="/my/layuiadmin/layui/layui.js"></script>
<script type="text/javascript">
    $('.report_btn').click(function(){
        window.location.href="/report"
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


