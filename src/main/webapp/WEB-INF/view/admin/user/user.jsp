<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../../common.jsp" %>
</head>
<body>
<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<form id="user_search_form">
				<div class="group-label">
					<input class="easyui-textbox theme-textbox-radius" data-options="label:'账号'" name="name" style="width:190px;">
					<input class="easyui-combobox theme-textbox-radius" id="user_search_role" label="角色" name="role" style="width:190px;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="resetForm('user_search_form');">重置</a>
					<a href="#" class="easyui-linkbutton button-info" data-options="iconCls:'icon-search'"
					   onclick="search_load('user_list', 'user_search_form', 'datagrid')">查询</a>
				</div>
			</form>
		</div>
		<div class="layui-card-body">
			<div id="user_list"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
    $('#user_search_role').combobox({
        url: '/role/getRoles',
        valueField: 'id',
        textField: 'text',
		editable: false
    });

	$('#user_list').datagrid({
        height: $(window).height()-115,
		cls: 'theme-border-radius',
		url: '/user/query',
		fitColumns: true,
		nowrap: true,
		idField: 'username',
		singleSelect: true,// 单选模式
		pagination: true,
		pageSize: 20, // 每一页多少条数据
		pageList: [ 10, 20, 30, 40, 50 ], // 可以选择的每页的大小的combobox
		sortName: 'username',
	    columns:[[
			{field: 'ck', checkbox: true },
            {field: 'username', title: '账号', width: 100},
            {field: 'realname', title: '姓名', width: 100},
            {field: 'roleName', title: '角色', width: 100},
            {field: 'deptName', title: '部门', width: 100},
            {field: 'phone', title: '手机号码', width: 150},
            {field: 'sex', title: '性别', width: 50, formatter: sexFormatter},
            {field: 'delete_flag',title: '是否可用',sortable: true, width: 80,formatter: deleteFormatter}
	    ]],
        toolbar: [{
            url: 'user/insert',
            text : '新增',
            iconCls : 'icon-add',
            handler : function() {
                openUserAddDialog();
            }
        },'-',{
            url: 'user/update',
            text : '编辑',
            iconCls : 'icon-edit',
            handler : function() {
                var row = $('#user_list').datagrid('getSelected');
                if (!row) {
                    $.messager.alert("温馨提示", "请先选择一行！");
                } else {
					openUserEditDialog(row.username);
                }
            }
        }]
	});
	actionButtonCtr('user_list');
});

function openUserAddDialog() {
	var $dialog = $("<div id='user_add_dialog'></div>");
	$dialog.dialog({
        href: '/user/insert',
        title: '新增用户',
        width: 410,
        height: 440,
        closed: true,
        cache: false,
        modal: true,
        buttons: [{
            text: '保存',
            iconCls:'icon-ok',
            handler: function() {
            	submitForm('user_add_form','user_add_dialog', 'user_list','user_search_form',this);
            }
        },{
            text: '取消',
            iconCls:'icon-cancel',
            handler: function() {
                $dialog.dialog('close');
            }
        }],
        onClose: function() {
            $dialog.dialog('destroy');
        }
    });
    $dialog.dialog('open');
}

function openUserEditDialog(username) {
	var $dialog = $("<div id='user_edit_dialog'></div>");
	$dialog.dialog({
        href: '/user/update?username=' + username,
        title: '编辑用户',
        width: 430,
        height: 480,
        closed: true,
        cache: false,
        modal: true,
        buttons: [{
            text: '保存',
            iconCls:'icon-ok',
            handler: function() {
            	submitForm('user_edit_form','user_edit_dialog', 'user_list','user_search_form',this);
            }
        },{
            text: '取消',
            iconCls:'icon-cancel',
            handler: function() {
                $dialog.dialog('close');
            }
        }],
        onClose: function() {
            $dialog.dialog('destroy');
        }
    });
    $dialog.dialog('open');
}
</script>
</body>
</html>
