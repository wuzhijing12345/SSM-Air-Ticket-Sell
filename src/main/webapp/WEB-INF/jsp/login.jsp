<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019-3-21
  Time: 10:10
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
    <meta charset="UTF-8">
    <title>login</title>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <base herf="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="../css/stylelogin.css">
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">登录</h3>
            <div class="col-md-9">
                <form:form modelAttribute="user" action="/zzgnb/login" method="post" name="login">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        用户名：<form:input path="username" class="form-control required" id="username" placeholder="用户名"/>
                        <label style="color: red">${user.error1}</label><br><br>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        密码：<form:input path="password" type="password" class="form-control required"  id="password" placeholder="密码"/>
                        <label style="color: red">${user.error}</label><br><br>
                    </div>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
