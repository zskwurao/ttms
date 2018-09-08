<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        img {
            padding: 0;
            margin: 0;
        }

        #header {
            width: 100%;
            height: 60px;
            background: #192332;
            top: 0;
            left: 0;
            z-index: 50;
        }

        #header .header_1 {
            background: #192332;
            min-width: 1092px;
            height: 60px;
            padding: 0 88px 0 20px;
            position: relative;
            z-index: 5;
        }

        #header .header_1 .left {
            float: left;
            width: 60%;
            height: 60px;
            margin-left: 10px;
            position: relative;
        }

        #header .header_1 .left ul {
            position: absolute;
            left: 0;
            top: 0;
        }

        #header .header_1 .left ul li {
            display: inline-block;
            width: 100px;
            height: 60px;
            line-height: 60px;
            text-align: center;
        }

        #header .header_1 .left ul li a {
            box-shadow: 1;
            text-decoration: none;
            color: #c8c8c8;
            font-size: 15px;
            font-family: 'caviar_dreamsregular';
            display: block;
            -webkit-transition: all .9s;
            -moz-transition: all .9s;
            -o-transition: all .9s;
            -ms-transition: all .9s;
            transition: all .9s;
        }

        #header .header_1 .left ul li a:hover {
            color: #FF00AE;
        }

        #header .header_1 .right {
            width: 300px;
            height: 60px;
            position: absolute;
            right: 0;
        }

        #header .header_1 .right .right_1 {
            width: 150px;
            height: 60px;
        }

        #header .header_1 .right .right_1 a {
            display: block;
            text-decoration: none;
            float: left;
            line-height: 60px;
            font-size: 16px;
            color: #c8c8c8;
            font-family: 'caviar_dreamsregular';
            -webkit-transition: all .9s;
            -moz-transition: all .9s;
            -o-transition: all .9s;
            -ms-transition: all .9s;
            transition: all .9s;
            padding-right: 20px;
            text-align: center;
            border-right: 1px solid #141c28;
        }

        #header .header_1 .right .right_1 a:hover {
            color: #FF00AE;
        }

        #header .header_1 .right .right_2 {
            width: 100px;
            height: 60px;
            position: relative;
            display: none;
        }

        #header .header_1 .right .right_2 span {
            width: 100px;
            height: 60px;
            line-height: 60px;
            font-size: 16px;
            text-align: center;
            color: #c8c8c8;
            border-right: 1px solid #141c28;
        }

        borde #header .header_1 .right .right_2 span:hover {
            cursor: pointer;
        }

        #header .header_1 .right .right_2 span i {
            width: 0;
            height: 0;
            border-top: 5px solid #c8c8c8;
            border-right: 5px dotted transparent;
            border-bottom: 5px dotted transparent;
            border-left: 5px dotted transparent;
            position: absolute;
            left: 50%;
            top: 50%;
        }

        #header .header_1 .right .infor {
            width: 100px;
            height: 83px;
            border: 1px solid blanchedalmond;
            position: relative;
            top: -10px;
        }

        #header .header_1 .right .infor ul {
            list-style: none;
        }

        #header .header_1 .right .infor ul li {
            padding-left: 10px;
            padding-top: 10px;
            border-bottom: 1px solid white;
        }

        #header .header_1 .right .infor ul li a {
            color: white;
            text-decoration: none;
            -webkit-transition: all .9s;
            -moz-transition: all .9s;
            -o-transition: all .9s;
            -ms-transition: all .9s;
            transition: all .9s;
        }

        #header .header_1 .right .infor ul li a:hover {
            color: #FF00AE;
        }

        .main {
            width: 1208px;
            margin: 100px auto;
            background-color: #fff;
        }

        .main .content {
            border: 1px solid #e5e5e5;
            margin: 0 40px 30px 0;
        }

        .main .content .content_top {
            background-color: #f7f7f7;
            font-size: 14px;
            padding: 16px 20px;
        }

        .main .content .content_top .order_data {
            color: #333;
            display: inline-block;
            margin-right: 30px;
        }

        .main .content .content_top .order_id {
            color: #999;
        }

        .main .content .content_top .del_order {
            width: 15px;
            height: 16px;
            background: url(../img/下载.png) no-repeat;
            float: right;
        }

        .main .content .content_body {
            padding: 20px;
            padding-right: 0;
        }

        .main .content .content_body .poster {
            border: 2px solid #fff;
            -webkit-box-shadow: 0 1px 2px 0 rgba(135, 135, 135, 0.5);
            box-shadow: 0 1px 2px 0 rgba(135, 135, 135, 0.5);
            margin-right: 11px;
            font-size: 0;
            display: inline-block;
            vertical-align: top;
        }

        .main .content .content_body .poster img {
            display: block;
            width: 66px;
            height: 91px;
        }

        .main .content .content_body .order_content {
            width: 49%;
            display: inline-block;
            vertical-align: top;
        }

        .main .content .content_body .order_content .movie_name {
            font-size: 16px;
            font-weight: 700;
            color: #333;
            margin: 4px 0 7px -6px;
        }

        .main .content .content_body .order_content .hall_ticket {
            font-size: 12px;
            color: #999;
            margin-bottom: 4px;
        }

        .main .content .content_body .order_content .hall_ticket span {
            display: inline-block;
            margin-right: 5px;
            font-size: 14px;
        }

        .main .content .content_body .order_content .show_time {
            font-size: 12px;
            color: #f03d37;
        }

        .main .content .content_body .order_price {
            font-size: 14px;
            color: #333;
            width: 12%;
            line-height: 95px;
            display: inline-block;
            vertical-align: top;
        }

        .main .content .content_body .order_stauts {
            display: inline-block;
            vertical-align: top;
            width: 15%;
            font-size: 14px;
            color: #333;
            line-height: 95px;
        }

        .main .content .content_body .actions {
            text-align: center;
            font-size: 14px;
            color: #333;
            width: 12%;
            line-height: 95px;
            display: inline-block;
            vertical-align: top;
        }

        .main .content .content_body .actions div {
            line-height: normal;
            display: inline-block;
            vertical-align: middle;
        }

        .main .content .content_body .actions div a {
            text-decoration: none;
            display: block;
            width: 80px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            background-color: #f03d37;
            color: #fff;
            -webkit-box-shadow: 0 2px 10px -2px #f03d37;
            box-shadow: 0 2px 10px -2px #f03d37;
            border-radius: 15px;
            margin-bottom: 8px;
        }
        #box {
            width: 250px;
            height: 50px;
            font-size: 16px;
            margin: 50px auto;
        }
    </style>

</head>

<body>
<header id="header">
    <div class="header_1">
        <div class="left">
            <ul>
                <li><a href="${pageContext.request.contextPath}/play/toindex.action">首页</a></li>
                <li><a href="#">影片介绍</a></li>
                <li><a href="">购票</a></li>
            </ul>
        </div>
        <div class="right">
            <div class="right_1" style="display: block">
                <c:if test="${sessionScope.user==null}">
                    <a href="${pageContext.request.contextPath}/user/tologin.action">登录</a>
                    <a href="${pageContext.request.contextPath}/user/tozhuce.action" class="ZC">注册</a>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    <a id="user_id" href="${pageContext.request.contextPath}/saleitem/selectListByUserId.action">${sessionScope.user.user_name}</a>

                </c:if>
            </div>
            <div class="right_2" style="display: none">
                <i>1</i>
                <span>姓名
                        <i class="bottom" style="cursor: pointer;"></i>
                    </span>
            </div>
            <div class="infor" style="display: none">
                <ul>
                    <li><a href="#" class="people">修改个人信息</a></li>
                    <li><a href="#" class="out">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<div id="box">
    支付成功3秒后显示订单信息
</div>
<div class="main" style="display: none">
    <c:forEach items="${saleitemList}" var="list">
        <div class="content">
            <div class="content_top">
                <span class="order_data"><fmt:formatDate value="${list.sale_item_time}" pattern="yyyy-MM-dd HH:mm"/></span>
                <span class="order_id">${list.sale_item_id}</span>
                <span class="del_order"></span>

            </div>
            <div class="content_body">
                <div class="poster">
                    <img src="${pageContext.request.contextPath}/${list.ticket.schedule.play.play_image}" alt="">
                </div>
                <div class="order_content">
                    <div class="movie_name">${list.ticket.schedule.play.play_name}</div>
                    <div class="hall_ticket">
                        <span>${list.ticket.schedule.studio.studio_name}</span>
                        <span>${list.ticket.seat.seat_row+1}排${list.ticket.seat.seat_column+1}座</span>
                    </div>
                    <div class="show_time">
                        <fmt:formatDate value="${list.ticket.schedule.sched_time}" pattern="HH:mm"/>
                    </div>
                </div>
                <div class="order_price">￥${list.sale_item_price}</div>
                <div class="order_stauts">
                    <c:if test="${list.sale_item_status==1}">已付款</c:if>
                    <c:if test="${list.sale_item_status==0}">待支付</c:if>
                </div>
                <div class="actions">
                    <div>

                            <c:if test="${list.sale_item_status==1}">
                                <a href="${pageContext.request.contextPath}/ticket/updateStatus.action?ticket_id=${list.ticket.ticket_id}">退票</a>
                            </c:if>
                            <c:if test="${list.sale_item_status==0}">
                                <a href="#">支付</a>
                            </c:if>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </c:forEach>


</div>


</body>
<script>
    setTimeout(xiaoshi, 3000);
    function xiaoshi() {
        document.getElementById('box').style.display = "none";
        document.querySelector(".main").style.display = "block";
    }
</script>
</html>