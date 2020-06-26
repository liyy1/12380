<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "../../common.jsp" %>
</head>
<body>
<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-card-body">
			<div class="easyui-layout" id="right_layout">
				<div data-options="region:'center',border:false">
					<div id="role_list"></div>
				</div>
				<div data-options="region:'east',split:true,collapsible:false,tools:[{iconCls:'icon-save',handler:updateRoleRight}]"
					 class="theme-border-radius" title="权限列表" style="width: 30%;">
					<div id="right_tree" checkbox="true" data-options="border:false"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
    $(function () {
        $("#right_layout").layout({
			border:false,
            height: $(window).height()-55
		})
        $('#role_list').datagrid({
            fit: true,
			title: '角色列表',
            cls: 'theme-border-radius',
            url: '/role/getPagedRoleList',
            fitColumns: true,
            singleSelect: true,//单选模式
            idField: 'roleId',
            sortName: 'roleId',
            pagination: true,
            pageSize: 10, //每一页多少条数据
            pageList: [10, 20, 30, 50, 100],  //可以选择的每页的大小的combobox
            columns: [[
                { field: 'ck', checkbox: true },
                { field: 'roleName', title: '角色名称', width: 80 },
                { field: 'roleType', title: '角色类型', width: 80 },
                { field: 'delete_flag', title: '是否可用',sortable: true,width: 80,formatter:deleteFormatter}
            ]],
            onLoadSuccess: function(data){
                $('#role_list').datagrid('selectRow',0);
                $("#right_tree").tree({url:"/menu/tree?roleId=" + data.rows[0].roleId, cache:false});
            },
            onSelect: function(index, row){
                $("#right_tree").tree({url:"/menu/tree?roleId=" + row.roleId, cache:false});
            },
            toolbar:[{
            	url: 'role/role_add',
    			text:'新增',
    			iconCls:'icon-add',
    			handler:function(){
    				addRoleDialog();
                }
    		},{
    			url: 'role/role_edit',
    			text:'编辑',
    			iconCls:'icon-edit',
    			handler:function(){
	    			var row = $('#role_list').datagrid('getSelected');
	    	        if (!row) {
    	                $.messager.alert("温馨提示", "请先选择一行！");
	    	        }else{
	    	        	editRoleDialog(row.roleId);
	    	        }
    		    }
    		}]
        });
        actionButtonCtr('role_list');
    });

    function addRoleDialog(){
        var dlg = $("<div style='padding-left:30px;' id='role_add_dialog'></div>");
        dlg.dialog({
            title: '新增角色',
            width: 440,
            height: 280,
            closed: true,
            cache: false,
            href: '/role/role_add',
            modal: true,
            buttons: [{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    submitForm('role_add_form','role_add_dialog', 'role_list',"",this);
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#role_add_dialog').dialog('close');
                }
            }],
            onClose:function(){
                $('#role_add_dialog').dialog('destroy');
            }
        });
        dlg.dialog('open');
    }

    function editRoleDialog(roleId){
        var dlg = $("<div style='padding-left:20px;padding-top:20px;' id='role_edit_dialog'></div>");
        dlg.dialog({
            title: '编辑角色',
            width: 440,
            height: 320,
            closed: true,
            cache: false,
            href: '/role/role_edit?roleId=' + roleId + '&delete_flag=0',
            modal: true,
            buttons: [{
                text:'保存',
                iconCls:'icon-ok',
                handler:function(){
                    submitForm('role_edit_form','role_edit_dialog', 'role_list',"",this);
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $('#role_edit_dialog').dialog('close');
                }
            }],
            onClose:function(){
                $('#role_edit_dialog').dialog('destroy');
            }
        });
        dlg.dialog('open');
    }

    function updateRoleRight() {
    	var row = $('#role_list').datagrid('getSelected');
    	if (!row) {
            $.messager.alert("温馨提示", "请先选中一个角色！");
            return;
        }
    	var checkedNodes = $('#right_tree').tree('getChecked',['checked','indeterminate']);
    	var checkedMenuIds = '';
    	for(var i = 0; i < checkedNodes.length; i++) {
    		if(checkedMenuIds != '') {
    			checkedMenuIds += ',';
    		}
    		checkedMenuIds += checkedNodes[i].id;
    	}
    	 
    	$.post('/menu/updateRights',{roleId:row.roleId,menuIds:checkedMenuIds},function(data){
            if(data.status){
                $("#right_tree").tree({url:"/menu/tree?roleId=" + row.roleId, cache:false});
                $.messager.alert("温馨提示", "角色权限修改成功！");
            }else{
         	    $.messager.alert("温馨提示", data.message);
            }
        });
    }

</script>
</body>
</html>
