<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ticker.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script >
        $(function () {


        $.post(
            "${pageContext.request.contextPath}/ticket/getTicketId.action",
            {"sched_id":${schedule.sched_id}},
            function (data) {
                console.log(data);
                for(var i = 0;i<data.length;i++){
                   document.getElementById(data[i]).className="choose_ok";
                }
            },
            "json"

        )
        });
    </script>
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
                        <a href="#">${sessionScope.user.user_name}</a>
                    </c:if>
                </div>
                <div class="right_2">
                    <i>1</i>
                    <span>姓名
                                <i></i>
                            </span>
                </div>
            </div>
        </div>
    </header>
    <div id="seat">
        <div class="seat_left">
            <div class="seat_left_top">
                <p>${schedule.studio.studio_name}</p>
            </div>

            <div class="seat_left_right">
                <div class="YM">银幕中央</div>
                <ul class="ul">
                    <c:set value="${schedule.list.get(0).ticket_id}" var="sum"/>

                    <c:forEach begin="1" end="${schedule.studio.studio_row_count}"  varStatus="count">


                        <li>
                        <c:forEach begin="1" end="${schedule.studio.studio_col_count}" items="${schedule.list}" var="ticket" varStatus="count">
                            <c:set var="sum" value="${sum+1}"></c:set>
                            <span  id="${sum}"></span>
                        </c:forEach>

                        </li>
                    </c:forEach>
                    <%--<span class="choose_ok"></span>--%>


                </ul>
                <div class="icon_list">
                    <ul>
                        <li>
                            可选座位
                        </li>
                        <li>
                            已选座位
                        </li>
                        <li>
                            已售座位
                        </li>
                        <li>
                            情侣座
                        </li>
                    </ul>
                </div>
                <div class="tip">
                    <h3>使用说明</h3>
                    <p>1、每笔订单最多可选购5张电影票，情侣座不单卖；</p>
                    <p>2、选座时，请尽量选择相邻座位，不要留下单个座位；</p>
                    <p>3、点击"完成选座"后，请在15分钟内完成支付，超时系统将释放你选定的座位；</p>
                    <p>4、选座购票为特殊商品，出票成功后，如无无法使用问题，不得退换；</p>
                    <p>5、付款后若没有出票成功，我们将自动为您退款。出票成功后，请牢记取票密码，若没有收到取票短信，请到订单中心查询，或拨打客服电话4006-099-866；</p>
                </div>
            </div>
        </div>
        <div class="seat_right">
            <div class="seat_right_content">
                <div class="first">
                    <div class="img">
                        <img src="${pageContext.request.contextPath}/${schedule.play.play_image}" alt="">
                    </div>
                    <div class="info">
                        <p>${schedule.play.play_name}</p>
                    </div>
                    <div class="area">
                        <p>影厅：<span>${schedule.studio.studio_name}</span></p>
                        <p>场次：<span><fmt:formatDate value="${schedule.sched_time}" pattern="yyyy-MM-dd HH:mm"/></span></p>
                    </div>
                    <div class="area_seat">
                        <p class="areat_seat_1">座位：</p>
                        <ul class="areat_seat_2">
                            <li class="empty">未选择座位</li>
                            <!-- <li class="num">
                                <p></p>
                            </li> -->
                        </ul>
                    </div>
                    <div class="price">
                        <p class="PS">
                            票数：
                            <span class="totalnum">0张</span>
                        </p>
                        <p class="PP">
                            总价：
                            <span class="totalprice">0元</span>
                        </p>
                    </div>
                    <a href="#" onclick="tiaozhuan()">确认提交</a>
                </div>

            </div>
        </div>
    </div>

</body>


<script>
    var li = document.querySelectorAll('#seat .seat_left_right .ul li');

    var seat_location = document.querySelectorAll('.num p');
    // var ul = document.getElementsByClassName('areat_seat_2');
    var ul = document.querySelector('.areat_seat_2');
    var totalnum = document.querySelector('.PS .totalnum');
    var totalprice = document.querySelector('.PP .totalprice');
    var arr= new Array();



    for (let i = 0, len = li.length; i < len; i++) {
        let span = li[i].querySelectorAll('span');
        li[i].index = i + 1;
        for (let j = 0; j < span.length; j++) {
            span[j].index = j + 1;
            var num = 0;
            var Li = document.createElement('li');
            var p = document.createElement('p');
            (function(Li, p) {
                span[j].onclick = function() {
                    var str=this.id;
                    if(this.className=="choose_ok"){
                        return false;
                    }
                    li.className = 'num';
                    if (!this.className) {
                        this.className = 'choose';
                        p.innerHTML = li[i].index + '排' + this.index + '座';
                        Li.appendChild(p);
                        ul.appendChild(Li);
                        num++;
                        arr.push(str);
                    } else {
                        this.className = '';

                        ul.removeChild(Li);
                        arr.remove(str);

                        num--;
                    }
                    totalnum.innerHTML = num + '张';
                    totalprice.innerHTML = num * ${schedule.sched_ticket_price} + '元';
                    console.log(arr);
                    arr.join(",");
                }

            })(Li, p)
        }

    }


    Array.prototype.indexOf = function(val) {
        for (var i = 0; i < this.length; i++) {
            if (Compare(this[i], val)) return i;
        }
        return -1;
    };
    Array.prototype.remove = function(val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };
    function Compare(objA, objB) {
        if (!isObj(objA) || !isObj(objB)) return false; //判断类型是否正确
        if (getLength(objA) != getLength(objB)) return false; //判断长度是否一致
        return CompareObj(objA, objB, true);//默认为true
    }
    function CompareObj(objA, objB, flag) {
        for (var key in objA) {
            if (!flag) //跳出整个循环
                break;
            if (!objB.hasOwnProperty(key)) { flag = false; break; }
            if (!isArray(objA[key])) { //子级不是数组时,比较属性值
                if (objB[key] != objA[key]) { flag = false; break; }
            } else {
                if (!isArray(objB[key])) { flag = false; break; }
                var oA = objA[key], oB = objB[key];
                if (oA.length != oB.length) { flag = false; break; }
                for (var k in oA) {
                    if (!flag) //这里跳出循环是为了不让递归继续
                        break;
                    flag = CompareObj(oA[k], oB[k], flag);
                }
            }
        }
        return flag;
    }
    function isObj(object) {
        return object && typeof (object) == 'object' && Object.prototype.toString.call(object).toLowerCase() == "[object object]";
    }
    function isArray(object) {
        return object && typeof (object) == 'object' && object.constructor == Array;
    }
    function getLength(object) {
        var count = 0;
        for (var i in object) count++;
        return count;
    }
    function tiaozhuan() {
        window.location.href="${pageContext.request.contextPath}/saleitem/addSaleitem.action?ids="+arr;
    }
</script>
</html>