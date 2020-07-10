<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file = "../common.jsp" %>
</head>
<body>
<div style="padding: 20px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>举报人信息</legend>
        <div class="layui-field-box" style="padding-left: 50px">
            <table cellpadding="10">
                <tr style="height:50px;">
                    <td align="right">姓名：</td>
                    <td>${report.jbrname}</td>
                </tr>
                <tr style="height:50px;">
                    <td align="right">性别：</td>
                    <td>${report.jbrsex}</td>
                </tr>
                <tr style="height:50px;">
                    <td>所在地区：</td>
                    <td>${report.jbrarea}</td>
                </tr>
                <tr style="height:50px;">
                    <td>工作单位：</td>
                    <td>${report.jbrunit}</td>
                </tr>
                <tr style="height:50px;">
                    <td>身份证号：</td>
                    <td>${report.jbrid}</td>
                </tr>
                <tr style="height:50px;">
                    <td>联系地址：</td>
                    <td>${report.jbraddr}</td>
                </tr>
                <tr style="height:50px;">
                    <td>联系电话：</td>
                    <td>${report.jbrphone}</td>
                </tr>
                <tr style="height:50px;">
                    <td>IP地址：</td>
                    <td>${report.ip}</td>
                </tr>
            </table>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field layui-field-title">
        <legend>被举报人信息</legend>
        <div class="layui-field-box" style="padding-left: 50px">
            <table cellpadding="10">
                <c:if test="${report.type == 1}">
                <tr style="height:50px;">
                    <td align="right">姓名：</td>
                    <td>${report.bjbname}</td>
                </tr>
                <tr style="height:50px;">
                    <td align="right">性别：</td>
                    <td>${report.bjbsex}</td>
                </tr>
                <tr style="height:50px;">
                    <td align="right">职务：</td>
                    <td>${report.bjbduty}</td>
                </tr>
                </c:if>
                <tr style="height:50px;">
                    <td>所在地区：</td>
                    <td>${report.bjbarea}</td>
                </tr>
                <tr style="height:50px;">
                    <td>工作单位：</td>
                    <td>${report.bjbunit}</td>
                </tr>
                <tr style="height:50px;">
                    <td align="right">级别：</td>
                    <td>${report.bjblevel}</td>
                </tr>
                <tr style="height:50px;">
                    <td>问题类型：</td>
                    <td>${report.bjbtype}</td>
                </tr>
                <tr style="height:50px;">
                    <td>问题描述：</td>
                    <td style="width: 550px">${report.bjbmemo}</td>
                </tr>
            </table>
        </div>
    </fieldset>
    <form>

    </form>
</div>
<script type="text/javascript">
$(function() {

});
</script>
</body>
</html>
