<%--
  Created by IntelliJ IDEA.
  User: xxxx
  Date: 2018/8/31
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<style>--%>
  <%--#FinishedGoodTable th{--%>
    <%--text-align: center;--%>
    <%--background-color: #C9E8FC;--%>
  <%--}--%>
<%--</style>--%>


<%--<html>--%>
<%--<head>--%>
  <%--<base href="${pageContext.request.contextPath}/">--%>
  <%--<title>贵美商城后台管理系统</title>--%>
  <%--<%@include file="../common.html"%>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="wrapper">--%>

  <%--<jsp:include page="../nav.jsp"></jsp:include>--%>
  <%--<div id="page-wrapper" class="gray-bg dashbard-1">--%>
    <%--<jsp:include page="../wrapper.jsp"></jsp:include>--%>
    <%--<div class="row">--%>
      <%--<div class="col-lg-12">--%>
        <%--<div class="wrapper wrapper-content">--%>

          <%--<form method="post" role="form"  class="form-inline" action="queryAll.do" STYLE="margin-top: 1%;margin-left: 2%">--%>
            <%--&nbsp; &nbsp; 库存名：<input type="text" style="width: 6%;padding-left: 1%"  name="stk_name" id="stk_name" value="${FinishedGoodCondition.stk_name}">--%>
            <%--&nbsp; &nbsp;--%>

            <%--编号：<input type="number" style="width: 4%;padding-left: 1%" name="lowId" id="lowId" value="${FinishedGoodCondition.lowId}">--%>
            <%--&nbsp; &nbsp;-----&nbsp; &nbsp;--%>
            <%--<c:if test="${FinishedGoodCondition.hiId == 0}"> <input type="number" style="width: 4%;padding-left: 1%" name="hiId" id="hiId" value=""></c:if>--%>
            <%--<c:if test="${FinishedGoodCondition.hiId != 0}"> <input type="number" style="width: 4%;padding-left: 1%" name="hiId" id="hiId" value="${FinishedGoodCondition.hiId}"></c:if>--%>
            <%--&nbsp; &nbsp;--%>
            <%--<input type="submit" class="btn btn-info btn-sm" value="查询">--%>
            <%--<a href="finishedGoods/add.jsp">&nbsp; &nbsp;<button type="button" class="btn btn-info btn-sm ">添加</button></a></form>--%>
          <%--<table class="table table-bordered" id="FinishedGoodTable" style="text-align: center">--%>
            <%--&lt;%&ndash;<caption>边框表格布局</caption>&ndash;%&gt;--%>
            <%--<thead>--%>
            <%--<tr>--%>
              <%--<th >库存编号</th>--%>
              <%--<th>库存名</th>--%>
              <%--<th>库存数量</th>--%>
              <%--<th>入库时间</th>--%>
              <%--<th>出库时间</th>--%>
              <%--<th>操作</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<c:forEach var="FinishedGood" items="${FinishedGoodList}">--%>
              <%--<tr>--%>
                <%--<td>${FinishedGood.stk_id}</td>--%>
                <%--<td>${FinishedGood.stk_name}</td>--%>
                <%--<td>${FinishedGood.quantity}</td>--%>
                <%--<td>${FinishedGood.in_stk_date}</td>--%>
                <%--<td>${FinishedGood.out_stk_date}</td>--%>
                <%--<td>--%>
                  <%--<span style="color: red" class="glyphicon glyphicon-share"></span>&nbsp; &nbsp;<button type="button" id="deleteBtn" class="btn btn-info btn-sm " onclick="deleteAffirm(${FinishedGood.stk_id})" data-toggle="modal" data-target="#affirmModal">删除</button>--%>
                  <%--&nbsp; &nbsp; <span style="color: #00ae9d" class="glyphicon glyphicon-edit"></span>&nbsp; &nbsp;<button type="button" id="${FinishedGood.stk_id}" onclick="update(${FinishedGood.stk_id})" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">修改</button>--%>
                <%--</td>--%>
              <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--<td colspan="6">--%>
              <%--<!-- 分页栏 -->--%>
              <%--<a href=queryAll.do?pageNo=1">首页</a>&nbsp;&nbsp;--%>
              <%--<c:if test="${FinishedGoodPage.pageNo gt 1}">--%>
                <%--<a href="queryAll.do?pageNo=${FinishedGoodPage.pageNo-1}">上一页</a>&nbsp;&nbsp;--%>
              <%--</c:if>--%>
              <%--<c:if test="${FinishedGoodPage.pageNo eq 1}">--%>
                <%--<a href="queryAll.do?pageNo=1">上一页</a>&nbsp;&nbsp;--%>
              <%--</c:if>--%>
              <%--<c:if test="${FinishedGoodPage.pageNo lt FinishedGoodPage.totalPage}">--%>
                <%--<a href="queryAll.do?pageNo=${FinishedGoodPage.pageNo+1}">下一页</a>&nbsp;&nbsp;--%>
              <%--</c:if>--%>
              <%--<c:if test="${FinishedGoodPage.pageNo eq FinishedGoodPage.totalPage}">--%>
                <%--<a href="queryAll.do?pageNo=${FinishedGoodPage.totalPage}">下一页</a>&nbsp;&nbsp;--%>
              <%--</c:if>--%>
              <%--<a href="queryAll.do?pageNo=${FinishedGoodPage.totalPage}">末页</a>--%>
              <%--<c:if test="${not empty FinishedGoodPage}">--%>
                <%--&nbsp;&nbsp; 共${FinishedGoodPage.totalRow}条记录&nbsp;第${FinishedGoodPage.pageNo}页/共${FinishedGoodPage.totalPage}页--%>
              <%--</c:if>--%>
            <%--</td>--%>
            <%--</tbody>--%>
          <%--</table>--%>

        <%--</div>--%>
        <%--<jsp:include page="../footer.jsp"></jsp:include>--%>
      <%--</div>--%>
    <%--</div>--%>
  <%--</div>--%>

<%--</div>--%>
<%--&lt;%&ndash;//确认模态框&ndash;%&gt;--%>
<%--<div class="modal fade" id="affirmModal" tabindex="-1" role="dialog" aria-labelledby="affirmModalLabel" aria-hidden="true">--%>
  <%--<div class="modal-dialog">--%>
    <%--<div class="modal-content">--%>
      <%--<div class="modal-header">--%>
        <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
        <%--<h4 class="modal-title" id="myModalLabel">删除操作</h4>--%>
      <%--</div>--%>
      <%--<div class="modal-body" > 您真的要删除编号为：<span id="deleteAffirmMsg"></span> 的员工吗？ </div>--%>
      <%--<div class="modal-footer">--%>
        <%--<button type="button" id="sureBtn" class="btn btn-default" data-dismiss="modal">确认</button>--%>
        <%--<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>--%>
      <%--</div>--%>
    <%--</div><!-- /.modal-content -->--%>
  <%--</div><!-- /.modal -->--%>
<%--</div>--%>
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
  <%--<div class="modal-dialog modal-lg">--%>
    <%--<div class="modal-content" id="myModal-content">--%>

    <%--</div>--%>
  <%--</div>--%>
<%--</div>--%>
<%--<div id="updateAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">--%>
  <%--<a href="#" class="close" data-dismiss="alert">&times;</a>--%>
  <%--<strong>更新成功！</strong>结果是成功的。--%>
<%--</div>--%>
<%--<div id="queryAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">--%>
  <%--<a href="#" class="close" data-dismiss="alert">&times;</a>--%>
  <%--<strong>查询成功！</strong>结果是成功的。--%>
<%--</div>--%>
<%--<div id="deleteAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">--%>
  <%--<a href="#" class="close" data-dismiss="alert">&times;</a>--%>
  <%--<strong>删除成功！</strong>结果是成功的。--%>
<%--</div>--%>
<%--<div id="addAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">--%>
  <%--<a href="#" class="close" data-dismiss="alert">&times;</a>--%>
  <%--<strong>添加成功！</strong>结果是成功的。--%>
<%--</div>--%>

<%--<script>--%>
    <%--function update(stk_id) {--%>
        <%--$('#myModal-content').empty();--%>

        <%--$.post("updateFrom.do?",{"stk_id":stk_id},function (html) {--%>

            <%--$('#myModal-content').append(html);--%>
        <%--},"html")--%>

    <%--}--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>































<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <base href="${pageContext.request.contextPath}/">
  <title>贵美商城后台管理系统</title>
  <%@include file="../common.html"%>

  <script>
      $(function () {
          <%--if (${operation} == "1") {--%>
          <%--//1.提示更新--%>
          <%--$('#queryAlert').show();--%>
          <%--alert('1');--%>
          <%--setTimeout("$('#queryAlert').hide()",3000);--%>
          <%--${operation}==null;--%>

          <%--}--%>
          if (${operation == "2"}) {
              //1.提示删除成功
              $('#deleteAlert').show();
              setTimeout("$('#deleteAlert').hide()", 3000);


          }
          if (${operation == "3"}) {
              //1.提示添加成功
              $('#addAlert').show();
              setTimeout("$('#addAlert').hide()", 3000);


          }
          if (${operation == "4"}) {
              //4.提示更新成功
              $('#updateAlert').show();
              setTimeout("$('#updateAlert').hide()", 3000);

          }

        <%--console.log(${FinishedGoodPage.pageNo});--%>
          <%--console.log(${FinishedGoodPage.totalPage})--%>
      });



  </script>
  <script>
      function deleteAffirm(id) {
          $('#deleteAffirmMsg').text(id);
      }
      $('#queryBtn').click(function () {
          $('tbody').load('student/querys?name = '+$('#search').val());
      })
  </script>
  <style>
    #th_goods th{
      text-align: center;
    }
  </style>
</head>
<body>
<div id="wrapper">

  <jsp:include page="../nav.jsp"></jsp:include>
  <div id="page-wrapper" class="gray-bg dashbard-1">
    <jsp:include page="../wrapper.jsp"></jsp:include>
    <div class="row" >
      <div class="col-lg-12" >
        <div class="wrapper wrapper-content" style="height: 78%">
          <%--content 内容放入的位置--%>
          <form method="post"  action="queryAll.do?key=1" STYLE="margin-top: 1%;margin-left: 2%">
            &nbsp; &nbsp; 库存名：<input type="text" style="width: 6%;padding-left: 1%"  name="stk_name" id="stk_name" value="${FinishedGoodCondition.stk_name}">
            &nbsp; &nbsp;

            编号：<input type="number" style="width: 4%;padding-left: 1%" name="lowId" id="lowId" value="">
            &nbsp; &nbsp;-----&nbsp; &nbsp;
            <c:if test="${FinishedGoodCondition.hiId == 0}"> <input type="number" style="width: 4%;padding-left: 1%" name="hiId" id="hiId" value=""></c:if>
            <c:if test="${FinishedGoodCondition.hiId != 0}"> <input type="number" style="width: 4%;padding-left: 1%" name="hiId" id="hiId" value="${FinishedGoodCondition.hiId}"></c:if>
            &nbsp; &nbsp;
            <input type="submit" class="btn btn-info btn-sm" value="查询">
            <a href="finishedGoods/add.jsp?modelId=6">&nbsp; &nbsp;<button type="button" class="btn btn-info btn-sm ">添加</button></a></form>
          <table class="table table-bordered" id="FinishedGoodTable" style="text-align: center">
            <%--<caption>边框表格布局</caption>--%>
            <thead>
            <tr id="th_goods">
              <th >库存编号</th>
              <th>库存名</th>
              <th>库存数量</th>
              <th>入库时间</th>
              <th>出库时间</th>
              <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="FinishedGood" items="${FinishedGoodList}">
              <tr>
                <td>${FinishedGood.stk_id}</td>
                <td>${FinishedGood.stk_name}</td>
                <td>${FinishedGood.quantity}</td>
                <td>${FinishedGood.in_stk_date}</td>
                <td>${FinishedGood.out_stk_date}</td>
                <td>

                  <button type="button"  onclick="update(${FinishedGood.stk_id})" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal"> <span style="color: #00ae9d" class="glyphicon glyphicon-edit"></span> &nbsp;更新</button>
                  &nbsp; &nbsp; <button type="button" id="deleteBtn" kid="${FinishedGood.stk_id}" class="btn btn-danger btn-sm " onclick="deleteAffirm(${FinishedGood.stk_id})" data-toggle="modal" data-target="#affirmModal"> <span style="color: red" class="glyphicon glyphicon-share"></span>&nbsp;删除</button>
                </td>
              </tr>
            </c:forEach>
            <td colspan="6">
              <!-- 分页栏 -->
              <a href=queryAll.do?pageNo=1">首页</a>&nbsp;&nbsp;
              <c:if test="${FinishedGoodPage.pageNo gt 1}">
                <a href="queryAll.do?pageNo=${FinishedGoodPage.pageNo-1}">上一页</a>&nbsp;&nbsp;
              </c:if>
              <c:if test="${FinishedGoodPage.pageNo eq 1}">
                <a href="queryAll.do?pageNo=1">上一页</a>&nbsp;&nbsp;
              </c:if>
              <c:if test="${FinishedGoodPage.pageNo lt FinishedGoodPage.totalPage}">
                <a href="queryAll.do?pageNo=${FinishedGoodPage.pageNo+1}">下一页</a>&nbsp;&nbsp;
              </c:if>-
              <c:if test="${FinishedGoodPage.pageNo eq FinishedGoodPage.totalPage}">
                <a href="queryAll.do?pageNo=${FinishedGoodPage.totalPage}">下一页</a>&nbsp;&nbsp;
              </c:if>
              <a href="queryAll.do?pageNo=${FinishedGoodPage.totalPage}">末页</a>
              <c:if test="${not empty FinishedGoodPage}">
                &nbsp;&nbsp; 共${FinishedGoodPage.totalRow}条记录&nbsp;第${FinishedGoodPage.pageNo}页/共${FinishedGoodPage.totalPage}页
              </c:if>
            </td>
            </tbody>
          </table>

          <%--//确认模态框--%>
          <div class="modal fade" id="affirmModal" tabindex="-1" role="dialog" aria-labelledby="affirmModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel">删除操作</h4>
                </div>
                <div class="modal-body" > 您真的要删除编号为：<span id="deleteAffirmMsg"></span> 的员工吗？ </div>
                <div class="modal-footer">
                  <button type="button" id="sureBtn" class="btn btn-default" data-dismiss="modal">确认</button>
                  <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal -->
          </div>


          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content" id="myModal-content">

              </div>
            </div>
          </div>
          <div id="updateAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>更新成功！</strong>结果是成功的。
          </div>
          <div id="queryAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>查询成功！</strong>结果是成功的。
          </div>
          <div id="deleteAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>删除成功！</strong>结果是成功的。
          </div>

          <div id="addAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">
            <a href="#" class="close" data-dismiss="alert">&times;</a>
            <strong>添加成功！</strong>结果是成功的。

          </div>

            <script>

                function update(stk_id) {
//                                alert(stk_id);

                    $('#myModal-content').empty();

                    $.post("updateFrom.do?",{"stk_id":stk_id},function (html) {

                        $('#myModal-content').append(html);

                    },"html")

                }

            </script>
            <script>


                $(function () {
                    function kk() {
                        window.location.href='queryAll.do';
                    }

                    $('#affirmModal').on('show.bs.modal',function (event) {
                        console.dirxml(event.relatedTarget);
                        var id = $(event.relatedTarget).attr('kid');
                        $('#sureBtn').click(function () {
                            $.get('delete.do?stk_id='+id,function () {
                                kk();
                            });
                        })
                    });
                })
            </script>
    

        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
      </div>

    </div>
  </div>

</div>

</body>
</html>