<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>供应商</title>
    <%@include file="../common.html"%>

    <script>
        $(function () {
            if(${vendorStatusCode == "update"}){
                $('#vendorUpdateAlert').show();
                setTimeout("$('#vendorUpdateAlert').hide()",1500);
            }
            if(${vendorStatusCode == "delete"}){
                $('#vendorDeleteAlert').show();
                setTimeout("$('#vendorDeleteAlert').hide()",1500);
            }
            if(${vendorStatusCode == "add"}){
                $('#vendorAddAlert').show();
                setTimeout("$('#vendorAddAlert').hide()",1500);
            }
        })
    </script>
    <style>
        #th_vender th{
            text-align: center;
        }
        #paging td{
            height: 50px;
        }
        #tr_vendor td{
            width: 20%;
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
                <div class="wrapper wrapper-content" style="height:78%">
                    <div>
                        <div>
                            <table class="table  table-bordered" style="text-align: center;margin-top: 10px;">
                                <caption>
                                    供应商信息
                                    <div style="float: right;margin-right: 20px">
                                        <a href="supplier/vendorAdd.jsp"
                                           class="btn btn-info btn-sm"  data-toggle="modal" data-target="#vendorInsertModal" data-backdrop="static">
                                            <span class="glyphicon glyphicon-plus"></span>新增
                                        </a>
                                    </div>
                                    <form action="vendor_list.do?pageNo=${null}" method="post" style="margin-left: 20%">
                                        供应商：<input type="text" name="ven_name" id="vendorName" value="${vendorsList.ven_name}">
                                        地址：<input type="text" name="ven_addr" id="vendorAddress" value="${vendorsList.ven_addr}" >
                                        &nbsp;&nbsp;<button type="submit" class="btn-info btn-sm ">查询</button>
                                    </form>
                                </caption>
                                <thead >
                                <tr id="th_vender">
                                    <th align="center">序号</th>
                                    <th>ID</th>
                                    <th>供应商</th>
                                    <th>地址</th>
                                    <th>基本操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="vendor" items="${vendors}">
                                    <tr id="tr_vendor">
                                        <td>${vendor.rownum}</td>
                                        <td>${vendor.ven_id}</td>
                                        <td>${vendor.ven_name}</td>
                                        <td>${vendor.ven_addr}</td>
                                        <td>
                                            &nbsp; &nbsp;
                                            <button href="supplier/vendorUpdate.jsp?vid=${vendor.ven_id}&vname=${vendor.ven_name}&vaddr=${vendor.ven_addr}"
                                                    type="button"  class="btn btn-info btn-sm" data-toggle="modal" data-target="#vendorUpdateModal"> <span style="color: #00ae9d" class="glyphicon glyphicon-edit"></span> &nbsp;更新</button>  &nbsp; &nbsp;

                                         <button type="button"  id="vendorDelBtn" vid="${vendor.ven_id}" class="btn btn-danger btn-sm "
                                                    data-toggle="modal" data-target="#vendorDeleteModal">   <span style="color: red" class="glyphicon glyphicon-share">
                        </span>&nbsp;删除</button>

                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div style="margin-right: 20px;height: 40px" align="center">

                            <c:if test="${not vendorPage.first}">
                                <a href="vendor_list.do?pageNo=1">首页</a>
                            </c:if>
                            <c:if test="${vendorPage.pageNo gt 1}">
                                <a href="vendor_list.do?pageNo=${vendorPage.pageNo-1}">上一页</a>
                            </c:if>
                            <c:if test="${vendorPage.pageNo lt vendorPage.totalPage}">
                                <a href="vendor_list.do?pageNo=${vendorPage.pageNo+1}">下一页</a>
                            </c:if>
                            <c:if test="${not vendorPage.last}">
                                <a href="vendor_list.do?pageNo=${vendorPage.totalPage}">尾页</a>
                            </c:if>
                            共${vendorPage.totalRow}条记录&nbsp;&nbsp;第${vendorPage.pageNo}页/共${vendorPage.totalPage}页
                        </div>
                    </div>
                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>


<%--更新--%>
<div class="modal fade" id="vendorUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="myModal-content">
        </div>
    </div>
</div>
<%--新增--%>
<div class="modal fade" id="vendorInsertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" id="">
        </div>
    </div>
</div>

<%--确认删除模态框--%>
<div class="modal fade" id="vendorDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">
                <span class="fa fa-exclamation fa-2x" style="color:#f15b6c;"></span>
                <span style="font-size: 20px;" class="text-danger">确认删除？</span>
            </div>
            <div class="modal-footer">
                <button type="button" id="confirmDeleteVendor" class="btn btn-default" data-dismiss="modal">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div id="vendorDeleteAlert" class="alert alert-success col-md-3"
     style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>删除成功！</strong>
</div>
<div id="vendorUpdateAlert" class="alert alert-success col-md-3"
     style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>更新成功！</strong>
</div>
<div id="vendorAddAlert" class="alert alert-success col-md-3"
     style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none;">
    <a href="#" class="close" data-dismiss="alert">&times;</a>
    <strong>添加成功！</strong>
</div>
<script type="text/javascript">
    $(function () {
        $('#vendorDeleteModal').on('show.bs.modal',function (event) {
            var id = $(event.relatedTarget).attr("vid");
            $('#confirmDeleteVendor').click(function () {
                $.get('vendor_delete.do?ven_id='+id,function () {
                    $('#vendorAddAlert').show();
                    window.location.href='vendor_list.do?pageNo=${vendorPage.pageNo}';
                })
            })
        })
    });
</script>
</body>
</html>
