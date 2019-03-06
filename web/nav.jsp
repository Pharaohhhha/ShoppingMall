<%--
  Created by IntelliJ IDEA.
  User: WT
  Date: 2018/9/2
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="images/profile_small.jpg" />
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Admin</strong>
                             </span> <span class="text-muted text-xs block">${sessionScope.logUser.login_Name}<b class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="profile.jsp?modelId=8">个人简介</a></li>
                        <li><a href="profile_update.jsp?modelId=9">个人信息修改</a></li>
                        <li class="divider"></li>
                        <li><a href="user/exit.do">注销</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    IN+
                </div>
            </li>
            <li class="${param.modelId eq 1? 'active':''}">
                <a href="index.jsp"><i class="fa fa-th-large"></i> <span class="nav-label">用户管理</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="user/list.do?modelId=1">查看用户</a></li>
                    <li><a href="userManager/addUserForm.jsp?modelId=1">增加用户</a></li>
                    <li><a href="userManager/changeHeader.jsp?modelId=1">头像上传</a></li>
                </ul>
            </li>
            <li class="${param.modelId eq 2? 'active':''}">
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">业务分析</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="Table/index.jsp?modelId=2">数据分析</a></li>
                </ul>
            </li>
            <li CLASS="${param.modelId eq 3? 'active':''}">
                <a href="#"><i class="fa fa-files-o"></i> <span class="nav-label">交易订单</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="list.do?modelId=3">订单管理</a></li>
                </ul>
            </li>
            <li CLASS="${param.modelId eq 4? 'active':''}">
                <a href="#"><i class="fa fa-flask"></i> <span class="nav-label">在售商品</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="Salaprod_queryAll.do?modelId=4">商品管理</a></li>
                    <li><a href="salaprod/addFrom.jsp?modelId=4">新增商品</a></li>
                </ul>
            </li>
            <li CLASS="${param.modelId eq 5? 'active':''}">
                <a href="#"><i class="fa fa-table"></i> <span class="nav-label">供应商表</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="vendor_list.do?modelId=5">商家管理</a></li>
                    <%--<li><a href="table_data_tables.html">新供应商</a></li>--%>
                    <%--<li><a href="table_foo_table.html">安全审计</a></li>--%>
                    <%--<li><a href="jq_grid.html">网站安全</a></li>--%>
                </ul>
            </li>
            <li   CLASS="${param.modelId eq 6? 'active':''}">
                <a href="#"><i class="fa fa-shopping-cart"></i> <span class="nav-label">库存管理</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="finishedGoods/dosomething.jsp?modelId=6" >库存管理</a></li>
                    <li><a href="finishedGoods/add.jsp?modelId=6">新增库存</a></li>
                </ul>
            </li>
            <li CLASS="${param.modelId eq 7? 'active':''}">
                <a href="#"><i class="fa fa-sitemap"></i> <span class="nav-label">分类管理</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="category/categoryMain.jsp?modelId=7" >商品分类管理</a></li>
                    <%--<li><a href="finishedGoods/add.jsp?modelId=5">新增商品</a></li>--%>
                </ul>
            </li>
        </ul>

    </div>


</nav>