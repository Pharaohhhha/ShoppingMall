<%--
  Created by IntelliJ IDEA.
  User: TCCCC
  Date: 2018/9/2/002
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>库信息添加</title>
    <jsp:include page="../common.html"></jsp:include>
</head>
<body>
<div id="wrapper">

    <jsp:include page="../nav.jsp"></jsp:include>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="../wrapper.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content" style="height: 78%">

                    <div class=" col-md-offset-2 col-md-10" style="text-align: center;height: 80%;">
                        <form role="form" id="formAdd" action="Salaprod_add.do" method="post"  style="text-align: center">
                            <div class="form-group" >
                                <label for="prod_no" class="col-sm-2 control-label"  style="margin-left: 20%" >商品序号</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="prod_no" name="prod_no" value="" placeholder="请输入商品序号">
                                </div>
                            </div>
                            <br><br><br>
                            <div class="form-group">
                                <label for="saler_id" class="col-sm-2 control-label" style="margin-left: 20%">卖家</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="saler_id" name="saler_id" value="" placeholder="请输入商品编号">
                                </div>
                            </div>
                            <br><br>
                            <div class="form-group">
                                <label for="stk_id" class="col-sm-2 control-label" style="margin-left: 20%">数量</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="stk_id" name="stk_id" value="" placeholder="请输入卖家编号">
                                </div>
                            </div><br><br>
                            <div class="form-group">
                                <label for="real_price" class="col-sm-2 control-label" style="margin-left: 20%">一口价</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="real_price" name="real_price" value="" placeholder="请输入一口价">
                                </div>
                            </div><br><br>
                            <div class="form-group">
                                <label for="carriage" class="col-sm-2 control-label" style="margin-left: 20%">运费</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="carriage" name="carriage" value="" placeholder="请输入运费">
                                </div>
                            </div><br><br>
                            <div class="form-group">
                                <label for="star_time" class="col-sm-2 control-label" style="margin-left: 20%">开始售卖时间</label>
                                <div class="col-sm-4">
                                    <input type="date" class="form-control" id="star_time" name="star_time" value="" placeholder="请输入开始售卖时间">
                                </div>
                            </div><br><br>
                            <div class="form-group">
                                <label for="end_time" class="col-sm-2 control-label" style="margin-left: 20%">结束售卖时间</label>
                                <div class="col-sm-4">
                                    <input type="date" class="form-control" id="end_time" name="end_time" value="" placeholder="请输入结束售卖时间">
                                </div>
                            </div><br><br>
                            <div class="form-group">
                                <label for="prod_skin" class="col-sm-2 control-label" style="margin-left: 20%">商品外观</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="prod_skin" name="prod_skin" value="" placeholder="请输入商品外观">
                                </div>
                            </div><br><br>
                            <div class="form-group">
                                <label for="location" class="col-sm-2 control-label" style="margin-left: 20%">所在地</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="location" name="location" value="" placeholder="请输入所在地">
                                </div>
                            </div><br><br>
                            <button type="reset" class="btn btn-info btn-sm" >重置</button>&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="btn btn-info btn-sm" >保存</button>
                        </form>
                    </div>

                </div>
                <jsp:include page="../footer.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>
</body>
</html>
