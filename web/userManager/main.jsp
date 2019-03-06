<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dio.guimei.vo.UserManagerVo.Users" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CBS
  Date: 2018/8/31
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>贵美商城后台管理系统</title>
    <%@include file="../common.html"%>
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




<table class="table table-bordered">
    <caption>用户表</caption>
    <thead>
    <tr>
        <th>用户ID</th>
        <th>头像</th>
        <th>登录名</th>
        <th>密码</th>
        <th>姓</th>
        <th>名</th>
        <th>邮箱</th>
        <th>性别</th>
        <th>爱好</th>
        <th>生日</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>


    <c:forEach var="myUser" items="${usersList}">
        <tr>
            <td>${myUser.user_id}</td>
            <td><img src="${myUser.header}" alt="${myUser.header}"height="30px"></td>
            <td>${myUser.login_name}</td>
            <td>${myUser.password}</td>
            <td>${myUser.first_name}</td>
            <td>${myUser.last_name}</td>
            <td>${myUser.email}</td>
            <td>${myUser.gender}</td>
            <td>${myUser.hobbit}</td>
            <td>${myUser.birthday}</td>
            <td class="text-center">

                <a id="toUpdateBtn" users="${myUser.user_id}" href="userManager/updateForm.jsp?user_id=${myUser.user_id}" class="btn btn-info btn-sm"
                   data-toggle="modal" data-target="#myModal" data-backdrop="static">
                    <span class="glyphicon glyphicon-refresh"></span> 编辑
                </a>
                <a href="javascript:void(0);" class="btn btn-danger btn-sm" user_id="${myUser.user_id}" id="deleteBtn"
                   data-toggle="modal" data-target="#deleteModal" data-backdrop="static">
                    <span class="glyphicon glyphicon-trash"></span> 删除
                </a>


           


            </td>
        </tr>
    </c:forEach>
    <tr style="text-align: center">
        <td colspan="11">
            <!-- 分页栏 -->

                <a href="user/list.do?pageNo=1">第一页</a>&nbsp;&nbsp;

            <c:if test="${userPage.pageNo gt 1}">
                <a href="user/list.do?pageNo=${userPage.pageNo-1}">上一页</a>&nbsp;&nbsp;
            </c:if>
            <c:if test="${userPage.pageNo lt userPage.totalPage}">
                <a href="user/list.do?pageNo=${userPage.pageNo+1}">下一页</a>&nbsp;&nbsp;
            </c:if>

                <a href="user/list.do?pageNo=${userPage.totalPage}">最后一页</a>

        </td>
    </tr>

    </tbody>
</table>

                    </div>

                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="myModal-content">
            <!-- 更新员工的信息表单的内容部分，加入到这里 -->
        </div>
    </div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> 删除确认 </h4>
            </div>
            <div class="modal-body">
                <span class="fa fa-exclamation fa-2x" style="color:#f15b6c;"></span>
                您真的要删除编号为：<span id="usersMsg"></span> 的员工吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="deleteConfirmBtn" type="button" class="btn btn-primary">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div id="deleteAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>删除成功！</strong>结果是成功的。
</div>



<script>
    //ready
    $(function () {
        $('#deleteAlert').hide();

        //处理当模态框打开时的事件：show.bs.modal
        $('#deleteModal').on('show.bs.modal', function (event) { //event表示的是点元素产生事件，此处是<a id="deleteBtn">...</a>的事件
            // 获得触发事件的源头的元素
            console.dirxml(event.relatedTarget);
            var user_id = $(event.relatedTarget).attr('user_id');
            $('#usersMsg').text(user_id);
            $('#deleteConfirmBtn').click(function () {
                //发送异步请求
                //url传参数
                console.log(user_id);
                $.get('user/delete.do?user_id= ' + user_id ,function (json) {}
                    ,'json');
                $('#deleteAlert').show()
                setTimeout("$(window.location.reload())",300)
            });
        })


    });

 


</script>
<c:set var="addmsg" value="${requestScope.addMsg}" scope="request"/>
<c:if test="${addmsg}">

</c:if>

</body>
</html>
