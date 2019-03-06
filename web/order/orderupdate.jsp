<%--
  Created by IntelliJ IDEA.
  User: wxk
  Date: 2018/9/3
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">更新订单</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <!-- body -->



    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <%--<div class="col-md-1 column"></div>--%>
                    <div class="col-md-12 column text-center">

                        <form class="form-horizontal" role="form" id="updateForm" action="updateorder.do?prod_no=${order1_product.prod_no}&trd_no=${param.trd_no}&image=${order1_product.image}" method="post">

                            <div class="form-group">
                                <label for="image" class="col-sm-2 control-label">图片</label>
                                <div class="col-sm-5">
                                    <img src="images/${order1_product.image}" width="100" height="100" >
                                    <input type="text" class="form-control" id="image" name="image" value="${order1_product.image}" readonly style="display: none">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="prod_name" class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="prod_name" name="prod_name"  value="${order1_product.prod_name}" placeholder="请输入名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="price" class="col-sm-2 control-label">原价格</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="price" name="price" value="${order1_product.price}" placeholder="请输入价格">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="type" class="col-sm-2 control-label">型号</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="type" name="type" value="${order1_product.type}" placeholder="请输入型号">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="descr" class="col-sm-2 control-label">商品描述</label>
                                <div class="col-sm-5">
                                    <input type="text"   class="form-control" id="descr" name="descr" value="${order1_product.descr}" placeholder="请输入商品描述">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="ctgr_id" class="col-sm-2 control-label">商品分类</label>
                                <div class="col-sm-5">
                                    <input type="text" readonly  class="form-control" id="ctgr_id" name="ctgr_id" value="${order1_product.ctgr_id}" placeholder="请输入商品分类">
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="ven_id" class="col-sm-2 control-label">供应商</label>
                                <div class="col-sm-5">
                                    <input type="text" readonly  class="form-control" id="ven_id" name="ven_id" value="${order1_product.ven_id}" placeholder="请输入供应商">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="stk_id" class="col-sm-2 control-label">库存</label>
                                <div class="col-sm-5">
                                    <input type="text" readonly class="form-control" id="stk_id" name="stk_id" value="${order1_product.stk_id}" placeholder="请输入库存">
                                </div>
                            </div>

                            <div align="center">
                                <!-- data-dismiss="modal" 该属性让模态框关闭 -->
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" id="updateBtn" >保存</button>

                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
