<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2018/9/3
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
    </button>
    <h4 class="modal-title" id="myModalLabel">更新买家订单</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <!-- body -->


    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <%--<div class="col-md-1 column"></div>--%>
                    <div class="col-md-12 column text-center">

                        <form class="form-horizontal" role="form" id="updateForm" action="updatebuyerorder.do?trd_no=${param.trd_no}&prod_no=${order1_product.prod_no}" method="post"  >

                        <div class="form-group">
                            <label for="login_name" class="col-sm-2 control-label">买家</label>
                            <div class="col-sm-5">
                                <input type="text" readonly class="form-control" id="login_name" name="login_name"
                                       value="${trade_temp.login_name}" placeholder="请输入买家" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="trd_time"  class="col-sm-2 control-label">交易时间</label>
                            <div class="col-sm-5">
                                <input type="text" readonly class="form-control" id="trd_time" name="trd_time"
                                       value="${trade_temp.trd_time}" placeholder="请输入交易时间">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="receiver" class="col-sm-2 control-label">收货人</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="receiver" name="receiver"
                                       value="${trade_temp.receiver}" placeholder="请输入交易地点">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="phone" name="phone"
                                       value="${trade_temp.phone}" placeholder="请输入交易地点">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="trd_loc" class="col-sm-2 control-label">交易地点</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="trd_loc" name="trd_loc"
                                       value="${trade_temp.trd_loc}" placeholder="请输入交易地点">
                            </div>
                        </div>


                        <div align="center">
                            <!-- data-dismiss="modal" 该属性让模态框关闭 -->
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" id="updateBtn">保存</button>

                        </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
