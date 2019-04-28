<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019-3-21
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>航班管理员界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
<div class="header">
    <ul>
        <li><a href="/zzgnb/toRecord">消费记录</a></li>
        <li><a href="/zzgnb/toManFlight">航班管理</a></li>
    </ul>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>日志编号</th>
                <th>修改类型</th>
                <th>航班编号</th>
                <th>起点</th>
                <th>终点</th>
                <th>起飞日期</th>
                <th>预计起飞时间</th>
                <th>预计到达时间</th>
                <th>候机位置</th>
                <th>机型</th>
                <th>经济舱票价</th>
                <th>头等舱票价</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="log" items="${requestScope.get('list5')}" varStatus="status">
                <tr>
                    <td>${log.logId}</td>
                    <td>${log.logtype}</td>
                    <td>${log.logflightId}</td>
                    <td>${log.logstart}</td>
                    <td>${log.logend}</td>
                    <td>${log.logdate}</td>
                    <td>${log.logstarttime}</td>
                    <td>${log.logendtime}</td>
                    <td>${log.logwaitsite}</td>
                    <td>${log.logfltype}</td>
                    <td>${log.loglowprice}</td>
                    <td>${log.logtopprice}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div>
    <a href="/zzgnb/toRecord">前往查看消费记录</a>
</div>
<div>
    <a href="/zzgnb/toManFlight">前往航班管理界面</a>
</div>

</body>
</html>