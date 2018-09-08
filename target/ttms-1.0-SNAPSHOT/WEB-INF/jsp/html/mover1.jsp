<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mover1.css">

    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script>
        $(function () {
            $.post("${pageContext.request.contextPath}/schedule/getTime.action",
                {id:${play.play_id}},
                function (data) {
                var s= '';
                for(var i = 0 ;i<data.length;i++){

                s+='<a href="" id="dianji" ><span id="${play.scheduleList[i].sched_id}" class="hide">'+data[i]+'</span></a>';
                }
                $(".datalist").html(s);
                $('.datalist a').on("click",function (ev) {

                        ev.preventDefault();
                        // var lin=$('.datalist a').index(this);
                        // console.log(lin);

                        var data=$(this).children('span').html();
                        console.log(data);
                        $.post("${pageContext.request.contextPath}/schedule/listajax.action",
                            {sched_time:data,
                                play_id:${play.play_id}
                            },
                            function (result) {
                                var str='';
                                for(var i=0;i<result.length;i++){


                                    str+='<li> <div class="time"> <p class="start">'+time(result[i].sched_time)+'</p><p class="end">'+time(result[i].end_time)+'离场</p> </div> <div class="type">'+result[i].studio.studio_introduction+' </div> <div class="hall">'+result[i].studio.studio_name+'</div> <div class="price"> <p> <span class="dollor">￥</span> <span class="num">'+result[i].sched_ticket_price+'</span> <del class="font-show">'+result[i].play.play_ticket_price+'</del> </p> </div> <div class="seat">余位98% </div> <a href="${pageContext.request.contextPath}/schedule/getSchedule.action?sched_id='+result[i].sched_id+'" class="btn">选座购票</a> </li>'

                                }
                                $(".session_list ul").html(str);
                            },
                            "json"


                        );
                    });
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
                    <li><a href="">影片介绍</a></li>
                    <li><a href="#">购票</a></li>
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
    <div class="nstime">&nbsp;</div>
    <div id="introduce">

        <div class="introduce_main">
            <div class="introduce_main_img">
                <a href=""><img src="${pageContext.request.contextPath}/${play.play_image}" alt=""></a>
            </div>
            <div class="introduce_main_title">
                <h2>${play.play_name}</h2>
                    <div class="introduce_main_content">

                        <p class="content_top">${play.play_shortintro}</p>
                        <p>导演：${play.play_director} &nbsp;&nbsp;&nbsp;&nbsp;主演：${play.play_actor}</p>
                        <p>中国 | ${play.play_length}分钟 &nbsp;&nbsp;&nbsp;&nbsp;2018-04-28 上映</p>
                        <p>剧情：${play.play_introduction}</p>
                    </div>
            </div>
        </div>


    </div>

    <div id="timer">
        <div class="data">

            <div class="datalist">
                <%--<c:forEach items="${play.scheduleList}" var="list" varStatus="s">
                <a href="" id="dianji" ><span id="${list.sched_id}" class="hide"><fmt:formatDate value="${list.sched_time}" pattern="yyyy-MM-dd"/></span></a>
                </c:forEach>--%>
            </div>

            <div class="session_list">
                <ul>
                    <c:forEach items="${play.scheduleList}" var="slist">
                        <%--<c:if test="${slist.sched_time==play.scheduleList[0].sched_time}">--%>
                    <li>
                        <div class="time">
                            <p class="start"><fmt:formatDate value="${slist.sched_time}" pattern="HH:mm"/></p>
                            <p class="end"><fmt:formatDate value="${slist.end_time}" pattern="HH:mm"/>离场</p>
                        </div>
                        <div class="type">
                         ${slist.studio.studio_introduction}

                        </div>
                        <div class="hall">
                            ${slist.studio.studio_name}
                        </div>
                        <div class="price">
                            <p>
                                <span class="dollor">￥</span>
                                <span class="num">${slist.sched_ticket_price}</span>
                                <del class="font-show">${play.play_ticket_price}</del>
                            </p>
                        </div>
                        <div class="seat">


                            余位98%


                        </div>
                        <a href="${pageContext.request.contextPath}/schedule/getSchedule.action?sched_id=${slist.sched_id}" class="btn">选座购票</a>
                    </li>
                        <%--</c:if>--%>
                    </c:forEach>

                </ul>
            </div>
        </div>
    </div>

    <div id="comment">
        <div class=""></div>
    </div>


</body>

</html>
<script>

    function time(data) {
        var date=data.replace(/-/g,'/');
        var d=new Date(data);
        var t=d.getHours();
        var m=d.getMinutes();
        var s=d.getSeconds();
        var str=t+':'+m;
        return str;
    }

</script>