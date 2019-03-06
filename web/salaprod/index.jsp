<%--
  Created by IntelliJ IDEA.
  User: xxxx
  Date: 2018/8/31
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>
  <title>在售商品</title>
  <base href="${pageContext.request.contextPath}/">
  <jsp:include page="../common.html"></jsp:include>
  <script>

      $(function () {
          if (${numberr =="2"}) {
              $('#deleteAlert').show();
              setTimeout("$('#deleteAlert').hide()", 3000);
          }
          if (${numberr == "3"}) {
              $('#addAlert').show();
              setTimeout("$('#addAlert').hide()", 3000);

          }
          if (${numberr == "4"}) {
              $('#updateAlert').show();
              setTimeout("$('#updateAlert').hide()", 3000);
          }
      });
  </script>
  <style>
    #salaprodtable th{
      text-align: center;
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
        <div class="wrapper wrapper-content" style="height: 78%">
          <div style="text-align: center">
            <form method="post" action="Salaprod_queryAll.do?key=1">
              &nbsp; &nbsp; 在售商品名：<input type="text" style="width: 6%;padding-left: 1%"  name="prod_name" id="prod_name" value="${SalaprodCondition.prod_name}">
              &nbsp; &nbsp;
              在售商品号：<input type="number" style="width: 4%;padding-left: 1%" name="lowId" id="lowId" value="">
              &nbsp; &nbsp;-&nbsp; &nbsp;
              <c:if test="${SalaprodCondition.hiId == 0}"> <input type="number" style="width: 4%;padding-left: 1%" name="hiId" id="hiId" value=""></c:if>
              <c:if test="${SalaprodCondition.hiId != 0}"> <input type="number" style="width: 4%;padding-left: 1%" name="hiId" id="hiId" value="${SalaprodCondition.hiId}"></c:if>
              &nbsp; &nbsp;
              <input type="submit" class="btn btn-info btn-sm" value="查询">
              <a href="salaprod/addFrom.jsp">&nbsp; &nbsp;<button type="button" class="btn btn-info btn-sm ">添加</button></a></form>
          </div>
          <table class="table table-bordered" id="SalaprodTable" style="text-align: center">
            <%--<caption>边框表格布局</caption>--%>
            <thead>
            <tr>
              <th>在售商品号</th>
              <th>商品编号</th>
              <th>商品名称</th>
              <th>卖家</th>
              <th>库存</th>
              <th>一口价</th>
              <th>运费</th>
              <th>开始售卖</th>
              <th>结束售卖</th>
              <th>外观</th>
              <th>所在地</th>
              <th>图片</th>
              <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="Salaprod" items="${SalaprodList}">
              <tr>
                <td>${Salaprod.id}</td>
                <td>${Salaprod.prod_no}</td>
                <td>${Salaprod.prod_name}</td>
                <td>${Salaprod.saler_id}</td>
                <td>${Salaprod.stk_id}</td>
                <td>${Salaprod.real_price}</td>
                <td>${Salaprod.carriage}</td>
                <td>${Salaprod.star_time}</td>
                <td>${Salaprod.end_time}</td>
                <td>${Salaprod.prod_skin}</td>
                <td>${Salaprod.location}</td>
                <td><img src="images/${Salaprod.image}"></td>
                <td>
                  <button type="button" onclick="update(${Salaprod.id})" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal"><span style="color: #00ae9d" class="glyphicon glyphicon-edit"></span> &nbsp;更新</button>
                  &nbsp; &nbsp;
                  <a href="Salaprod_delete.do?id=${Salaprod.id}"><button type="button"  class="btn btn-danger btn-sm " > <span style="color: red" class="glyphicon glyphicon-share"></span>&nbsp;删除</button></a>
                </td>
              </tr>
            </c:forEach>
            <td colspan="13">
              <!-- 分页栏 -->
              <a href="Salaprod_queryAll.do?pageNo=1">首页</a>&nbsp;&nbsp;
              <c:if test="${SalaprodPage.pageNo gt 1}">
                <a href="Salaprod_queryAll.do?pageNo=${SalaprodPage.pageNo-1}">上一页</a>&nbsp;&nbsp;
              </c:if>
              <c:if test="${SalaprodPage.pageNo eq 1}">
                <a href="Salaprod_queryAll.do?pageNo=1">上一页</a>&nbsp;&nbsp;
              </c:if>
              <c:if test="${SalaprodPage.pageNo lt SalaprodPage.totalPage}">
                <a href="Salaprod_queryAll.do?pageNo=${SalaprodPage.pageNo+1}">下一页</a>&nbsp;&nbsp;
              </c:if>
              <c:if test="${SalaprodPage.pageNo eq SalaprodPage.totalPage}">
                <a href="Salaprod_queryAll.do?pageNo=${SalaprodPage.totalPage}">下一页</a>&nbsp;&nbsp;
              </c:if>
              <a href="Salaprod_queryAll.do?pageNo=${SalaprodPage.totalPage}">最后一页</a>
              <c:if test="${not empty SalaprodPage}">
                &nbsp;&nbsp; 共${SalaprodPage.totalRow}条记录&nbsp;第${SalaprodPage.pageNo}页/共${SalaprodPage.totalPage}页
              </c:if>
            </td>
            </tbody>
          </table>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
      </div>
    </div>
  </div>

</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" id="myModal-content">
    </div>
  </div>
</div>
<div id="deleteAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px; display: none">
  <a href="#" class="close" data-dismiss="alert">&times;</a>
  <strong>删除成功！</strong>结果是成功的。
</div>
<div id="addAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">
  <a href="#" class="close" data-dismiss="alert">&times;</a>
  <strong>添加成功！</strong>结果是成功的。
</div>
<div id="updateAlert" class="alert alert-success col-md-3" style="margin-right: 5px;position: fixed; right: 5px; bottom: 5px;display: none">
  <a href="#" class="close" data-dismiss="alert">&times;</a>
  <strong>更新成功！</strong>结果是成功的。
</div>


<script>
    function update(id) {
        $('#myModal-content').empty();
        $.post("Salaprod_updateFrom.do?",{"id":id},function (html) {
            $('#myModal-content').append(html);
        },"html")
    }
</script>
</body>
</html>
