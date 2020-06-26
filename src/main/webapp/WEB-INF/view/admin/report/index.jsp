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
			<form id="report_search_form">
				<div class="group-label">
					<input class="easyui-datebox" data-options="label:'举报日期',editable:false" name="stime" style="width:200px;">-
					<input class="easyui-datebox" data-options="editable:false" name="etime" style="width:140px;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" onclick="resetForm('report_search_form');">重置</a>
					<a href="#" class="easyui-linkbutton button-info" data-options="iconCls:'icon-search'"
					   onclick="search_load('report_list', 'report_search_form', 'datagrid')">查询</a>

					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="margin-left: 20px"
					   onclick="exportExcel()">导出</a>
				</div>
			</form>
		</div>
		<div class="layui-card-body">
			<div id="report_list"></div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#report_list').datagrid({
        height: $(window).height()-115,
		cls: 'theme-border-radius',
		url: '/admin/report/list?type=${reportType}',
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
            {field: 'bjbarea', title: '区域', width: 150},
            {field: 'bjbunit', title: '单位', width: 150},
            {field: 'bjblevel', title: '级别', width: 150},
            {field: 'bjbtype', title: '问题类型', width: 150},
            {field: 'jbrname', title: '举报人姓名', width: 100},
            {field: 'jbrphone', title: '举报人电话', width: 150},
            {field: 'createtime', title: '举报时间', width: 150, formatter: dateFormatter}
	    ]],
        onDblClickRow: function (index, row) {
            openDetailDialog(row.id);
        }
	});
});

function openDetailDialog(id) {
	var $dialog = $("<div id='report_detail_dialog'></div>");
	$dialog.dialog({
        href: '/admin/report/detail?id='+id,
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
	var params = getFormJson('report_search_form');
	params.type='${reportType}';
	window.location.href = "/admin/report/excel?params="+JSON.stringify(params);
}
</script>
</body>
</html>
