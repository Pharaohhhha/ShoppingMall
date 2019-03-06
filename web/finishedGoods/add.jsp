<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <base href="${pageContext.request.contextPath}/">
    <title>贵美商城后台管理系统</title>
    <%@include file="../common.html"%>
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

                        <div class=" col-md-offset-2 col-md-8" style="text-align: center;border: 1px solid #00ae9d;margin-top: 5%">
                            <form role="form" id="formAdd"  action="add.do" style="margin-top: 5%;" method="post">
                                <div class="form-group" style="   text-align: center;">
                                    <label for="stk_name" class="col-sm-2 control-label"  style="margin-left: 18%">库存名</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="stk_name" name="stk_name" value="" placeholder="请输入库存名">
                                    </div>
                                </div>
                                <br><br><br>
                                <div class="form-group">
                                    <label for="quantity" class="col-sm-2 control-label" style="margin-left: 18%"  >库存数量</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="quantity" name="quantity" value="" placeholder="请输入库存数量">
                                    </div>
                                </div>
                                <br><br>
                                <div class="form-group">
                                    <label for="in_stk_date" class="col-sm-2 control-label" style="margin-left: 18%">入库时间</label>
                                    <div class="col-sm-5">
                                        <input type="date" class="form-control" id="in_stk_date" name="in_stk_date" value="" placeholder="请输入入库时间">
                                    </div>
                                </div>
                                <br><br>
                                <div class="form-group">
                                    <label for="out_stk_date" class="col-sm-2 control-label" style="margin-left: 18%">出库时间</label>
                                    <div class="col-sm-5">
                                        <input type="date" class="form-control" id="out_stk_date" name="out_stk_date" value="" placeholder="请输入出库时间">
                                    </div>
                                </div>
                                <br><br>
                                <button type="reset"  class="btn btn-info btn-sm " >重置</button>&nbsp;&nbsp;&nbsp;
                                <button type="submit"  class="btn btn-info btn-sm " >保存</button>
                            </form>
                        </div>

                    </div>

                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>


</body>
</html>
