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
    <title>search</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=basePath%>../js/jquery-1.8.0.min.js"></script>
    <style>
        *{padding:0px;margin:0px;}
        .pop {  display: none;  width: 400px; min-height: 200px;  max-height: 900px;  height:700px;  position: absolute;  top: 0;  left: 0;  bottom: 0;  right: 0;  margin: auto;  padding: 25px;  z-index: 130;  border-radius: 8px;  background-color: #fff;  box-shadow: 0 3px 18px rgba(100, 0, 0, .5);  }
        .pop1 {  display: none;  width: 400px; min-height: 100px;  max-height: 200px;  height:100px;  position: absolute;  top: 0;  left: 0;  bottom: 0;  right: 0;  margin: auto;  padding: 25px;  z-index: 130;  border-radius: 8px;  background-color: #fff;  box-shadow: 0 3px 18px rgba(100, 0, 0, .5);  }
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
    <link type="text/css" rel="stylesheet" href="<%=basePath%>../css/csssearch.css">
</head>
<body>
<div>
    <form action="/zzgnb/toSearch" method="post">
        <section class="banner" id="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-14">
                        <section id="first-tab-group" class="tabgroup">
                            <div id="tab1">
                                <div class="submit-form">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <fieldset>
                                                起点：
                                                <form:select path="flight.start" cssStyle="size: 50px">
                                                    <c:forEach var="start" items="${requestScope.get('list1')}" varStatus="status">
                                                        <form:option value="${start}">${start}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-2">
                                            <fieldset>
                                                终点：
                                                <form:select path="flight.end" cssStyle="size: 50px">
                                                    <c:forEach var="end" items="${requestScope.get('list1')}" varStatus="status">
                                                        <form:option value="${end}">${end}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-2">
                                            <fieldset>
                                                出发日期：
                                                <form:select path="flight.date" cssStyle="size: 50px">
                                                    <c:forEach var="start" items="${requestScope.get('list2')}" varStatus="status">
                                                        <form:option value="${start}">${start}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-2">
                                            <fieldset>
                                                <div id="div1">
                                                    返回日期：
                                                    <select id="date2" name="date2" style="size: 50px">     <%-- 此处必须使用没有经过Spring渲染的标签！ --%>
                                                        <c:forEach var="date" items="${requestScope.get('list2')}" varStatus="status">
                                                            <option value="${date}">${date}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="radio-select">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                                        <label>单程：</label>
                                                        <input type="radio" name="tag" value="1" onclick="one()" ${(requestScope.tag=='1')?"checked":""}/>
                                                    </div>
                                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                                        <label>往返：</label>
                                                        <input type="radio" name="tag" value="2" onclick="two()" ${(requestScope.tag=='2')?"checked":""}/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <form:hidden path="user.userId"/>
                                        <div class="col-md-2">
                                            <fieldset>
                                                <button type="submit" id="form-submit" class="btn">查询相应的航班</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </section>
        <form>
            <button type="submit" id="b1">确认选择</button>
            <input type="button" value="确认购票" onclick="a()" id="b2">
            <input type="hidden" name="tag" value="${requestScope.tag}"/> <%-- hidden 标签不能传递int --%>
            <div class="row clearfix">
                <div class="col-md-8 column col-md-offset-2">
                    <table class="table table-hover table-striped" align="center">
                        <thead>
                        <tr>
                            <th>去程</th>
                        </tr>
                        </thead>
                        <c:forEach var="flight" items="${requestScope.get('f_list')}" varStatus="status">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td rowspan="2" width="200"><h4>${flight.flightId}</h4></td>
                                            <td height="30" width="200"><h4>${flight.start}</h4></td>
                                            <td height="30" width="200"><h4>${flight.end}</h4></td>
                                            <td height="30" width="200"><h4>￥ ${flight.lowprice}</h4></td>
                                            <td rowspan="2" width="200">
                                                点击选择<input type="radio" name="fid1" value="${flight.flightId}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="30"><h4>${flight.starttime}</h4></td>
                                            <td height="30"><h4>${flight.endtime}</h4></td>
                                            <td height="30"><h4>￥ ${flight.topprice}</h4></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <c:if test="${requestScope.tag==2}">
                <div class="row clearfix">
                    <div class="col-md-8 column col-md-offset-2">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>回程</th>
                            </tr>
                            </thead>
                            <c:forEach var="flight" items="${requestScope.get('f_list2')}" varStatus="status">
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td rowspan="2" width="200"><h4>${flight.flightId}</h4></td>
                                                <td height="30" width="200"><h4>${flight.start}</h4></td>
                                                <td height="30" width="200"><h4>${flight.end}</h4></td>
                                                <td height="30" width="200"><h4>￥ ${flight.lowprice}</h4></td>
                                                <td rowspan="2" width="200">
                                                    点击选择<input type="radio" name="fid2" value="${flight.flightId}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="30"><h4>${flight.starttime}</h4></td>
                                                <td height="30"><h4>${flight.endtime}</h4></td>
                                                <td height="30"><h4>￥ ${flight.topprice}</h4></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </c:if>
        </form>
    </form>
</div>
<!--遮罩层-->
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
            <form action="/zzgnb/toComform" method="post">
                <h4>确认机票信息并选择舱位</h4><br>
                去程：
                <table align="center">
                    <tr>
                        <td>航班号：</td><td>${requestScope.flight1.flightId}<br></td>
                    </tr>
                    <tr>
                        <td>出发地：</td><td>${requestScope.flight1.start}<br></td>
                    </tr>
                    <tr>
                        <td>目的地：</td><td>${requestScope.flight1.end}<br></td></tr>
                    <tr>
                        <td>起飞时间：</td><td>${requestScope.flight1.starttime}<br></td></tr>
                    <tr>
                        <td>到达时间：</td><td>${requestScope.flight1.endtime}<br></td></tr>
                    <tr>
                        <td>飞机型号：</td><td>${requestScope.flight1.fltype}<br></td></tr>
                    <tr>
                        <td>票价：</td><td>${requestScope.flight1.topprice} 元 / ${requestScope.flight1.lowprice} 元<br></td></tr>
                    <tr>
                        <td>选择舱位：</td><td><input type="radio" value="T" name="c1"/>头等舱&nbsp
                        <input type="radio" value="J" name="c1" checked="checked"/>经济舱</td></tr>
                    <br>
                </table>
                <c:if test="${requestScope.tag=='2'}">
                    <hr>
                    回程：
                    <table align="center">
                        <tr>
                            <td>航班号：</td><td>${requestScope.flight2.flightId}<br></td>
                        </tr>
                        <tr>
                            <td>出发地：</td><td>${requestScope.flight2.start}<br></td>
                        </tr>
                        <tr>
                            <td>目的地：</td><td>${requestScope.flight2.end}<br></td></tr>
                        <tr>
                            <td>起飞时间：</td><td>${requestScope.flight2.starttime}<br></td></tr>
                        <tr>
                            <td>到达时间：</td><td>${requestScope.flight2.endtime}<br></td></tr>
                        <tr>
                            <td>飞机型号：</td><td>${requestScope.flight2.fltype}<br></td></tr>
                        <tr>
                            <td>票价：</td><td>${requestScope.flight2.topprice} 元 / ${requestScope.flight2.lowprice} 元<br></td></tr>
                        <tr>
                            <td>选择舱位：</td><td><input type="radio" value="T" name="c2"/>头等舱&nbsp
                            <input type="radio" value="J" name="c2" checked="checked"/>经济舱</td></tr>
                        <br>
                    </table>
                </c:if>
                <form:hidden path="user.userId"/>
                <form:hidden path="flight.start"/>
                <form:hidden path="flight.end"/>
                <form:hidden path="flight.date"/>
                <form:hidden path="date2"/>
                <input type="hidden" name="tag" value="${requestScope.tag}"/>
                <input type="hidden" name="fid1" value="${requestScope.flight1.flightId}"/>
                <input type="hidden" name="fid2" value="${requestScope.flight2.flightId}"/>
                <br><br>
                <div class="pop-foot">
                    <input type="button" value="关闭" class="pop-cancel pop-close" onclick="b()">
                    <input type="submit" value="购票" class="pop-ok">
                </div>
            </form>
        </div>
    </div>
</div>
<div class="bgPop"></div>
<!--弹出框-->
<div class="pop1">
    <div class="pop-top">
        <h2></h2>
        <span class="pop-close" onclick="c()">Ｘ</span>
    </div>
    <div class="pop-content">
        <div class="pop-content-left">
            <img src="" alt="" class="teathumb">
        </div>
        <div class="pop-content-right">
            <h4 style="color: red">请选择足够数量的机票！</h4><br>
        </div>
    </div>
</div>
<c:if test="${requestScope.err==1}">
    <script>
        $('.bgPop,.pop1').show();
    </script>
</c:if>
</body>
<script>
    function a() {
        $('.bgPop,.pop').show();
    }
    function b() {
        $('.bgPop,.pop').hide();
    }
    function c() {
        $('.bgPop,.pop1').hide();
    }
</script>
<script>
    function one() {
        document.getElementById("div1").style.visibility="hidden";
    }
    function two() {
        document.getElementById("div1").style.visibility="visible";
    }
</script>


</html>
