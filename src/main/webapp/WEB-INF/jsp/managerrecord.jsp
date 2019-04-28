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
    <title>消费记录查看界面</title>
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
        <li><a href="/zzgnb/toManFlight">航班管理</a></li>
        <li><a href="/zzgnb/toLog">日志文件</a></li>
    </ul>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>交易记录编号</th>
                <th>交易类型</th>
                <th>账户号</th>
                <th>航班号</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="record" items="${requestScope.get('list4')}" varStatus="status">
                <tr>
                    <td>${record.recordId}</td>
                    <td>${record.retype}</td>
                    <td>${record.reuserId}</td>
                    <td>${record.reflightId}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
