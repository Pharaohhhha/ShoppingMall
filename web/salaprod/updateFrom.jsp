<%--
  Created by IntelliJ IDEA.
  User: TCCCC
  Date: 2018/9/2/002
  Time: 14:15
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
                    <div class="col-md-12 column text-center" style="width: 100%;height: 100%;">

                        <form class="form-horizontal" role="form" id="updateForm" method="post" action="Salaprod_update.do">
                            <input type="hidden" id="id" name="id" value="${originalData.id}">
                            <div class="form-group">
                                <label for="id2" class="col-sm-2 control-label text-right">编号</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="id2" value="${originalData.id}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="prod_no" class="col-sm-2 control-label">商品序号</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="prod_no" name="prod_no" value="${originalData.prod_no}" placeholder="请输入商品序号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="saler_id" class="col-sm-2 control-label">商品编号</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="saler_id" name="saler_id" value="${originalData.saler_id}" placeholder="请输入商品编号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="stk_id" class="col-sm-2 control-label">商品数量</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="stk_id" name="stk_id" value="${originalData.stk_id}" placeholder="请输入卖家编号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="real_price" class="col-sm-2 control-label">一口价</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="real_price" name="real_price" value="${originalData.real_price}" placeholder="请输入一口价">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="carriage" class="col-sm-2 control-label">运费</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="carriage" name="carriage" value="${originalData.carriage}" placeholder="请输入运费">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="star_time" class="col-sm-2 control-label">开始售卖时间</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="star_time" name="star_time" value="${originalData.star_time}" placeholder="请输入开始售卖时间">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="end_time" class="col-sm-2 control-label">结束售卖时间</label>
                                <div class="col-sm-5">
                                    <input type="date" class="form-control" id="end_time" name="end_time" value="${originalData.end_time}" placeholder="请输入结束售卖时间">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="prod_skin" class="col-sm-2 control-label">商品外观</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="prod_skin" name="prod_skin" value="${originalData.prod_skin}" placeholder="请输入商品外观">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="location" class="col-sm-2 control-label">所在地</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="location" name="location" value="${originalData.location}" placeholder="请输入所在地">
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

