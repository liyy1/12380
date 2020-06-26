<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<body>
<form id="user_edit_form" method="post" action='/user/update' style="padding-top: 30px;text-align: center">
	<div style="margin-bottom:20px">
		<input class="easyui-textbox" name="username" style="width:280px;" data-options="required:true,label:'帐号'" value="${user.username}" readonly>
	</div>
	<div style="margin-bottom:20px">
		<input class="easyui-textbox" name="realname" style="width:280px;" data-options="required:true,label:'姓名'" value="${user.realname}">
	</div>
	<div style="margin-bottom:20px">
		<input class="easyui-textbox" name="phone" style="width:280px;" data-options="label:'手机'" validType="mobile" value="${user.phone}">
	</div>
	<div style="margin-bottom:20px">
		<input id="user_edit_role" name="role" style="width:280px;" data-options="label:'角色'" value="${user.role}">
		<input type="hidden" id="user_edit_role_name" name="roleName" value="${user.roleName}">
	</div>
	<div style="margin-bottom:20px">
		<input id="user_edit_dept" name="dept" style="width:280px;" data-options="label:'部门'" value="${user.dept}">
		<input type="hidden" id="user_edit_dept_name" name="deptName" value="${user.deptName}">
	</div>
	<div style="margin-bottom:20px">
		<input id="user_edit_sex" name="sex" style="width:280px;" data-options="label:'姓别'" value="${user.sex}">
	</div>
	<div style="margin-bottom:20px">
		<input id="user_edit_delete_flag" name="delete_flag" value="${user.delete_flag}" style="width:280px;">
	</div>
</form>
<script type="text/javascript">
$(function() {
    $('#user_edit_sex').combobox({
        data: [{id:1, text:'男'}, {id:2, text:'女'}],
        label: '性别',
        valueField: 'id',
        textField: 'text',
        panelHeight: 'auto',
        required: true,
        editable: false
    });
	$('#user_edit_role').combobox({
        url: '/role/getRoles',
        valueField: 'id',
        textField: 'text',
        required: true,
        editable: false,
		onSelect: function(record) {
			$('#user_edit_role_name').val(record.text);
		}
	});
	
	$('#user_edit_delete_flag').combobox({
        data: [{value: 0,text: '可用'}, {value: 1,text: '不可用'}],
        label: '是否可用',
		valueField: 'value',
		textField: 'text', 
		editable: false,
		panelHeight: 'auto'
	})

    $('#user_edit_dept').combotree({
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
            $('#user_edit_dept_name').val(item.name);
        }
    });
});

</script>
</body>
</html>
