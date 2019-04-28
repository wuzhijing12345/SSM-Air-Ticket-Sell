<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>航空售票系统主页</title>
    <base herf="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link type="text/css" rel="stylesheet" href="../css/stylema.css">
</head>
<body>
<section class="banner" id="top">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="left-side">
                    <div class="logo">
                        <img src="<%=basePath%>../img/logo1.png" alt="Flight Template">
                    </div>
                    <div class="tabs-content">
                        <h4>航空售票管理系统</h4>
                        <ul class="social-links">
                            <c:if test="${requestScope.user.userId==0}">
                                <li><a href="/zzgnb/toRegister">免费注册账号</a></li>
                                <li><a href="/zzgnb/toLogin">登录账号</a></li>
                            </c:if>
                            <c:if test="${requestScope.user.userId!=0}">
                                <li> <a href="#">欢迎${requestScope.user.username}登录!</a> </li>
                                <li> <a href="/zzgnb/toClient/${user.userId}">前往个人主页</a> </li>
                                <li> <a href="/zzgnb/toMain">退出登录</a> </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-5 col-md-offset-1">
                <section id="first-tab-group" class="tabgroup">
                    <div id="tab1">
                        <div class="submit-form">
                            <h4>查询你需要的<em>航班</em>：</h4>
                            <form action="/zzgnb/toSearch" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <fieldset>
                                            <label>起点：</label>
                                            <form:select path="flight.start" cssStyle="size: 50px">
                                            <c:forEach var="start" items="${requestScope.get('list1')}" varStatus="status">
                                                <form:option value="${start}">${start}</form:option>
                                            </c:forEach>
                                            </form:select>
                                        </fieldset>
                                    </div>
                                    <div class="col-md-6">
                                        <fieldset>
                                            <label>终点：</label>
                                            <form:select path="flight.end" cssStyle="size: 50px">
                                            <c:forEach var="end" items="${requestScope.get('list1')}" varStatus="status">
                                                <form:option value="${end}">${end}</form:option>
                                            </c:forEach>
                                            </form:select>
                                        </fieldset>
                                    </div>
                                    <div class="col-md-6">
                                        <fieldset>
                                            <label>出发日期：</label>
                                            <form:select path="flight.date" cssStyle="size: 50px">
                                            <c:forEach var="start" items="${requestScope.get('list2')}" varStatus="status">
                                                <form:option value="${start}">${start}</form:option>
                                            </c:forEach>
                                            </form:select>
                                        </fieldset>
                                    </div>
                                    <div class="col-md-6">
                                        <fieldset>
                                            <div id="div1">
                                                <label>返回日期：</label>
                                                <select id="date2" name="date2" style="size: 50px">     <%-- 此处必须使用没有经过Spring渲染的标签！ --%>
                                                    <c:forEach var="date" items="${requestScope.get('list2')}" varStatus="status">
                                                        <option value="${date}">${date}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="radio-select">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6 col-xs-6">
                                                    <label>单程：</label>
                                                    <input type="radio" name="tag" value="1" onclick="one()"/>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-6">
                                                    <label>往返：</label>
                                                    <input type="radio" name="tag" value="2" checked="checked" onclick="two()"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <form:hidden path="user.userId"/>
                                    <div class="col-md-6">
                                        <fieldset>
                                            <button type="submit" id="form-submit" class="btn">查询相应的航班</button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</section>
<script>
    function one() {
        document.getElementById("div1").style.visibility="hidden";
    }
    function two() {
        document.getElementById("div1").style.visibility="visible";
    }
</script>
</body>
</html>