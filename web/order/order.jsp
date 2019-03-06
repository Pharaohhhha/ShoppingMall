<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2018/8/31
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<base href="${pageContext.request.contextPath}/">
    <title></title>
    <jsp:include page="../common.html"></jsp:include>
</head>
<style>
    th{
        text-align:center;
    }

</style>
<body>
<div id="wrapper">

    <jsp:include page="../nav.jsp"></jsp:include>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="../wrapper.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content" style="height: 78%">
                    <form action="list.do" method="post" style="text-align: center">

                        <%--查询框--%>


                        起始时间：<input type="date" name="select_time" id="select_time" class="input" >
                        终止日期：<input type="date" name="select_lgtime" id="select_lgtime" class="input">
                        <button type="submit" class="btn btn-info">查询</button>
                        <button type="reset" class="btn btn-info">重置</button>
                    </form>
<table class="table table-bordered" style="text-align: center"  id="orderTab">
    <caption>订单详情</caption>
    <thead>
    <tr>
        <th>序号</th>
        <th>交易编号</th>
        <th>商品编号</th>
        <th>卖家</th>
        <th>交易时间</th>
        <th>交易数量</th>
        <th>折扣价</th>
        <th colspan="2" style="text-align:center">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${tradeDetailsList}">
    <tr>
        <td>${item.rn}</td>
        <td>${item.trd_no}</td>
        <td>${item.prod_no}</td>
        <td>${item.saler}</td>
        <td>${item.trd_time}</td>
        <td>${item.quantity}</td>
        <td>${item.discount_price}</td>
        <td><a href="order_detail.do?trd_no=${item.trd_no}" class="btn btn-info btn-sm"  data-toggle="modal" data-backdrop="static">
            <span class="glyphicon glyphicon-book"></span>&nbsp;详情</a>&nbsp;&nbsp;
        <a href="javascript:void(0)" class="btn btn-danger btn-sm"  data-toggle="modal"
               id="deleteBtn"  trd_no="${item.trd_no}" data-target="#deleteModal" data-backdrop="static">
            <span style="color: red" class="glyphicon glyphicon-share"></span>&nbsp;删除</a></td>

    </tr>
    </c:forEach>

    </tbody>
</table>

<div style="float: right">
    <td >
        <!-- 分页栏 -->
        <c:if test="${not order_page.first}">
            <a href="list.do?pageNo=1">第一页</a>&nbsp;&nbsp;
        </c:if>
        <c:if test="${order_page.pageNo gt 1}">
            <a href="list.do?pageNo=${order_page.pageNo-1}">上一页</a>&nbsp;&nbsp;
        </c:if>
        <c:if test="${order_page.pageNo lt order_page.totalPage}">
            <a href="list.do?pageNo=${order_page.pageNo+1}">下一页</a>&nbsp;&nbsp;
        </c:if>
        <c:if test="${not order_page.last}">
            <a href="list.do?pageNo=${order_page.totalPage}">最后一页</a>
        </c:if>
        <c:if test="${not empty order_page}">
            &nbsp;&nbsp; 共${order_page.totalRow}条记录&nbsp;第${order_page.pageNo}页/共${order_page.totalPage}页
        </c:if>
    </td>
    </div>
                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
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
            您真的要删除订单号为：<span id="trd_noMsg"></span> 吗？
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
            <strong>删除成功！</strong>结果是成功的。
        </div>
        <script>
            //ready
            $(function () {
                $('#deleteAlert').hide();

                //处理当模态框打开时的事件：show.bs.modal
                $('#deleteModal').on('show.bs.modal', function (event) { //event表示的是点元素产生事件，此处是<a id="deleteBtn">...</a>的事件
                    // 获得触发事件的源头的元素
                    var trd_no = $(event.relatedTarget).attr('trd_no');
                    $('#trd_noMsg').text(trd_no);
                    console.log(trd_no);
                    $('#deleteConfirmBtn').click(function () {
                        //发送异步请求
                        //url传参数
                        $.get('order_delete.do?trd_no=' +trd_no,function (json) {

                        },'json');

                            $('#deleteAlert').show()
                            setTimeout("$(window.location.reload())",300);



                    });
                })


            });
        </script>
</body>
</html>




