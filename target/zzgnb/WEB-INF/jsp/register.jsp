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
    <title>register</title>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <base herf="<%=basePath%>">
    <link type="text/css" rel="stylesheet" href="../css/styleregister.css">
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">注册</h3>
            <div class="col-md-9">
                <form action="/zzgnb/register" method="post">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        姓名：<form:input path="user.username" placeholder="用户名"/><br>
                        <form:errors path="user.username" cssStyle="color: red"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-globe fa-lg"></i>
                        联系方式：<form:input path="user.telnumber" placeholder="联系方式"/><br>
                        <form:errors path="user.telnumber" cssStyle="color: red"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        密码：<form:input path="user.password" type="password" placeholder="密码"/><br>
                        <form:errors path="user.password" cssStyle="color: red"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        确认密码：<input  name="againpwd" type="password" placeholder="确认密码"/><br>
                        <label style="color: red">${user.error}</label>
                    </div>
                    <label style="color: red">${user.error1}</label>
                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-success pull-right" name="submit">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
