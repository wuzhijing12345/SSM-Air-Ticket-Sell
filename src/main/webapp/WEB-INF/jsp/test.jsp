<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <style>
        .header ul{
            list-style-type: none;
            margin:0px;
            padding:0px;
        }
        .header li {
            float:left;
            margin: 10px;
        }
    </style>
</head>
<body>
<div id="container" style="width:1000px;height:400px" align="center"></div>
<div class="header">
    <ul>
        <li><a href="/zzgnb/toManFlight">航空管理</a></li>
        <li><a href="/zzgnb/toRecord">record check</a></li>
        <li><a href="/zzgnb/toLog">log check</a></li>
    </ul>
</div>
<script>
    var chart = Highcharts.chart('container',{
        chart: {
            type: 'column'
        },
        title: {
            text: 'Statistics of flights taking off and landing respectively in different cities'
        },
        subtitle: {
            text: 'resource: Fake numbers'
        },
        xAxis: {
            categories: [
                'Beijing','Shanghai','Hangzhou','Guangzhou','Shenzhen','Chongqing','Wuhan','Tianjin','Zhengzhou','Xi an','Chengdu'
            ],
            crosshair: true
        },
        yAxis: {
            title: {
                text: ''
            },
            labels: {
                //去掉左侧的显示
                formatter: function(){
                    return this.value;
                },
                step:1
            }
        },
        tooltip: {
            // head + 每个 point + footer 拼接成完整的 table
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            footerFormat: '</table>',
        },
        plotOptions: {
            column: {
                borderWidth: 0,
                //在图形上面显示
                dataLabels: {
                    enabled: true,
                    color:'black'
                }
            },
            series : {
                minPointLength :2,//防止值太小图形显示不出来
                //negativeColor:'#87CEFF',  //设置负数条形的颜色
                //color: '#F08080'//设置显示条颜色
                colorByPoint:true//设置不同颜色
            }
        },
        series: [{
            name: 'Takeoff',
            data: ${l1}
        }, {
            name: 'Land',
            data: ${l2}
        }]
    });
</script>
</body>
</html>

