<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xxxx
  Date: 2018/9/1
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>贵美商城后台管理系统</title>
    <%@include file="../common.html"%>

    <%--<link rel="stylesheet" href="../js/bootstrap_v3.3.7/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="../js/bootstrap_v3.3.7/css/bootstrap-theme.min.css">--%>

    <%--<script src="../js/jquery-2.2.4.js"></script>--%>
    <%--<script src="../js/bootstrap_v3.3.7/js/bootstrap.min.js"></script>--%>

    <script>
        $(function () {
            //异步加载部门表列至下拉列表框
            //这里是一个json对象，不是一个字符串，jquery已给我们转换成json对象
            $.get("category_getCategorys.do",function (jsonArr) {
                var  bigCtgrSelect = $('#big_ctgr');
                $.each(jsonArr, function () {
                    var opt = $('<option></option>');
                    opt.attr('value', this.bigCtgr);
                    opt.text(this.bigCtgr);
                    bigCtgrSelect.append(opt);
                });
            },"json");
        })
    </script>
    <style>
        #th_cate th{
            text-align: center;
        }
    </style>
</head>
<body>


<div id="wrapper">

    <jsp:include page="../nav.jsp"></jsp:include>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="../wrapper.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <%--content 内容放入的位置--%>
                    <div id="center-content-area" style="height: 70%;">

    <form class="form-inline" method="post" action="category_getCategoryList.do" style="width: 400px">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">商品大分类：</div>
                <select name="big_ctgr" id="big_ctgr" class="form-control">
                    <option value="">--请选择--</option>
                </select>
            </div>
        </div>
        <div class="clearfix"></div>
        <br>
        <div class="row clearfix">
            <div class="col-md-12 column text-center">
                <div class="form-group">
                    <div class="input-group">
                        <button type="submit" class="btn btn-info" id="queryList">查询</button>
                        <button id="toAddBtn"  href="#"
                                data-toggle="modal" data-target="#addModal" data-backdrop="static"
                                type="button" class="btn btn-default" style="margin-left: 50px;">新增分类</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <table class="table table-bordered" style="text-align: center">

        <thead>
        <tr id="th_cate">
            <th>分类编号</th>
            <th>分类名</th>
            <th>所属分类</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${categories}" var="item">
            <tr id="tr_${item.ctgr_id}">
                <td>${item.ctgr_id}</td>
                <td>${item.ctgr_name}</td>
                <td>${item.big_ctgr}</td>
                <td class="text-center">
                    <a id="toUpdateBtn" ctgr_id="${item.ctgr_id}" onclick="toUpdate(this)" href="#" class="btn btn-info btn-sm"
                       data-toggle="modal" data-target="#myModal" data-backdrop="static">
                        <span style="color: #00ae9d" class="glyphicon glyphicon-edit"></span>  &nbsp;更新
                    </a>
                    <a id="toDeleteBtn" ctgr_id="${item.ctgr_id}" big_ctgr="${item.big_ctgr}" href="#" class="btn btn-danger btn-sm"
                       data-toggle="modal" data-target="#deleteModal" data-backdrop="static">
                        <span style="color: red" class="glyphicon glyphicon-share"></span>  &nbsp;删除
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <table style="text-align:center">
        <tr>
            <td >
                <!-- 分页栏 -->
                <c:if test="${not category_page.first}">
                    <a href="category_getCategoryList.do?pageNo=1">第一页</a>&nbsp;&nbsp;
                </c:if>
                <c:if test="${category_page.pageNo gt 1}">
                    <a href="category_getCategoryList.do?pageNo=${category_page.pageNo-1}">上一页</a>&nbsp;&nbsp;
                </c:if>
                <c:if test="${category_page.pageNo lt category_page.totalPage}">
                    <a href="category_getCategoryList.do?pageNo=${category_page.pageNo+1}">下一页</a>&nbsp;&nbsp;
                </c:if>
                <c:if test="${not category_page.last}">
                    <a href="category_getCategoryList.do?pageNo=${category_page.totalPage}">最后一页</a>
                </c:if>
                <c:if test="${not empty category_page}">
                    &nbsp;&nbsp; 共${category_page.totalRow}条记录&nbsp;第${category_page.pageNo}页/共${category_page.totalPage}页
                </c:if>
            </td>
        </tr>
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

            </div>
        </div>
    </div>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" id="addModal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增商品分类</h4>
                </div>
                <div class="modal-body" id="update-modal-body">
                    <!-- body -->
                    <div class="container">
                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <div class="row clearfix">
                                    <%--<div class="col-md-1 column"></div>--%>
                                    <div class="col-md-12 column text-center">

                                        <form class="form-horizontal" role="form" id="addForm">
                                            <div class="form-group">
                                                <label for="add_ctgr_id" class="col-sm-2 control-label text-right">编号</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="add_ctgr_id"  disabled placeholder="自动生成">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="add_ctgr_name" class="col-sm-2 control-label">商品分类</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="add_ctgr_name" name="add_ctgr_name"  placeholder="请输入商品分类">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="add_big_ctgr" class="col-sm-2 control-label">所属分类</label>
                                                <div class="col-sm-5">
                                                    <input type="text" class="form-control" id="add_big_ctgr" name="add_big_ctgr"  placeholder="请输入所属分类">
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <!-- data-dismiss="modal" 该属性让模态框关闭 -->
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="_addBtn">保存</button>
                </div>
            </div>
        </div>
    </div>


    <div id="addAlert" class="alert alert-success col-md-2" style="margin-right: 5px;position: absolute; right: 5px; bottom: 5px;">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>添加成功!</strong>
    </div>

    <script>
        //通过这种方式把其它页面的内容加入到模态框的body部分
        function toUpdate(c) {
            $('#myModal-content').empty();
            var id = $(c).attr('ctgr_id');
            $.get('category_readyUpdate.do?ctgrId=' + id,function (html) {
                $('#myModal-content').append(html)
            },'html');
        }


        $(function () {
            $('#addAlert').hide();
            $('#_addBtn').click(function () {
                var data = $('#addForm').serialize();
                //send ajax request
                $.post('category_doAdd.do', data, function(json){ // {"actionFlag": true}
                    //2. 关闭模态框窗口
                    if(json.actionFlag){
                        $('#addAlert').show();
                        $('#addModal').modal('hide');
                        var big_ctgr = $('#add_big_ctgr').val();
                        console.log(big_ctgr);
                        $.post('category_getCategoryList.do?big_ctgr='+ big_ctgr,function () {
                            setTimeout("$(window.location.reload())", 800);

                        });
                    }
                },'json');
            });
        })

    </script>

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
                    您真的要删除分类编号<span id="ctgr_idMsg"></span> 吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="deleteConfirmBtn" type="button" class="btn btn-primary" data-dismiss="modal">删除</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <div id="deleteAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>删除成功！</strong>
    </div>
    <script>
        //ready
        $(function () {
            $('#deleteAlert').hide();

            //处理当模态框打开时的事件：show.bs.modal
            $('#deleteModal').on('show.bs.modal', function (event) { //event表示的是点元素产生事件，此处是<a id="deleteBtn">...</a>的事件
                // 获得触发事件的源头的元素
                var cid = $(event.relatedTarget).attr('ctgr_id');
                var bct = $(event.relatedTarget).attr('big_ctgr');
                $('#ctgr_idMsg').text(cid);
                console.log(cid);
                $('#deleteConfirmBtn').click(function () {
                    //发送异步请求
                    //url传参数
                    $.get('category_delete.do?ctgrId=' +cid,function (json) {
                        $('#deleteAlert').show();
                        $.post('category_getCategoryList.do?big_ctgr='+ bct,function () {
                            setTimeout("$(window.location.reload())", 800);
                        });
                    },'json');




                });
            })
        });
    </script>


</body>
</html>
