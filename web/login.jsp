<%--
  Created by IntelliJ IDEA.
  User: WT
  Date: 2018/8/31
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="vendor/css/animate.css" rel="stylesheet">
    <link href="vendor/css/style.css" rel="stylesheet">
</head>
<body class="white-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">GM</h1>
        </div>
        <h3>欢迎登录贵美后台管理系统</h3>
        <p>阿里巴巴贵美商城频道，为您提供最新最热销的贵美商城产品、价格、图片、评价等信息；您还可以找到更多临沂贵美,小程序商城,等产品
        </p>
        <p>Login in. To see it in action.</p>
        <form class="m-t" role="form" action="user/login.do" method="post">
            <div class="form-group">
                <input type="text" class="form-control" name="login_Name" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="密码" required="">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登录</button>

            <a href="#"><small> 忘记密码 ?</small></a>
        </form>
        <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2018</small> </p>
    </div>
</div>

<!-- Mainly scripts -->
<script src="vendor/js/jquery-2.1.1.js"></script>
<script src="vendor/js/bootstrap.min.js"></script>

</body>
</html>
