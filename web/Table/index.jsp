<%--
  Created by IntelliJ IDEA.
  User: xxxx
  Date: 2018/8/31
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>贵美商城后台管理系统</title>
    <%@include file="../common.html"%>
    <meta charset="utf-8">
    <script src="js/echarts.js" charset="utf-8"></script>
      <script>
     $(function () {

         <c:if test="${shape2 == 'bar'}">
         $('#pic').val("bar");
         </c:if>
         <c:if test="${shape2 == 'line'}">
         $('#pic').val("line");
         </c:if>

         <c:if test="${season == '0'}">
         $('#season').val("0");
         </c:if>
         <c:if test="${season == '上半年'}">
         $('#season').val("上半年");
         </c:if>
         <c:if test="${season == '下半年'}">
         $('#season').val("下半年");
         </c:if>


         <c:if test="${year2 == '2018'}">
         $('#year').val("2018");
         </c:if>
         <c:if test="${year2 == '2017'}">
         $('#year').val("2017");
         </c:if>
         <c:if test="${year2 == '2016'}">
         $('#year').val("2016");
         </c:if>

      });
      </script>
  </head>
  <body>
  <div id="wrapper">

      <jsp:include page="../nav.jsp"></jsp:include>
      <div id="page-wrapper" class="gray-bg dashbard-1">
          <jsp:include page="../wrapper.jsp"></jsp:include>
          <div class="row">
              <div class="col-lg-12">
                  <div class="wrapper wrapper-content" style="height: 78%">
                      <%--content 内容放入的位置--%>
                      <div id="center-content-area" style="height: 70%;">


  <form action="QueryServlet.table" class="form-inline" method="post" style="margin-top: 2%">

        <div  style="float: left;height: 12%;width: 8%;margin-left: 24%">
         <span><h3 style="float: left">年份:&nbsp;&nbsp;</h3>
          <select name="year" id="year" style="float: left">
              <option value="2018">2018</option>
              <option value="2017">2017</option>
              <option value="2016">2016</option>
          </select></span>
          </div>
      <div style="float: left;height: 12%;width: 8%;margin-left: 8%">
       <span><h3 style="float: left">季度:&nbsp;&nbsp;</h3>
        <select name="season" id="season" style="float: left" >
          <option value="0">--全年--</option>
          <option value="上半年">上半年</option>
          <option value="下半年">下半年</option>
        </select></span>
  </div>
      <div style="float: left;height: 12%;width: 8%;margin-left: 8%">
        <span><h3 style="float: left">图形:&nbsp;&nbsp;</h3>
          <select class="type" name="pic" id="pic" style="float: left" >
              <option value="bar">柱状图</option>
              <option value="line">曲线图</option>
          </select>
      </span></div>
    <br>
      <div  id="clear"  style="margin: 0;  padding: 0; width: 0;height: 0; clear: both;">  </div>
          <div  style="margin-left: 40%;height: 5%">
            <button type="submit" >查询</button>
            <button type="reset"  style="margin-left: 50px;">重置</button>
          </div>
      <br>
      <br>
  </form>
<c:if test="${param.shape eq 'bar'}">
  <div name="bar" class="" style="margin-left: 10%;">
      <div id="bar" style="width: 1200px;height:400px;"></div>
      <script type="text/javascript">


          // 基于准备好的dom，初始化echarts实例
          var myChart = echarts.init(document.getElementById('bar'));
          var xData = [<c:forEach var="sale" items="${SaleMonthList}">"${sale.month}月",</c:forEach>];
          var yData = [<c:forEach var="sale" items="${SaleMonthList}">${sale.monthSum},</c:forEach>];
          option = {
              backgroundColor: "#111c4e",
              color: ['#3398DB'],
              tooltip: {
                  trigger: 'axis',
                  axisPointer: {
                      type: 'line',
                      lineStyle: {
                          opacity: 0
                      }
                  },
                  formatter: function(prams) {
                      return "办理数：" + prams[0].data
                  }
              },
              grid: {
                  left: '0%',
                  right: '0%',
                  bottom: '5%',
                  top: '7%',
                  height: '85%',
                  containLabel: true,
                  z: 22
              },
              xAxis: [{
                  type: 'category',
                  gridIndex: 0,
                  data: xData,
                  axisTick: {
                      alignWithLabel: true
                  },
                  axisLine: {
                      lineStyle: {
                          color: '#0c3b71'
                      }
                  },
                  axisLabel: {
                      show: true,
                      color: 'rgb(170,170,170)',
                      fontSize: 16
                  }
              }],
              yAxis: [{
                  type: 'value',
                  gridIndex: 0,
                  splitLine: {
                      show: false
                  },
                  axisTick: {
                      show: false
                  },
                  axisLine: {
                      lineStyle: {
                          color: '#0c3b71'
                      }
                  },
                  axisLabel: {
                      color: 'rgb(170,170,170)',
                      formatter: '{value}'
                  }
              },
                  {
                      type: 'value',
                      gridIndex: 0,
                      splitNumber: 12,
                      splitLine: {
                          show: false
                      },
                      axisLine: {
                          show: false
                      },
                      axisTick: {
                          show: false
                      },
                      axisLabel: {
                          show: false
                      },
                      splitArea: {
                          show: true,
                          areaStyle: {
                              color: ['rgba(250,250,250,0.0)', 'rgba(250,250,250,0.05)']
                          }
                      }
                  }
              ],
              series: [{
                  name: '销售金额',
                  type: 'bar',
                  barWidth: '30%',
                  xAxisIndex: 0,
                  yAxisIndex: 0,
                  label: {
                      normal: {
                          show: true,
                          position: "top",
                          textStyle: {
                              color: "#ffc72b",
                              fontSize: 20
                          }
                      }
                  },
                  itemStyle: {
                      normal: {
                          color: new echarts.graphic.LinearGradient(
                              0, 0, 0, 1, [{
                                  offset: 0,
                                  color: '#00feff'
                              },
                                  {
                                      offset: 0.5,
                                      color: '#027eff'
                                  },
                                  {
                                      offset: 1,
                                      color: '#0286ff'
                                  }
                              ]
                          )
                      }
                  },
                  data: yData,
                  zlevel: 11

              },
                  {
                      name: '背景',
                      type: 'bar',
                      barWidth: '50%',
                      xAxisIndex: 0,
                      yAxisIndex: 1,
                      barGap: '-135%',
                      data: [100, 100, 100, 100, 100, 100, 100],
                      itemStyle: {
                          normal: {
                              color: 'rgba(255,255,255,0.1)'
                          }
                      },
                      zlevel: 9
                  },

              ]
          };

          // 使用刚指定的配置项和数据显示图表。
          myChart.setOption(option);
      </script>
  </div>
</c:if>
<c:if test="${param.shape eq 'line'}">
  <div name="line" class="" style="margin-left: 10%;">
      <div id="line" style="width: 1200px;height:400px;"></div>
      <script type="text/javascript">
          var myChart = echarts.init(document.getElementById('line'));
          var data = [<c:forEach var="sale" items="${SaleMonthList}">${sale.monthSum},</c:forEach>];
          var xdata = [<c:forEach var="sale" items="${SaleMonthList}">"${sale.month}月",</c:forEach>];
          var option = {
              backgroundColor:'#8EE5EE',
              grid: {
                  left: 30,
                  right: 50,
                  top: 50,
                  bottom: 30,
                  containLabel: true
              },
              xAxis: {
                  type: 'category',
                  // boundaryGap: false,
                  data: xdata,
                  triggerEvent: true,
                  splitLine: {
                      show: false
                  },
                  axisLine: {
                      show: true,
                      lineStyle: {
                          width: 2,
                          color: 'rgba(255,255,255,.6)'
                      }
                  },
                  axisTick: {
                      show: false
                  },
                  axisLabel: {
                      color: '#fff',
                      fontSize: 16,
                      fontWeight: 'bold',
                      textShadowColor: '#000',
                      textShadowOffsetY: 2
                  }
              },
              yAxis: {
                  name: '单位（元）',
                  nameTextStyle: {
                      color: '#fff',
                      fontSize: 16,
                      textShadowColor: '#000',
                      textShadowOffsetY: 2
                  },
                  type: 'value',
                  splitLine: {
                      show: true,
                      lineStyle: {
                          color: 'rgba(255,255,255,.2)'
                      }
                  },
                  axisLine: {
                      show: true,
                      lineStyle: {
                          width: 2,
                          color: 'rgba(255,255,255,.6)'
                      }
                  },
                  axisTick: {
                      show: true
                  },
                  axisLabel: {
                      color: '#fff',
                      fontSize: 16,
                      textShadowColor: '#000',
                      textShadowOffsetY: 2
                  }
              },
              series: [{
                  data: data,
                  type: 'line',
                  symbol: 'circle',
                  symbolSize: 12,
                  color: '#FEC201',
                  lineStyle: {
                      color: "#03E0F2"
                  },
                  label: {
                      show: true,
                      position: 'top',
                      textStyle: {
                          color: '#FEC201',
                          fontSize: 18,
                          fontWeight: 'bold'
                      }
                  },
                  areaStyle: {
                      color: 'rgba(1,98,133,0.6)'
                  }
              }, {
                  type: 'bar',
                  animation: false,
                  barWidth: 3,
                  hoverAnimation: false,
                  data: data,
                  tooltip: {
                      show: false
                  },
                  itemStyle: {
                      normal: {
                          color: {
                              type: 'linear',
                              x: 0,
                              y: 0,
                              x2: 0,
                              y2: 1,
                              colorStops: [{
                                  offset: 0,
                                  color: '#91EAF2' // 0% 处的颜色
                              }, {
                                  offset: 1,
                                  color: '#074863' // 100% 处的颜色
                              }],
                              globalCoord: false // 缺省为 false
                          },
                          label: {
                              show: false
                          }
                      }
                  }
              }]
          }

          myChart.setOption(option);
      </script>
  </div>
</c:if>
                      </div>

                  </div>
                  <jsp:include page="../footer.jsp"></jsp:include>
              </div>
          </div>
      </div>

  </div>

  </body>
</html>
