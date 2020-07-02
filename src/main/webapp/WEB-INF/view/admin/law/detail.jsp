<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<body>
<form id="law_detail_form" method="post">
	<table style="margin: 15px;">
		<tr style="height:50px;" id="law_detail_tr">
			<td style="text-align: right;width: 50px;">标题：</td>
			<td>
				<input class="easyui-textbox" name="title" style="width:400px;" readonly value="${law.title}">
			</td>
		</tr>
		<tr style="height:25px;">
			<td colspan="4" style="padding-left: 10px;">内容：</td>
		</tr>
		<tr>
			<td colspan="4" style="padding: 0px 10px;">
				<textarea id="law_detail_editor" name="content" style="width:100%;height:440px" readonly>${law.content}
				</textarea>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
    var lawDetailEditor = UM.getEditor('law_detail_editor',{
        initialFrameHeight: 440,
        autoFloatEnabled: true,
        autoHeightEnabled: false
    });
</script>
</body>
</html>
