<%--
  Created by IntelliJ IDEA.
  User: xxxx
  Date: 2018/9/1
  Time: 23:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">更新商品分类</h4>
</div>
<div class="modal-body" id="update-modal-body">
    <!-- body -->
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <%--<div class="col-md-1 column"></div>--%>
                    <div class="col-md-12 column text-center">

                        <form class="form-horizontal" role="form" id="updateForm">
                            <input type="hidden" name="ctgr_id" value="${cgy.ctgr_id}">
                            <div class="form-group">
                                <label for="ctgr_id" class="col-sm-2 control-label text-right">编号</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="ctgr_id" value="${cgy.ctgr_id}" disabled>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_ctgr_name" class="col-sm-2 control-label">商品分类</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="new_ctgr_name" name="new_ctgr_name" value="${cgy.ctgr_name}" placeholder="请输入商品分类">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_big_ctgr" class="col-sm-2 control-label">分类</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="new_big_ctgr" name="new_big_ctgr" value="${cgy.big_ctgr}" placeholder="请输入所属分类">
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
    <button type="button" class="btn btn-primary" id="_updateBtn">保存</button>
</div>
<script>
    $(function () {
        $('#_updateBtn').click(function () {
            var data = $('#updateForm').serialize();
            console.log(data)
            //send ajax request
            $.post('category_doUpdate.do', data, function(json){ // {"actionFlag": true}
                //1.把该表单的数据更新父窗口表格中相应的行
                $('#tr_' + $('#ctgr_id').val() + ' td:eq(1)').text($('#new_ctgr_name').val());
                $('#tr_' + $('#ctgr_id').val() + ' td:eq(2)').text($('#new_big_ctgr').val());
                //2. 关闭模态框窗口
                if(json.actionFlag){
                    $('#myModal').modal('hide');
                }
            },'json');
        });
    })

</script>
