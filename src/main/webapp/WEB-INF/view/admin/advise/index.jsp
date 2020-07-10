<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../common.jsp" %>
</head>
<body>
<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<form id="advise_search_form">
				<div class="group-label">
					<input class="easyui-datebox" data-options="label:'日期',editable:false" name="stime" style="width:180px;">-
					<input class="easyui-datebox" data-options="editable:false" name="etime" style="width:140px;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="resetForm('advise_search_form');">重置</a>
					<a href="#" class="easyui-linkbutton button-info" data-options="iconCls:'icon-search'"
					   onclick="search_load('advise_list', 'advise_search_form', 'datagrid')">查询</a>

					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="margin-left: 20px"
					   onclick="exportExcel()">导出所有</a>
				</div>
			</form>
		</div>
		<div class="layui-card-body">
			<div id="advise_list"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#advise_list').datagrid({
        height: $(window).height()-115,
		cls: 'theme-border-radius',
		url: '/admin/advise/list',
		fitColumns: true,
		nowrap: true,
		idField: 'id',
		singleSelect: true,// 单选模式
		pagination: true,
		pageSize: 20, // 每一页多少条数据
		pageList: [ 10, 20, 30, 40, 50 ], // 可以选择的每页的大小的combobox
		sortName: 'id',
	    columns:[[
			{field: 'ck', checkbox: true },
            {field: 'name', title: '姓名', width: 100},
            {field: 'phone', title: '联系电话', width: 150},
            {field: 'ip', title: 'IP地址', width: 150},
            {field: 'content', title: '意见内容', width: 600},
            {field: 'createtime', title: '时间', width: 150, formatter: dateFormatter}
	    ]],
        onDblClickRow: function (index, row) {
            openDetailDialog(row.id);
        }
	});
});

function openDetailDialog(id) {
	var $dialog = $("<div id='advise_detail_dialog'></div>");
	$dialog.dialog({
        href: '/admin/advise/detail?id='+id,
        title: '详情',
        width: 800,
        height: 550,
        closed: true,
        cache: false,
        modal: true,
        onClose: function() {
            $dialog.dialog('destroy');
        }
    });
    $dialog.dialog('open');
}

function exportExcel(){
	var params = getFormJson('advise_search_form');
	window.location.href = "/admin/advise/excel?params="+JSON.stringify(params);
}
</script>
</body>
</html>
