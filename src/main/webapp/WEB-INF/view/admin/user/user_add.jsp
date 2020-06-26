<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file = "../../common.jsp" %>
</head>
<body>
<form id="user_add_form" method="post" action='/user/insert' style="padding-top: 30px;text-align: center">
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" name="username" style="width:280px;" data-options="required:true,label:'帐号'">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" name="realname" style="width:280px;" data-options="required:true,label:'姓名'">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-textbox" name="phone" style="width:280px;" data-options="label:'手机'" validType="mobile">
    </div>
    <div style="margin-bottom:20px">
        <input id="user_add_role" name="role" style="width:280px;" data-options="label:'角色'">
        <input type="hidden" id="user_add_role_name" name="roleName">
    </div>
    <div style="margin-bottom:20px">
        <input id="user_add_dept" name="dept" style="width:280px;" data-options="label:'部门'">
        <input type="hidden" id="user_add_dept_name" name="deptName">
    </div>
    <div style="margin-bottom:20px">
        <input id="user_add_sex" name="sex" style="width:280px;" data-options="label:'姓别'">
    </div>
</form>
<script type="text/javascript">
$(function() {
    $('#user_add_sex').combobox({
        data: [{id:1, text:'男', selected:true}, {id:2, text:'女'}],
        label: '性别',
        valueField: 'id',
        textField: 'text',
        panelHeight: 'auto',
        required: true,
        editable: false
    });
	$('#user_add_role').combobox({
        label: '角色',
		url: '/role/getRoles',
		valueField: 'id',
		textField: 'text', 
		required: true,
		editable: false,
		onSelect: function(record) {
			$('#user_add_role_name').val(record.text);
		}
	});

    $('#user_add_dept').combotree({
        label: '部门',
        url: '/dept/query',
        valueField: 'id',
        textField: 'name',
        cascadeCheck: false,
        editable: false,
        required: true,
        panelHeight: 240,
        formatter:function(node){
            return node.name;
        },
        onSelect: function(item) {
            $('#user_add_dept_name').val(item.name);
        }
    });
});
</script>
</body>
</html>
