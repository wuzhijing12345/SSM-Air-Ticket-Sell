<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>client</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>../css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>../css/styleclient2.css">
    <script type="text/javascript" src="<%=basePath%>../js/jquery-1.8.0.min.js"></script>
    <style>
        *{padding:0px;margin:0px;}
        .pop {  display: none;  width: 400px; min-height: 200px;  max-height: 400px;  height:200px;  position: absolute;  top: 0;  left: 0;  bottom: 0;  right: 0;  margin: auto;  padding: 25px;  z-index: 130;  border-radius: 8px;  background-color: #fff;  box-shadow: 0 3px 18px rgba(100, 0, 0, .5);  }
        .pop-top{  height:20px;  width:100%;  border-bottom: 1px #E5E5E5 solid;  }
        .pop-top h2{  float: left; }
        .pop-top span{  float: right;  cursor: pointer;  font-weight: bold; }
        .pop-foot{  height:10px;  line-height:10px;  width:100%;  border-top: 1px #E5E5E5 solid;  text-align: right;  }
        .pop-cancel, .pop-ok {  padding:8px 15px;  margin:15px 5px;  border: none;  border-radius: 5px;  background-color: #337AB7;  color: #fff;  cursor:pointer;  }
        .pop-cancel {  background-color: #FFF;  border:1px #CECECE solid;  color: #000;  }
        .pop-content{  height: 380px;  }
        .pop-content-left{  float: left;  }
        .pop-content-right{  width:310px;  float: left;  padding-top:20px;  padding-left:20px;  font-size: 16px;  line-height:35px;  }
        .bgPop{  display: none;  position: absolute;  z-index: 129;  left: 0;  top: 0;  width: 100%;  height: 100%;  background: rgba(0,0,0,.2);  }
    </style>
</head>
<body>
<div id="page">
    <a href="#" class="nav"><i></i></a>
    <aside id="aside"class="border">
        <h1 id="logo">欢迎 ${requestScope.user.username}</h1>
        <nav id="menu">
            <ul>
                <li><a href="#personal">修改个人信息</a></li>
                <li><a href="#pay">个人账户充值</a></li>
                <li><a href="#flight">查看已购机票</a></li>
                <li>
                    <form action="/zzgnb/toMain" method="post">
                        <form:hidden path="user.userId"/>
                        <button type="submit" class="btn btn-primary btn-md">返回主页</button>
                    </form>
                </li>
            </ul>
        </nav>
    </aside>
</div>
<div id="personal">
    <div class="content box" >
        <div class="row">
            <div class="col-md-4">
                <h2>修改个人信息</h2>
            </div>
        </div>
        <form action="/zzgnb/client" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <form:input path="user.userId" type="hidden"/>
                        <div class="form-group">
                            用 户 名：</td><td><form:input path="user.username" class="form-control" placeholder="姓名"/>
                            <form:errors path="user.username" cssStyle="color: red"/>
                        </div>
                        <div class="form-group">
                            密    码：</td><td><form:input path="user.password" class="form-control" placeholder="密码"/>
                            <form:errors path="user.password" cssStyle="color: red"/>
                        </div>
                        <div class="form-group">
                            联系方式：</td><td><form:input path="user.telnumber" class="form-control" placeholder="联系方式"/>
                            <form:errors path="user.telnumber" cssStyle="color: red"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-md" value="修改个人信息">
                        </div>
                    </div>
                </div>
        </form>
    </div>
</div>
<div id="pay">
    <div class="content box" >
        <div class="row">
            <div class="col-md-4">
                <h3>账户充值</h3>
            </div>
        </div>
        <form action="/zzgnb/recharge" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <form:input path="user.userId" type="hidden"/>
                        <div class="form-group">
                            显示当前金额：
                                <label>${requestScope.user.money} 元</label>
                        </div>
                        <div class="form-group">
                            充值金额：<form:input path="user.money" value="0"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-md" value="充值">
                        </div>
                    </div>
                </div>
        </form>
    </div>
</div>
<div id="flight">
    <div class="content box" >
        <div class="row">
            <div class="col-md-4">
                <h3>查看已经购买的机票</h3>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <td>机票号</td>
                        <td>机型</td>
                        <td>起点</td>
                        <td>终点</td>
                        <td>起飞时间</td>
                        <td>到达时间</td>
                        <td>价格</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="f_list" items="${requestScope.get('f_list')}" varStatus="status">
                        <tr>
                            <td>${f_list.flightId}</td>
                            <td>${f_list.fltype}</td>
                            <td>${f_list.start}</td>
                            <td>${f_list.end}</td>
                            <td>${f_list.starttime}</td>
                            <td>${f_list.endtime}</td>
                            <td>
                                <c:if test="${c_list.get(status.index).seattype==84}">${f_list.topprice}</c:if><%-- T --%>
                                <c:if test="${c_list.get(status.index).seattype==74}">${f_list.lowprice}</c:if><%-- J --%>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="bgPop"></div>
<!--弹出框-->
<div class="pop">
    <div class="pop-top">
        <h2></h2>
        <span class="pop-close" onclick="b()">Ｘ</span>
    </div>
    <div class="pop-content">
        <div class="pop-content-left">
            <img src="" alt="" class="teathumb">
        </div>
        <div class="pop-content-right">
            <c:if test="${requestScope.flag1==0}">去程票购票成功！<br></c:if>
            <c:if test="${requestScope.flag1==2}">购买去程票余额不足<br></c:if>
            <c:if test="${requestScope.flag1==3||requestScope.flag1==4}">去程票已卖完<br></c:if>
            <c:if test="${requestScope.error==1}">不可重复购买去程票<br></c:if>
            <c:if test="${requestScope.tag=='2'}">
                <c:if test="${requestScope.flag2==0}">回程票购票成功！<br></c:if>
                <c:if test="${requestScope.flag2==2}">购买回程票余额不足<br></c:if>
                <c:if test="${requestScope.flag2==3||requestScope.flag2==4}">回程票已卖完<br></c:if>
                <c:if test="${requestScope.error1==1}">不可重复购买回程票<br></c:if>
            </c:if>
            <div class="pop-foot">
                <input type="button" value="关闭" class="pop-cancel pop-close" onclick="b()">
                <input type="submit" value="购票" class="pop-ok" onclick="b()">
            </div>
        </div>
    </div>
</div>
<c:if test="${requestScope.flag1!=null}">
    <script>
        $('.bgPop,.pop').show();
    </script>
</c:if>
<script>
    function b() {
        $('.bgPop,.pop').hide();
    }
</script>
</body>
</html>
