<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../common.jsp" %>
</head>
<body>
<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<form id="law_search_form">
				<div class="group-label">
					<input class="easyui-textbox theme-textbox-radius" data-options="label:'标题'" name="title" style="width:260px;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="resetForm('law_search_form');">重置</a>
					<a href="#" class="easyui-linkbutton button-info" data-options="iconCls:'icon-search'"
					   onclick="search_load('law_list', 'law_search_form', 'datagrid')">查询</a>
				</div>
			</form>
		</div>
		<div class="layui-card-body">
			<div id="law_list"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function() {

        $('#law_list').datagrid({
            url: '/admin/law/query',
            height: $(window).height()-115,
            fitColumns: true,
            singleSelect: true,// 单选模式
            pagination: true,
            pageSize: 20, // 每一页多少条数据
            pageList: [ 10, 20, 30, 40, 50 ], // 可以选择的每页的大小的combobox
            idField: 'id',
            sortName: 'id',
            columns:[[
                {field: 'ck', checkbox: true },
                {field: 'title', title: '标题', width: 500},
                {field: 'createTime', title: '创建时间', width: 100, formatter: timeFormatter}
            ]],
            onDblClickRow: function(index, row){
                openLawDetailDialog(row.id);
            },
            toolbar: [{
                text : '新增',
                iconCls : 'icon-add',
                handler : function() {
					openLawAddDialog();
                }
            },'-',{
                text : '修改',
                iconCls : 'icon-edit',
                handler : function() {
                    var row = $('#law_list').datagrid('getSelected');
                    if (!row) {
                        $.messager.alert("温馨提示", "请先选择一行！");
                    } else {
						openLawEditDialog(row.id);
                    }
                }
            },'-',{
                text : '删除',
                iconCls : 'icon-cancel',
                handler : function() {
                    var row = $('#law_list').datagrid('getSelected');
                    if (!row) {
                        $.messager.alert("温馨提示", "请先选择一个文章！");
                    } else {
                        $.messager.confirm('温馨提示', '您确定要删除该法律法规吗？', function(r) {
                            if (r) {
                                $.post("/admin/law/delete", {id:row.id,username:row.username}, function(data) {
                                    if (data.status) {
                                        $.messager.alert("温馨提示", "删除成功！");
                                        search_load('law_list', 'law_search_form', 'datagrid');
                                    } else
                                        $.messager.alert("温馨提示", data.message);
                                });
                            }
                        });
                    }
                }
            }]
        });
    });


    function openLawAddDialog() {
        var $dialog = $("<div id='law_add_dialog'></div>");
        $dialog.dialog({
            href: '/admin/law/insert?type=${param.type}',
            title: '新增',
            width: 1000,
            height: 700,
            closed: true,
            cache: false,
            modal: true,
            buttons: [{
                text: '保存',
                iconCls:'icon-ok',
                class: 'button-info',
                handler: function() {
                    submitForm('law_add_form','law_add_dialog', 'law_list','law_search_form',this);
                }
            },{
                text: '关闭',
                iconCls:'icon-cancel',
                handler: function() {
                    $dialog.dialog('close');
                }
            }],
            onClose: function() {
                $dialog.dialog('destroy');
                UM.getEditor('law_add_editor').destroy();
            }
        });
        $dialog.dialog('open');
    }

    function openLawEditDialog(id) {
        var $dialog = $("<div id='law_edit_dialog'></div>");
        $dialog.dialog({
            href: '/admin/law/update?id=' + id,
            title: '修改',
            width: 1000,
            height: 700,
            closed: true,
            cache: false,
            modal: true,
            buttons: [{
                text: '保存',
                iconCls:'icon-ok',
                handler: function() {
                    submitForm('law_edit_form','law_edit_dialog', 'law_list','law_search_form',this);
                }
            },{
                text: '关闭',
                iconCls:'icon-cancel',
                handler: function() {
                    $dialog.dialog('close');
                }
            }],
            onClose: function() {
                $dialog.dialog('destroy');
                UM.getEditor('law_edit_editor').destroy();
            }
        });
        $dialog.dialog('open');
    }

    function openLawDetailDialog(id) {
        var $dialog = $("<div id='law_detail_dialog'></div>");
        $dialog.dialog({
            href: '/admin/law/detail?id=' + id,
            title: '查看',
            width: 1000,
            height: 700,
            closed: true,
            cache: false,
            modal: true,
            buttons: [{
                text: '关闭',
                iconCls:'icon-cancel',
                handler: function() {
                    $dialog.dialog('close');
                }
            }],
            onClose: function() {
                $dialog.dialog('destroy');
                UM.getEditor('law_detail_editor').destroy();
            }
        });
        $dialog.dialog('open');
    }
</script>
</body>
</html>
