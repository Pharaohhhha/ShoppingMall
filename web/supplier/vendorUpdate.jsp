
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">更新供应商信息</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <div class="container text-center">
        <div class="row clearfix">
            <div class="col-md-12 column text-center">
                <div class="row clearfix">
                    <form class="form-horizontal text-center" role="form" id="vendorUpdateForm" 
                          action="vendor_update.do" method="post">
                        <input type="hidden" name="ven_id" value="${param.vid}">
                        <div class="form-group">
                            <label for="ven_id" class="col-sm-2 control-label">ID</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="ven_id" id="ven_id" value="${param.vid}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ven_name" class="col-sm-2 control-label">供应商</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="ven_name" id="ven_name" value="${param.vname}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ven_addr" class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="ven_addr" id="ven_addr" value="${param.vaddr}" >
                            </div>
                        </div>
                        <div >
                            <button type="button" class="btn btn-default" data-dismiss="modal" href="">关闭</button>
                            <button type="submit" class="btn btn-primary">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
