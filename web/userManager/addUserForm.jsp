<%--
  Created by IntelliJ IDEA.
  User: CBS
  Date: 2018/9/4
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <title>贵美商城后台管理系统</title>
    <%@include file="../common.html"%>
    <script>
        $(function () {
            //
            $('#myAlert').hide();

            $('#addBtn').click(function () {
                //发送ajax请求
                $.post('doAdd.jsp', $('form').serialize(), function (json) {
                    if (json.actionFlag) {
                        //弹出提示框
                        $('#myAlert').show();
                        setTimeout("$('#myAlert').hide()", 3000);
                    }
                },'json'/*响应的数据类型*/);
            });

            //

        })
    </script>
</head>
<body>
<div id="wrapper">

    <jsp:include page="../nav.jsp"></jsp:include>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="../wrapper.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content" style="height: 78%">
                    <%--content 内容放入的位置--%>
                    <div id="center-content-area" style="height: 70%;">
<img src="user_images/header/defaultHeader.png" alt="">
<br>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-2 column"></div>
        <div class="col-md-8 column">
            <form action="user/add.do" class="form-horizontal" role="form" id="addForm">
                <div class="form-group">
                    <label for="user_id" class="col-sm-2 control-label text-right">用户编号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_id" value="系统自动生成" disabled>
                    </div>
                </div>
                <div class="form-group">
                    <label for="login_name" class="col-sm-2 control-label">登录名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="login_name" name="login_name" required placeholder="请输入登录名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="password" name="password" required placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <label for="first_name" class="col-sm-2 control-label">姓</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="first_name" name="first_name" placeholder="请输入姓">
                    </div>
                </div>
                <div class="form-group">
                    <label for="last_name" class="col-sm-2 control-label">名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="last_name" name="last_name" placeholder="请输入名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">email</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="email" name="email"  placeholder="请输入email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="gender" name="gender"  placeholder="请输入性别">
                    </div>
                </div>
                <div class="form-group">
                    <label for="hobbit" class="col-sm-2 control-label">爱好</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="hobbit" name="hobbit"  placeholder="请输入爱好">
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthday" class="col-sm-2 control-label">生日</label>
                    <div class="col-sm-6">
                        <input type="date" class="form-control" id="birthday" name="birthday"  placeholder="请输出生日期">
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-md-8 col-md-offset-1 text-center">
                        <button id="addBtn" class="btn btn-primary btn-lg" type="submit" style="width: 100px;">保存</button>&nbsp;&nbsp;
                        <button id="resetBtn" class="btn btn-default btn-lg" type="reset" style="width: 100px;">重置</button>
                    </div>
                </div>
            </form>


        </div>
        <div class="col-md-2 column"></div>
    </div>
</div>

                    </div>

                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>

<div id="myAlert" class="alert alert-success col-md-2" style="margin-right: 5px;position: absolute; right: 5px; bottom: 5px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>成功！</strong>结果是成功的。
</div>
<script>
    $(function () {
        $('#addBtn').click(function () {
            $('#addForm').submit();
            $('#addHeader').submit();
        });
    });
</script>
</body>
</html>
