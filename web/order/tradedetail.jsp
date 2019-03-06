<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2018/9/3
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>订单详情</title>

    <base href="${pageContext.request.contextPath}/">
    <jsp:include page="../common.html"></jsp:include>

</head>
<style>
    th {
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
                <div class="wrapper wrapper-content" style="height: 78%">

<table class="table table-bordered" style="text-align: center">
    <caption>订单详情</caption>
    <thead>
    <tr>
        <th>图片</th>
        <th>名称</th>
        <th>原价格</th>
        <th colspan="2">型号</th>
        <th colspan="2">描述</th>
        <th>商品分类</th>
        <th>供应商</th>
        <th>库存</th>
        <th colspan="4" style="text-align:center">操作</th>

    </tr>
    </thead>
    <tbody>


    <tr>
        <td>
            <img src="images/${order1_product.image}" height="50" width="50">
        </td>
        <td>${order1_product.prod_name}</td>
        <td>${order1_product.price}</td>
        <td colspan="2">${order1_product.type}</td>
        <td colspan="2">${order1_product.descr}</td>
        <td>${order1_product.ctgr_id}</td>
        <td>${order1_product.ven_id}</td>
        <td>${order1_product.stk_id}</td>

        <td><a href="order/orderupdate.jsp?trd_no=${param.trd_no}" prod_no="${order1_product.prod_no}"
               class="btn btn-info btn-sm" data-target="#orderUpdateModal" data-toggle="modal" data-backdrop="static">
            <span class="glyphicon glyphicon-pencil"></span>编辑</a></td>
        <td>
            <a href="list.do" >
                <button class="btn btn-info btn-sm" data-toggle="modal" data-backdrop="static">
                <span class="glyphicon glyphicon-home"></span>返回
                </button>
            </a>
        </td>

    </tr>
    <tr>

        <th>买家</th>
        <td>${trade_temp.login_name}</td>
        <th>交易时间</th>
        <td>${trade_temp.trd_time}</td>
        <th>收货人</th>
        <td>${trade_temp.receiver}</td>
        <th>电话</th>
        <td>${trade_temp.phone}</td>
        <th>交易地点</th>
        <td>${trade_temp.trd_loc}</td>

        <td>
            <a href="order/orderbuyerupdate.jsp?trd_no=${param.trd_no}" class="btn btn-info btn-sm"
               data-target="#buyerUpdateModal" data-toggle="modal" data-backdrop="static">
                <span class="glyphicon glyphicon-pencil"></span>编辑</a></td>



        <td><a href="list.do" >
            <button class="btn btn-info btn-sm" data-toggle="modal" data-backdrop="static">
                <span class="glyphicon glyphicon-home"></span>返回</button>
            </a>
        </td>


    </tr>
    </tbody>
</table>
                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>
<%--更新order模态框--%>
<div class="modal fade" id="orderUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="myModal-content">
        </div>
    </div>
</div>

<%--更新buyer模态框--%>
<div class="modal fade" id="buyerUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="buymyModal-content">
        </div>
    </div>
</div>


<%--删除模态框--%>

<%--
<td>
    <a href="javascript:void(0)" class="btn btn-danger btn-sm" data-toggle="modal"
       id="deleteBtn"  prod_no="${order1_product.prod_no}" data-target="#deleteModal" data-backdrop="static">
    <span class="glyphicon glyphicon-trash"></span>删除</a></td>

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
                您真的要删除订单号为：<span id="trd_noMsg"></span> 吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="deleteConfirmBtn" type="button" class="btn btn-primary" data-dismiss="modal">删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div id="deleteAlert" class="alert alert-success col-md-3"
     style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;">
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
            var prod_no = $(event.relatedTarget).attr('prod_no');
            console.log(prod_no);
            $('#trd_noMsg').text(prod_no);
            $('#deleteConfirmBtn').click(function () {
                //发送异步请求
                //url传参数
                $.get('product_delete.do?prod_no=' + prod_no, function (json) {

                }, 'json');

                $('#deleteAlert').show();
                setTimeout("$(window.location.reload())", 1000);

            });
        })


    });
</script>
--%>


</tbody>
</table>
</body>
</html>
