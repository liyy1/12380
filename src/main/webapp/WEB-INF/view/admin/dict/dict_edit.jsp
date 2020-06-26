<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<body>
<form id="dict_edit_form" method="post" action='/dict/edit' style="padding:25px;">
	<table>
		<tr style="height:45px;">
			<td style="width:120px;text-align:right;">类型：</td>
			<td>
				<input id="dict_edit_type" class="easyui-textbox" name="type" 
					data-options="required:true" style="width:210px;" value="${dict.type}">
					<input name="id" value="${dict.id}" type="hidden">
			</td>
		</tr>
		<tr style="height:45px;">
			<td style="width:120px;text-align:right;">键：</td>
			<td>
				<input id="dict_edit_key" class="easyui-textbox" name="key" 
					data-options="required:true" style="width:210px;" value="${dict.key}">
			</td>
		</tr>
		<tr style="height:45px;">
			<td style="width:120px;text-align:right;">值：</td>
			<td>
				<input id="dict_edit_value" class="easyui-textbox" name="value" 
					data-options="required:true" style="width:210px;" value="${dict.value}">
			</td>
		</tr>
		<tr style="height:45px;">
			<td style="width:120px;text-align:right;">备注：</td>
			<td>
				<input class="easyui-textbox" type="text" name="memo"   data-options="multiline:true,width:'210px',height:'60px'" value="${dict.memo}">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
