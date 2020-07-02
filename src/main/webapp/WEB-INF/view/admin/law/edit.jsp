<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<body>
<form id="law_edit_form" method="post" action='/admin/law/save' >
	<input type="hidden" name="id" value="${law.id}">
	<table style="margin: 15px;">
		<tr style="height:50px;" id="law_edit_tr">
			<td style="text-align: right;width: 50px;">标题：</td>
			<td>
				<input class="easyui-textbox" name="title" style="width:400px;" data-options="required:true" value="${law.title}">
			</td>
		</tr>
		<tr style="height:25px;">
			<td colspan="4" style="padding-left: 10px;">内容：</td>
		</tr>
		<tr>
			<td colspan="4" style="padding: 0px 10px;">
				<textarea id="law_edit_editor" name="content" style="width:100%;height:440px">${law.content}
				</textarea>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
    var lawEditEditor = UM.getEditor('law_edit_editor',{
        initialFrameHeight: 440,
        autoFloatEnabled: true,
        autoHeightEnabled: false
    });
</script>
</body>
</html>
