<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="org.apache.commons.lang3.math.NumberUtils" %>
<%@ page import="com.dio.guimei.vo.UserManagerVo.Users" %>
<%@ page import="com.dio.guimei.dao.UserManagerDao.UserDao" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: CBS
  Date: 2018/9/4
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String _user_id = request.getParameter("user_id");
    Integer user_id = null;
    if(StringUtils.isNotBlank(_user_id)){
        user_id = NumberUtils.toInt(_user_id,-1);
    }
    Users users=new UserDao().queryByPK(user_id);

    request.setAttribute("myUser",users);

    String hiredate = new SimpleDateFormat("yyyy-MM-dd").format(users.getBirthday());


%>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">更新用户信息</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <!-- body -->
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <%--<div class="col-md-1 column"></div>--%>
                    <div class="col-md-12 column text-center">

                        <form action="user/update.do" class="form-horizontal" role="form" id="updateForm">
                            <input type="hidden" name="user_id" value="${myUser.user_id}">
                            <div class="form-group">
                                <label for="user_id" class="col-sm-2 control-label text-right">编号</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="user_id" value="${myUser.user_id}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_name" class="col-sm-2 control-label">登录名</label>
                                <div class="col-sm-5">
                                    <input type="text" readonly class="form-control" id="login_name" name="login_name" value="${myUser.login_name}" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="password" name="password" value="${myUser.password}" placeholder="请输入密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="first_name" class="col-sm-2 control-label">姓</label>
                                <div class="col-sm-5">
                                    <input type="text" readonly class="form-control" id="first_name" name="first_name" value="${myUser.first_name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="last_name" class="col-sm-2 control-label">名</label>
                                <div class="col-sm-5">
                                    <input type="text" readonly class="form-control" id="last_name" name="last_name" value="${myUser.last_name}">

                                    <%--value="<%=hiredate%>" placeholder="请输入职日期">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="email" name="email" value="${myUser.email}" placeholder="请输入邮箱">
                                </div>
                            </div>
                            <div class="form-group" >
                                <label for="header" class="col-sm-2 control-label">头像</label>
                                <div class="col-sm-5">
                                    <input  type="text" class="form-control" id="header" name="header" value="${myUser.header}"  placeholder="头像上传">
                                    <img src="${myUser.header}" alt="默认头像">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="hobbit" class="col-sm-2 control-label">爱好</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="hobbit" name="hobbit" value="${myUser.hobbit}" placeholder="请输入爱好">
                                    <%-- <input type="text" class="form-control" id="deptno" name="deptno" value="${e.deptno}" placeholder="请输入部门">--%>
                                </div>
                            </div>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" id="updateBtn">保存</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

