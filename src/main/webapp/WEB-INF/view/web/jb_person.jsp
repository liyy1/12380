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
    <link href="/my/css/common.css" type="text/css" rel="stylesheet" />
    <link href="/my/css/jbperson.css" type="text/css" rel="stylesheet" />
</head>
<body class="layui-layout-body">
<div class="header">
    <img src="/my/img/head_bg.png"  width="1200" height="220"  />
    <img class="img1" src="/my/img/12380.png"   width="500" height="60"/>
    <img class="img2" src="/my/img/zgjn.png"  width="1000" height="80" />
    <img class="img3" src="/my/img/huabiao1.png"  width="200" />
    <img class="img5" src="/my/img/red_bg.png"  width="600" height="150"/>
    <img class="img6" src="/my/img/line_blue.png"  width="1200" height="80"/>
    <div class="nav">
        <ul>
            <li><a href="/index">首&nbsp;&nbsp;页</a></li>
            <li><a href="/report" class="current"><b>举报须知</b></a></li>
            <li><a href="/handle"><b>受理介绍</b></a></li>
            <li><a href="/regulations"><b>法规制度</b></a></li>
            <li><a href="/contact_us"><b>意见建议</b></a></li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="con1"><img src="/my/img/07.gif" alt=""></div>
    <div class="con2">
        <span>您的位置：</span>
        <a href="/index">首页</a>
        &nbsp;&gt;
        <span><a href="/report">举报须知</a></span>
        &nbsp;&gt;
        <span>举报个人</span>
    </div>
    <div class="clear"></div>
    <div class="main">
        <div class="card">举报人信息</div>
        <form  id="formId" method="post">
            <table>
                <tr>
                    <th>姓名：</th>
                    <td><input type="text" name="jbrname" value="">
                        <span class="start">*</span>
                    </td>
                    <th>性别：</th>
                    <td>
                        <div class="com-sel">
                            <select name="jbrsex" id="sexid" class="com-opt">
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select>
                        </div>
                    </td>
                    <th>所在地区：</th>
                    <td>
                        <div class="com-sel">
                            <select name="jbrarea" id="twon" class="com-opt">
                                <option value="李营街道">李营街道</option>
                                <option value="二十里铺街道">二十里铺街道</option>
                                <option value="南张街道">南张街道</option>
                                <option value="金城街道">金城街道</option>
                                <option value="仙营街道">仙营街道</option>
                                <option value="安居街道">安居街道</option>
                                <option value="唐口街道">唐口街道</option>
                                <option value="观音阁街道">观音阁街道</option>
                                <option value="阜桥街道">阜桥街道</option>
                                <option value="古槐街道">古槐街道</option>
                                <option value="南苑街道">南苑街道</option>
                                <option value="济阳街道">济阳街道</option>
                                <option value="越河街道">越河街道</option>
                                <option value="喻屯镇">喻屯镇</option>
                                <option value="长沟镇">长沟镇</option>
                                <option value="区直部门单位">区直部门单位</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                    </td>
                    <th>工作单位：</th>
                    <td>
                        <input type="text" name="jbrunit" value="">
                        <span class="start">*</span>
                    </td>
                </tr>
                <tr>
                    <th>身份证号：</th>
                    <td><input type="text" name="jbrid" value="">
                        <span class="start">*</span>
                    </td>
                    <th>联系电话：</th>
                    <td>
                        <input type="text" name="jbrphone" value="">
                        <span class="start">*</span>
                    </td>
                    <th>联系地址：</th>
                    <td colspan="3">
                        <input type="text" name="jbraddr" value="" style="width: 350px">
                    </td>
                </tr>
            </table>
            <div class="card">被举报人信息</div>
            <table>
                <tr>
                    <th>姓名：</th>
                    <td><input type="text" name="bjbname" value="">
                        <span class="start">*</span>
                    </td>
                    <th>性别：</th>
                    <td>
                        <div class="com-sel">
                            <select name="bjbsex" id="sexid1" class="com-opt">
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select>
                        </div>
                    </td>
                    <th>所在地区：</th>
                    <td>
                        <div class="com-sel">
                            <select name="bjbarea" id="twon1" class="com-opt">
                                <option value="李营街道">李营街道</option>
                                <option value="二十里铺街道">二十里铺街道</option>
                                <option value="南张街道">南张街道</option>
                                <option value="金城街道">金城街道</option>
                                <option value="仙营街道">仙营街道</option>
                                <option value="安居街道">安居街道</option>
                                <option value="唐口街道">唐口街道</option>
                                <option value="观音阁街道">观音阁街道</option>
                                <option value="阜桥街道">阜桥街道</option>
                                <option value="古槐街道">古槐街道</option>
                                <option value="南苑街道">南苑街道</option>
                                <option value="济阳街道">济阳街道</option>
                                <option value="越河街道">越河街道</option>
                                <option value="喻屯镇">喻屯镇</option>
                                <option value="长沟镇">长沟镇</option>
                                <option value="区直部门单位">区直部门单位</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                    </td>
                    <th>工作单位：</th>
                    <td>
                        <input type="text" name="bjbunit" value="">
                        <span class="start">*</span>
                    </td>
                </tr>
                <tr>
                    <th>职务：</th>
                    <td>
                        <input type="text" name="bjbduty" value="">
                        <span class="start">*</span>
                    </td>
                    <th>级别：</th>
                    <td>
                        <div class="com-sel">
                            <select name="bjblevel" id="grade" class="com-opt">
                                <option value="0">县处级</option>
                                <option value="1">乡科级</option>
                                <option value="2">其他</option>
                            </select>
                        </div>
                    </td>
                    <th>问题类型：</th>
                    <td colspan="3">
                        <div class="com-sel">
                            <select name="bjbtype" id="question" class="com-opt" style="width: 200px">
                                <option value="选人用人问题">选人用人问题</option>
                                <option value="拉票贿选">拉票贿选</option>
                                <option value="买官卖官">买官卖官</option>
                                <option value="廉洁自律问题">廉洁自律问题</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>问题描述：</th>
                    <td colspan="7">
                        <textarea name="bjbmemo"  id="bjbmemo" placeholder="请填写问题详情..."></textarea>
                        <span class="start">*</span>
                    </td>
                </tr>
            </table>
            <div class="card">其他信息</div>
            <table>
                <tr>
                    <th width="50%">验证码：<input type="text" name="code" id="code" value="" placeholder="验证码"></th>
                    <td width="50%">&nbsp;&nbsp;<span id="checkCode"></span></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <button class="report_btn" id="submit_btn">提交</button>
                    </td>
                    <td >
                        <button class="report_btn" id="reset_btn">重置</button>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="type" value="1">
        </form>
    </div>
</div>
<div class="footer">
    <p>中共济宁市任城区委组织部版权所有&nbsp;ICP备xxx号</p>
    <p>本系统由济宁城市云计算有限公司承建</p>
</div>

</body>
<script src="/my/layuiadmin/layui/layui.js"></script>
<script src="/my/js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="/my/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/my/js/code.js"></script>

<script type="text/javascript">
    $('#submit_btn').click(function(){
        var isCode= validateCode();
        if(!isCode){
            return false;
        }
        event.preventDefault(); // 兼容标准浏览器
        window.event.returnValue = false; // 兼容IE6 - 8
        var name=$('input[name="jbrname"]').val()
        if(name=='' || name==null){
           alert("请填写您的姓名！")
           return false;
       }
        var idCard=$('input[name="jbrid"]').val();
        var reg=/^[1-9]\d{14}(\d{2}[0-9x])?$/;
       if(!reg.exec(idCard)){
            alert("您的身份证格式不对！");
            return false;
        }
        var phone=$('input[name="jbrphone"]').val();
        var pran = /^1[34578]\d{9}$/;
        if(!pran.exec(phone)){
            alert("您的电话格式不对");
            return false;
        }
        var name1=$('input[name="bjbname"]').val();
        if(name1=='' || name1==null){
            alert("请填写被举报人的姓名！")
            return false;
        }
        var bjbmemo=$('#bjbmemo').val();
        if(bjbmemo=='' || bjbmemo==null){
            alert("请详细描述问题！")
            return false;
        }
        $.ajax({ url: "/report/save",
            dataType:'json',
            data:$('#formId').serialize(),
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
        return false;
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


