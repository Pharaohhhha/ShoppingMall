<%--
  Created by IntelliJ IDEA.
  User: a'su's
  Date: 2018/9/5
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <!-- 引入 echarts.js -->
    <script src="./js/echarts.js" charset="utf-8"></script>
</head>
<body>
<div id="main" style="width: 1200px;height:400px;"></div>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('main'));
    var xData = ['8:00-10:00','10:00-12:00','12:00-14:00','14:00-16:00','16:00-18:00'];
    var yData = [80,87,51,81,23,45,33];
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
            name: '办理数',
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

    myChart.setOption(option);
</script>
</body>
</html>
