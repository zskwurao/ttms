<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index1.css">
    <style>
        .yanse1{
            color: black;
        }
        .yanse2{
            color: blue;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/index1.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script>
        $(function () {
            var title_nav=$('.title_nav');
    
            <%--$.post(--%>

                <%--"${pageContext.request.contextPath}/base/getListById.action",--%>
                <%--{dict_parent_id: "1"},--%>
                <%--function (data) {--%>
                   <%--// alert(data.length);--%>
                    <%--console.log(data[2].dict_value);--%>
                    <%--for(var i=0;i<data.length;i++){--%>
                           <%--var con = "";--%>
                        <%--con += data[i].dict_value;--%>
                        <%--console.log(con);--%>
                        <%--title_nav.append("<a href=''>"+con+"</a><span>|</span>");--%>
                        <%--}--%>

                    <%--},--%>
                <%--"json"--%>
            <%--);--%>
            $.post(

                "${pageContext.request.contextPath}/play/getListBystatus.action",
                {play_status: "0"},
                function (data) {
                    // alert(data.length);
                    console.log(data);
                    var con = '';
                    for(var i=0;i<data.length;i++){
                        con+='<li class="i_wantmover"> <a href=""><img src="${pageContext.request.contextPath}/'+data[i].play_image+'"></a> <div class="top"> <h3>'+data[i].play_name+'</h3><p class="i_wbr"> <b>导演：</b> <span>'+data[i].play_director+'</span> </p> <p class="data">上映日期： <span>'+time(data[0].scheduleList[0].sched_time)+'</span> </p> <p class="sale"> <a href="">超前预售</a></p></div> </li>';
                    }
                    $(".content ul").html(con);
                },
                "json"
            );
            var li = document.querySelectorAll('#header_img ul li');
            var header_img_content = document.querySelectorAll('.header_img_content');
// var header_img_content_1 = document.querySelector('.header_img_content_1');

            var img = document.querySelectorAll('#header_img img');

            var arr = [];
            for (var i = 0; i < li.length; i++) {
                arr.push([getStyle(li[i], 'opacity'), getStyle(li[i], 'z-index')]);
            }
            console.log(arr);
            var array = [];
            for (var i = 0; i < header_img_content.length; i++) {
                array.push([getStyle(header_img_content[i], 'display')])
            }

            setInterval(function() {
                array.push(array[0]);
                array.shift();
                arr.push(arr[0]);
                arr.shift();
                for (var i = 0; i < li.length; i++) {
                    li[i].style.opacity = arr[i][0];
                    li[i].style.zIndex = arr[i][1];
                    header_img_content[i].style.display = array[i][0];
                }

            }, 2000);
        });

        function time(data) {
            var date=data.replace(/-/g,'/');
            var d=new Date(data);
            var t=d.getMonth();
            var m=d.getDay();
            var s=d.getSeconds();
            var str=t+'-'+m;
            return str;
        }


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
                    <a href="${pageContext.request.contextPath}/saleitem/selectListByUserId.action">${sessionScope.user.user_name}</a>

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

<section id="header_img">
    <ul>
        <li style="opacity: 0;">
            <img src="${pageContext.request.contextPath}/img/093805.44580932_o.jpg" alt="" class="li_1">
        </li>
        <li style="z-index: 3;">
            <img src="${pageContext.request.contextPath}/img/155600.65759564_o.jpg" alt="" class="li_2">
        </li>
    </ul>
    <div class="header_img_content">
        <span>正在热映</span>
        <h2>
            <a href="">《狂暴巨兽》</a>
        </h2>
        <p class="intotxt">
            108分钟 -
            <a href="">动作/</a>
            <a href="">冒险</a>
        </p>
        <p class="intotxt">
            <i class="ico_ydot"></i>
            <a href="">强森带领“拯救世界小队”逆袭巨兽</a></p>
    </div>
    <div class="header_img_content" style="display: none">
        <span>正在热映</span>
        <h2>
            <a href="">《幕后玩家》</a>
        </h2>
        <p class="intotxt">
            114分钟 -
            <a href="">剧情</a>

        </p>
        <p class="intotxt">
            <i class="ico_ydot"></i>
            <a href="">徐峥被困密室生死抉择</a></p>
    </div>
    <div class="quan">
        <a href=""></a>
        <a href=""></a>
    </div>
</section>
<nav>
    <div class="ticketServer">
        <div class="search">
            <input id="play_id" type="text" name="play_name" placeholder="请输入要看的电影名">

        </div>
        <a href="#" id="buy"
           onclick="location.href='${pageContext.request.contextPath}/play/selectPlay.action?play_name='+document.getElementById('play_id').value">选座购票</a>

    </div>
</nav>

<div id="middle">
    <div class="title">
        <h2>
                <span>
                        正在热映的电影
                </span>
        </h2>
        <div class='title_nav'>
            <a href="" style="color: #000">热映</a>
            <span>|</span>
            <a href="">爱情</a>
            <span>|</span>
            <a href="">动作</a>
            <span>|</span>
            <a href="">冒险</a>
            <span>|</span>
            <a href="">奇幻</a>
            <span>|</span>
            <a href="">喜剧</a>
        </div>
    </div>
    <div class="middle_content">
        <div class="movebox">
            <div class="right_move">

                <ul>
                    <c:if test="${list==null}">
                    <c:forEach items="${plays}" var="play">
                        <c:if test="${play.play_status==1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/play/selectPlay.action?play_name=${play.play_name}">
                                    <img src="${pageContext.request.contextPath}/${play.play_image}" alt="">
                                </a>
                                <dl>
                                    <dt>
                                        <a href="">${play.play_name}</a>
                                    </dt>
                                    <dd class='time'>
                                            ${play.play_length}分钟-剧情
                                    </dd>
                                    <dd class="hot">
                                        <i></i> ${play.play_shortintro}
                                    </dd>
                                    <dd class="btn">
                                        <a href="${pageContext.request.contextPath}/play/selectPlay.action?play_name=${play.play_name}">选座购票</a>
                                    </dd>
                                </dl>
                            </li>
                        </c:if>
                    </c:forEach>
                    </c:if>
                    <c:if test="${list!=null}">
                        <c:forEach items="${list}" var="playlist">
                            <c:if test="${playlist.play_status==1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/play/selectPlay.action?play_name=${playlist.play_name}">
                                        <img src="${pageContext.request.contextPath}/${playlist.play_image}" alt="">
                                    </a>
                                    <dl>
                                        <dt>
                                            <a href="">${playlist.play_name}</a>
                                        </dt>
                                        <dd class='time'>
                                                ${playlist.play_length}分钟-剧情
                                        </dd>
                                        <dd class="hot">
                                            <i></i> ${playlist.play_shortintro}
                                        </dd>
                                        <dd class="btn">
                                            <a href="${pageContext.request.contextPath}/play/selectPlay.action?play_name=${playlist.play_name}">选座购票</a>
                                        </dd>
                                    </dl>
                                </li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </ul>


            </div>
        </div>

    </div>
    <div id="bottom">
        <div class="title">
            <h2>即将上映的</h2>
        </div>
        <div class="content">
            <ul>
            </ul>

        </div>
    </div>
</div>
<script>
    $('.title_nav a').on("click",function(ev) {
        ev.preventDefault();

        console.log($(this).html());
        $.post("${pageContext.request.contextPath}/play/getListById.action", {
            "name": $(this).html()
        }, function(result) {
            var str = '';
            $('.right_move ul').html('');
            for (var i = 0; i < result.length; i++) {
                str += '<li><a href="${pageContext.request.contextPath}/play/selectPlay.action?play_name='+result[i].play_name+'"><img src="${pageContext.request.contextPath}/'+result[i].play_image+'" alt=""></a><dl><dt><a href="">' + result[i].play_name + '</a></dt><dd class="time">' + result[i].play_length + '分钟-剧情</dd><dd class="hot"><i></i>' + result[i].play_shortintro + '</dd><dd class="btn"><a href="${pageContext.request.contextPath}/play/selectPlay.action?play_name='+result[i].play_name+'">选座购票</a></dd></dl></li>'

            }
            $('.right_move ul').html(str);

        });
    })
</script>
</body>

</html>