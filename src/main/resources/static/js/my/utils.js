//清空表单数据
function resetForm(id){
	$("#"+id).form('clear');
}

//打开窗口，并加载指定页面
function openPage(title,url,width,height) {
    $.get(url,function (res) {
        layer.open({
            type: 1,
            title: title,
            area: [width+'px', height+'px'], //宽高
            content: res
        });
    })
}

