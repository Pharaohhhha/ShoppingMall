<%--
  Created by IntelliJ IDEA.
  User: WT
  Date: 2018/9/5
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>个人简介</title>
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
                    <div id="center-content-area" style="height: 70%;">

                        <div class="col-md-offset-2 col-md-8">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>管理员信息</h5>
                                </div>
                                <div>
                                    <div class="ibox-content no-padding border-left-right">
                                        <img alt="image" class="img-responsive" src="${sessionScope.logUser.image}">
                                    </div>
                                    <div class="ibox-content profile-content">
                                        <h4><strong>${sessionScope.logUser.login_Name}</strong></h4>
                                        <p><i class="fa fa-map-marker"></i> ${sessionScope.logUser.address}</p>
                                        <h5>
                                            关于我
                                        </h5>
                                        <p>
                                            ${sessionScope.logUser.profile}
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>
</body>
</html>
