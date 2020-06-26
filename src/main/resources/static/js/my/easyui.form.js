/**
 * 删除单行方法 Controller中统一返回com.domor.model.Result
 * @param url 删除方法对应的请求路径
 * @param title 模块标题
 * @param gridId 需要重载数据的easyui datagrid ID
 * @param gridFormId easyui datagrid 重载时的过滤参数的表单ID
 */
function delRow(title,url,gridId,gridFormId) {
	$.messager.confirm('温馨提示', '您确定要删除该'+title+'吗？', function(r) {
		if (r) {
			$.post(url, {}, function(data) {
				if (data.status) {
					layer.msg("删除成功！");
					search_load(gridId, gridFormId, 'datagrid');
				} else
					layer.msg(data.message, {icon: 5});
			},'json');
		}
	});
}

/**
 * 封装打开弹出窗口（带保存按钮）
 * 按model type 自动拼接dialogId,formId,gridId,searchFormId
 * 规则：model_type_dialog, model_type_form, model_list, model_search_form
 * @param model: 模块名
 * @param type: 操作（'add' or 'edit'）
 * @param url: 页面请求路径
 * @param title: 窗口标题
 * @param w,h: 窗口宽度和高度
 */
function openSaveDialog(model,type,url,title,w,h) {
    var btns = [{
    	text: '保存',
		iconCls:'icon-ok',
		handler: function() {
        	submitForm(model+'_'+type+'_form', model+'_'+type+'_dialog', model+'_list', model+'_search_form', this);
    	}
    },{
        text: '关闭',
        iconCls:'icon-cancel',
        handler: function() {
            $dialog.dialog('close');
        }
    }];

    var $dialog = $("<div id='"+model+"_"+type+"_dialog'></div>");
    $dialog.dialog({
        href: url,
        title: title,
        width: w,
        height: h,
        closed: true,
        cache: false,
        modal: true,
        buttons: btns,
        onClose: function() {$dialog.dialog('destroy');}
    });
    $dialog.dialog('open');
}

/**
 * 封装打开弹出窗口（详情页面，无操作按钮）
 * @param model: 模块名
 * @param url: 页面请求路径
 * @param title: 窗口标题
 * @param w,h: 窗口宽度和高度
 */
function openDetailDialog(model,url,title,w,h) {
    var btns = [{
        text: '关闭',
        iconCls:'icon-cancel',
        handler: function() {
            $dialog.dialog('close');
        }
    }];

    var $dialog = $("<div id='"+model+"'_detail_dialog'></div>");
    $dialog.dialog({
        href: url,
        title: title,
        width: w,
        height: h,
        closed: true,
        cache: false,
        modal: true,
        buttons: btns,
        onClose: function() {$dialog.dialog('destroy');}
    });
    $dialog.dialog('open');
}

/**
 * 封装打开弹出窗口（自定义按钮组）
 * @param dialogId: 窗口ID
 * @param url: 页面请求路径
 * @param title: 窗口标题
 * @param w,h: 窗口宽度和高度
 * @param btns: 按钮数组
 */
function openDialog(id,url,title,w,h,btns) {
    var btn = {
        text: '关闭',
        iconCls:'icon-cancel',
        handler: function() {
            $dialog.dialog('close');
        }
    };
    btns.push(btn);

    var $dialog = $("<div id='"+id+"'></div>");
    $dialog.dialog({
        href: url,
        title: title,
        width: w,
        height: h,
        closed: true,
        cache: false,
        modal: true,
        buttons: btns,
        onClose: function() {$dialog.dialog('destroy');}
    });
    $dialog.dialog('open');
}

//将form表单中的参数值转换为json对象
function getFormJson(formId) {
	var o = {};
	var a = $("#" + formId).serializeArray();
	$.each(a, function() {
		if (o[this.name] !== undefined) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
}

function search_load(dateGridId, params, gridType) {
	if (gridType == "treegrid") {
		// 如果是string类型 表示为查询条件所在的form表单的id 这种情况下
		// 会利用getFormJson(formId)方法将这些参数封装成json对象
		if (typeof (params) == "string")
			$('#' + dateGridId).treegrid('load', getFormJson(params));
		else if (typeof (params) == "undefined" || params=="" || params== null) // 表示不传递参数
			$('#' + dateGridId).treegrid('load');
		else
			// 表示params本身就是参数的json对象
			$('#' + dateGridId).treegrid('load', params);
	} else {
		// 如果是string类型 表示为查询条件所在的form表单的id 这种情况下
		// 会利用getFormJson(formId)方法将这些参数封装成json对象
		if (typeof (params) == "string")
			$('#' + dateGridId).datagrid('load', getFormJson(params));
		else if (typeof (params) == "undefined") // 表示不传递参数
			$('#' + dateGridId).datagrid('load');
		else
			// 表示params本身就是参数的json对象
			$('#' + dateGridId).datagrid('load', params);
	}
}

/**
 * 表单提交方法
 * 并且Controller中统一返回com.domor.model.Result
 * @param formId 需要提交的表单ID
 * @param dialog 弹出框的ID或者jQuery对象（可以为空）
 * @param gridId 需要重载数据的easyui datagrid ID（可以为空）
 * @param gridFormId easyui datagrid 重载时的过滤参数的表单ID（可以为空）
 * @param subBtn 当前按钮的ID或对象（可以为空）
 * @param gridType grid 类型：treegrid or 其它（可以为空）
 */
function submitForm(formId, dialog, gridId, gridFormId,subBtn,gridType) {
	var form = $("#" + formId);
	var action = form.attr("action");

	if (typeof(dialog)=='string') {
		dialog = $("#"+dialog);
	}else{
		dialog = $(dialog);
	}
	 
	if (form.form("validate")) {
        layer.load();
        $.post(action, getFormJson(formId), function(data) {
            if(data.status){
				layer.msg("保存成功！");
            	if(dialog) dialog.dialog('close');
            	if(gridId) search_load(gridId, gridFormId, gridType);
            }else{
				layer.msg(data.message, {icon: 5});
			}
            layer.closeAll('loading');
        },'json');
	}
}

/**
 * 表单提交方法
 * 并且Controller中统一返回com.domor.model.Result
 * @param formId 需要提交的表单ID
 * @param dialog1 弹出框的ID或者jQuery对象（可以为空）
 * @param dialog2 弹出框的ID或者jQuery对象（可以为空）
 * @param gridId 需要重载数据的easyui datagrid ID（可以为空）
 * @param gridFormId easyui datagrid 重载时的过滤参数的表单ID（可以为空）
 * @param subBtn 当前按钮的ID或对象（可以为空）
 * @param gridType grid 类型：treegrid or 其它（可以为空）
 */
function submitForm2(formId, dialog1, dialog2, gridId, gridFormId,subBtn,gridType) {
	var form = $("#" + formId);
	var action = form.attr("action");
	if (typeof(subBtn)=='string') {
		subBtn = $("#"+subBtn);
	}else{
		subBtn = $(subBtn);
	}
	
	if (typeof(dialog1)=='string') {
		dialog1 = $("#"+dialog1);
	}else{
		dialog1 = $(dialog1);
	}
	if (typeof(dialog2)=='string') {
		dialog2 = $("#"+dialog2);
	}else{
		dialog2 = $(dialog2);
	}
	 
	if (form.form("validate")) {
		if(subBtn) subBtn.linkbutton("disable");
		$.post(action, getFormJson(formId), function(data) {
            if(data.status){
				layer.msg("保存成功！");
            	if(dialog1) dialog1.dialog('close');
            	if(dialog2) dialog2.dialog('close');
            	if(gridId) search_load(gridId, gridFormId, gridType);
            }else{
				layer.msg(data.message, {icon: 5});
			}
		},'json');
		if(subBtn) subBtn.linkbutton("enable");
	}
}

/**
 * 表格工具格按钮控制（datagrid treegrid）
 * @param gridId
 * @param gridType
 */
function actionButtonCtr(gridId, gridType) {
	var toolbar;
	if (gridType == "treegrid")
		toolbar = $('#' + gridId).treegrid('options').toolbar;
	else
		toolbar = $('#' + gridId).datagrid('options').toolbar;

	$.getJSON('/getActionsByUser', {}, function(data) {
		for ( var i = 0; i < toolbar.length; i++) {
			var tool = toolbar[i];
			var hasAction = false;
			for ( var j = 0; j < data.length; j++) {
				var action = data[j];
				if (action.menuUrl == tool.url && action.menuType == 2) {
					hasAction = true;
					break;
				}
			}

			if (!hasAction) {
			  if(tool.text) 
		         $('#'+gridId).datagrid("removeToolbarItem",tool.text);
			}
		}
	});
}

/**
 * 窗口按钮控制（dialog）
 * @param btns
 * @param status
 * @author liyy
 */
function dialogButtonCtr(dialogId, btns, status){
	return new Promise(function(resolve) {
		var buttons = new Array();
		$.getJSON('/getButtonAuth', {status: status}, function(data) {
			for ( var i = 0; i < btns.length; i++) {
				var btn = btns[i];
				for ( var j = 0; j < data.length; j++) {
					var action = data[j];
					if (action.menuUrl == btn.id && action.menuType == 2) {
						buttons.push(btn);
						break;
					}
				}
			}
			var cbtn = {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() { $("#"+dialogId).dialog('close'); }
			}
			buttons.push(cbtn);
			resolve(buttons);
		});
	})
}
