<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>12380</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="/my/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="/my/js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <link href="/my/css/common.css" type="text/css" rel="stylesheet" />
    <link href="/my/css/contact_us.css" type="text/css" rel="stylesheet" />
</head>
<body class="layui-layout-body">
<div class="header">
    <img src="/my/img/head_bg.png"  width="1200" height="220"  />
    <img class="img1" src="/my/img/12380.png"   width="500" height="60"/>
    <img class="img2" src="/my/img/zgjn.png"  width="1000" height="80" />
    <img class="img3" src="/my/img/huabiao1.png"  width="200" />
    <img class="img5" src="/my/img/red_bg.png"  width="600" height="150"/>
   <img class="img6" src="/my/img/line_blue.png"  width="1200" height="50"/>
    <img class="img7" src="/my/img/line_bg.png"  width="1200" height="50"/>
    <div class="nav">
        <ul>
            <li><a href="/index">首&nbsp;&nbsp;页</a></li>
            <li><a href="/report"><b>举报须知</b></a></li>
            <li><a href="/handle"><b>受理介绍</b></a></li>
            <li><a href="/regulations"><b>法规制度</b></a></li>
            <li><a href="/contact_us" class="current"><b>意见建议</b></a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="con1"><img src="/my/img/04.gif" alt=""></div>
    <div class="con2">
        <span>您的位置：</span>
        <a href="/index">首页</a>
        &nbsp;&gt;
        <span>意见建议</span>
    </div>
    <div class="clear"></div>
    <div class="main">
        <div class="main_left">
            <p>意见与建议：</p>
        </div>
        <div class="main_right">
            <p>欢迎对网上举报工作及网站建设提出意见建议：</p>
            <table>
                <form action="" id="formId">
                    <textarea name="message" id="message" cols="30" rows="10" placeholder="请留言..."></textarea>

                    <tr>
                        <td>您的姓名：<input type="text" name="name" value="" placeholder="姓名"></td>
                        <td>&nbsp;&nbsp;您的联系方式：<input type="text" name="phone" value="" placeholder="电话"></td>
                    </tr>
                    <tr>
                        <td>验证码：&nbsp;&nbsp;
                            <input type="text" name="code" id="code" value="" placeholder="验证码"></td>
                        <td>&nbsp;&nbsp;<span id="checkCode"></span></td>
                    </tr>
                </form>
                <tr>
                    <td>
                        <button class="report_btn" id="submit_btn">提交</button>
                    </td>
                    <td>
                        <button class="report_btn" id="reset_btn">重置</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</div>
<div class="footer">
    <p>中共济宁市任城区委组织部版权所有&nbsp;ICP备xxx号</p>
    <p>本系统由济宁城市云计算有限公司承建</p>
</div>
<script src="/my/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="/my/js/code.js"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>

<script type="text/javascript">
    $('#submit_btn').click(function(){
        var isCode= validateCode();
        if(!isCode){
            return false;
        }
        var message=$('#message').val();
        if(message=='' || message==null){
            alert("请填写您的意见与建议！")
            return false;
        }
        var name=$('input[name="name"]').val();
       if(name=='' || name==null){
           alert("请填写您的姓名！")
           return false;
       }
        var phone=$('input[name="phone"]').val().replace(/\s/g, "");
        var pran = /^1[34578]\d{9}$/;
        if(phone=='' || phone==null){
            alert("请留下您的联系方式！")
            return false;
        }
        if(!pran.exec(phone)){
            alert("电话格式不对");
            return false;
        }
        var ip=returnCitySN["cip"];
        $.ajax({ url: "/advise/save",
            dataType:'json',
            data:{name:name,phone:phone,content:message,ip:ip},
            success: function(data){
              if(data.status){
                  alert("提交成功！")
                  location.reload()
              }else{
                  alert("提交失败，请重试或联系管理员！");
                  return false;
              }
            }});


    })
    $('#reset_btn').click(function () {
        $('#formId')[0].reset();
        createCode(4);
    })
    $('#checkCode').click(function () {
        createCode(4);
    })
    $(function () {

    })
    //检查验证码是否正确
    function validateCode() {
        //获取显示区生成的验证码
        var checkCode = document.getElementById("checkCode").innerHTML;
        //获取输入的验证码
        var inputCode = $('#code').val();
        if (inputCode.length <= 0) {
            alert("请输入验证码！");
        }
        else if (inputCode.toUpperCase() != checkCode.toUpperCase()) {
            return false;
            createCode(4);
        }
        else {
            return true;
        }
    }
</script>
<script>
    layui.config({
        base: '/my/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'console']);
</script>
</body>
</html>


