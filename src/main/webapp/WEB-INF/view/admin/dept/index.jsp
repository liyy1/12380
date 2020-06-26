<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file = "../../common.jsp" %>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div id="dept_list"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function() {
	$('#dept_list').treegrid({
        height: $(window).height()-55,
        cls: 'theme-border-radius',
	    url: '/dept/query',
	    idField: 'id',
	    treeField: 'name',
	    fitColumns: true,
	    singleSelect: true,
		sortName: 'creatTime',
	    columns:[[
			{field:'ck', checkbox: true},
			{title:'名称', field:'name', width:150},
			{title:'描述', field:'memo', width:180},	
			{title:'是否可用',field: 'delete_flag',width: 150,formatter: deleteFormatter}
	    ]],
	    toolbar : [{
	    	url: 'dept/add',
			text : '新增',
			iconCls : 'icon-add',
			handler : function() {
                openDeptAddDialog();
			}
		},{
			url: 'dept/edit',
			text : '编辑',
			iconCls : 'icon-edit',
			handler : function() {
				var row = $('#dept_list').datagrid('getSelected');
                if (!row) {
                    $.messager.alert("温馨提示", "请先选择一行！");
                } else {
                    openDeptEditDialog(row.id);
                }
			}
		}]
	});
	actionButtonCtr('dept_list');
});

function openDeptAddDialog() {
	var $dialog = $("<div id='dept_add_dialog'></div>");
	$dialog.dialog({
        href: '/dept/insert',
        title: '新增部门',
        width: 460,
        height:  330,
        closed: true,
        cache: false,
        modal: true,
        buttons: [{
            text: '确定',
            iconCls:'icon-ok',
            handler: function() {
            	submitForm('dept_add_form','dept_add_dialog', 'dept_list',"",this,'treegrid');
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

function openDeptEditDialog(deptId) {
	var $dialog = $("<div id='dept_edit_dialog'></div>");
	$dialog.dialog({
        href: '/dept/update?deptId=' + deptId,
        title: '编辑部门',
        width: 460,
        height: 370,
        closed: true,
        cache: false,
        modal: true,
        buttons: [{
            text: '确定',
            iconCls:'icon-ok',
            handler: function() {
            	submitForm('dept_edit_form','dept_edit_dialog', 'dept_list',"",this,'treegrid');
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

function deleteDept(){
	var row = $('#dept_list').datagrid('getSelected');
    if (!row) {
        $.messager.alert("温馨提示", "请先选择一行！");
    } else {
        $.messager.confirm('温馨提示', '删除部门后，其部门下的所有子部门都将不可用。您确定要删除该部门吗？', function(r) {
            if (r) {
                $.get("/dept/delete?deptId=" + row.id, {}, function(data) {
                    if (data.status) {
                        $.messager.alert("温馨提示", "删除成功！");
                        search_load('dept_list', 'dept_search_form', 'treegrid');
                    } else
                        $.messager.alert("温馨提示", data.message);
                });
            }
        });
    }
}
</script>
</body>
</html>
