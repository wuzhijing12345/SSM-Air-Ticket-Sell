<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019-3-31
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <form action="/zzgnb/updateFlight" method="post">
        航班号：<form:input path="flight.flightId"/><br>
        起点：<form:input path="flight.start"/><br>
        终点：<form:input path="flight.end"/><br>
        日期：<form:input path="flight.date"/><br>
        预计起飞时间：<form:input path="flight.starttime"/><br>
        预计到达时间：<form:input path="flight.endtime"/><br>
        候机点：<form:input path="flight.waitsite"/><br>
        飞机类型：<form:input path="flight.fltype"/><br>
        经济舱票价：<form:input path="flight.lowprice"/><br>
        头等舱票价：<form:input path="flight.topprice"/><br>
        <input type="submit" id="submit" value="submit"><br>
    </form>
</div>
</body>
</html>
