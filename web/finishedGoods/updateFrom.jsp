<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2018/9/1
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">更新库信息</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <!-- body -->
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <%--<div class="col-md-1 column"></div>--%>
                    <span style="float: left" ></span>
                    <div class="col-md-12 column text-center">
                        <form class="form-horizontal" role="form" id="updateForm" method="post" action="update.do">
                            <input type="hidden" id="stk_id" name="stk_id" value="${originalData.stk_id}">
                            <div class="form-group">
                                <label for="stk_id" class="col-sm-2 control-label text-right">编号</label>
                                <div class="col-sm-5" >
                                    <input type="text" class="form-control" id="stk_name2" value="${originalData.stk_id}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="stk_name" class="col-sm-2 control-label">库存名</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="stk_name" name="stk_name" value="${originalData.stk_name}" placeholder="请输入库存名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="quantity" class="col-sm-2 control-label">库存数量</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="quantity" name="quantity" value="${originalData.quantity}" placeholder="请输入库存数量">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="in_stk_date" class="col-sm-2 control-label">入库时间</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="in_stk_date" name="in_stk_date" value="${originalData.in_stk_date}" placeholder="请输入入库时间">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="out_stk_date" class="col-sm-2 control-label">出库时间</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="out_stk_date" name="out_stk_date" value="${originalData.out_stk_date}" placeholder="请输入出库时间">
                                </div>
                            </div>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary" id="updateBtn">保存</button>
                        </form>
                    </div>
                    <%--<div class="col-md-1 column"> </div>--%>
                </div>
            </div>
        </div>
    </div>

</div>
