<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file = "../common.jsp" %>
</head>
<body>
<div style="padding: 30px 0px 0px 80px;">
    <form>
        <table cellpadding="10">
            <tr style="height:50px;">
                <td>姓名：</td>
                <td><input class="easyui-textbox" style='width:560px' value="${advise.name}" readonly/></td>
            </tr>
            <tr style="height:50px;">
                <td>电话：</td>
                <td><input class="easyui-textbox" style='width:560px' value="${advise.phone}" readonly/></td>
            </tr>
            <tr style="height:50px;">
                <td>内容：</td>
                <td><input class="easyui-textbox" style='width:560px' value="${advise.content}" readonly data-options="multiline:true,height:200"/></td>
            </tr>
            <tr style="height:50px;">
                <td>时间：</td>
                <td><input class="easyui-datebox" style='width:560px' value="${advise.createtime}" readonly/></td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
$(function() {

});
</script>
</body>
</html>
