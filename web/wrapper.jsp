<%--
  Created by IntelliJ IDEA.
  User: WT
  Date: 2018/9/2
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row border-bottom">
    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="搜索" class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li>
                <span class="m-r-sm text-muted welcome-message">欢迎登陆贵美后台管理系统</span>
            </li>

            <li>
                <a href="user/exit.do">
                    <i class="fa fa-sign-out"></i> 注销
                </a>
            </li>
        </ul>

    </nav>
</div>
<div class="row  border-bottom white-bg dashboard-header">

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>贵美商城后台管理系统</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="index.jsp">首页</a>
                </li>
                <li class="${param.modelId  eq 1?'active':'hidden'}">
                    <a>用户管理</a>
                </li>
                <li class="${param.modelId  eq 2?'active':'hidden'}">
                    <a>业务分析</a>
                </li>
                <li class="${param.modelId  eq 3?'active':'hidden'}">
                    <a>交易订单</a>
                </li>
                <li class="${param.modelId  eq 4?'active':'hidden'}">
                    <a>在售商品</a>
                </li>
                <li class="${param.modelId  eq 5?'active':'hidden'}">
                    <a>供应商表</a>
                </li>
                <li class="${param.modelId  eq 6?'active':'hidden'}">
                    <a>库存管理</a>
                </li>
                <li class="${param.modelId  eq 7?'active':'hidden'}">
                    <a>分类管理</a>
                </li>
                <li class="${param.modelId  eq 8?'active':'hidden'}">
                    <a>管理员信息</a>
                </li>
                <li class="${param.modelId  eq 9?'active':'hidden'}">
                    <a>管理员信息修改</a>
                </li>


                <%--<li class="active">--%>
                    <%--<strong>Flot Charts</strong>--%>
                <%--</li>--%>
            </ol>
        </div>
        <div class="col-lg-2">

        </div>
    </div>

</div>
