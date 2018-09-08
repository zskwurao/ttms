<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="css/index1.css">
</head>

<body>
    <header id="header">
        <div class="header_1">
            <div class="left">
                <ul>
                    <li><a href="">首页</a></li>
                    <li><a href="">影片介绍</a></li>
                    <li><a href="">购票</a></li>
                </ul>
            </div>
            <div class="right">
                <div class="right_1" style="display: block">
                    <c:if test="${sessionScope.user==null}">
                        <a href="${pageContext.request.contextPath}/user/tologin.action">登录</a>
                        <a href="login.jsp" class="ZC">注册</a>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <a href="#">${sessionScope.user.user_name}</a>
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
</body>

</html>