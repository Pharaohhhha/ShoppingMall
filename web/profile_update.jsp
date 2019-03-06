<%--
  Created by IntelliJ IDEA.
  User: WT
  Date: 2018/9/5
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>个人信息修改</title>
    <%@include file="common.html"%>
</head>
<body>
<div id="wrapper">

    <jsp:include page="nav.jsp"></jsp:include>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="wrapper.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content" style="height: 78%">
                    <%--content 内容放入的位置--%>
                    <div id="center-content-area" style="height: 70%;" class=" col-md-offset-2 col-md-8">

                        <form class="form-inline" role="form">
                            <div class="form-group">
                                <label class="sr-only" for="name">路径</label>
                                <input type="text" class="form-control" id="name" placeholder="头像上传">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="inputfile">文件输入</label>
                                <input type="file" id="inputfile">
                            </div>

                            <button type="submit" class="btn btn-primary">提交</button>
                        </form>




                        <form class="form-horizontal" role="form" action="user/admin_update.do">
                            <div class="form-group">
                                <label for="user_Id" class="col-sm-2 control-label">管理员ID</label>
                                <input type="text" name="user_Id" value=" ${sessionScope.logUser.user_Id}" hidden>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="user_Id" value=" ${sessionScope.logUser.user_Id}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_Name" class="col-sm-2 control-label">名字</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="login_Name" name="login_Name" placeholder="请输入名字" value=" ${sessionScope.logUser.login_Name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" value="${sessionScope.logUser.password}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="address" name="address" placeholder="请输入地址" value="${sessionScope.logUser.address}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱" value="${sessionScope.logUser.email}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入电话" value="${sessionScope.logUser.phone}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>个人经历</label>
                                <textarea class="form-control" name="profile" rows="10"> ${sessionScope.logUser.profile}</textarea>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>
</body>
</html>
