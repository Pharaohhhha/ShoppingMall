<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <title>贵美商城后台管理系统</title>
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






                    </div>

                </div>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>




<script>
    $(document).ready(function() {
        setTimeout(function() {
            toastr.options = {
                closeButton: true,
                progressBar: true,
                showMethod: 'slideDown',
                timeOut: 4000
            };
            toastr.success('${sessionScope.logUser.loginName}', '欢迎登陆');

        }, 1300);
    });
</script>
</body>
</html>
