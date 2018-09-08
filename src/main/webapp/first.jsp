<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index1.css">
    <script src="js/jquery.js"></script>
    <script>
        function login(ev) {
            ev.preventDefault();
            window.location.href="${pageContext.request.contextPath}/user/tologin.action";
        }
    </script>
</head>

<body>
    <header id="header">
        <div class="header_1">
            <div class="left">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/play/toindex.action">首页</a></li>
                    <li><a href="">影片介绍</a></li>
                    <li><a href="">购票</a></li>
                </ul>
            </div>
            <div class="right">
                <div class="right_1" style="display: block">
                    <a href="" onclick="login()">登录</a>
                    <a href="${pageContext.request.contextPath}/user/tologin.action" class="ZC">注册</a>
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