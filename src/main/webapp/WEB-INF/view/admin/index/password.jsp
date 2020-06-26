<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common.jsp" %>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">修改密码</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">当前密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="oldpwd" lay-verify="required" lay-verType="tips"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="newpwd" lay-verify="pass" lay-verType="tips"
                                       autocomplete="off" id="LAY_password" class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确认新密码</label>
                            <div class="layui-input-inline">
                                <input type="password" name="repwd" lay-verify="repass" lay-verType="tips"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="savePwd">确认修改</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.config({
        base: '/my/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'set'], function () {
        var $ = layui.$
            , form = layui.form

        //提交
        form.on('submit(savePwd)', function (obj) {
            $.post('/admin/index/savePwd', obj.field, function (res) {
                if (res.status) {
                    layer.msg('修改密码成功,请重新登录', {
                        offset: '15px'
                        , icon: 1
                        , time: 1000
                    }, function () {
                        window.open('/admin/toLogin', '_top');
                    });
                } else {
                    layer.msg(res.message);
                }
            })
        });

    });
</script>
</body>
</html>