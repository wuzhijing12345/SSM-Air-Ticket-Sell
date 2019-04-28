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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
        <li><a href="/zzgnb/toLog">日志文件</a></li>
        <li><a href="/zzgnb/toTest">数据统计</a></li>
        <li><a href="/zzgnb/toMain">前往主页</a></li>
    </ul>
</div>
<div class="row clearfix">
    <div class="col-md-12 column">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
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
            <c:forEach var="flight" items="${requestScope.list3.list}" varStatus="status">
                <tr>
                    <td>${flight.flightId}</td>
                    <td>${flight.start}</td>
                    <td>${flight.end}</td>
                    <td>${flight.date}</td>
                    <td>${flight.starttime}</td>
                    <td>${flight.endtime}</td>
                    <td>${flight.waitsite}</td>
                    <td>${flight.fltype}</td>
                    <td>${flight.lowprice}</td>
                    <td>${flight.topprice}</td>
                    <td>
                        <a href="/zzgnb/toUpdateFlight?id=${flight.flightId}">更改</a> |
                        <a href="/zzgnb/del/${flight.flightId}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="row">
            <div class="col-md-4 column">
                <a href="/zzgnb/toAddFlight" class="btn btn-primary">新增航班</a>
            </div>
        </div>
        <table class="col-md-12">
            <tr>
                <td class="td2">
                   <span>第${requestScope.list3.currPage}/ ${requestScope.list3.totalPage}页</span> 
                   <span>总记录数：${requestScope.list3.totalCount } 每页显示:${requestScope.list3.pageSize}</span> 
                   <span>
                        <c:if test="${requestScope.list3.currPage != 0}">
                       <a href="/zzgnb/toManFlight?currentPage=1">[首页]</a> 
                        <a href="/zzgnb/toManFlight?currentPage=${requestScope.list3.currPage-1}">[上一页]</a> 
                    </c:if>
                    </span>
                    <span>
                    <c:if test="${requestScope.pagemsg.currPage != requestScope.list3.totalPage}">
                       <a href="/zzgnb/toManFlight?currentPage=${requestScope.list3.currPage+1}">[下一页]</a>  
                       <a href="/zzgnb/toManFlight?currentPage=${requestScope.list3.totalPage}">[尾页]</a>  
                    </c:if>
                    </span>
                </td>
                <td>
                    <span>
                        <form action="/zzgnb/toManFlight?currentPage=${currentPage}">
                            跳到
                            <input name="currentPage" type="text"/>
                            页
                            <input type="submit" value="跳转" class="btn btn-primary"/>
                        </form>
                    </span>
                </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>
