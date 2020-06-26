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

</head>
<body class="layui-layout-body">
  <h1>首页</h1>

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


